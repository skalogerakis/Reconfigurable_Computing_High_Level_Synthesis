; ModuleID = '/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/main.c'
source_filename = "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/main.c"
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7--linux-gnueabihf"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timespec = type { i32, i32 }

@.str = private unnamed_addr constant [23 x i8] c"SOMETHING WENT WRONG\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"SUCCESS\0A\0A\00", align 1
@stdout = external global %struct._IO_FILE*, align 4
@.str.2 = private unnamed_addr constant [8 x i8] c"seed>=0\00", align 1
@.str.3 = private unnamed_addr constant [88 x i8] c"/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/main.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"size>=1\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"dim>=2\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"threshold>=0.0\00", align 1
@.str.7 = private unnamed_addr constant [44 x i8] c"Seed %u\0ASize %u\0ADimension %u\0AThreshold %f\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"data0!=NULL\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"data1!=NULL\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"data2!=NULL\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"Executing myFunc...\0A\00", align 1
@.str.12 = private unnamed_addr constant [36 x i8] c"Reference Code execution time: %f\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"data2_hw!=NULL\00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"Executing myFuncAccel...\0A\00", align 1
@.str.15 = private unnamed_addr constant [30 x i8] c"Hardware execution time: %f\0A\0A\00", align 1

; Function Attrs: nounwind
define void @myFunc(i32, i32, float, float*, float*, float*) #0 !dbg !15 !xidane.fname !19 !xidane.function_declaration_type !20 !xidane.function_declaration_filename !21 !xidane.ExternC !22 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float*, align 4
  %11 = alloca float*, align 4
  %12 = alloca float*, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !23, metadata !24), !dbg !25
  store i32 %1, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !26, metadata !24), !dbg !27
  store float %2, float* %9, align 4
  call void @llvm.dbg.declare(metadata float* %9, metadata !28, metadata !24), !dbg !29
  store float* %3, float** %10, align 4
  call void @llvm.dbg.declare(metadata float** %10, metadata !30, metadata !24), !dbg !31
  store float* %4, float** %11, align 4
  call void @llvm.dbg.declare(metadata float** %11, metadata !32, metadata !24), !dbg !33
  store float* %5, float** %12, align 4
  call void @llvm.dbg.declare(metadata float** %12, metadata !34, metadata !24), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %13, metadata !36, metadata !24), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %14, metadata !38, metadata !24), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %15, metadata !40, metadata !24), !dbg !41
  store i32 0, i32* %13, align 4, !dbg !42
  br label %17, !dbg !44

; <label>:17:                                     ; preds = %127, %6
  %18 = load i32, i32* %13, align 4, !dbg !45
  %19 = load i32, i32* %7, align 4, !dbg !48
  %20 = icmp ult i32 %18, %19, !dbg !49
  br i1 %20, label %21, label %130, !dbg !50

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %14, align 4, !dbg !51
  br label %22, !dbg !54

; <label>:22:                                     ; preds = %34, %21
  %23 = load i32, i32* %14, align 4, !dbg !55
  %24 = load i32, i32* %8, align 4, !dbg !58
  %25 = icmp ult i32 %23, %24, !dbg !59
  br i1 %25, label %26, label %37, !dbg !60

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %13, align 4, !dbg !61
  %28 = load i32, i32* %8, align 4, !dbg !63
  %29 = mul i32 %27, %28, !dbg !64
  %30 = load i32, i32* %14, align 4, !dbg !65
  %31 = add i32 %29, %30, !dbg !66
  %32 = load float*, float** %12, align 4, !dbg !67
  %33 = getelementptr inbounds float, float* %32, i32 %31, !dbg !67
  store float 0.000000e+00, float* %33, align 4, !dbg !68
  br label %34, !dbg !69

; <label>:34:                                     ; preds = %26
  %35 = load i32, i32* %14, align 4, !dbg !70
  %36 = add i32 %35, 1, !dbg !70
  store i32 %36, i32* %14, align 4, !dbg !70
  br label %22, !dbg !72, !llvm.loop !73

; <label>:37:                                     ; preds = %22
  store i32 0, i32* %14, align 4, !dbg !75
  br label %38, !dbg !77

; <label>:38:                                     ; preds = %78, %37
  %39 = load i32, i32* %14, align 4, !dbg !78
  %40 = load i32, i32* %8, align 4, !dbg !81
  %41 = icmp ult i32 %39, %40, !dbg !82
  br i1 %41, label %42, label %81, !dbg !83

; <label>:42:                                     ; preds = %38
  store i32 0, i32* %15, align 4, !dbg !84
  br label %43, !dbg !87

; <label>:43:                                     ; preds = %74, %42
  %44 = load i32, i32* %15, align 4, !dbg !88
  %45 = load i32, i32* %8, align 4, !dbg !91
  %46 = icmp ult i32 %44, %45, !dbg !92
  br i1 %46, label %47, label %77, !dbg !93

; <label>:47:                                     ; preds = %43
  %48 = load i32, i32* %14, align 4, !dbg !94
  %49 = load i32, i32* %8, align 4, !dbg !96
  %50 = mul i32 %48, %49, !dbg !97
  %51 = load i32, i32* %15, align 4, !dbg !98
  %52 = add i32 %50, %51, !dbg !99
  %53 = load float*, float** %10, align 4, !dbg !100
  %54 = getelementptr inbounds float, float* %53, i32 %52, !dbg !100
  %55 = load float, float* %54, align 4, !dbg !100
  %56 = load i32, i32* %13, align 4, !dbg !101
  %57 = load i32, i32* %8, align 4, !dbg !102
  %58 = mul i32 %56, %57, !dbg !103
  %59 = load i32, i32* %15, align 4, !dbg !104
  %60 = add i32 %58, %59, !dbg !105
  %61 = load float*, float** %11, align 4, !dbg !106
  %62 = getelementptr inbounds float, float* %61, i32 %60, !dbg !106
  %63 = load float, float* %62, align 4, !dbg !106
  %64 = fmul float %55, %63, !dbg !107
  %65 = load i32, i32* %13, align 4, !dbg !108
  %66 = load i32, i32* %8, align 4, !dbg !109
  %67 = mul i32 %65, %66, !dbg !110
  %68 = load i32, i32* %14, align 4, !dbg !111
  %69 = add i32 %67, %68, !dbg !112
  %70 = load float*, float** %12, align 4, !dbg !113
  %71 = getelementptr inbounds float, float* %70, i32 %69, !dbg !113
  %72 = load float, float* %71, align 4, !dbg !114
  %73 = fadd float %72, %64, !dbg !114
  store float %73, float* %71, align 4, !dbg !114
  br label %74, !dbg !115

; <label>:74:                                     ; preds = %47
  %75 = load i32, i32* %15, align 4, !dbg !116
  %76 = add i32 %75, 1, !dbg !116
  store i32 %76, i32* %15, align 4, !dbg !116
  br label %43, !dbg !118, !llvm.loop !119

; <label>:77:                                     ; preds = %43
  br label %78, !dbg !121

; <label>:78:                                     ; preds = %77
  %79 = load i32, i32* %14, align 4, !dbg !122
  %80 = add i32 %79, 1, !dbg !122
  store i32 %80, i32* %14, align 4, !dbg !122
  br label %38, !dbg !124, !llvm.loop !125

; <label>:81:                                     ; preds = %38
  call void @llvm.dbg.declare(metadata i32* %16, metadata !127, metadata !24), !dbg !129
  store i32 1, i32* %16, align 4, !dbg !129
  store i32 0, i32* %15, align 4, !dbg !130
  br label %82, !dbg !132

; <label>:82:                                     ; preds = %103, %81
  %83 = load i32, i32* %16, align 4, !dbg !133
  %84 = icmp ne i32 %83, 0, !dbg !133
  br i1 %84, label %85, label %89, !dbg !136

; <label>:85:                                     ; preds = %82
  %86 = load i32, i32* %15, align 4, !dbg !137
  %87 = load i32, i32* %8, align 4, !dbg !139
  %88 = icmp ult i32 %86, %87, !dbg !140
  br label %89

; <label>:89:                                     ; preds = %85, %82
  %90 = phi i1 [ false, %82 ], [ %88, %85 ]
  br i1 %90, label %91, label %106, !dbg !141

; <label>:91:                                     ; preds = %89
  %92 = load i32, i32* %13, align 4, !dbg !143
  %93 = load i32, i32* %8, align 4, !dbg !145
  %94 = mul i32 %92, %93, !dbg !146
  %95 = load i32, i32* %15, align 4, !dbg !147
  %96 = add i32 %94, %95, !dbg !148
  %97 = load float*, float** %12, align 4, !dbg !149
  %98 = getelementptr inbounds float, float* %97, i32 %96, !dbg !149
  %99 = load float, float* %98, align 4, !dbg !149
  %100 = load float, float* %9, align 4, !dbg !150
  %101 = fcmp ogt float %99, %100, !dbg !151
  %102 = zext i1 %101 to i32, !dbg !151
  store i32 %102, i32* %16, align 4, !dbg !152
  br label %103, !dbg !153

; <label>:103:                                    ; preds = %91
  %104 = load i32, i32* %15, align 4, !dbg !154
  %105 = add i32 %104, 1, !dbg !154
  store i32 %105, i32* %15, align 4, !dbg !154
  br label %82, !dbg !156, !llvm.loop !157

; <label>:106:                                    ; preds = %89
  %107 = load i32, i32* %16, align 4, !dbg !159
  %108 = icmp ne i32 %107, 0, !dbg !159
  br i1 %108, label %109, label %126, !dbg !161

; <label>:109:                                    ; preds = %106
  store i32 0, i32* %15, align 4, !dbg !162
  br label %110, !dbg !165

; <label>:110:                                    ; preds = %122, %109
  %111 = load i32, i32* %15, align 4, !dbg !166
  %112 = load i32, i32* %8, align 4, !dbg !169
  %113 = icmp ult i32 %111, %112, !dbg !170
  br i1 %113, label %114, label %125, !dbg !171

; <label>:114:                                    ; preds = %110
  %115 = load i32, i32* %13, align 4, !dbg !172
  %116 = load i32, i32* %8, align 4, !dbg !174
  %117 = mul i32 %115, %116, !dbg !175
  %118 = load i32, i32* %15, align 4, !dbg !176
  %119 = add i32 %117, %118, !dbg !177
  %120 = load float*, float** %12, align 4, !dbg !178
  %121 = getelementptr inbounds float, float* %120, i32 %119, !dbg !178
  store float 0.000000e+00, float* %121, align 4, !dbg !179
  br label %122, !dbg !180

; <label>:122:                                    ; preds = %114
  %123 = load i32, i32* %15, align 4, !dbg !181
  %124 = add i32 %123, 1, !dbg !181
  store i32 %124, i32* %15, align 4, !dbg !181
  br label %110, !dbg !183, !llvm.loop !184

; <label>:125:                                    ; preds = %110
  br label %126, !dbg !186

; <label>:126:                                    ; preds = %125, %106
  br label %127, !dbg !187

; <label>:127:                                    ; preds = %126
  %128 = load i32, i32* %13, align 4, !dbg !188
  %129 = add i32 %128, 1, !dbg !188
  store i32 %129, i32* %13, align 4, !dbg !188
  br label %17, !dbg !190, !llvm.loop !191

; <label>:130:                                    ; preds = %17
  ret void, !dbg !193
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
define void @validityChecker(i32, i32, float*, float*) #0 !dbg !194 !xidane.fname !197 !xidane.function_declaration_type !198 !xidane.function_declaration_filename !199 !xidane.ExternC !22 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca float*, align 4
  %8 = alloca float*, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !200, metadata !24), !dbg !201
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !202, metadata !24), !dbg !203
  store float* %2, float** %7, align 4
  call void @llvm.dbg.declare(metadata float** %7, metadata !204, metadata !24), !dbg !205
  store float* %3, float** %8, align 4
  call void @llvm.dbg.declare(metadata float** %8, metadata !206, metadata !24), !dbg !207
  call void @llvm.dbg.declare(metadata i32* %9, metadata !208, metadata !24), !dbg !209
  store i32 0, i32* %9, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata i32* %10, metadata !210, metadata !24), !dbg !212
  store i32 0, i32* %10, align 4, !dbg !212
  br label %11, !dbg !213

; <label>:11:                                     ; preds = %33, %4
  %12 = load i32, i32* %9, align 4, !dbg !214
  %13 = icmp ne i32 %12, 1, !dbg !217
  br i1 %13, label %14, label %20, !dbg !218

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %10, align 4, !dbg !219
  %16 = load i32, i32* %6, align 4, !dbg !221
  %17 = load i32, i32* %5, align 4, !dbg !222
  %18 = mul i32 %16, %17, !dbg !223
  %19 = icmp ult i32 %15, %18, !dbg !224
  br label %20

; <label>:20:                                     ; preds = %14, %11
  %21 = phi i1 [ false, %11 ], [ %19, %14 ]
  br i1 %21, label %22, label %36, !dbg !225

; <label>:22:                                     ; preds = %20
  %23 = load i32, i32* %10, align 4, !dbg !227
  %24 = load float*, float** %7, align 4, !dbg !229
  %25 = getelementptr inbounds float, float* %24, i32 %23, !dbg !229
  %26 = load float, float* %25, align 4, !dbg !229
  %27 = load i32, i32* %10, align 4, !dbg !230
  %28 = load float*, float** %8, align 4, !dbg !231
  %29 = getelementptr inbounds float, float* %28, i32 %27, !dbg !231
  %30 = load float, float* %29, align 4, !dbg !231
  %31 = fcmp une float %26, %30, !dbg !232
  %32 = select i1 %31, i32 1, i32 0, !dbg !229
  store i32 %32, i32* %9, align 4, !dbg !233
  br label %33, !dbg !234

; <label>:33:                                     ; preds = %22
  %34 = load i32, i32* %10, align 4, !dbg !235
  %35 = add nsw i32 %34, 1, !dbg !235
  store i32 %35, i32* %10, align 4, !dbg !235
  br label %11, !dbg !237, !llvm.loop !238

; <label>:36:                                     ; preds = %20
  %37 = load i32, i32* %9, align 4, !dbg !240
  %38 = icmp eq i32 %37, 1, !dbg !241
  %39 = select i1 %38, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), !dbg !240
  %40 = call i32 (i8*, ...) @printf(i8* %39), !dbg !242
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !243
  %42 = call i32 @fflush(%struct._IO_FILE* %41), !dbg !244
  ret void, !dbg !245
}

declare !xidane.fname !246 !xidane.function_declaration_type !247 !xidane.function_declaration_filename !248 !xidane.ExternC !22 i32 @printf(i8*, ...) #2

declare !xidane.fname !249 !xidane.function_declaration_type !250 !xidane.function_declaration_filename !248 !xidane.ExternC !22 i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind
define i32 @main(i32, i8**) #0 !dbg !251 !xidane.fname !257 !xidane.function_declaration_type !258 !xidane.function_declaration_filename !199 !xidane.ExternC !22 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float*, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float*, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float*, align 4
  %18 = alloca double, align 8
  %19 = alloca %struct.timespec, align 4
  %20 = alloca %struct.timespec, align 4
  %21 = alloca float*, align 4
  %22 = alloca double, align 8
  %23 = alloca %struct.timespec, align 4
  %24 = alloca %struct.timespec, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !259, metadata !24), !dbg !260
  store i8** %1, i8*** %5, align 4
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !261, metadata !24), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %6, metadata !263, metadata !24), !dbg !264
  call void @llvm.dbg.declare(metadata i32* %7, metadata !265, metadata !24), !dbg !266
  %25 = load i8**, i8*** %5, align 4, !dbg !267
  %26 = getelementptr inbounds i8*, i8** %25, i32 1, !dbg !267
  %27 = load i8*, i8** %26, align 4, !dbg !267
  %28 = call i32 @atoi(i8* %27) #6, !dbg !268
  store i32 %28, i32* %7, align 4, !dbg !266
  %29 = load i32, i32* %7, align 4, !dbg !269
  %30 = icmp uge i32 %29, 0, !dbg !269
  br i1 %30, label %31, label %32, !dbg !272

; <label>:31:                                     ; preds = %2
  br label %33, !dbg !273

; <label>:32:                                     ; preds = %2
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 66, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !275
  unreachable, !dbg !275

; <label>:33:                                     ; preds = %31
  %34 = load i32, i32* %7, align 4, !dbg !277
  call void @srand(i32 %34) #8, !dbg !278
  call void @llvm.dbg.declare(metadata i32* %8, metadata !279, metadata !24), !dbg !280
  %35 = load i8**, i8*** %5, align 4, !dbg !281
  %36 = getelementptr inbounds i8*, i8** %35, i32 2, !dbg !281
  %37 = load i8*, i8** %36, align 4, !dbg !281
  %38 = call i32 @atoi(i8* %37) #6, !dbg !282
  store i32 %38, i32* %8, align 4, !dbg !280
  %39 = load i32, i32* %8, align 4, !dbg !283
  %40 = icmp uge i32 %39, 1, !dbg !283
  br i1 %40, label %41, label %42, !dbg !286

; <label>:41:                                     ; preds = %33
  br label %43, !dbg !287

; <label>:42:                                     ; preds = %33
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 71, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !289
  unreachable, !dbg !289

; <label>:43:                                     ; preds = %41
  call void @llvm.dbg.declare(metadata i32* %9, metadata !291, metadata !24), !dbg !292
  %44 = load i8**, i8*** %5, align 4, !dbg !293
  %45 = getelementptr inbounds i8*, i8** %44, i32 3, !dbg !293
  %46 = load i8*, i8** %45, align 4, !dbg !293
  %47 = call i32 @atoi(i8* %46) #6, !dbg !294
  store i32 %47, i32* %9, align 4, !dbg !292
  %48 = load i32, i32* %9, align 4, !dbg !295
  %49 = icmp uge i32 %48, 2, !dbg !295
  br i1 %49, label %50, label %51, !dbg !298

; <label>:50:                                     ; preds = %43
  br label %52, !dbg !299

; <label>:51:                                     ; preds = %43
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 74, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !301
  unreachable, !dbg !301

; <label>:52:                                     ; preds = %50
  call void @llvm.dbg.declare(metadata float* %10, metadata !303, metadata !24), !dbg !304
  %53 = load i8**, i8*** %5, align 4, !dbg !305
  %54 = getelementptr inbounds i8*, i8** %53, i32 4, !dbg !305
  %55 = load i8*, i8** %54, align 4, !dbg !305
  %56 = call double @atof(i8* %55) #6, !dbg !306
  %57 = fptrunc double %56 to float, !dbg !307
  store float %57, float* %10, align 4, !dbg !304
  %58 = load float, float* %10, align 4, !dbg !308
  %59 = fpext float %58 to double, !dbg !308
  %60 = fcmp oge double %59, 0.000000e+00, !dbg !308
  br i1 %60, label %61, label %62, !dbg !311

; <label>:61:                                     ; preds = %52
  br label %63, !dbg !312

; <label>:62:                                     ; preds = %52
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 77, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !314
  unreachable, !dbg !314

; <label>:63:                                     ; preds = %61
  %64 = load i32, i32* %7, align 4, !dbg !316
  %65 = load i32, i32* %8, align 4, !dbg !317
  %66 = load i32, i32* %9, align 4, !dbg !318
  %67 = load float, float* %10, align 4, !dbg !319
  %68 = fpext float %67 to double, !dbg !319
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.7, i32 0, i32 0), i32 %64, i32 %65, i32 %66, double %68), !dbg !320
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !321
  %71 = call i32 @fflush(%struct._IO_FILE* %70), !dbg !322
  call void @llvm.dbg.declare(metadata float** %11, metadata !323, metadata !24), !dbg !324
  %72 = load i32, i32* %9, align 4, !dbg !325
  %73 = mul i32 4, %72, !dbg !326
  %74 = load i32, i32* %9, align 4, !dbg !327
  %75 = mul i32 %73, %74, !dbg !328
  %76 = call i8* @sds_alloc(i32 %75), !dbg !329
  %77 = bitcast i8* %76 to float*, !dbg !330
  store float* %77, float** %11, align 4, !dbg !324
  %78 = load float*, float** %11, align 4, !dbg !331
  %79 = icmp ne float* %78, null, !dbg !331
  br i1 %79, label %80, label %81, !dbg !334

; <label>:80:                                     ; preds = %63
  br label %82, !dbg !335

; <label>:81:                                     ; preds = %63
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !337
  unreachable, !dbg !337

; <label>:82:                                     ; preds = %80
  store i32 0, i32* %6, align 4, !dbg !339
  br label %83, !dbg !341

; <label>:83:                                     ; preds = %103, %82
  %84 = load i32, i32* %6, align 4, !dbg !342
  %85 = load i32, i32* %9, align 4, !dbg !345
  %86 = load i32, i32* %9, align 4, !dbg !346
  %87 = mul i32 %85, %86, !dbg !347
  %88 = icmp ult i32 %84, %87, !dbg !348
  br i1 %88, label %89, label %106, !dbg !349

; <label>:89:                                     ; preds = %83
  call void @llvm.dbg.declare(metadata float* %12, metadata !350, metadata !24), !dbg !352
  %90 = call i32 @rand() #8, !dbg !353
  %91 = srem i32 %90, 10, !dbg !354
  %92 = sitofp i32 %91 to float, !dbg !355
  store float %92, float* %12, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata float* %13, metadata !356, metadata !24), !dbg !357
  %93 = call i32 @rand() #8, !dbg !358
  %94 = srem i32 %93, 10, !dbg !359
  %95 = sitofp i32 %94 to float, !dbg !360
  %96 = fdiv float %95, 1.000000e+01, !dbg !361
  store float %96, float* %13, align 4, !dbg !357
  %97 = load float, float* %12, align 4, !dbg !362
  %98 = load float, float* %13, align 4, !dbg !363
  %99 = fadd float %97, %98, !dbg !364
  %100 = load i32, i32* %6, align 4, !dbg !365
  %101 = load float*, float** %11, align 4, !dbg !366
  %102 = getelementptr inbounds float, float* %101, i32 %100, !dbg !366
  store float %99, float* %102, align 4, !dbg !367
  br label %103, !dbg !368

; <label>:103:                                    ; preds = %89
  %104 = load i32, i32* %6, align 4, !dbg !369
  %105 = add i32 %104, 1, !dbg !369
  store i32 %105, i32* %6, align 4, !dbg !369
  br label %83, !dbg !371, !llvm.loop !372

; <label>:106:                                    ; preds = %83
  call void @llvm.dbg.declare(metadata float** %14, metadata !374, metadata !24), !dbg !375
  %107 = load i32, i32* %9, align 4, !dbg !376
  %108 = mul i32 4, %107, !dbg !377
  %109 = load i32, i32* %8, align 4, !dbg !378
  %110 = mul i32 %108, %109, !dbg !379
  %111 = call i8* @sds_alloc(i32 %110), !dbg !380
  %112 = bitcast i8* %111 to float*, !dbg !381
  store float* %112, float** %14, align 4, !dbg !375
  %113 = load float*, float** %14, align 4, !dbg !382
  %114 = icmp ne float* %113, null, !dbg !382
  br i1 %114, label %115, label %116, !dbg !385

; <label>:115:                                    ; preds = %106
  br label %117, !dbg !386

; <label>:116:                                    ; preds = %106
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 102, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !388
  unreachable, !dbg !388

; <label>:117:                                    ; preds = %115
  store i32 0, i32* %6, align 4, !dbg !390
  br label %118, !dbg !392

; <label>:118:                                    ; preds = %138, %117
  %119 = load i32, i32* %6, align 4, !dbg !393
  %120 = load i32, i32* %9, align 4, !dbg !396
  %121 = load i32, i32* %8, align 4, !dbg !397
  %122 = mul i32 %120, %121, !dbg !398
  %123 = icmp ult i32 %119, %122, !dbg !399
  br i1 %123, label %124, label %141, !dbg !400

; <label>:124:                                    ; preds = %118
  call void @llvm.dbg.declare(metadata float* %15, metadata !401, metadata !24), !dbg !403
  %125 = call i32 @rand() #8, !dbg !404
  %126 = srem i32 %125, 10, !dbg !405
  %127 = sitofp i32 %126 to float, !dbg !406
  store float %127, float* %15, align 4, !dbg !403
  call void @llvm.dbg.declare(metadata float* %16, metadata !407, metadata !24), !dbg !408
  %128 = call i32 @rand() #8, !dbg !409
  %129 = srem i32 %128, 10, !dbg !410
  %130 = sitofp i32 %129 to float, !dbg !411
  %131 = fdiv float %130, 1.000000e+01, !dbg !412
  store float %131, float* %16, align 4, !dbg !408
  %132 = load float, float* %15, align 4, !dbg !413
  %133 = load float, float* %16, align 4, !dbg !414
  %134 = fadd float %132, %133, !dbg !415
  %135 = load i32, i32* %6, align 4, !dbg !416
  %136 = load float*, float** %14, align 4, !dbg !417
  %137 = getelementptr inbounds float, float* %136, i32 %135, !dbg !417
  store float %134, float* %137, align 4, !dbg !418
  br label %138, !dbg !419

; <label>:138:                                    ; preds = %124
  %139 = load i32, i32* %6, align 4, !dbg !420
  %140 = add i32 %139, 1, !dbg !420
  store i32 %140, i32* %6, align 4, !dbg !420
  br label %118, !dbg !422, !llvm.loop !423

; <label>:141:                                    ; preds = %118
  call void @llvm.dbg.declare(metadata float** %17, metadata !425, metadata !24), !dbg !426
  %142 = load i32, i32* %9, align 4, !dbg !427
  %143 = mul i32 4, %142, !dbg !428
  %144 = load i32, i32* %8, align 4, !dbg !429
  %145 = mul i32 %143, %144, !dbg !430
  %146 = call i8* @sds_alloc(i32 %145), !dbg !431
  %147 = bitcast i8* %146 to float*, !dbg !432
  store float* %147, float** %17, align 4, !dbg !426
  %148 = load float*, float** %17, align 4, !dbg !433
  %149 = icmp ne float* %148, null, !dbg !433
  br i1 %149, label %150, label %151, !dbg !436

; <label>:150:                                    ; preds = %141
  br label %152, !dbg !437

; <label>:151:                                    ; preds = %141
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 118, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !439
  unreachable, !dbg !439

; <label>:152:                                    ; preds = %150
  %153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i32 0, i32 0)), !dbg !441
  %154 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !442
  %155 = call i32 @fflush(%struct._IO_FILE* %154), !dbg !443
  call void @llvm.dbg.declare(metadata double* %18, metadata !444, metadata !24), !dbg !446
  store double 0.000000e+00, double* %18, align 8, !dbg !446
  call void @llvm.dbg.declare(metadata %struct.timespec* %19, metadata !447, metadata !24), !dbg !457
  call void @llvm.dbg.declare(metadata %struct.timespec* %20, metadata !458, metadata !24), !dbg !459
  %156 = call i32 @clock_gettime(i32 0, %struct.timespec* %19) #8, !dbg !460
  %157 = load i32, i32* %8, align 4, !dbg !461
  %158 = load i32, i32* %9, align 4, !dbg !462
  %159 = load float, float* %10, align 4, !dbg !463
  %160 = load float*, float** %11, align 4, !dbg !464
  %161 = load float*, float** %14, align 4, !dbg !465
  %162 = load float*, float** %17, align 4, !dbg !466
  call void @myFunc(i32 %157, i32 %158, float %159, float* %160, float* %161, float* %162), !dbg !467
  %163 = call i32 @clock_gettime(i32 0, %struct.timespec* %20) #8, !dbg !468
  %164 = getelementptr inbounds %struct.timespec, %struct.timespec* %20, i32 0, i32 0, !dbg !469
  %165 = load i32, i32* %164, align 4, !dbg !469
  %166 = getelementptr inbounds %struct.timespec, %struct.timespec* %19, i32 0, i32 0, !dbg !470
  %167 = load i32, i32* %166, align 4, !dbg !470
  %168 = sub nsw i32 %165, %167, !dbg !471
  %169 = sitofp i32 %168 to double, !dbg !472
  %170 = getelementptr inbounds %struct.timespec, %struct.timespec* %20, i32 0, i32 1, !dbg !473
  %171 = load i32, i32* %170, align 4, !dbg !473
  %172 = getelementptr inbounds %struct.timespec, %struct.timespec* %19, i32 0, i32 1, !dbg !474
  %173 = load i32, i32* %172, align 4, !dbg !474
  %174 = sub nsw i32 %171, %173, !dbg !475
  %175 = sitofp i32 %174 to double, !dbg !476
  %176 = fdiv double %175, 1.000000e+09, !dbg !477
  %177 = fadd double %169, %176, !dbg !478
  store double %177, double* %18, align 8, !dbg !479
  %178 = load double, double* %18, align 8, !dbg !480
  %179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.12, i32 0, i32 0), double %178), !dbg !481
  %180 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !482
  %181 = call i32 @fflush(%struct._IO_FILE* %180), !dbg !483
  call void @llvm.dbg.declare(metadata float** %21, metadata !484, metadata !24), !dbg !485
  %182 = load i32, i32* %9, align 4, !dbg !486
  %183 = mul i32 4, %182, !dbg !487
  %184 = load i32, i32* %8, align 4, !dbg !488
  %185 = mul i32 %183, %184, !dbg !489
  %186 = call i8* @sds_alloc(i32 %185), !dbg !490
  %187 = bitcast i8* %186 to float*, !dbg !491
  store float* %187, float** %21, align 4, !dbg !485
  %188 = load float*, float** %21, align 4, !dbg !492
  %189 = icmp ne float* %188, null, !dbg !492
  br i1 %189, label %190, label %191, !dbg !495

; <label>:190:                                    ; preds = %152
  br label %192, !dbg !496

; <label>:191:                                    ; preds = %152
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.3, i32 0, i32 0), i32 152, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !498
  unreachable, !dbg !498

; <label>:192:                                    ; preds = %190
  %193 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0)), !dbg !500
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !501
  %195 = call i32 @fflush(%struct._IO_FILE* %194), !dbg !502
  call void @llvm.dbg.declare(metadata double* %22, metadata !503, metadata !24), !dbg !504
  store double 0.000000e+00, double* %22, align 8, !dbg !504
  call void @llvm.dbg.declare(metadata %struct.timespec* %23, metadata !505, metadata !24), !dbg !506
  call void @llvm.dbg.declare(metadata %struct.timespec* %24, metadata !507, metadata !24), !dbg !508
  %196 = call i32 @clock_gettime(i32 0, %struct.timespec* %23) #8, !dbg !509
  %197 = load i32, i32* %8, align 4, !dbg !510
  %198 = load i32, i32* %9, align 4, !dbg !511
  %199 = load float, float* %10, align 4, !dbg !512
  %200 = load float*, float** %11, align 4, !dbg !513
  %201 = load float*, float** %14, align 4, !dbg !514
  %202 = load float*, float** %21, align 4, !dbg !515
  call void @myFuncAccel(i32 %197, i32 %198, float %199, float* %200, float* %201, float* %202), !dbg !516
  %203 = call i32 @clock_gettime(i32 0, %struct.timespec* %24) #8, !dbg !517
  %204 = getelementptr inbounds %struct.timespec, %struct.timespec* %24, i32 0, i32 0, !dbg !518
  %205 = load i32, i32* %204, align 4, !dbg !518
  %206 = getelementptr inbounds %struct.timespec, %struct.timespec* %23, i32 0, i32 0, !dbg !519
  %207 = load i32, i32* %206, align 4, !dbg !519
  %208 = sub nsw i32 %205, %207, !dbg !520
  %209 = sitofp i32 %208 to double, !dbg !521
  %210 = getelementptr inbounds %struct.timespec, %struct.timespec* %24, i32 0, i32 1, !dbg !522
  %211 = load i32, i32* %210, align 4, !dbg !522
  %212 = getelementptr inbounds %struct.timespec, %struct.timespec* %23, i32 0, i32 1, !dbg !523
  %213 = load i32, i32* %212, align 4, !dbg !523
  %214 = sub nsw i32 %211, %213, !dbg !524
  %215 = sitofp i32 %214 to double, !dbg !525
  %216 = fdiv double %215, 1.000000e+09, !dbg !526
  %217 = fadd double %209, %216, !dbg !527
  store double %217, double* %22, align 8, !dbg !528
  %218 = load double, double* %22, align 8, !dbg !529
  %219 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.15, i32 0, i32 0), double %218), !dbg !530
  %220 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !dbg !531
  %221 = call i32 @fflush(%struct._IO_FILE* %220), !dbg !532
  %222 = load i32, i32* %8, align 4, !dbg !533
  %223 = load i32, i32* %9, align 4, !dbg !534
  %224 = load float*, float** %17, align 4, !dbg !535
  %225 = load float*, float** %21, align 4, !dbg !536
  call void @validityChecker(i32 %222, i32 %223, float* %224, float* %225), !dbg !537
  %226 = load float*, float** %11, align 4, !dbg !538
  %227 = bitcast float* %226 to i8*, !dbg !538
  call void @sds_free(i8* %227), !dbg !539
  %228 = load float*, float** %14, align 4, !dbg !540
  %229 = bitcast float* %228 to i8*, !dbg !540
  call void @sds_free(i8* %229), !dbg !541
  %230 = load float*, float** %17, align 4, !dbg !542
  %231 = bitcast float* %230 to i8*, !dbg !542
  call void @sds_free(i8* %231), !dbg !543
  %232 = load float*, float** %21, align 4, !dbg !544
  %233 = bitcast float* %232 to i8*, !dbg !544
  call void @sds_free(i8* %233), !dbg !545
  ret i32 0, !dbg !546
}

; Function Attrs: nounwind readonly
declare !xidane.fname !547 !xidane.function_declaration_type !548 !xidane.function_declaration_filename !549 !xidane.ExternC !22 i32 @atoi(i8*) #3

; Function Attrs: noreturn nounwind
declare !xidane.fname !550 !xidane.function_declaration_type !551 !xidane.function_declaration_filename !552 !xidane.ExternC !22 void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind
declare !xidane.fname !553 !xidane.function_declaration_type !554 !xidane.function_declaration_filename !549 !xidane.ExternC !22 void @srand(i32) #5

; Function Attrs: nounwind readonly
declare !xidane.fname !555 !xidane.function_declaration_type !556 !xidane.function_declaration_filename !549 !xidane.ExternC !22 double @atof(i8*) #3

declare !xidane.fname !557 !xidane.function_declaration_type !558 !xidane.function_declaration_filename !559 !xidane.ExternC !22 i8* @sds_alloc(i32) #2

; Function Attrs: nounwind
declare !xidane.fname !560 !xidane.function_declaration_type !561 !xidane.function_declaration_filename !549 !xidane.ExternC !22 i32 @rand() #5

; Function Attrs: nounwind
declare !xidane.fname !562 !xidane.function_declaration_type !563 !xidane.function_declaration_filename !564 !xidane.ExternC !22 i32 @clock_gettime(i32, %struct.timespec*) #5

declare !xidane.fname !565 !xidane.function_declaration_type !20 !xidane.function_declaration_filename !21 !xidane.ExternC !22 void @myFuncAccel(i32, i32, float, float*, float*, float*) #2

declare !xidane.fname !566 !xidane.function_declaration_type !567 !xidane.function_declaration_filename !559 !xidane.ExternC !22 void @sds_free(i8*) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "../src/main.c", directory: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug")
!2 = !{}
!3 = !{!4, !5, !8, !9, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "dataType_t", file: !6, line: 15, baseType: !7)
!6 = !DIFile(filename: "../src/myLib.h", directory: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug")
!7 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32, align: 32)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32, align: 32)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 1, !"min_enum_size", i32 4}
!14 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!15 = distinct !DISubprogram(name: "myFunc", scope: !16, file: !16, line: 3, type: !17, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!16 = !DIFile(filename: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/main.c", directory: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4, !4, !5, !8, !8, !8}
!19 = !{!"myFunc"}
!20 = !{!"void.unsigned int.0.unsigned int.0.dataType_t.0.dataType_t *.1.dataType_t *.1.dataType_t *.1"}
!21 = !{!"../src/myLib.h"}
!22 = !{!"t"}
!23 = !DILocalVariable(name: "size", arg: 1, scope: !15, file: !16, line: 3, type: !4)
!24 = !DIExpression()
!25 = !DILocation(line: 3, column: 27, scope: !15)
!26 = !DILocalVariable(name: "dim", arg: 2, scope: !15, file: !16, line: 3, type: !4)
!27 = !DILocation(line: 3, column: 46, scope: !15)
!28 = !DILocalVariable(name: "threshold", arg: 3, scope: !15, file: !16, line: 3, type: !5)
!29 = !DILocation(line: 3, column: 62, scope: !15)
!30 = !DILocalVariable(name: "data0", arg: 4, scope: !15, file: !16, line: 3, type: !8)
!31 = !DILocation(line: 3, column: 86, scope: !15)
!32 = !DILocalVariable(name: "data1", arg: 5, scope: !15, file: !16, line: 3, type: !8)
!33 = !DILocation(line: 3, column: 106, scope: !15)
!34 = !DILocalVariable(name: "data2", arg: 6, scope: !15, file: !16, line: 3, type: !8)
!35 = !DILocation(line: 3, column: 126, scope: !15)
!36 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 5, type: !4)
!37 = !DILocation(line: 5, column: 15, scope: !15)
!38 = !DILocalVariable(name: "k", scope: !15, file: !16, line: 5, type: !4)
!39 = !DILocation(line: 5, column: 18, scope: !15)
!40 = !DILocalVariable(name: "l", scope: !15, file: !16, line: 5, type: !4)
!41 = !DILocation(line: 5, column: 21, scope: !15)
!42 = !DILocation(line: 7, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 7, column: 5)
!44 = !DILocation(line: 7, column: 11, scope: !43)
!45 = !DILocation(line: 7, column: 19, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !16, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 7, column: 5)
!48 = !DILocation(line: 7, column: 23, scope: !46)
!49 = !DILocation(line: 7, column: 21, scope: !46)
!50 = !DILocation(line: 7, column: 5, scope: !46)
!51 = !DILocation(line: 9, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !53, file: !16, line: 9, column: 9)
!53 = distinct !DILexicalBlock(scope: !47, file: !16, line: 8, column: 5)
!54 = !DILocation(line: 9, column: 15, scope: !52)
!55 = !DILocation(line: 9, column: 23, scope: !56)
!56 = !DILexicalBlockFile(scope: !57, file: !16, discriminator: 1)
!57 = distinct !DILexicalBlock(scope: !52, file: !16, line: 9, column: 9)
!58 = !DILocation(line: 9, column: 27, scope: !56)
!59 = !DILocation(line: 9, column: 25, scope: !56)
!60 = !DILocation(line: 9, column: 9, scope: !56)
!61 = !DILocation(line: 11, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !16, line: 10, column: 9)
!63 = !DILocation(line: 11, column: 23, scope: !62)
!64 = !DILocation(line: 11, column: 22, scope: !62)
!65 = !DILocation(line: 11, column: 29, scope: !62)
!66 = !DILocation(line: 11, column: 27, scope: !62)
!67 = !DILocation(line: 11, column: 13, scope: !62)
!68 = !DILocation(line: 11, column: 33, scope: !62)
!69 = !DILocation(line: 12, column: 9, scope: !62)
!70 = !DILocation(line: 9, column: 35, scope: !71)
!71 = !DILexicalBlockFile(scope: !57, file: !16, discriminator: 2)
!72 = !DILocation(line: 9, column: 9, scope: !71)
!73 = distinct !{!73, !74}
!74 = !DILocation(line: 9, column: 9, scope: !53)
!75 = !DILocation(line: 14, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !53, file: !16, line: 14, column: 9)
!77 = !DILocation(line: 14, column: 15, scope: !76)
!78 = !DILocation(line: 14, column: 23, scope: !79)
!79 = !DILexicalBlockFile(scope: !80, file: !16, discriminator: 1)
!80 = distinct !DILexicalBlock(scope: !76, file: !16, line: 14, column: 9)
!81 = !DILocation(line: 14, column: 27, scope: !79)
!82 = !DILocation(line: 14, column: 25, scope: !79)
!83 = !DILocation(line: 14, column: 9, scope: !79)
!84 = !DILocation(line: 16, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !16, line: 16, column: 13)
!86 = distinct !DILexicalBlock(scope: !80, file: !16, line: 15, column: 9)
!87 = !DILocation(line: 16, column: 19, scope: !85)
!88 = !DILocation(line: 16, column: 27, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !16, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !85, file: !16, line: 16, column: 13)
!91 = !DILocation(line: 16, column: 31, scope: !89)
!92 = !DILocation(line: 16, column: 29, scope: !89)
!93 = !DILocation(line: 16, column: 13, scope: !89)
!94 = !DILocation(line: 18, column: 48, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !16, line: 17, column: 13)
!96 = !DILocation(line: 18, column: 52, scope: !95)
!97 = !DILocation(line: 18, column: 50, scope: !95)
!98 = !DILocation(line: 18, column: 58, scope: !95)
!99 = !DILocation(line: 18, column: 56, scope: !95)
!100 = !DILocation(line: 18, column: 40, scope: !95)
!101 = !DILocation(line: 18, column: 72, scope: !95)
!102 = !DILocation(line: 18, column: 74, scope: !95)
!103 = !DILocation(line: 18, column: 73, scope: !95)
!104 = !DILocation(line: 18, column: 79, scope: !95)
!105 = !DILocation(line: 18, column: 77, scope: !95)
!106 = !DILocation(line: 18, column: 64, scope: !95)
!107 = !DILocation(line: 18, column: 62, scope: !95)
!108 = !DILocation(line: 18, column: 25, scope: !95)
!109 = !DILocation(line: 18, column: 27, scope: !95)
!110 = !DILocation(line: 18, column: 26, scope: !95)
!111 = !DILocation(line: 18, column: 33, scope: !95)
!112 = !DILocation(line: 18, column: 31, scope: !95)
!113 = !DILocation(line: 18, column: 17, scope: !95)
!114 = !DILocation(line: 18, column: 37, scope: !95)
!115 = !DILocation(line: 19, column: 13, scope: !95)
!116 = !DILocation(line: 16, column: 39, scope: !117)
!117 = !DILexicalBlockFile(scope: !90, file: !16, discriminator: 2)
!118 = !DILocation(line: 16, column: 13, scope: !117)
!119 = distinct !{!119, !120}
!120 = !DILocation(line: 16, column: 13, scope: !86)
!121 = !DILocation(line: 20, column: 9, scope: !86)
!122 = !DILocation(line: 14, column: 35, scope: !123)
!123 = !DILexicalBlockFile(scope: !80, file: !16, discriminator: 2)
!124 = !DILocation(line: 14, column: 9, scope: !123)
!125 = distinct !{!125, !126}
!126 = !DILocation(line: 14, column: 9, scope: !53)
!127 = !DILocalVariable(name: "r", scope: !53, file: !16, line: 22, type: !128)
!128 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!129 = !DILocation(line: 22, column: 13, scope: !53)
!130 = !DILocation(line: 26, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !53, file: !16, line: 26, column: 9)
!132 = !DILocation(line: 26, column: 15, scope: !131)
!133 = !DILocation(line: 26, column: 23, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !16, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !131, file: !16, line: 26, column: 9)
!136 = !DILocation(line: 26, column: 25, scope: !134)
!137 = !DILocation(line: 26, column: 30, scope: !138)
!138 = !DILexicalBlockFile(scope: !135, file: !16, discriminator: 2)
!139 = !DILocation(line: 26, column: 34, scope: !138)
!140 = !DILocation(line: 26, column: 32, scope: !138)
!141 = !DILocation(line: 26, column: 9, scope: !142)
!142 = !DILexicalBlockFile(scope: !131, file: !16, discriminator: 3)
!143 = !DILocation(line: 28, column: 27, scope: !144)
!144 = distinct !DILexicalBlock(scope: !135, file: !16, line: 27, column: 9)
!145 = !DILocation(line: 28, column: 29, scope: !144)
!146 = !DILocation(line: 28, column: 28, scope: !144)
!147 = !DILocation(line: 28, column: 35, scope: !144)
!148 = !DILocation(line: 28, column: 33, scope: !144)
!149 = !DILocation(line: 28, column: 19, scope: !144)
!150 = !DILocation(line: 28, column: 41, scope: !144)
!151 = !DILocation(line: 28, column: 39, scope: !144)
!152 = !DILocation(line: 28, column: 15, scope: !144)
!153 = !DILocation(line: 29, column: 9, scope: !144)
!154 = !DILocation(line: 26, column: 44, scope: !155)
!155 = !DILexicalBlockFile(scope: !135, file: !16, discriminator: 4)
!156 = !DILocation(line: 26, column: 9, scope: !155)
!157 = distinct !{!157, !158}
!158 = !DILocation(line: 26, column: 9, scope: !53)
!159 = !DILocation(line: 31, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !53, file: !16, line: 31, column: 14)
!161 = !DILocation(line: 31, column: 14, scope: !53)
!162 = !DILocation(line: 33, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !16, line: 33, column: 13)
!164 = distinct !DILexicalBlock(scope: !160, file: !16, line: 32, column: 9)
!165 = !DILocation(line: 33, column: 19, scope: !163)
!166 = !DILocation(line: 33, column: 27, scope: !167)
!167 = !DILexicalBlockFile(scope: !168, file: !16, discriminator: 1)
!168 = distinct !DILexicalBlock(scope: !163, file: !16, line: 33, column: 13)
!169 = !DILocation(line: 33, column: 31, scope: !167)
!170 = !DILocation(line: 33, column: 29, scope: !167)
!171 = !DILocation(line: 33, column: 13, scope: !167)
!172 = !DILocation(line: 35, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !16, line: 34, column: 13)
!174 = !DILocation(line: 35, column: 27, scope: !173)
!175 = !DILocation(line: 35, column: 26, scope: !173)
!176 = !DILocation(line: 35, column: 33, scope: !173)
!177 = !DILocation(line: 35, column: 31, scope: !173)
!178 = !DILocation(line: 35, column: 17, scope: !173)
!179 = !DILocation(line: 35, column: 37, scope: !173)
!180 = !DILocation(line: 36, column: 13, scope: !173)
!181 = !DILocation(line: 33, column: 39, scope: !182)
!182 = !DILexicalBlockFile(scope: !168, file: !16, discriminator: 2)
!183 = !DILocation(line: 33, column: 13, scope: !182)
!184 = distinct !{!184, !185}
!185 = !DILocation(line: 33, column: 13, scope: !164)
!186 = !DILocation(line: 37, column: 9, scope: !164)
!187 = !DILocation(line: 38, column: 5, scope: !53)
!188 = !DILocation(line: 7, column: 32, scope: !189)
!189 = !DILexicalBlockFile(scope: !47, file: !16, discriminator: 2)
!190 = !DILocation(line: 7, column: 5, scope: !189)
!191 = distinct !{!191, !192}
!192 = !DILocation(line: 7, column: 5, scope: !15)
!193 = !DILocation(line: 39, column: 1, scope: !15)
!194 = distinct !DISubprogram(name: "validityChecker", scope: !16, file: !16, line: 45, type: !195, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!195 = !DISubroutineType(types: !196)
!196 = !{null, !4, !4, !8, !8}
!197 = !{!"validityChecker"}
!198 = !{!"void.unsigned int.0.unsigned int.0.dataType_t *.1.dataType_t *.1"}
!199 = !{!"/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/main.c"}
!200 = !DILocalVariable(name: "size", arg: 1, scope: !194, file: !16, line: 45, type: !4)
!201 = !DILocation(line: 45, column: 35, scope: !194)
!202 = !DILocalVariable(name: "dim", arg: 2, scope: !194, file: !16, line: 45, type: !4)
!203 = !DILocation(line: 45, column: 54, scope: !194)
!204 = !DILocalVariable(name: "data2", arg: 3, scope: !194, file: !16, line: 45, type: !8)
!205 = !DILocation(line: 45, column: 72, scope: !194)
!206 = !DILocalVariable(name: "data2_hw", arg: 4, scope: !194, file: !16, line: 45, type: !8)
!207 = !DILocation(line: 45, column: 92, scope: !194)
!208 = !DILocalVariable(name: "flag", scope: !194, file: !16, line: 47, type: !4)
!209 = !DILocation(line: 47, column: 15, scope: !194)
!210 = !DILocalVariable(name: "i", scope: !211, file: !16, line: 48, type: !128)
!211 = distinct !DILexicalBlock(scope: !194, file: !16, line: 48, column: 2)
!212 = !DILocation(line: 48, column: 10, scope: !211)
!213 = !DILocation(line: 48, column: 6, scope: !211)
!214 = !DILocation(line: 48, column: 15, scope: !215)
!215 = !DILexicalBlockFile(scope: !216, file: !16, discriminator: 1)
!216 = distinct !DILexicalBlock(scope: !211, file: !16, line: 48, column: 2)
!217 = !DILocation(line: 48, column: 19, scope: !215)
!218 = !DILocation(line: 48, column: 23, scope: !215)
!219 = !DILocation(line: 48, column: 26, scope: !220)
!220 = !DILexicalBlockFile(scope: !216, file: !16, discriminator: 2)
!221 = !DILocation(line: 48, column: 28, scope: !220)
!222 = !DILocation(line: 48, column: 32, scope: !220)
!223 = !DILocation(line: 48, column: 31, scope: !220)
!224 = !DILocation(line: 48, column: 27, scope: !220)
!225 = !DILocation(line: 48, column: 2, scope: !226)
!226 = !DILexicalBlockFile(scope: !211, file: !16, discriminator: 3)
!227 = !DILocation(line: 50, column: 16, scope: !228)
!228 = distinct !DILexicalBlock(scope: !216, file: !16, line: 48, column: 42)
!229 = !DILocation(line: 50, column: 10, scope: !228)
!230 = !DILocation(line: 50, column: 31, scope: !228)
!231 = !DILocation(line: 50, column: 22, scope: !228)
!232 = !DILocation(line: 50, column: 19, scope: !228)
!233 = !DILocation(line: 50, column: 8, scope: !228)
!234 = !DILocation(line: 52, column: 2, scope: !228)
!235 = !DILocation(line: 48, column: 39, scope: !236)
!236 = !DILexicalBlockFile(scope: !216, file: !16, discriminator: 4)
!237 = !DILocation(line: 48, column: 2, scope: !236)
!238 = distinct !{!238, !239}
!239 = !DILocation(line: 48, column: 2, scope: !194)
!240 = !DILocation(line: 54, column: 9, scope: !194)
!241 = !DILocation(line: 54, column: 13, scope: !194)
!242 = !DILocation(line: 54, column: 2, scope: !194)
!243 = !DILocation(line: 55, column: 9, scope: !194)
!244 = !DILocation(line: 55, column: 2, scope: !194)
!245 = !DILocation(line: 57, column: 1, scope: !194)
!246 = !{!"printf"}
!247 = !{!"int.const char *__restrict.1"}
!248 = !{!"/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdio.h"}
!249 = !{!"fflush"}
!250 = !{!"int.FILE *.1"}
!251 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 59, type: !252, isLocal: false, isDefinition: true, scopeLine: 60, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!252 = !DISubroutineType(types: !253)
!253 = !{!128, !128, !254}
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 32, align: 32)
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 32, align: 32)
!256 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!257 = !{!"main"}
!258 = !{!"int.int.0.char **.1"}
!259 = !DILocalVariable(name: "argc", arg: 1, scope: !251, file: !16, line: 59, type: !128)
!260 = !DILocation(line: 59, column: 14, scope: !251)
!261 = !DILocalVariable(name: "argv", arg: 2, scope: !251, file: !16, line: 59, type: !254)
!262 = !DILocation(line: 59, column: 28, scope: !251)
!263 = !DILocalVariable(name: "i", scope: !251, file: !16, line: 62, type: !4)
!264 = !DILocation(line: 62, column: 15, scope: !251)
!265 = !DILocalVariable(name: "seed", scope: !251, file: !16, line: 65, type: !4)
!266 = !DILocation(line: 65, column: 15, scope: !251)
!267 = !DILocation(line: 65, column: 41, scope: !251)
!268 = !DILocation(line: 65, column: 36, scope: !251)
!269 = !DILocation(line: 66, column: 2, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !16, line: 66, column: 2)
!271 = distinct !DILexicalBlock(scope: !251, file: !16, line: 66, column: 2)
!272 = !DILocation(line: 66, column: 2, scope: !271)
!273 = !DILocation(line: 66, column: 2, scope: !274)
!274 = !DILexicalBlockFile(scope: !271, file: !16, discriminator: 1)
!275 = !DILocation(line: 66, column: 2, scope: !276)
!276 = !DILexicalBlockFile(scope: !270, file: !16, discriminator: 2)
!277 = !DILocation(line: 68, column: 8, scope: !251)
!278 = !DILocation(line: 68, column: 2, scope: !251)
!279 = !DILocalVariable(name: "size", scope: !251, file: !16, line: 70, type: !4)
!280 = !DILocation(line: 70, column: 15, scope: !251)
!281 = !DILocation(line: 70, column: 41, scope: !251)
!282 = !DILocation(line: 70, column: 36, scope: !251)
!283 = !DILocation(line: 71, column: 2, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !16, line: 71, column: 2)
!285 = distinct !DILexicalBlock(scope: !251, file: !16, line: 71, column: 2)
!286 = !DILocation(line: 71, column: 2, scope: !285)
!287 = !DILocation(line: 71, column: 2, scope: !288)
!288 = !DILexicalBlockFile(scope: !285, file: !16, discriminator: 1)
!289 = !DILocation(line: 71, column: 2, scope: !290)
!290 = !DILexicalBlockFile(scope: !284, file: !16, discriminator: 2)
!291 = !DILocalVariable(name: "dim", scope: !251, file: !16, line: 73, type: !4)
!292 = !DILocation(line: 73, column: 15, scope: !251)
!293 = !DILocation(line: 73, column: 40, scope: !251)
!294 = !DILocation(line: 73, column: 35, scope: !251)
!295 = !DILocation(line: 74, column: 2, scope: !296)
!296 = distinct !DILexicalBlock(scope: !297, file: !16, line: 74, column: 2)
!297 = distinct !DILexicalBlock(scope: !251, file: !16, line: 74, column: 2)
!298 = !DILocation(line: 74, column: 2, scope: !297)
!299 = !DILocation(line: 74, column: 2, scope: !300)
!300 = !DILexicalBlockFile(scope: !297, file: !16, discriminator: 1)
!301 = !DILocation(line: 74, column: 2, scope: !302)
!302 = !DILexicalBlockFile(scope: !296, file: !16, discriminator: 2)
!303 = !DILocalVariable(name: "threshold", scope: !251, file: !16, line: 76, type: !5)
!304 = !DILocation(line: 76, column: 13, scope: !251)
!305 = !DILocation(line: 76, column: 42, scope: !251)
!306 = !DILocation(line: 76, column: 37, scope: !251)
!307 = !DILocation(line: 76, column: 25, scope: !251)
!308 = !DILocation(line: 77, column: 2, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !16, line: 77, column: 2)
!310 = distinct !DILexicalBlock(scope: !251, file: !16, line: 77, column: 2)
!311 = !DILocation(line: 77, column: 2, scope: !310)
!312 = !DILocation(line: 77, column: 2, scope: !313)
!313 = !DILexicalBlockFile(scope: !310, file: !16, discriminator: 1)
!314 = !DILocation(line: 77, column: 2, scope: !315)
!315 = !DILexicalBlockFile(scope: !309, file: !16, discriminator: 2)
!316 = !DILocation(line: 79, column: 61, scope: !251)
!317 = !DILocation(line: 79, column: 67, scope: !251)
!318 = !DILocation(line: 79, column: 73, scope: !251)
!319 = !DILocation(line: 79, column: 78, scope: !251)
!320 = !DILocation(line: 79, column: 2, scope: !251)
!321 = !DILocation(line: 80, column: 9, scope: !251)
!322 = !DILocation(line: 80, column: 2, scope: !251)
!323 = !DILocalVariable(name: "data0", scope: !251, file: !16, line: 86, type: !8)
!324 = !DILocation(line: 86, column: 15, scope: !251)
!325 = !DILocation(line: 86, column: 66, scope: !251)
!326 = !DILocation(line: 86, column: 65, scope: !251)
!327 = !DILocation(line: 86, column: 70, scope: !251)
!328 = !DILocation(line: 86, column: 69, scope: !251)
!329 = !DILocation(line: 86, column: 37, scope: !251)
!330 = !DILocation(line: 86, column: 23, scope: !251)
!331 = !DILocation(line: 89, column: 2, scope: !332)
!332 = distinct !DILexicalBlock(scope: !333, file: !16, line: 89, column: 2)
!333 = distinct !DILexicalBlock(scope: !251, file: !16, line: 89, column: 2)
!334 = !DILocation(line: 89, column: 2, scope: !333)
!335 = !DILocation(line: 89, column: 2, scope: !336)
!336 = !DILexicalBlockFile(scope: !333, file: !16, discriminator: 1)
!337 = !DILocation(line: 89, column: 2, scope: !338)
!338 = !DILexicalBlockFile(scope: !332, file: !16, discriminator: 2)
!339 = !DILocation(line: 91, column: 7, scope: !340)
!340 = distinct !DILexicalBlock(scope: !251, file: !16, line: 91, column: 2)
!341 = !DILocation(line: 91, column: 6, scope: !340)
!342 = !DILocation(line: 91, column: 10, scope: !343)
!343 = !DILexicalBlockFile(scope: !344, file: !16, discriminator: 1)
!344 = distinct !DILexicalBlock(scope: !340, file: !16, line: 91, column: 2)
!345 = !DILocation(line: 91, column: 12, scope: !343)
!346 = !DILocation(line: 91, column: 16, scope: !343)
!347 = !DILocation(line: 91, column: 15, scope: !343)
!348 = !DILocation(line: 91, column: 11, scope: !343)
!349 = !DILocation(line: 91, column: 2, scope: !343)
!350 = !DILocalVariable(name: "t", scope: !351, file: !16, line: 93, type: !5)
!351 = distinct !DILexicalBlock(scope: !344, file: !16, line: 92, column: 2)
!352 = !DILocation(line: 93, column: 14, scope: !351)
!353 = !DILocation(line: 93, column: 26, scope: !351)
!354 = !DILocation(line: 93, column: 32, scope: !351)
!355 = !DILocation(line: 93, column: 18, scope: !351)
!356 = !DILocalVariable(name: "d", scope: !351, file: !16, line: 94, type: !5)
!357 = !DILocation(line: 94, column: 14, scope: !351)
!358 = !DILocation(line: 94, column: 27, scope: !351)
!359 = !DILocation(line: 94, column: 33, scope: !351)
!360 = !DILocation(line: 94, column: 19, scope: !351)
!361 = !DILocation(line: 94, column: 38, scope: !351)
!362 = !DILocation(line: 95, column: 14, scope: !351)
!363 = !DILocation(line: 95, column: 16, scope: !351)
!364 = !DILocation(line: 95, column: 15, scope: !351)
!365 = !DILocation(line: 95, column: 9, scope: !351)
!366 = !DILocation(line: 95, column: 3, scope: !351)
!367 = !DILocation(line: 95, column: 12, scope: !351)
!368 = !DILocation(line: 96, column: 2, scope: !351)
!369 = !DILocation(line: 91, column: 21, scope: !370)
!370 = !DILexicalBlockFile(scope: !344, file: !16, discriminator: 2)
!371 = !DILocation(line: 91, column: 2, scope: !370)
!372 = distinct !{!372, !373}
!373 = !DILocation(line: 91, column: 2, scope: !251)
!374 = !DILocalVariable(name: "data1", scope: !251, file: !16, line: 99, type: !8)
!375 = !DILocation(line: 99, column: 15, scope: !251)
!376 = !DILocation(line: 99, column: 66, scope: !251)
!377 = !DILocation(line: 99, column: 65, scope: !251)
!378 = !DILocation(line: 99, column: 70, scope: !251)
!379 = !DILocation(line: 99, column: 69, scope: !251)
!380 = !DILocation(line: 99, column: 37, scope: !251)
!381 = !DILocation(line: 99, column: 23, scope: !251)
!382 = !DILocation(line: 102, column: 2, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !16, line: 102, column: 2)
!384 = distinct !DILexicalBlock(scope: !251, file: !16, line: 102, column: 2)
!385 = !DILocation(line: 102, column: 2, scope: !384)
!386 = !DILocation(line: 102, column: 2, scope: !387)
!387 = !DILexicalBlockFile(scope: !384, file: !16, discriminator: 1)
!388 = !DILocation(line: 102, column: 2, scope: !389)
!389 = !DILexicalBlockFile(scope: !383, file: !16, discriminator: 2)
!390 = !DILocation(line: 104, column: 7, scope: !391)
!391 = distinct !DILexicalBlock(scope: !251, file: !16, line: 104, column: 2)
!392 = !DILocation(line: 104, column: 6, scope: !391)
!393 = !DILocation(line: 104, column: 10, scope: !394)
!394 = !DILexicalBlockFile(scope: !395, file: !16, discriminator: 1)
!395 = distinct !DILexicalBlock(scope: !391, file: !16, line: 104, column: 2)
!396 = !DILocation(line: 104, column: 12, scope: !394)
!397 = !DILocation(line: 104, column: 16, scope: !394)
!398 = !DILocation(line: 104, column: 15, scope: !394)
!399 = !DILocation(line: 104, column: 11, scope: !394)
!400 = !DILocation(line: 104, column: 2, scope: !394)
!401 = !DILocalVariable(name: "t", scope: !402, file: !16, line: 106, type: !5)
!402 = distinct !DILexicalBlock(scope: !395, file: !16, line: 105, column: 2)
!403 = !DILocation(line: 106, column: 14, scope: !402)
!404 = !DILocation(line: 106, column: 26, scope: !402)
!405 = !DILocation(line: 106, column: 32, scope: !402)
!406 = !DILocation(line: 106, column: 18, scope: !402)
!407 = !DILocalVariable(name: "d", scope: !402, file: !16, line: 107, type: !5)
!408 = !DILocation(line: 107, column: 14, scope: !402)
!409 = !DILocation(line: 107, column: 27, scope: !402)
!410 = !DILocation(line: 107, column: 33, scope: !402)
!411 = !DILocation(line: 107, column: 19, scope: !402)
!412 = !DILocation(line: 107, column: 38, scope: !402)
!413 = !DILocation(line: 108, column: 14, scope: !402)
!414 = !DILocation(line: 108, column: 16, scope: !402)
!415 = !DILocation(line: 108, column: 15, scope: !402)
!416 = !DILocation(line: 108, column: 9, scope: !402)
!417 = !DILocation(line: 108, column: 3, scope: !402)
!418 = !DILocation(line: 108, column: 12, scope: !402)
!419 = !DILocation(line: 109, column: 2, scope: !402)
!420 = !DILocation(line: 104, column: 22, scope: !421)
!421 = !DILexicalBlockFile(scope: !395, file: !16, discriminator: 2)
!422 = !DILocation(line: 104, column: 2, scope: !421)
!423 = distinct !{!423, !424}
!424 = !DILocation(line: 104, column: 2, scope: !251)
!425 = !DILocalVariable(name: "data2", scope: !251, file: !16, line: 115, type: !8)
!426 = !DILocation(line: 115, column: 15, scope: !251)
!427 = !DILocation(line: 115, column: 66, scope: !251)
!428 = !DILocation(line: 115, column: 65, scope: !251)
!429 = !DILocation(line: 115, column: 70, scope: !251)
!430 = !DILocation(line: 115, column: 69, scope: !251)
!431 = !DILocation(line: 115, column: 37, scope: !251)
!432 = !DILocation(line: 115, column: 23, scope: !251)
!433 = !DILocation(line: 118, column: 2, scope: !434)
!434 = distinct !DILexicalBlock(scope: !435, file: !16, line: 118, column: 2)
!435 = distinct !DILexicalBlock(scope: !251, file: !16, line: 118, column: 2)
!436 = !DILocation(line: 118, column: 2, scope: !435)
!437 = !DILocation(line: 118, column: 2, scope: !438)
!438 = !DILexicalBlockFile(scope: !435, file: !16, discriminator: 1)
!439 = !DILocation(line: 118, column: 2, scope: !440)
!440 = !DILexicalBlockFile(scope: !434, file: !16, discriminator: 2)
!441 = !DILocation(line: 121, column: 2, scope: !251)
!442 = !DILocation(line: 122, column: 9, scope: !251)
!443 = !DILocation(line: 122, column: 2, scope: !251)
!444 = !DILocalVariable(name: "totalTime_ref", scope: !251, file: !16, line: 125, type: !445)
!445 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!446 = !DILocation(line: 125, column: 9, scope: !251)
!447 = !DILocalVariable(name: "timerStart_ref", scope: !251, file: !16, line: 126, type: !448)
!448 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !449, line: 8, size: 64, align: 32, elements: !450)
!449 = !DIFile(filename: "/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/bits/types/struct_timespec.h", directory: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug")
!450 = !{!451, !455}
!451 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !448, file: !449, line: 10, baseType: !452, size: 32, align: 32)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !453, line: 148, baseType: !454)
!453 = !DIFile(filename: "/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/bits/types.h", directory: "/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug")
!454 = !DIBasicType(name: "long int", size: 32, align: 32, encoding: DW_ATE_signed)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !448, file: !449, line: 11, baseType: !456, size: 32, align: 32, offset: 32)
!456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !453, line: 184, baseType: !454)
!457 = !DILocation(line: 126, column: 18, scope: !251)
!458 = !DILocalVariable(name: "timerStop_ref", scope: !251, file: !16, line: 127, type: !448)
!459 = !DILocation(line: 127, column: 18, scope: !251)
!460 = !DILocation(line: 129, column: 2, scope: !251)
!461 = !DILocation(line: 133, column: 10, scope: !251)
!462 = !DILocation(line: 133, column: 16, scope: !251)
!463 = !DILocation(line: 133, column: 21, scope: !251)
!464 = !DILocation(line: 133, column: 32, scope: !251)
!465 = !DILocation(line: 133, column: 39, scope: !251)
!466 = !DILocation(line: 133, column: 46, scope: !251)
!467 = !DILocation(line: 133, column: 2, scope: !251)
!468 = !DILocation(line: 138, column: 2, scope: !251)
!469 = !DILocation(line: 139, column: 33, scope: !251)
!470 = !DILocation(line: 139, column: 55, scope: !251)
!471 = !DILocation(line: 139, column: 39, scope: !251)
!472 = !DILocation(line: 139, column: 18, scope: !251)
!473 = !DILocation(line: 139, column: 79, scope: !251)
!474 = !DILocation(line: 139, column: 102, scope: !251)
!475 = !DILocation(line: 139, column: 86, scope: !251)
!476 = !DILocation(line: 139, column: 64, scope: !251)
!477 = !DILocation(line: 139, column: 111, scope: !251)
!478 = !DILocation(line: 139, column: 62, scope: !251)
!479 = !DILocation(line: 139, column: 16, scope: !251)
!480 = !DILocation(line: 141, column: 50, scope: !251)
!481 = !DILocation(line: 141, column: 2, scope: !251)
!482 = !DILocation(line: 142, column: 9, scope: !251)
!483 = !DILocation(line: 142, column: 2, scope: !251)
!484 = !DILocalVariable(name: "data2_hw", scope: !251, file: !16, line: 147, type: !8)
!485 = !DILocation(line: 147, column: 15, scope: !251)
!486 = !DILocation(line: 147, column: 69, scope: !251)
!487 = !DILocation(line: 147, column: 68, scope: !251)
!488 = !DILocation(line: 147, column: 73, scope: !251)
!489 = !DILocation(line: 147, column: 72, scope: !251)
!490 = !DILocation(line: 147, column: 40, scope: !251)
!491 = !DILocation(line: 147, column: 26, scope: !251)
!492 = !DILocation(line: 152, column: 2, scope: !493)
!493 = distinct !DILexicalBlock(scope: !494, file: !16, line: 152, column: 2)
!494 = distinct !DILexicalBlock(scope: !251, file: !16, line: 152, column: 2)
!495 = !DILocation(line: 152, column: 2, scope: !494)
!496 = !DILocation(line: 152, column: 2, scope: !497)
!497 = !DILexicalBlockFile(scope: !494, file: !16, discriminator: 1)
!498 = !DILocation(line: 152, column: 2, scope: !499)
!499 = !DILexicalBlockFile(scope: !493, file: !16, discriminator: 2)
!500 = !DILocation(line: 154, column: 2, scope: !251)
!501 = !DILocation(line: 155, column: 9, scope: !251)
!502 = !DILocation(line: 155, column: 2, scope: !251)
!503 = !DILocalVariable(name: "totalTime_hw", scope: !251, file: !16, line: 158, type: !445)
!504 = !DILocation(line: 158, column: 9, scope: !251)
!505 = !DILocalVariable(name: "timerStart_hw", scope: !251, file: !16, line: 159, type: !448)
!506 = !DILocation(line: 159, column: 18, scope: !251)
!507 = !DILocalVariable(name: "timerStop_hw", scope: !251, file: !16, line: 160, type: !448)
!508 = !DILocation(line: 160, column: 18, scope: !251)
!509 = !DILocation(line: 162, column: 2, scope: !251)
!510 = !DILocation(line: 165, column: 15, scope: !251)
!511 = !DILocation(line: 165, column: 21, scope: !251)
!512 = !DILocation(line: 165, column: 26, scope: !251)
!513 = !DILocation(line: 165, column: 37, scope: !251)
!514 = !DILocation(line: 165, column: 44, scope: !251)
!515 = !DILocation(line: 165, column: 51, scope: !251)
!516 = !DILocation(line: 165, column: 2, scope: !251)
!517 = !DILocation(line: 168, column: 2, scope: !251)
!518 = !DILocation(line: 169, column: 31, scope: !251)
!519 = !DILocation(line: 169, column: 52, scope: !251)
!520 = !DILocation(line: 169, column: 37, scope: !251)
!521 = !DILocation(line: 169, column: 17, scope: !251)
!522 = !DILocation(line: 169, column: 75, scope: !251)
!523 = !DILocation(line: 169, column: 97, scope: !251)
!524 = !DILocation(line: 169, column: 82, scope: !251)
!525 = !DILocation(line: 169, column: 61, scope: !251)
!526 = !DILocation(line: 169, column: 106, scope: !251)
!527 = !DILocation(line: 169, column: 59, scope: !251)
!528 = !DILocation(line: 169, column: 15, scope: !251)
!529 = !DILocation(line: 171, column: 44, scope: !251)
!530 = !DILocation(line: 171, column: 2, scope: !251)
!531 = !DILocation(line: 172, column: 9, scope: !251)
!532 = !DILocation(line: 172, column: 2, scope: !251)
!533 = !DILocation(line: 175, column: 18, scope: !251)
!534 = !DILocation(line: 175, column: 24, scope: !251)
!535 = !DILocation(line: 175, column: 29, scope: !251)
!536 = !DILocation(line: 175, column: 36, scope: !251)
!537 = !DILocation(line: 175, column: 2, scope: !251)
!538 = !DILocation(line: 178, column: 11, scope: !251)
!539 = !DILocation(line: 178, column: 2, scope: !251)
!540 = !DILocation(line: 179, column: 11, scope: !251)
!541 = !DILocation(line: 179, column: 2, scope: !251)
!542 = !DILocation(line: 180, column: 11, scope: !251)
!543 = !DILocation(line: 180, column: 2, scope: !251)
!544 = !DILocation(line: 181, column: 11, scope: !251)
!545 = !DILocation(line: 181, column: 2, scope: !251)
!546 = !DILocation(line: 184, column: 2, scope: !251)
!547 = !{!"atoi"}
!548 = !{!"int.const char *.1"}
!549 = !{!"/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdlib.h"}
!550 = !{!"__assert_fail"}
!551 = !{!"void.const char *.1.const char *.1.unsigned int.0.const char *.1"}
!552 = !{!"/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/assert.h"}
!553 = !{!"srand"}
!554 = !{!"void.unsigned int.0"}
!555 = !{!"atof"}
!556 = !{!"double.const char *.1"}
!557 = !{!"sds_alloc"}
!558 = !{!"void .unsigned int.0"}
!559 = !{!"/toolsViv/Xilinx/SDx/2018.3/target/aarch32-linux/include/sds_lib.h"}
!560 = !{!"rand"}
!561 = !{!"int."}
!562 = !{!"clock_gettime"}
!563 = !{!"int.clockid_t.0.struct timespec *.1"}
!564 = !{!"/toolsViv/Xilinx/SDK/2018.3/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/time.h"}
!565 = !{!"myFuncAccel"}
!566 = !{!"sds_free"}
!567 = !{!"void.void *.1"}
