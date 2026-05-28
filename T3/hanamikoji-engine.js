import { performance } from "node:perf_hooks";

const CARD_ORDER = ["A", "B", "C", "D", "E", "F", "G"];
const SCORE_BY_ID = [2, 2, 2, 3, 3, 4, 5];
const CARD_COUNT_BY_ID = [2, 2, 2, 3, 3, 4, 5];
const TIER_ORDER = [[6], [5], [3, 4], [0, 1, 2]];

function cardIndex(ch) {
  return ch.charCodeAt(0) - 65;
}

function boardFromP1ToPlayer(boardP1, playerIndex) {
  if (playerIndex === 0) return [...boardP1];
  return boardP1.map((v) => -v);
}

function createInitialDeck() {
  const deck = [];
  for (let i = 0; i < CARD_COUNT_BY_ID.length; i += 1) {
    for (let k = 0; k < CARD_COUNT_BY_ID[i]; k += 1) {
      deck.push(CARD_ORDER[i]);
    }
  }
  return deck;
}

function mulberry32(seed) {
  let t = seed >>> 0;
  return function random() {
    t = (t + 0x6d2b79f5) >>> 0;
    let r = Math.imul(t ^ (t >>> 15), 1 | t);
    r ^= r + Math.imul(r ^ (r >>> 7), 61 | r);
    return ((r ^ (r >>> 14)) >>> 0) / 4294967296;
  };
}

function shuffleInPlace(arr, rand) {
  for (let i = arr.length - 1; i > 0; i -= 1) {
    const j = Math.floor(rand() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

export function buildMatchRoundDecks(seed) {
  const rand = mulberry32(seed >>> 0);
  const roundDecks = [];
  for (let round = 0; round < 3; round += 1) {
    const deck = createInitialDeck();
    shuffleInPlace(deck, rand);
    roundDecks.push(deck);
  }
  return roundDecks;
}

function scoreAndCount(boardP1) {
  let p1Score = 0;
  let p2Score = 0;
  let p1Count = 0;
  let p2Count = 0;

  for (let i = 0; i < 7; i += 1) {
    if (boardP1[i] === 1) {
      p1Score += SCORE_BY_ID[i];
      p1Count += 1;
    } else if (boardP1[i] === -1) {
      p2Score += SCORE_BY_ID[i];
      p2Count += 1;
    }
  }

  return { p1Score, p2Score, p1Count, p2Count };
}

function judgeByBoard(boardP1, round) {
  const { p1Score, p2Score, p1Count, p2Count } = scoreAndCount(boardP1);

  if (p1Score >= 11) return 1;
  if (p2Score >= 11) return -1;

  if (p1Count >= 4 && p2Score < 11) return 1;
  if (p2Count >= 4 && p1Score < 11) return -1;

  if (round < 3) return 0;

  if (p1Score !== p2Score) {
    return p1Score > p2Score ? 1 : -1;
  }

  for (const tier of TIER_ORDER) {
    const p1Has = tier.some((idx) => boardP1[idx] === 1);
    const p2Has = tier.some((idx) => boardP1[idx] === -1);
    if (p1Has !== p2Has) {
      return p1Has ? 1 : -1;
    }
  }

  return 2;
}

function sameMultiset(left, right) {
  if (left.length !== right.length) return false;
  return left.split("").sort().join("") === right.split("").sort().join("");
}

function removeCardsFromHand(hand, cards) {
  const cloned = [...hand];
  for (const ch of cards) {
    const pos = cloned.indexOf(ch);
    if (pos === -1) return null;
    cloned.splice(pos, 1);
  }
  return cloned;
}

function cardsToString(hand) {
  return [...hand].sort().join("");
}

function addCardsToCounter(counter, cards) {
  for (const ch of cards) {
    counter[cardIndex(ch)] += 1;
  }
}

function appendToken(historyViews, tokenSelf, tokenOpp) {
  historyViews[0].push(tokenSelf);
  historyViews[1].push(tokenOpp);
}

function appendChoiceToLastToken(historyViews, choice) {
  for (let i = 0; i < 2; i += 1) {
    const last = historyViews[i][historyViews[i].length - 1];
    historyViews[i][historyViews[i].length - 1] = `${last}-${choice}`;
  }
}

function callDecision(player, historyText, cardsText, board, timeLimitMs) {
  const start = performance.now();
  const output = player.action(historyText, cardsText, board);
  const elapsed = performance.now() - start;

  if (elapsed > timeLimitMs) {
    return { ok: false, reason: "timeout", detail: `${elapsed.toFixed(3)}ms` };
  }

  if (typeof output !== "string") {
    return {
      ok: false,
      reason: "invalid-output",
      detail: `返回值类型为 ${typeof output}`
    };
  }

  return { ok: true, output: output.trim(), elapsed };
}

function updateBoardByRoundArea(boardP1, p1Area, p2Area) {
  const next = [...boardP1];
  for (let i = 0; i < 7; i += 1) {
    if (p1Area[i] > p2Area[i]) next[i] = 1;
    else if (p1Area[i] < p2Area[i]) next[i] = -1;
  }
  return next;
}

function makeRoundState(startPlayer) {
  return {
    startPlayer,
    activePlayer: startPlayer,
    historyViews: [[], []],
    hands: [[], []],
    usedActions: [new Set(), new Set()],
    normalActionCount: [0, 0],
    publicArea: [new Array(7).fill(0), new Array(7).fill(0)],
    secretArea: [new Array(7).fill(0), new Array(7).fill(0)],
    pendingOffer: null
  };
}

function isRoundFinished(roundState) {
  return (
    roundState.normalActionCount[0] === 4 &&
    roundState.normalActionCount[1] === 4 &&
    !roundState.pendingOffer
  );
}

function resolveRound(gameState, roundState) {
  const p1RoundArea = roundState.publicArea[0].map(
    (v, i) => v + roundState.secretArea[0][i]
  );
  const p2RoundArea = roundState.publicArea[1].map(
    (v, i) => v + roundState.secretArea[1][i]
  );
  gameState.boardP1 = updateBoardByRoundArea(gameState.boardP1, p1RoundArea, p2RoundArea);
}

function summarizeScore(boardP1) {
  const { p1Score, p2Score, p1Count, p2Count } = scoreAndCount(boardP1);
  return { p1Score, p2Score, p1Count, p2Count };
}

function makeInvalidResult(winner, loser, reason) {
  return {
    endBy: "invalid",
    winner,
    loser,
    reason
  };
}

function dealRoundCards(roundState, deck) {
  for (let k = 0; k < 6; k += 1) {
    roundState.hands[0].push(deck.pop());
    roundState.hands[1].push(deck.pop());
  }
}

function validateCardsOnlyAG(cards) {
  return /^[A-G]+$/.test(cards);
}

function parseNormalAction(actionText) {
  if (typeof actionText !== "string" || actionText.length < 2) return null;
  const type = actionText[0];
  if (!["1", "2", "3", "4"].includes(type)) return null;

  const cards = actionText.slice(1);
  const requiredCardCount = Number(type);

  if (cards.length !== requiredCardCount) return null;
  if (!validateCardsOnlyAG(cards)) return null;

  return { type, cards };
}

function parseChoiceAction(actionText) {
  if (typeof actionText !== "string" || !actionText.startsWith("-")) return null;
  const choice = actionText.slice(1);
  if (!validateCardsOnlyAG(choice)) return null;
  return choice;
}

function applyNormalAction(roundState, actor, parsedAction) {
  const { type, cards } = parsedAction;

  if (roundState.usedActions[actor].has(type)) {
    return { ok: false, reason: `行动 ${type} 在本小轮中已使用` };
  }

  const newHand = removeCardsFromHand(roundState.hands[actor], cards);
  if (!newHand) {
    return { ok: false, reason: `行动使用了不在手牌中的卡：${cards}` };
  }

  roundState.hands[actor] = newHand;
  roundState.usedActions[actor].add(type);
  roundState.normalActionCount[actor] += 1;

  if (type === "1") {
    addCardsToCounter(roundState.secretArea[actor], cards);
    if (actor === 0) {
      appendToken(roundState.historyViews, `1${cards}`, "1X");
    } else {
      appendToken(roundState.historyViews, "1X", `1${cards}`);
    }
    roundState.activePlayer = 1 - actor;
    return { ok: true };
  }

  if (type === "2") {
    if (actor === 0) {
      appendToken(roundState.historyViews, `2${cards}`, `2${"X".repeat(cards.length)}`);
    } else {
      appendToken(roundState.historyViews, `2${"X".repeat(cards.length)}`, `2${cards}`);
    }
    roundState.activePlayer = 1 - actor;
    return { ok: true };
  }

  if (type === "3") {
    appendToken(roundState.historyViews, `3${cards}`, `3${cards}`);
    roundState.pendingOffer = {
      provider: actor,
      type: "3",
      cards
    };
    return { ok: true };
  }

  appendToken(roundState.historyViews, `4${cards}`, `4${cards}`);
  roundState.pendingOffer = {
    provider: actor,
    type: "4",
    leftGroup: cards.slice(0, 2),
    rightGroup: cards.slice(2, 4)
  };
  return { ok: true };
}

function applyChoiceAction(roundState, chooser, choice) {
  const offer = roundState.pendingOffer;
  if (!offer) {
    return { ok: false, reason: "当前不需要响应选择" };
  }

  if (offer.type === "3") {
    if (choice.length !== 1) {
      return { ok: false, reason: `3行动响应必须选择1张，实际为 ${choice}` };
    }

    const pos = offer.cards.indexOf(choice);
    if (pos === -1) {
      return { ok: false, reason: `选择 ${choice} 不在赠送牌组 ${offer.cards} 中` };
    }

    const providerCards = offer.cards.split("");
    providerCards.splice(pos, 1);

    addCardsToCounter(roundState.publicArea[chooser], choice);
    addCardsToCounter(roundState.publicArea[offer.provider], providerCards.join(""));

    appendChoiceToLastToken(roundState.historyViews, choice);
    roundState.pendingOffer = null;
    roundState.activePlayer = chooser;
    return { ok: true };
  }

  if (choice.length !== 2) {
    return { ok: false, reason: `4行动响应必须选择2张，实际为 ${choice}` };
  }

  const left = offer.leftGroup;
  const right = offer.rightGroup;

  let chosen;
  let remain;
  if (sameMultiset(choice, left)) {
    chosen = left;
    remain = right;
  } else if (sameMultiset(choice, right)) {
    chosen = right;
    remain = left;
  } else {
    return { ok: false, reason: `选择 ${choice} 不匹配竞争分组 ${left}/${right}` };
  }

  addCardsToCounter(roundState.publicArea[chooser], chosen);
  addCardsToCounter(roundState.publicArea[offer.provider], remain);

  appendChoiceToLastToken(roundState.historyViews, choice);
  roundState.pendingOffer = null;
  roundState.activePlayer = chooser;
  return { ok: true };
}

export function runSingleGame(players, maxDecisionMs, options = {}) {
  const verbose = !!options.verbose;
  const onUpdate = typeof options.onUpdate === "function" ? options.onUpdate : null;
  const firstPlayer = options.firstPlayer ?? 0;
  const seed = (options.seed ?? (Date.now() & 0xffffffff)) >>> 0;
  const preparedRoundDecks = options.roundDecks
    ? options.roundDecks.map((deck) => [...deck])
    : buildMatchRoundDecks(seed);

  function log(...args) {
    if (verbose) console.log(...args);
  }

  function emit(evt) {
    if (onUpdate) onUpdate(evt);
    if (evt && evt.log) gameState.logs.push(evt.log);
  }

  const gameState = {
    seed,
    boardP1: new Array(7).fill(0),
    round: 1,
    startPlayer: firstPlayer,
    timeSpent: [0, 0],
    logs: []
  };

  while (gameState.round <= 3) {
    const roundState = makeRoundState(gameState.startPlayer);

    const deck = [...preparedRoundDecks[gameState.round - 1]];
    const removedCard = deck.pop();

    dealRoundCards(roundState, deck);

    emit({
      type: "roundStart",
      round: gameState.round,
      startPlayer: gameState.startPlayer,
      seed,
      log: { round: gameState.round, startPlayer: gameState.startPlayer, removedCard }
    });

    log(`=== Round ${gameState.round} start; startPlayer=${gameState.startPlayer}; seed=${seed} ===`);
    log(`Hidden removed -> ${removedCard}`);
    log(
      `Dealt hands -> P1: ${cardsToString(roundState.hands[0])}  P2: ${cardsToString(roundState.hands[1])}`
    );

    while (!isRoundFinished(roundState)) {
      if (roundState.pendingOffer) {
        const chooser = 1 - roundState.pendingOffer.provider;
        const player = players[chooser];
        const historyText = roundState.historyViews[chooser].join(" ");
        const cardsText = cardsToString(roundState.hands[chooser]);
        const boardForPlayer = Int8Array.from(boardFromP1ToPlayer(gameState.boardP1, chooser));

        const decision = callDecision(player, historyText, cardsText, boardForPlayer, maxDecisionMs);

        if (!decision.ok) {
          const loser = chooser;
          const winner = 1 - loser;
          log(`Player ${chooser + 1} choice failed: ${decision.reason} ${decision.detail || ""}`);
          return {
            seed,
            winnerCode: winner === 0 ? 1 : -1,
            reason: makeInvalidResult(
              winner,
              loser,
              `响应失败: ${decision.reason}${decision.detail ? ` (${decision.detail})` : ""}`
            ),
            boardP1: gameState.boardP1,
            timeSpent: gameState.timeSpent
          };
        }

        gameState.timeSpent[chooser] += decision.elapsed;

        const choice = parseChoiceAction(decision.output);
        if (!choice) {
          const loser = chooser;
          const winner = 1 - loser;
          log(`Player ${chooser + 1} returned invalid choice: ${decision.output}`);
          return {
            seed,
            winnerCode: winner === 0 ? 1 : -1,
            reason: makeInvalidResult(winner, loser, `响应格式非法: ${decision.output}`),
            boardP1: gameState.boardP1,
            timeSpent: gameState.timeSpent
          };
        }

        log(`Player ${chooser + 1} chose: ${choice} (elapsed ${decision.elapsed.toFixed(3)}ms)`);

        const applied = applyChoiceAction(roundState, chooser, choice);
        if (!applied.ok) {
          const loser = chooser;
          const winner = 1 - loser;
          log(`Apply choice failed for P${chooser + 1}: ${applied.reason}`);
          return {
            seed,
            winnerCode: winner === 0 ? 1 : -1,
            reason: makeInvalidResult(winner, loser, applied.reason),
            boardP1: gameState.boardP1,
            timeSpent: gameState.timeSpent
          };
        }

        continue;
      }

      const actor = roundState.activePlayer;

      if (deck.length > 0) {
        roundState.hands[actor].push(deck.pop());
      }

      const player = players[actor];
      const historyText = roundState.historyViews[actor].join(" ");
      const cardsText = cardsToString(roundState.hands[actor]);
      const boardForPlayer = Int8Array.from(boardFromP1ToPlayer(gameState.boardP1, actor));

      const decision = callDecision(player, historyText, cardsText, boardForPlayer, maxDecisionMs);

      if (!decision.ok) {
        const loser = actor;
        const winner = 1 - loser;
        log(`Player ${actor + 1} decision failed: ${decision.reason} ${decision.detail || ""}`);
        return {
          seed,
          winnerCode: winner === 0 ? 1 : -1,
          reason: makeInvalidResult(
            winner,
            loser,
            `行动失败: ${decision.reason}${decision.detail ? ` (${decision.detail})` : ""}`
          ),
          boardP1: gameState.boardP1,
          timeSpent: gameState.timeSpent
        };
      }

      gameState.timeSpent[actor] += decision.elapsed;
      log(`Player ${actor + 1} decision: ${decision.output} (elapsed ${decision.elapsed.toFixed(3)}ms)`);

      const parsedAction = parseNormalAction(decision.output);
      if (!parsedAction) {
        const loser = actor;
        const winner = 1 - loser;
        log(`Player ${actor + 1} returned invalid action format: ${decision.output}`);
        return {
          seed,
          winnerCode: winner === 0 ? 1 : -1,
          reason: makeInvalidResult(winner, loser, `行动格式非法: ${decision.output}`),
          boardP1: gameState.boardP1,
          timeSpent: gameState.timeSpent
        };
      }

      const applied = applyNormalAction(roundState, actor, parsedAction);
      if (!applied.ok) {
        const loser = actor;
        const winner = 1 - loser;
        log(`Apply action failed for P${actor + 1}: ${applied.reason}`);
        return {
          seed,
          winnerCode: winner === 0 ? 1 : -1,
          reason: makeInvalidResult(winner, loser, applied.reason),
          boardP1: gameState.boardP1,
          timeSpent: gameState.timeSpent
        };
      }

      log(
        `Player ${actor + 1} applied action: ${parsedAction.type}${parsedAction.cards}. Hands -> P1: ${cardsToString(
          roundState.hands[0]
        )} P2: ${cardsToString(roundState.hands[1])}`
      );
    }

    resolveRound(gameState, roundState);
    const judged = judgeByBoard(gameState.boardP1, gameState.round);
    const roundSummary = {
      round: gameState.round,
      board: [...gameState.boardP1],
      score: summarizeScore(gameState.boardP1)
    };

    gameState.logs.push(roundSummary);
    log(
      `Round ${gameState.round} resolved. Board: ${gameState.boardP1.join(",")} Score: P1 ${
        roundSummary.score.p1Score
      } P2 ${roundSummary.score.p2Score}`
    );

    if (judged === 1 || judged === -1) {
      return {
        seed,
        winnerCode: judged,
        reason: { endBy: "normal", winner: judged === 1 ? 0 : 1 },
        boardP1: gameState.boardP1,
        timeSpent: gameState.timeSpent
      };
    }

    if (gameState.round === 3) {
      return {
        seed,
        winnerCode: judged,
        reason: { endBy: "normal", winner: judged === 1 ? 0 : judged === -1 ? 1 : -1 },
        boardP1: gameState.boardP1,
        timeSpent: gameState.timeSpent
      };
    }

    gameState.round += 1;
    gameState.startPlayer = 1 - gameState.startPlayer;
  }

  return {
    seed,
    winnerCode: 2,
    reason: { endBy: "normal", winner: -1 },
    boardP1: gameState.boardP1,
    timeSpent: gameState.timeSpent
  };
}

export function runSingleMatch(players, maxDecisionMs, options = {}) {
  return runSingleGame(players, maxDecisionMs, options);
}

export function formatWinnerLabel(players, winnerCode) {
  if (winnerCode === 1) return players[0].name;
  if (winnerCode === -1) return players[1].name;
  return "平局";
}

export function winnerReasonText(reason) {
  if (reason.endBy === "normal") return "正常结算完成";
  return reason.reason || "非法行为";
}

export function prettyBoard(boardP1) {
  return `A---B---C---D---E---F---G\n${boardP1
    .map((v) => (v === 1 ? "P1" : v === -1 ? "P2" : "--"))
    .join("---")}`;
}