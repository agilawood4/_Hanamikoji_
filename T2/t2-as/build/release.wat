(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $5 (func (param i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32 i32 i32)))
 (type $8 (func (param i32 i32 i32)))
 (type $9 (func (result i32)))
 (type $10 (func (param i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1584))
 (memory $0 1)
 (data $0 (i32.const 1036) ",")
 (data $0.1 (i32.const 1048) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $1 (i32.const 1084) ",")
 (data $1.1 (i32.const 1096) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $3 (i32.const 1196) "<")
 (data $3.1 (i32.const 1208) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $4 (i32.const 1260) "<")
 (data $4.1 (i32.const 1272) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $5 (i32.const 1324) "\1c")
 (data $5.1 (i32.const 1336) "\02\00\00\00\02\00\00\00 ")
 (data $6 (i32.const 1356) "\1c")
 (data $6.1 (i32.const 1368) "\02")
 (data $7 (i32.const 1388) "|")
 (data $7.1 (i32.const 1400) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $8 (i32.const 1516) "\1c")
 (data $8.1 (i32.const 1528) "\02\00\00\00\02\00\00\00-")
 (data $9 (i32.const 1548) "\1c")
 (data $9.1 (i32.const 1560) "\02\00\00\00\02\00\00\00X")
 (data $10 (i32.const 1584) "\06\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\02\t\00\00\02A")
 (export "calc_current_state_raw" (func $assembly/index/calc_current_state_raw@varargs))
 (export "__new" (func $~lib/rt/stub/__new))
 (export "__pin" (func $~lib/rt/stub/__pin))
 (export "__unpin" (func $~lib/rt/stub/__unpin))
 (export "__collect" (func $~lib/rt/stub/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (start $~start)
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1152
   i32.const 1216
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  local.tee $3
  memory.size
  local.tee $4
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $5
  i32.gt_u
  if
   local.get $4
   local.get $3
   local.get $5
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $5
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $3
  global.set $~lib/rt/stub/offset
  local.get $0
  i32.store
  local.get $2
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1152
   i32.const 1216
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/array/Array<i32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1056
   i32.const 1104
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $3
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435455
   i32.gt_u
   if
    i32.const 1056
    i32.const 1104
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load
   local.set $4
   i32.const 1073741820
   local.get $3
   i32.const 1
   i32.shl
   local.tee $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   i32.const 2
   i32.shl
   local.tee $1
   local.get $1
   local.get $2
   i32.lt_u
   select
   local.tee $5
   i32.const 1073741804
   i32.gt_u
   if
    i32.const 1152
    i32.const 1216
    i32.const 99
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $4
   i32.const 16
   i32.sub
   local.tee $1
   i32.const 15
   i32.and
   i32.const 1
   local.get $1
   select
   if
    i32.const 0
    i32.const 1216
    i32.const 45
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/rt/stub/offset
   local.get $1
   i32.const 4
   i32.sub
   local.tee $6
   i32.load
   local.tee $7
   local.get $1
   i32.add
   i32.eq
   local.set $8
   local.get $5
   i32.const 16
   i32.add
   local.tee $9
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
   local.set $2
   local.get $7
   local.get $9
   i32.lt_u
   if
    local.get $8
    if
     local.get $9
     i32.const 1073741820
     i32.gt_u
     if
      i32.const 1152
      i32.const 1216
      i32.const 52
      i32.const 33
      call $~lib/builtins/abort
      unreachable
     end
     local.get $1
     local.get $2
     i32.add
     local.tee $7
     memory.size
     local.tee $8
     i32.const 16
     i32.shl
     i32.const 15
     i32.add
     i32.const -16
     i32.and
     local.tee $9
     i32.gt_u
     if
      local.get $8
      local.get $7
      local.get $9
      i32.sub
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee $9
      local.get $8
      local.get $9
      i32.gt_s
      select
      memory.grow
      i32.const 0
      i32.lt_s
      if
       local.get $9
       memory.grow
       i32.const 0
       i32.lt_s
       if
        unreachable
       end
      end
     end
     local.get $7
     global.set $~lib/rt/stub/offset
     local.get $6
     local.get $2
     i32.store
    else
     local.get $2
     local.get $7
     i32.const 1
     i32.shl
     local.tee $6
     local.get $2
     local.get $6
     i32.gt_u
     select
     call $~lib/rt/stub/__alloc
     local.tee $2
     local.get $1
     local.get $7
     memory.copy
     local.get $2
     local.set $1
    end
   else
    local.get $8
    if
     local.get $1
     local.get $2
     i32.add
     global.set $~lib/rt/stub/offset
     local.get $6
     local.get $2
     i32.store
    end
   end
   local.get $1
   i32.const 4
   i32.sub
   local.get $5
   i32.store offset=16
   local.get $3
   local.get $1
   i32.const 16
   i32.add
   local.tee $1
   i32.add
   i32.const 0
   local.get $5
   local.get $3
   i32.sub
   memory.fill
   local.get $1
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $1
    i32.store
    local.get $0
    local.get $1
    i32.store offset=4
   end
   local.get $0
   local.get $5
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<i32>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 1280
    i32.const 1104
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $assembly/index/zero7 (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 7
  call $~lib/array/Array<i32>#constructor
  local.set $1
  loop $for-loop|0
   local.get $0
   i32.const 7
   i32.lt_s
   if
    local.get $1
    local.get $0
    i32.const 0
    call $~lib/array/Array<i32>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $~lib/rt/__newArray (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $2
  i32.const 16
  i32.const 5
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/util/string/compareImpl (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.set $1
  local.get $3
  i32.const 4
  i32.ge_u
  if (result i32)
   local.get $1
   i32.const 7
   i32.and
   local.get $2
   i32.const 7
   i32.and
   i32.or
  else
   i32.const 1
  end
  i32.eqz
  if
   loop $do-loop|0
    local.get $1
    i64.load
    local.get $2
    i64.load
    i64.eq
    if
     local.get $1
     i32.const 8
     i32.add
     local.set $1
     local.get $2
     i32.const 8
     i32.add
     local.set $2
     local.get $3
     i32.const 4
     i32.sub
     local.tee $3
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  loop $while-continue|1
   local.get $3
   local.tee $0
   i32.const 1
   i32.sub
   local.set $3
   local.get $0
   if
    local.get $1
    i32.load16_u
    local.tee $0
    local.get $2
    i32.load16_u
    local.tee $4
    i32.ne
    if
     local.get $0
     local.get $4
     i32.sub
     return
    end
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|1
   end
  end
  i32.const 0
 )
 (func $~lib/string/String#indexOf (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $4
  i32.eqz
  if
   i32.const -1
   return
  end
  local.get $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  local.get $4
  local.get $2
  local.get $4
  i32.lt_s
  select
  local.set $2
  local.get $4
  local.get $3
  i32.sub
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $4
   i32.le_s
   if
    local.get $0
    local.get $2
    local.get $1
    local.get $3
    call $~lib/util/string/compareImpl
    i32.eqz
    if
     local.get $2
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $~lib/array/Array<~lib/string/String>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureCapacity
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $assembly/index/splitHistory (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  i32.eqz
  if
   i32.const 16
   i32.const 5
   call $~lib/rt/stub/__new
   local.tee $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   i32.const 32
   i32.const 1
   call $~lib/rt/stub/__new
   local.tee $1
   i32.const 0
   i32.const 32
   memory.fill
   local.get $0
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.store offset=4
   local.get $0
   i32.const 32
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   return
  end
  i32.const 1
  global.set $~argumentsLength
  block $__inlined_func$~lib/string/String#split$1 (result i32)
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.set $6
   block $folding-inner0
    i32.const 1340
    i32.load
    i32.const 1
    i32.shr_u
    local.tee $7
    if
     local.get $6
     i32.eqz
     if
      i32.const 1
      call $~lib/rt/__newArray
      local.tee $0
      i32.load offset=4
      i32.const 1376
      i32.store
      local.get $0
      br $__inlined_func$~lib/string/String#split$1
     end
    else
     local.get $6
     i32.eqz
     br_if $folding-inner0
     i32.const 2147483647
     local.get $6
     local.get $6
     i32.const 2147483647
     i32.eq
     select
     local.tee $2
     call $~lib/rt/__newArray
     local.tee $3
     i32.load offset=4
     local.set $4
     loop $for-loop|0
      local.get $1
      local.get $2
      i32.lt_s
      if
       i32.const 2
       i32.const 2
       call $~lib/rt/stub/__new
       local.tee $5
       local.get $0
       local.get $1
       i32.const 1
       i32.shl
       i32.add
       i32.load16_u
       i32.store16
       local.get $4
       local.get $1
       i32.const 2
       i32.shl
       i32.add
       local.get $5
       i32.store
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       br $for-loop|0
      end
     end
     local.get $3
     br $__inlined_func$~lib/string/String#split$1
    end
    i32.const 0
    call $~lib/rt/__newArray
    local.set $3
    loop $while-continue|1
     local.get $0
     i32.const 1344
     local.get $1
     call $~lib/string/String#indexOf
     local.tee $4
     i32.const -1
     i32.xor
     if
      local.get $4
      local.get $1
      i32.sub
      local.tee $5
      i32.const 0
      i32.gt_s
      if
       local.get $5
       i32.const 1
       i32.shl
       local.tee $5
       i32.const 2
       call $~lib/rt/stub/__new
       local.tee $8
       local.get $0
       local.get $1
       i32.const 1
       i32.shl
       i32.add
       local.get $5
       memory.copy
       local.get $3
       local.get $8
       call $~lib/array/Array<~lib/string/String>#push
      else
       local.get $3
       i32.const 1376
       call $~lib/array/Array<~lib/string/String>#push
      end
      local.get $3
      local.get $2
      i32.const 1
      i32.add
      local.tee $2
      i32.const 2147483647
      i32.eq
      br_if $__inlined_func$~lib/string/String#split$1
      drop
      local.get $4
      local.get $7
      i32.add
      local.set $1
      br $while-continue|1
     end
    end
    local.get $1
    i32.eqz
    if
     local.get $3
     local.get $0
     call $~lib/array/Array<~lib/string/String>#push
     local.get $3
     br $__inlined_func$~lib/string/String#split$1
    end
    local.get $6
    local.get $1
    i32.sub
    local.tee $2
    i32.const 0
    i32.gt_s
    if
     local.get $2
     i32.const 1
     i32.shl
     local.tee $2
     i32.const 2
     call $~lib/rt/stub/__new
     local.tee $4
     local.get $0
     local.get $1
     i32.const 1
     i32.shl
     i32.add
     local.get $2
     memory.copy
     local.get $3
     local.get $4
     call $~lib/array/Array<~lib/string/String>#push
    else
     local.get $3
     i32.const 1376
     call $~lib/array/Array<~lib/string/String>#push
    end
    local.get $3
    br $__inlined_func$~lib/string/String#split$1
   end
   i32.const 0
   call $~lib/rt/__newArray
  end
 )
 (func $~lib/string/String#substring (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $3
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $1
  local.get $1
  local.get $3
  i32.gt_s
  select
  local.tee $3
  local.get $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  local.get $1
  local.get $1
  local.get $2
  i32.gt_s
  select
  local.tee $2
  local.get $2
  local.get $3
  i32.gt_s
  select
  i32.const 1
  i32.shl
  local.set $4
  local.get $3
  local.get $2
  local.get $2
  local.get $3
  i32.lt_s
  select
  i32.const 1
  i32.shl
  local.tee $2
  local.get $4
  i32.sub
  local.tee $3
  i32.eqz
  if
   i32.const 1376
   return
  end
  local.get $4
  i32.eqz
  local.get $2
  local.get $1
  i32.const 1
  i32.shl
  i32.eq
  i32.and
  if
   local.get $0
   return
  end
  local.get $3
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $0
  local.get $4
  i32.add
  local.get $3
  memory.copy
  local.get $1
 )
 (func $~lib/string/String#substring@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 2147483647
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/string/String#substring
 )
 (func $~lib/string/String#charAt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 1376
   return
  end
  i32.const 2
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
  i32.store16
  local.get $2
 )
 (func $~lib/string/String.__eq (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 1568
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $1
  i32.const 1564
  i32.load
  i32.const 1
  i32.shr_u
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 0
  i32.const 1568
  local.get $1
  call $~lib/util/string/compareImpl
  i32.eqz
 )
 (func $~lib/array/Array<i32>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1280
   i32.const 1104
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $assembly/index/addLetters (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $3
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.lt_s
   if
    local.get $1
    local.get $3
    call $~lib/string/String#charAt
    local.tee $2
    call $~lib/string/String.__eq
    i32.eqz
    if
     local.get $0
     local.get $2
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if (result i32)
      local.get $2
      i32.load16_u
     else
      i32.const -1
     end
     i32.const 65
     i32.sub
     local.get $0
     local.get $2
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if (result i32)
      local.get $2
      i32.load16_u
     else
      i32.const -1
     end
     i32.const 65
     i32.sub
     call $~lib/array/Array<i32>#__get
     i32.const 1
     i32.add
     call $~lib/array/Array<i32>#__set
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/sameMultiset (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  i32.ne
  if
   i32.const 0
   return
  end
  call $assembly/index/zero7
  local.set $3
  call $assembly/index/zero7
  local.set $4
  local.get $3
  local.get $0
  call $assembly/index/addLetters
  local.get $4
  local.get $1
  call $assembly/index/addLetters
  loop $for-loop|0
   local.get $2
   i32.const 7
   i32.lt_s
   if
    local.get $3
    local.get $2
    call $~lib/array/Array<i32>#__get
    local.get $4
    local.get $2
    call $~lib/array/Array<i32>#__get
    i32.ne
    if
     i32.const 0
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 1
 )
 (func $assembly/index/calc_current_state_raw (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  call $assembly/index/zero7
  local.set $22
  call $assembly/index/zero7
  local.set $21
  local.get $0
  call $assembly/index/splitHistory
  local.set $14
  loop $for-loop|0
   local.get $9
   local.get $14
   i32.load offset=12
   local.tee $0
   i32.lt_s
   if
    local.get $0
    local.get $9
    i32.le_u
    if
     i32.const 1280
     i32.const 1104
     i32.const 114
     i32.const 42
     call $~lib/builtins/abort
     unreachable
    end
    local.get $14
    i32.load offset=4
    local.get $9
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $0
    i32.eqz
    if
     i32.const 1408
     i32.const 1104
     i32.const 118
     i32.const 40
     call $~lib/builtins/abort
     unreachable
    end
    local.get $9
    local.set $10
    local.get $8
    i32.const 1
    i32.eq
    if (result i32)
     local.get $9
     i32.const 1
     i32.and
     i32.eqz
    else
     local.get $10
     i32.const 2
     i32.rem_s
     i32.const 1
     i32.eq
    end
    local.set $17
    block $__inlined_func$assembly/index/applyToken$58
     local.get $0
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.eqz
     local.tee $9
     br_if $__inlined_func$assembly/index/applyToken$58
     local.get $9
     if (result i32)
      i32.const -1
     else
      local.get $0
      i32.load16_u
     end
     i32.const 48
     i32.sub
     local.set $9
     local.get $0
     i32.const 1536
     i32.const 0
     call $~lib/string/String#indexOf
     local.tee $11
     i32.const 0
     i32.ge_s
     if (result i32)
      local.get $0
      i32.const 1
      local.get $11
      call $~lib/string/String#substring
     else
      i32.const 1
      global.set $~argumentsLength
      local.get $0
      i32.const 1
      call $~lib/string/String#substring@varargs
     end
     local.set $12
     local.get $11
     i32.const 0
     i32.ge_s
     if (result i32)
      i32.const 1
      global.set $~argumentsLength
      local.get $0
      local.get $11
      i32.const 1
      i32.add
      call $~lib/string/String#substring@varargs
     else
      i32.const 1376
     end
     local.set $24
     local.get $9
     i32.const 1
     i32.eq
     if
      local.get $17
      if
       local.get $22
       local.get $12
       call $assembly/index/addLetters
      else
       local.get $21
       local.get $12
       call $assembly/index/addLetters
      end
      br $__inlined_func$assembly/index/applyToken$58
     end
     local.get $9
     i32.const 2
     i32.eq
     br_if $__inlined_func$assembly/index/applyToken$58
     local.get $9
     i32.const 3
     i32.eq
     if
      local.get $24
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.eqz
      br_if $__inlined_func$assembly/index/applyToken$58
      call $assembly/index/zero7
      local.tee $16
      local.get $12
      call $assembly/index/addLetters
      i32.const 0
      local.set $0
      loop $for-loop|00
       local.get $0
       local.get $24
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.lt_s
       if
        local.get $24
        local.get $0
        call $~lib/string/String#charAt
        local.tee $9
        call $~lib/string/String.__eq
        i32.eqz
        if
         local.get $16
         local.get $9
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 1
         i32.shr_u
         if (result i32)
          local.get $9
          i32.load16_u
         else
          i32.const -1
         end
         i32.const 65
         i32.sub
         local.get $16
         local.get $9
         i32.const 20
         i32.sub
         i32.load offset=16
         i32.const 1
         i32.shr_u
         if (result i32)
          local.get $9
          i32.load16_u
         else
          i32.const -1
         end
         i32.const 65
         i32.sub
         call $~lib/array/Array<i32>#__get
         i32.const 1
         i32.sub
         call $~lib/array/Array<i32>#__set
        end
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        br $for-loop|00
       end
      end
      i32.const 1376
      local.set $0
      i32.const 0
      local.set $23
      loop $for-loop|1
       local.get $23
       i32.const 7
       i32.lt_s
       if
        i32.const 0
        local.set $15
        loop $for-loop|2
         local.get $16
         local.get $23
         call $~lib/array/Array<i32>#__get
         local.get $15
         i32.gt_s
         if
          i32.const 1
          global.set $~argumentsLength
          i32.const 2
          i32.const 2
          call $~lib/rt/stub/__new
          local.tee $13
          local.get $23
          i32.const 65
          i32.add
          i32.store16
          i32.const 1376
          local.set $9
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const -2
          i32.and
          local.tee $12
          local.get $13
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const -2
          i32.and
          local.tee $11
          i32.add
          local.tee $25
          if
           local.get $25
           i32.const 2
           call $~lib/rt/stub/__new
           local.tee $9
           local.get $0
           local.get $12
           memory.copy
           local.get $9
           local.get $12
           i32.add
           local.get $13
           local.get $11
           memory.copy
          end
          local.get $9
          local.set $0
          local.get $15
          i32.const 1
          i32.add
          local.set $15
          br $for-loop|2
         end
        end
        local.get $23
        i32.const 1
        i32.add
        local.set $23
        br $for-loop|1
       end
      end
      local.get $17
      if
       local.get $21
       local.get $24
       call $assembly/index/addLetters
       local.get $22
       local.get $0
       call $assembly/index/addLetters
      else
       local.get $22
       local.get $24
       call $assembly/index/addLetters
       local.get $21
       local.get $0
       call $assembly/index/addLetters
      end
      br $__inlined_func$assembly/index/applyToken$58
     end
     local.get $9
     i32.const 4
     i32.eq
     if
      local.get $24
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.eqz
      br_if $__inlined_func$assembly/index/applyToken$58
      local.get $12
      i32.const 0
      i32.const 2
      call $~lib/string/String#substring
      local.tee $0
      local.get $12
      i32.const 2
      i32.const 4
      call $~lib/string/String#substring
      local.tee $9
      local.get $0
      local.get $24
      call $assembly/index/sameMultiset
      select
      local.set $11
      local.get $9
      local.get $0
      local.get $0
      local.get $24
      call $assembly/index/sameMultiset
      select
      local.set $0
      local.get $17
      if
       local.get $21
       local.get $11
       call $assembly/index/addLetters
       local.get $22
       local.get $0
       call $assembly/index/addLetters
      else
       local.get $22
       local.get $11
       call $assembly/index/addLetters
       local.get $21
       local.get $0
       call $assembly/index/addLetters
      end
     end
    end
    local.get $10
    i32.const 1
    i32.add
    local.set $9
    br $for-loop|0
   end
  end
  i32.const 7
  call $~lib/array/Array<i32>#constructor
  local.tee $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 1
  local.get $2
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 2
  local.get $3
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 3
  local.get $4
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 4
  local.get $5
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 5
  local.get $6
  call $~lib/array/Array<i32>#__set
  local.get $0
  i32.const 6
  local.get $7
  call $~lib/array/Array<i32>#__set
  i32.const 7
  call $~lib/array/Array<i32>#constructor
  local.set $1
  loop $for-loop|02
   local.get $18
   i32.const 7
   i32.lt_s
   if
    local.get $1
    local.get $18
    local.get $0
    local.get $18
    call $~lib/array/Array<i32>#__get
    call $~lib/array/Array<i32>#__set
    local.get $18
    i32.const 1
    i32.add
    local.set $18
    br $for-loop|02
   end
  end
  loop $for-loop|001
   local.get $20
   i32.const 7
   i32.lt_s
   if
    local.get $22
    local.get $20
    call $~lib/array/Array<i32>#__get
    local.get $21
    local.get $20
    call $~lib/array/Array<i32>#__get
    i32.gt_s
    if
     local.get $1
     local.get $20
     i32.const 1
     call $~lib/array/Array<i32>#__set
    else
     local.get $22
     local.get $20
     call $~lib/array/Array<i32>#__get
     local.get $21
     local.get $20
     call $~lib/array/Array<i32>#__get
     i32.lt_s
     if
      local.get $1
      local.get $20
      i32.const -1
      call $~lib/array/Array<i32>#__set
     end
    end
    local.get $20
    i32.const 1
    i32.add
    local.set $20
    br $for-loop|001
   end
  end
  i32.const 21
  call $~lib/array/Array<i32>#constructor
  local.set $0
  loop $for-loop|12
   local.get $19
   i32.const 7
   i32.lt_s
   if
    local.get $0
    local.get $19
    local.get $22
    local.get $19
    call $~lib/array/Array<i32>#__get
    call $~lib/array/Array<i32>#__set
    local.get $0
    local.get $19
    i32.const 7
    i32.add
    local.get $21
    local.get $19
    call $~lib/array/Array<i32>#__get
    call $~lib/array/Array<i32>#__set
    local.get $0
    local.get $19
    i32.const 14
    i32.add
    local.get $1
    local.get $19
    call $~lib/array/Array<i32>#__get
    call $~lib/array/Array<i32>#__set
    local.get $19
    i32.const 1
    i32.add
    local.set $19
    br $for-loop|12
   end
  end
  local.get $0
 )
 (func $assembly/index/calc_current_state_raw@varargs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 8
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 1
   local.set $8
  end
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  local.get $4
  local.get $5
  local.get $6
  local.get $7
  local.get $8
  call $assembly/index/calc_current_state_raw
 )
 (func $~lib/rt/stub/__pin (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/rt/stub/__unpin (param $0 i32)
 )
 (func $~lib/rt/stub/__collect
 )
 (func $~setArgumentsLength (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~start
  i32.const 1612
  global.set $~lib/rt/stub/offset
 )
)
