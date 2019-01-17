# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 22:34:31 2019

@author: Administrator
"""

from cocotb.log                          import SimLog
from cocotb.decorators                   import test, coroutine
from cocotb.triggers                     import Timer
from powlib.verify.agents.SystemAgent    import ClockDriver, ResetDriver
from powlib                              import Interface, Namespace

@test()
def test_proj(top):
    
    tb = TestEnvironment(top)
    yield tb.start()
    yield Timer(10000,"ns")
    
class TestEnvironment(object):
    '''
    Defines the test environment. 
    '''
    
    def __init__(self, top):
        '''
        Constructor. dut is the device-under-test that consists of all the cocotb
        SimHandles.
        '''
        
        self.__rstDrvs = []
        self.__log     = SimLog("cocotb.log")
        
        # Create the agents and blocks...
        ClockDriver(interface=Interface(clk=top.sys_clock),
                    param_namespace=Namespace(clk=Namespace(period=(10,"ns"))),
                    name="ipmaxiFullInst")
        rstDrv = ResetDriver(interface=Interface(rst=top.reset),
                             param_namespace=Namespace(rst=(Namespace(active_mode=0,
                                                            associated_clock=top.sys_clock,
                                                            wait_cycles=128))))
        self.__rstDrvs.append(rstDrv)

    log                    = property(lambda self : self.__log)     
    
    @coroutine
    def start(self):
        '''
        Waits until all resets are out of reset.
        '''
        for rstDrv in self.__rstDrvs:
            yield rstDrv.wait()
         