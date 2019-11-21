<project xmlns="com.autoesl.autopilot.project" name="algHLS" top="myFuncAccel">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="1000 1000 4 100">
        <SimFlow name="csim" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../main.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../myLib.h" sc="0" tb="false" cflags="" blackbox="false"/>
        <file name="../myAccel.c" sc="0" tb="false" cflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="InitCode" status="inactive"/>
        <solution name="Optimization_1" status="inactive"/>
        <solution name="Optimazation_2" status="inactive"/>
        <solution name="Optimazation_3" status="active"/>
    </solutions>
</project>

