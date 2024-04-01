onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counterupdown4_tb/s_reset
add wave -noupdate /counterupdown4_tb/s_clk
add wave -noupdate /counterupdown4_tb/s_enable
add wave -noupdate /counterupdown4_tb/s_upDown_n
add wave -noupdate /counterupdown4_tb/s_cntOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1024 ns}
