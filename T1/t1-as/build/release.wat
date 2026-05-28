(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func))
 (type $2 (func (param i32 i32 i32 i32)))
 (type $3 (func (param i32 i32 i32 i32) (result i32)))
 (type $4 (func (param i32) (result i32)))
 (type $5 (func (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $assembly/index/INT8_ARRAY_ID i32 (i32.const 4))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1440))
 (memory $0 1)
 (data $0 (i32.const 1036) ",")
 (data $0.1 (i32.const 1048) "\01\00\00\00\1c\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00\04\00\00\00\05")
 (data $1 (i32.const 1084) ",")
 (data $1.1 (i32.const 1096) "\05\00\00\00\10\00\00\00 \04\00\00 \04\00\00\1c\00\00\00\07")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $3 (i32.const 1196) "<")
 (data $3.1 (i32.const 1208) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $4 (i32.const 1260) ",")
 (data $4.1 (i32.const 1272) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $5 (i32.const 1308) "<")
 (data $5.1 (i32.const 1320) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $6 (i32.const 1372) "<")
 (data $6.1 (i32.const 1384) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $7 (i32.const 1440) "\06\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00A\08\00\00\02\t")
 (export "INT8_ARRAY_ID" (global $assembly/index/INT8_ARRAY_ID))
 (export "hanamikoji_judge" (func $assembly/index/hanamikoji_judge))
 (export "__new" (func $~lib/rt/stub/__new))
 (export "__pin" (func $~lib/rt/stub/__pin))
 (export "__unpin" (func $~lib/rt/stub/__unpin))
 (export "__collect" (func $~lib/rt/stub/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/typedarray/Int8Array#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 1152
   i32.const 1216
   i32.const 25
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_s
 )
 (func $assembly/index/calcScore (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $3
   i32.const 7
   i32.lt_s
   if
    local.get $0
    local.get $3
    call $~lib/typedarray/Int8Array#__get
    local.get $1
    i32.eq
    if
     local.get $3
     i32.const 1116
     i32.load
     i32.ge_u
     if
      i32.const 1152
      i32.const 1280
      i32.const 114
      i32.const 42
      call $~lib/builtins/abort
      unreachable
     end
     local.get $2
     i32.const 1108
     i32.load
     local.get $3
     i32.const 2
     i32.shl
     i32.add
     i32.load
     i32.add
     local.set $2
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $assembly/index/countMarks (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $2
   i32.const 7
   i32.lt_s
   if
    local.get $3
    i32.const 1
    i32.add
    local.get $3
    local.get $0
    local.get $2
    call $~lib/typedarray/Int8Array#__get
    local.get $1
    i32.eq
    select
    local.set $3
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $assembly/index/sideHasAny (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.le_s
   if
    local.get $0
    local.get $2
    call $~lib/typedarray/Int8Array#__get
    local.get $1
    i32.eq
    if
     i32.const 1
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 0
 )
 (func $assembly/index/hanamikoji_judge (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1
  call $assembly/index/calcScore
  local.set $2
  local.get $0
  i32.const -1
  call $assembly/index/calcScore
  local.set $3
  local.get $0
  i32.const 1
  call $assembly/index/countMarks
  local.set $4
  local.get $0
  i32.const -1
  call $assembly/index/countMarks
  local.set $5
  local.get $2
  i32.const 11
  i32.ge_s
  if
   i32.const 1
   return
  end
  local.get $3
  i32.const 11
  i32.ge_s
  if
   i32.const -1
   return
  end
  local.get $3
  i32.const 11
  i32.lt_s
  local.get $4
  i32.const 4
  i32.ge_s
  i32.and
  if
   i32.const 1
   return
  end
  local.get $2
  i32.const 11
  i32.lt_s
  local.get $5
  i32.const 4
  i32.ge_s
  i32.and
  if
   i32.const -1
   return
  end
  local.get $1
  i32.const 3
  i32.lt_s
  if
   i32.const 0
   return
  end
  local.get $2
  local.get $3
  i32.gt_s
  if
   i32.const 1
   return
  end
  local.get $2
  local.get $3
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.const 6
  call $~lib/typedarray/Int8Array#__get
  i32.const 1
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $0
  i32.const 6
  call $~lib/typedarray/Int8Array#__get
  i32.const -1
  i32.eq
  if
   i32.const -1
   return
  end
  local.get $0
  i32.const 5
  call $~lib/typedarray/Int8Array#__get
  i32.const 1
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $0
  i32.const 5
  call $~lib/typedarray/Int8Array#__get
  i32.const -1
  i32.eq
  if
   i32.const -1
   return
  end
  local.get $0
  i32.const 1
  i32.const 3
  i32.const 4
  call $assembly/index/sideHasAny
  local.set $1
  local.get $0
  i32.const -1
  i32.const 3
  i32.const 4
  call $assembly/index/sideHasAny
  local.get $1
  i32.ne
  if
   i32.const 1
   i32.const -1
   local.get $1
   select
   return
  end
  local.get $0
  i32.const 1
  i32.const 0
  i32.const 2
  call $assembly/index/sideHasAny
  local.set $1
  local.get $0
  i32.const -1
  i32.const 0
  i32.const 2
  call $assembly/index/sideHasAny
  local.get $1
  i32.ne
  if
   i32.const 1
   i32.const -1
   local.get $1
   select
   return
  end
  i32.const 2
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1328
   i32.const 1392
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  local.tee $4
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1328
   i32.const 1392
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
  local.get $4
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $4
  i32.add
  local.tee $5
  memory.size
  local.tee $6
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $7
  i32.gt_u
  if
   local.get $6
   local.get $5
   local.get $7
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $7
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $5
  global.set $~lib/rt/stub/offset
  local.get $4
  i32.store
  local.get $2
  i32.const 4
  i32.sub
  local.tee $3
  i32.const 0
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store offset=8
  local.get $3
  local.get $1
  i32.store offset=12
  local.get $3
  local.get $0
  i32.store offset=16
  local.get $2
  i32.const 16
  i32.add
 )
 (func $~lib/rt/stub/__pin (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/rt/stub/__unpin (param $0 i32)
 )
 (func $~lib/rt/stub/__collect
 )
 (func $~start
  i32.const 1468
  global.set $~lib/rt/stub/offset
 )
)
