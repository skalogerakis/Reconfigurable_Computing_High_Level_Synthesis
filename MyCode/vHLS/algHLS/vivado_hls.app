<project xmlns="com.autoesl.autopilot.project" name="algHLS" top="myFuncAccel">
    <files>
        <file name="../../../main.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas"/>
        <file name="../myAccel.c" sc="0" tb="false" cflags=""/>
        <file name="../myLib.h" sc="0" tb="false" cflags=""/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="1000 1000 4 100">
        <SimFlow name="csim" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="InitCode" status="inactive"/>
        <solution name="Optimization_1" status="inactive"/>
        <solution name="Optimazation_2" status="active"/>
    </solutions>
</project>

