# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 22:34:31 2019

@author: Administrator
"""

from cocotb.log                          import SimLog
from cocotb.result                       import TestFailure
from cocotb.decorators                   import test, coroutine
from cocotb.triggers                     import Timer
from powlib.verify.agents.SystemAgent    import ClockDriver, ResetDriver
from powlib.verify.agents.DiscreteAgent  import DiscreteMonitor
from powlib.verify.blocks                import SwissBlock, ComposeBlocks, SucceedBlock, PrintBlock
from powlib                              import Interface, Namespace

@test()
def test_proj(top):
    '''
    Test the Microblaze system. Most of the work is done by the Microblaze. The
    purpose of this test is to simply wait until the expected GPIO value is presented.
    If not, raise TestFailure to indicate a timeout.
    '''
    
    # Create and start the test.
    tb = TestEnvironment(top)
    yield tb.start()
    
    # Wait until throwing TestFailure. 
    yield Timer(60000, "ns")
    raise TestFailure()
    
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
        
        # Create the system agent for driving clock and reset.
        ClockDriver(interface=Interface(clk=top.sys_clock),
                    param_namespace=Namespace(clk=Namespace(period=(10,"ns"))),
                    name="ipmaxiFullInst")
        rstDrv = ResetDriver(interface=Interface(rst=top.reset),
                             param_namespace=Namespace(rst=(Namespace(active_mode=0,
                                                            associated_clock=top.sys_clock,
                                                            wait_cycles=128))))
        self.__rstDrvs.append(rstDrv)
        
        # Create a discrete monitor to determine when the microblaze's operation is successful.
        dismon = DiscreteMonitor(interface=Interface(data=top.top_inst.GPIO_0_tri_io))
        
        # Print out the GPIO output.
        ComposeBlocks(dismon, PrintBlock())        
        
        # Succeed once the expected GPIO is presented.
        ComposeBlocks(dismon, 
                      SwissBlock(lambda trans : True if str(trans.data)=="0000000011111111" else False),
                      SucceedBlock())        

    log                    = property(lambda self : self.__log)     
    
    @coroutine
    def start(self):
        '''
        Waits until all resets are out of reset.
        '''
        for rstDrv in self.__rstDrvs:
            yield rstDrv.wait()
         