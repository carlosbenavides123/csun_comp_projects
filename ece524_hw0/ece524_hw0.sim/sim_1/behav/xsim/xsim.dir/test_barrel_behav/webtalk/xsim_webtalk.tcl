webtalk_init -webtalk_dir /home/carlos/csun/ece524_hw0/ece524_hw0.sim/sim_1/behav/xsim/xsim.dir/test_barrel_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Sun Sep  1 17:43:45 2019" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2018.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2258646" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "92118152-c2bd-4a25-83cb-9ab88cb98213" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "a9d85eb2f5e14ae0895c8b5e90a4f89f" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "24" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 19.04" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3374.777 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "16.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "1 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "2" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.04_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "122540_KB" -context "xsim\\usage"
webtalk_transmit -clientid 2747039818 -regid "" -xml /home/carlos/csun/ece524_hw0/ece524_hw0.sim/sim_1/behav/xsim/xsim.dir/test_barrel_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/carlos/csun/ece524_hw0/ece524_hw0.sim/sim_1/behav/xsim/xsim.dir/test_barrel_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/carlos/csun/ece524_hw0/ece524_hw0.sim/sim_1/behav/xsim/xsim.dir/test_barrel_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
