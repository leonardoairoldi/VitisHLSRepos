; ModuleID = 'C:/dev/VitisHLSRepos/LoopPipeline/solution_default/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<5>" = type { %"struct.ap_int_base<5, true>" }
%"struct.ap_int_base<5, true>" = type { %"struct.ssdm_int<5, true>" }
%"struct.ssdm_int<5, true>" = type { i5 }
%"struct.ap_int<20>" = type { %"struct.ap_int_base<20, true>" }
%"struct.ap_int_base<20, true>" = type { %"struct.ssdm_int<20, true>" }
%"struct.ssdm_int<20, true>" = type { i20 }

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([20 x %"struct.ap_int<5>"]* noalias readonly "unpacked"="0", [20 x i5]* noalias nocapture align 512 "unpacked"="1.0.0.0") unnamed_addr #0 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a20struct.ap_int<5>"([20 x i5]* align 512 %1, [20 x %"struct.ap_int<5>"]* %0)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([20 x %"struct.ap_int<5>"]* noalias "unpacked"="0", [20 x i5]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a20struct.ap_int<5>.8"([20 x %"struct.ap_int<5>"]* %0, [20 x i5]* align 512 %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a20struct.ap_int<5>.8"([20 x %"struct.ap_int<5>"]* noalias "unpacked"="0", [20 x i5]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [20 x %"struct.ap_int<5>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [20 x i5], [20 x i5]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [20 x %"struct.ap_int<5>"], [20 x %"struct.ap_int<5>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = bitcast i5* %src.addr.0.0.05 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i5
  store i5 %5, i5* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 20
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a20struct.ap_int<5>"([20 x i5]* noalias nocapture align 512 "unpacked"="0.0.0.0", [20 x %"struct.ap_int<5>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [20 x %"struct.ap_int<5>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [20 x %"struct.ap_int<5>"], [20 x %"struct.ap_int<5>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [20 x i5], [20 x i5]* %0, i64 0, i64 %for.loop.idx1
  %3 = bitcast i5* %src.addr.0.0.05 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i5
  store i5 %5, i5* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 20
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @apatb_loop_pipeline_hw(%"struct.ap_int<20>"*, i5*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([20 x %"struct.ap_int<5>"]* noalias "unpacked"="0", [20 x i5]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #1 {
entry:
  ret void
}

define void @loop_pipeline_hw_stub_wrapper(%"struct.ap_int<20>"*, i5*) #3 {
entry:
  %2 = alloca [20 x %"struct.ap_int<5>"]
  %3 = bitcast i5* %1 to [20 x i5]*
  call void @copy_out([20 x %"struct.ap_int<5>"]* %2, [20 x i5]* %3)
  %4 = bitcast [20 x %"struct.ap_int<5>"]* %2 to %"struct.ap_int<5>"*
  call void @loop_pipeline_hw_stub(%"struct.ap_int<20>"* %0, %"struct.ap_int<5>"* %4)
  call void @copy_in([20 x %"struct.ap_int<5>"]* %2, [20 x i5]* %3)
  ret void
}

declare void @loop_pipeline_hw_stub(%"struct.ap_int<20>"*, %"struct.ap_int<5>"*)

; Function Attrs: noinline
define void @apatb_loop_pipeline_ir(i32* %ret, %"struct.ap_int<5>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="20" %A) #4 {
entry:
  %A_copy = alloca [20 x i5], align 512
  %0 = bitcast %"struct.ap_int<5>"* %A to [20 x %"struct.ap_int<5>"]*
  call fastcc void @copy_in([20 x %"struct.ap_int<5>"]* nonnull %0, [20 x i5]* nonnull align 512 %A_copy)
  %1 = getelementptr [20 x i5], [20 x i5]* %A_copy, i32 0, i32 0
  %2 = alloca %"struct.ap_int<20>"
  call void @apatb_loop_pipeline_hw(%"struct.ap_int<20>"* %2, i5* %1)
  %3 = load volatile %"struct.ap_int<20>", %"struct.ap_int<20>"* %2
  call void @copy_back([20 x %"struct.ap_int<5>"]* %0, [20 x i5]* %A_copy)
  %4 = bitcast %"struct.ap_int<20>"* %2 to i32*
  %5 = load volatile i32, i32* %4
  store i32 %5, i32* %ret
  ret void
}

attributes #0 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { "fpga.wrapper.func"="stub" }
attributes #4 = { noinline "fpga.wrapper.func"="wrapper" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
