<project xmlns="com.autoesl.autopilot.project" top="myFuncAccel" name="vHls16">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="1000 1000 16 100">
        <SimFlow name="csim" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../main.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="myLib.h" sc="0" tb="false" cflags="" blackbox="false"/>
        <file name="myAccel16.c" sc="0" tb="false" cflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="Optimization_1_16" status="active"/>
    </solutions>
</project>

