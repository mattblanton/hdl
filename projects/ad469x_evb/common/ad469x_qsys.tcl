###############################################################################
## Copyright (C) 2024-2025 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# receive dma
set_instance_parameter_value sys_hps {F2SDRAM_Width} {128 64}

add_instance axi_dmac_0 axi_dmac
set_instance_parameter_value axi_dmac_0 {DMA_TYPE_SRC} {1}
set_instance_parameter_value axi_dmac_0 {DMA_TYPE_DEST} {0}
set_instance_parameter_value axi_dmac_0 {CYCLIC} {0}
set_instance_parameter_value axi_dmac_0 {DMA_DATA_WIDTH_SRC} {32}
set_instance_parameter_value axi_dmac_0 {DMA_DATA_WIDTH_DEST} {64}

# axi_spi_engine

add_instance axi_spi_engine_0 axi_spi_engine
set_instance_parameter_value axi_spi_engine_0 {ASYNC_SPI_CLK} {1}
set_instance_parameter_value axi_spi_engine_0 {DATA_WIDTH}    {32}
set_instance_parameter_value axi_spi_engine_0 {MM_IF_TYPE}    {0}
set_instance_parameter_value axi_spi_engine_0 {NUM_OF_SDI}    {1}
set_instance_parameter_value axi_spi_engine_0 {NUM_OFFLOAD}   {1}

# spi_engine_execution

add_instance spi_engine_execution_0 spi_engine_execution
set_instance_parameter_value spi_engine_execution_0 {DATA_WIDTH} {32}
set_instance_parameter_value spi_engine_execution_0 {NUM_OF_SDI} {1}
set_instance_parameter_value spi_engine_execution_0 {SDI_DELAY} {0}

# spi_engine_interconnect

add_instance spi_engine_interconnect_0 spi_engine_interconnect
set_instance_parameter_value spi_engine_interconnect_0 {DATA_WIDTH} {32}
set_instance_parameter_value spi_engine_interconnect_0 {NUM_OF_SDI} {1}

# bridges

add_instance clock_bridge_0 altera_clock_bridge
set_instance_parameter_value clock_bridge_0 {EXPLICIT_CLOCK_RATE} {0.0}
set_instance_parameter_value clock_bridge_0 {NUM_CLOCK_OUTPUTS} {1}

add_instance reset_bridge_0 altera_reset_bridge
set_instance_parameter_value reset_bridge_0 {ACTIVE_LOW_RESET} {1}
set_instance_parameter_value reset_bridge_0 {NUM_RESET_OUTPUTS} {1}
set_instance_parameter_value reset_bridge_0 {SYNCHRONOUS_EDGES} {none}
set_instance_parameter_value reset_bridge_0 {USE_RESET_REQUEST} {0}

# spi_engine_offload

add_instance spi_engine_offload_0 spi_engine_offload
set_instance_parameter_value spi_engine_offload_0 {ASYNC_TRIG}    {1}
set_instance_parameter_value spi_engine_offload_0 {ASYNC_SPI_CLK} {0}
set_instance_parameter_value spi_engine_offload_0 {DATA_WIDTH}    {32}
set_instance_parameter_value spi_engine_offload_0 {NUM_OF_SDI}    {1}

# axi pwm gen

add_instance ad469x_trigger_gen axi_pwm_gen
set_instance_parameter_value ad469x_trigger_gen {N_PWMS} {1}
set_instance_parameter_value ad469x_trigger_gen {PULSE_0_PERIOD} {160}
set_instance_parameter_value ad469x_trigger_gen {PULSE_0_WIDTH} {1}

# spi_clk pll

add_instance spi_clk_pll altera_pll
set_instance_parameter_value spi_clk_pll {gui_feedback_clock} {Global Clock}
set_instance_parameter_value spi_clk_pll {gui_operation_mode} {direct}
set_instance_parameter_value spi_clk_pll {gui_number_of_clocks} {1}
set_instance_parameter_value spi_clk_pll {gui_output_clock_frequency0} {160}
set_instance_parameter_value spi_clk_pll {gui_phase_shift0} {0}
set_instance_parameter_value spi_clk_pll {gui_phase_shift1} {0}
set_instance_parameter_value spi_clk_pll {gui_phase_shift_deg0} {0.0}
set_instance_parameter_value spi_clk_pll {gui_phase_shift_deg1} {0.0}
set_instance_parameter_value spi_clk_pll {gui_phout_division} {1}
set_instance_parameter_value spi_clk_pll {gui_pll_auto_reset} {Off}
set_instance_parameter_value spi_clk_pll {gui_pll_bandwidth_preset} {Auto}
set_instance_parameter_value spi_clk_pll {gui_pll_mode} {Fractional-N PLL}
set_instance_parameter_value spi_clk_pll {gui_ps_units0} {ps}
set_instance_parameter_value spi_clk_pll {gui_refclk_switch} {0}
set_instance_parameter_value spi_clk_pll {gui_reference_clock_frequency} {50.0}
set_instance_parameter_value spi_clk_pll {gui_switchover_delay} {0}
set_instance_parameter_value spi_clk_pll {gui_en_reconf} {1}

add_instance spi_clk_pll_reconfig altera_pll_reconfig
set_instance_parameter_value spi_clk_pll_reconfig {ENABLE_BYTEENABLE} {0}
set_instance_parameter_value spi_clk_pll_reconfig {ENABLE_MIF} {0}
set_instance_parameter_value spi_clk_pll_reconfig {MIF_FILE_NAME} {}

add_connection spi_clk_pll.reconfig_from_pll spi_clk_pll_reconfig.reconfig_from_pll
set_connection_parameter_value spi_clk_pll.reconfig_from_pll/spi_clk_pll_reconfig.reconfig_from_pll endPort {}
set_connection_parameter_value spi_clk_pll.reconfig_from_pll/spi_clk_pll_reconfig.reconfig_from_pll endPortLSB {0}
set_connection_parameter_value spi_clk_pll.reconfig_from_pll/spi_clk_pll_reconfig.reconfig_from_pll startPort {}
set_connection_parameter_value spi_clk_pll.reconfig_from_pll/spi_clk_pll_reconfig.reconfig_from_pll startPortLSB {0}
set_connection_parameter_value spi_clk_pll.reconfig_from_pll/spi_clk_pll_reconfig.reconfig_from_pll width {0}

add_connection spi_clk_pll.reconfig_to_pll spi_clk_pll_reconfig.reconfig_to_pll
set_connection_parameter_value spi_clk_pll.reconfig_to_pll/spi_clk_pll_reconfig.reconfig_to_pll endPort {}
set_connection_parameter_value spi_clk_pll.reconfig_to_pll/spi_clk_pll_reconfig.reconfig_to_pll endPortLSB {0}
set_connection_parameter_value spi_clk_pll.reconfig_to_pll/spi_clk_pll_reconfig.reconfig_to_pll startPort {}
set_connection_parameter_value spi_clk_pll.reconfig_to_pll/spi_clk_pll_reconfig.reconfig_to_pll startPortLSB {0}
set_connection_parameter_value spi_clk_pll.reconfig_to_pll/spi_clk_pll_reconfig.reconfig_to_pll width {0}


# exported interface

add_interface ad469x_spi_sclk       clock source
add_interface ad469x_spi_cs         conduit end
add_interface ad469x_spi_sdi        conduit end
add_interface ad469x_spi_sdo        conduit end
add_interface ad469x_spi_trigger    conduit end
add_interface ad469x_spi_cnv        conduit end
add_interface ad469x_spi_resetn     reset source

set_interface_property ad469x_spi_cs      EXPORT_OF spi_engine_execution_0.if_cs
set_interface_property ad469x_spi_sclk    EXPORT_OF spi_engine_execution_0.if_sclk
set_interface_property ad469x_spi_sdi     EXPORT_OF spi_engine_execution_0.if_sdi
set_interface_property ad469x_spi_sdo     EXPORT_OF spi_engine_execution_0.if_sdo
set_interface_property ad469x_spi_trigger EXPORT_OF spi_engine_offload_0.if_trigger
set_interface_property ad469x_spi_cnv     EXPORT_OF ad469x_trigger_gen.if_pwm_0
set_interface_property ad469x_spi_resetn  EXPORT_OF reset_bridge_0.out_reset

add_connection axi_spi_engine_0.if_spi_resetn reset_bridge_0.in_reset

# clocks

add_interface ad469x_spi_clk            clock source
set_interface_property ad469x_spi_clk   EXPORT_OF clock_bridge_0.out_clk


add_connection sys_clk.clk spi_clk_pll.refclk
add_connection sys_clk.clk spi_clk_pll_reconfig.mgmt_clk
add_connection sys_clk.clk ad469x_trigger_gen.s_axi_clock
add_connection sys_clk.clk axi_spi_engine_0.s_axi_clock
add_connection sys_clk.clk axi_dmac_0.s_axi_clock

add_connection spi_clk_pll.outclk0 ad469x_trigger_gen.if_ext_clk
add_connection spi_clk_pll.outclk0 spi_engine_execution_0.if_clk
add_connection spi_clk_pll.outclk0 spi_engine_interconnect_0.if_clk
add_connection spi_clk_pll.outclk0 axi_spi_engine_0.if_spi_clk
add_connection spi_clk_pll.outclk0 spi_engine_offload_0.if_ctrl_clk
add_connection spi_clk_pll.outclk0 spi_engine_offload_0.if_spi_clk
add_connection spi_clk_pll.outclk0 axi_dmac_0.if_s_axis_aclk
add_connection spi_clk_pll.outclk0 clock_bridge_0.in_clk

add_connection sys_dma_clk.clk axi_dmac_0.m_dest_axi_clock

# resets

add_connection sys_clk.clk_reset spi_clk_pll.reset
add_connection sys_clk.clk_reset spi_clk_pll_reconfig.mgmt_reset
add_connection sys_clk.clk_reset axi_spi_engine_0.s_axi_reset
add_connection sys_clk.clk_reset axi_dmac_0.s_axi_reset
add_connection sys_clk.clk_reset ad469x_trigger_gen.s_axi_reset

add_connection axi_spi_engine_0.if_spi_resetn spi_engine_execution_0.if_resetn
add_connection axi_spi_engine_0.if_spi_resetn spi_engine_interconnect_0.if_resetn
add_connection axi_spi_engine_0.if_spi_resetn spi_engine_offload_0.if_spi_resetn

add_connection sys_dma_clk.clk_reset axi_dmac_0.m_dest_axi_reset

# interfaces

add_connection spi_engine_interconnect_0.m_cmd spi_engine_execution_0.cmd
add_connection spi_engine_execution_0.sdi_data spi_engine_interconnect_0.m_sdi
add_connection spi_engine_interconnect_0.m_sdo spi_engine_execution_0.sdo_data
add_connection spi_engine_execution_0.sync spi_engine_interconnect_0.m_sync

add_connection axi_spi_engine_0.cmd spi_engine_interconnect_0.s0_cmd
add_connection spi_engine_interconnect_0.s0_sdi axi_spi_engine_0.sdi_data
add_connection axi_spi_engine_0.sdo_data spi_engine_interconnect_0.s0_sdo
add_connection spi_engine_interconnect_0.s0_sync axi_spi_engine_0.sync

add_connection spi_engine_offload_0.cmd spi_engine_interconnect_0.s1_cmd
add_connection spi_engine_interconnect_0.s1_sdi  spi_engine_offload_0.sdi_data
add_connection spi_engine_offload_0.sdo_data spi_engine_interconnect_0.s1_sdo
add_connection spi_engine_interconnect_0.s1_sync spi_engine_offload_0.sync
add_connection spi_engine_offload_0.m_interconnect_ctrl spi_engine_interconnect_0.s_interconnect_ctrl

add_connection spi_engine_offload_0.ctrl_cmd_wr       axi_spi_engine_0.offload0_cmd
add_connection spi_engine_offload_0.ctrl_sdo_wr       axi_spi_engine_0.offload0_sdo
add_connection spi_engine_offload_0.if_ctrl_enable    axi_spi_engine_0.if_offload0_enable
add_connection spi_engine_offload_0.if_ctrl_enabled   axi_spi_engine_0.if_offload0_enabled
add_connection spi_engine_offload_0.if_ctrl_mem_reset axi_spi_engine_0.if_offload0_mem_reset
add_connection spi_engine_offload_0.status_sync       axi_spi_engine_0.offload_sync

add_connection spi_engine_offload_0.offload_sdi axi_dmac_0.s_axis

add_interface dma_xfer_req conduit end

set_interface_property dma_xfer_req EXPORT_OF axi_dmac_0.if_s_axis_xfer_req

# cpu interconnects

ad_cpu_interconnect 0x00020000 axi_dmac_0.s_axi
ad_cpu_interconnect 0x00030000 axi_spi_engine_0.s_axi
ad_cpu_interconnect 0x00040000 ad469x_trigger_gen.s_axi

# dma interconnect

ad_dma_interconnect axi_dmac_0.m_dest_axi

#interrupts

ad_cpu_interrupt 4 axi_dmac_0.interrupt_sender
ad_cpu_interrupt 5 axi_spi_engine_0.interrupt_sender
