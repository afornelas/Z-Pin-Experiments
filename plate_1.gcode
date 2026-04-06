; HEADER_BLOCK_START
; BambuStudio 02.05.00.66
; model printing time: 13m 48s; total estimated time: 20m 12s
; total layer number: 25
; total filament length [mm] : 391.43,245.25
; total filament volume [cm^3] : 941.50,589.89
; total filament weight [g] : 1.19,0.74
; model label id: 112,152
; filament_density: 1.26,1.26,1.26,1.04
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 5.00
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,1
; additional_cooling_fan_speed = 75,75,75,0
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_highest_temp
; before_layer_change_gcode = 
; best_object_pos = 0.3,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50,50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,65
; change_filament_gcode = ;======== H2D ========\n;===== 20260116 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[current_extruder]/2.4053*60*0.8} L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{else}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60*0.8} L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM620.15 C{new_filament_temp - filament_cooling_before_tower[next_extruder]}\n\nM628 S1\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if (filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU") && (old_extruder_variant != "Direct Drive TPU High Flow")}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\n{if  (old_extruder_variant == "Direct Drive TPU High Flow") && (filament_map[current_extruder] == 2) && (filament_map[next_extruder] == 1)}\n;debug log pe:{previous_extruder} ce:{current_extruder} ne:{next_extruder} oev: {old_extruder_variant} nev:{new_extruder_variant}\n;debug fm-curr:{filament_map[current_extruder]} fm-next:{filament_map[next_extruder]}\n;sw from R2L&TPU kit, travel run a distance for sketch TPU\nG1 X30 Y30 F5000\nM400\nG1 X300 Y30 F5000\nM400\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\nM620.10 R{new_extruder_retracted_length}\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\n;prime_tower_interface\n{if is_prime_tower_interface && filament_tower_interface_purge_volume !=0}\nG150.1\nM620.13 W0 L{filament_tower_interface_purge_volume} T{filament_tower_interface_print_temp} R0.0\n{endif}\n;prime_tower_interface\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4 R{new_extruder_retracted_length}\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,3
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,0
; cool_plate_temp_initial_layer = 35,35,35,0
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10,10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling,uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.003,0.003,0.003,0.008
; counter_coef_3 = 0.01,0.01,0.01,-0.041
; counter_limit_max = 0.088,0.088,0.088,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 8000,8000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL H2D"
; default_jerk = 0
; default_nozzle_volume_type = Standard,Standard
; default_print_profile = 0.20mm Standard @BBL H2D
; deretraction_speed = 30,30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0,0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1,1
; enable_pre_heating = 1
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 1
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 55,55,55,90
; eng_plate_temp_initial_layer = 55,55,55,90
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#1|4#0;1#0|4#1
; extruder_clearance_dist_to_rod = 50
; extruder_clearance_height_to_lid = 201
; extruder_clearance_height_to_rod = 47.4
; extruder_clearance_max_radius = 96
; extruder_colour = #018001;#018001
; extruder_max_nozzle_count = 1,1
; extruder_nozzle_stats = Standard#1;Standard#1
; extruder_offset = 0x0,0x0
; extruder_printable_area = 0x0,325x0,325x320,0x320#25x0,350x0,350x320,25x320
; extruder_printable_height = 320,325
; extruder_type = Direct Drive,Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow,Direct Drive TPU High Flow"
; fan_cooling_layer_time = 100,100,100,30
; fan_direction = left
; fan_max_speed = 80,80,80,60
; fan_min_speed = 60,60,60,10
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 100,100,100,200
; filament_bridge_speed = 25,25,25,25
; filament_change_length = 4,4,4,4
; filament_change_length_nc = 10,10,10,10
; filament_colour = #161616;#FFFFFF;#FFFFFF;#D32941
; filament_colour_type = 0;0;0;0
; filament_cooling_before_tower = 10,10,10,10
; filament_cost = 24.99,24.99,24.99,24.99
; filament_density = 1.26,1.26,1.26,1.04
; filament_dev_ams_drying_ams_limitations = 1;0;1;0;1;0;1
; filament_dev_ams_drying_heat_distortion_temperature = 45,45,45,90
; filament_dev_ams_drying_temperature = 45,45,45,45,45,45,45,45,45,45,45,45,65,80,65,75
; filament_dev_ams_drying_time = 12,12,12,12,12,12,12,12,12,12,12,12,12,8,12,8
; filament_dev_chamber_drying_bed_temperature = 70,70,70,90
; filament_dev_chamber_drying_time = 12,12,12,12
; filament_dev_drying_cooling_temperature = 45,45,45,75
; filament_dev_drying_softening_temperature = 50,50,50,80
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_enable_overhang_speed = 1,1,1,1
; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.95
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFA00;GFA00;GFA00;GFB00
; filament_is_support = 0,0,0,0
; filament_map = 1,2,1,1
; filament_map_2 = 0,1,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 25,25,25,20
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #FFFFFF;#FFFFFF;#FFFFFF;#D32941
; filament_notes = 
; filament_nozzle_map = 0,1,1,0
; filament_overhang_1_4_speed = 0,0,0,0
; filament_overhang_2_4_speed = 50,50,50,50
; filament_overhang_3_4_speed = 30,30,30,30
; filament_overhang_4_4_speed = 10,10,10,10
; filament_overhang_totally_speed = 10,10,10,10
; filament_pre_cooling_temperature = 0,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0
; filament_prime_volume = 30,30,30,30
; filament_prime_volume_nc = 60,60,60,60
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14
; filament_retraction_length = 0.4,0.4,0.4,0.4
; filament_scarf_gap = 0%,0%,0%,0%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,1,2,2,3,3,4,4
; filament_settings_id = "Bambu PLA Basic @BBL H2D";"Bambu PLA Basic @BBL H2D";"Bambu PLA Basic @BBL H2D";"Bambu ABS @BBL H2D"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n"
; filament_tower_interface_pre_extrusion_dist = 10,10,10,10
; filament_tower_interface_pre_extrusion_length = 0,0,0,0
; filament_tower_interface_print_temp = -1,-1,-1,-1
; filament_tower_interface_purge_volume = 20,20,20,20
; filament_tower_ironing_area = 4,4,4,4
; filament_type = PLA;PLA;PLA;ABS
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0,0,0
; filament_wipe = 1,1,1,1
; filament_wipe_distance = 1,1,1,1
; filament_z_hop_types = Spiral Lift,Spiral Lift,Spiral Lift,Spiral Lift
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1,1
; flush_volumes_matrix = 0,900,900,466,90,0,190,313,90,190,0,313,219,629,629,0,0,900,900,481,90,0,205,328,90,205,0,328,234,644,644,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250,250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0,0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.18,0.18,0.18,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55,55,90
; hot_plate_temp_initial_layer = 55,55,55,90
; hotend_cooling_rate = 2,2
; hotend_heating_rate = 3.6,3.6
; impact_strength_z = 13.8,13.8,13.8,7.4
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500,500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105,105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50,50
; initial_layer_travel_acceleration = 6000,6000
; inner_wall_acceleration = 0,0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300,300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250,250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ;======== H2D 20250710 layer_change ========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0,0
; long_retractions_when_ec = 1,1,1,1
; machine_end_gcode = ;========== H2D end ==========\n;===== date: 2025/12/26 =====\n\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nM400\nM211 Z1\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    G150.3\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of "timelapse_record_flag"\n\nG90\nG1 Z{max_layer_z + 10} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\nM106 P9 S0 ; turn off ext toodhead cooling fan\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (100.0 - max_layer_z/2) > 0}\n    {if (max_layer_z + 100.0 - max_layer_z/2) < 320}\n        G1 Z{max_layer_z + 100.0 - max_layer_z/2} F600\n        G1 Z{max_layer_z + 98.0 - max_layer_z/2}\n    {else}\n        G1 Z320 F600\n        G1 Z320\n    {endif}\n{else}\n    {if (max_layer_z + 4.0) < 320}\n        G1 Z{max_layer_z + 4.0} F600\n        G1 Z{max_layer_z + 2.0}\n    {else}\n        G1 Z320 F600\n        G1 Z320\n    {endif}\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n\n;=====printer finish air purification=========\nM622.1 S0\nM1002 judge_flag print_finish_air_filt_flag\n\nM622 J1\nM1002 gcode_claim_action : 66\nM145 P1\nM106 P6 S255\nM400 S180\nM106 P6 S0\nM623\n\nM622 J2\nM1002 gcode_claim_action : 66\nM145 P0\nM106 P3 S127\nM400 S180\nM106 P3 S0\nM623\n;=====printer finish air purification=========\n\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 30
; machine_max_acceleration_e = 5000,5000,5000,5000
; machine_max_acceleration_extruding = 20000,20000,20000,20000
; machine_max_acceleration_retracting = 5000,5000,5000,5000
; machine_max_acceleration_travel = 9000,9000,9000,9000
; machine_max_acceleration_x = 20000,20000,20000,20000
; machine_max_acceleration_y = 20000,20000,20000,20000
; machine_max_acceleration_z = 500,500,500,500
; machine_max_jerk_e = 2.5,2.5,2.5,2.5
; machine_max_jerk_x = 9,9,9,9
; machine_max_jerk_y = 9,9,9,9
; machine_max_jerk_z = 3,3,3,3
; machine_max_speed_e = 50,50,50,50
; machine_max_speed_x = 1000,1000,1000,1000
; machine_max_speed_y = 1000,1000,1000,1000
; machine_max_speed_z = 30,30,30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20260116 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\nM960 S10 P1 ; ext fan led\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM1002 set_gcode_claim_speed_level 5 ;Reset speed level\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\nG28.140 D0; reset pre-extrude z pos\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z42 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n    {if(cooling_filter_enabled)}\n        M145.2 P0 F0\n    {else}\n        M145.2 P0 F1\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n\nM1002 gcode_claim_action : 74 ; Heatbed surface foreign object detection\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{else}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nM972 S41 P0 T5000 ; trash can anti-collision\n\nM1009 Q1 L1\nG91\nG380 S2 Z30 F1200 ; lower heatbed to move toolhead\nG90\nG1 X175 Y160 F30000\nG28 Z P0 T250\nM1009 Q1 L0\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n    \nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    ;M1002 gcode_claim_action : 11 ; Indentifying build plate type\n    M972 S19 P0 C0    ; heatbed presence detection\n    M972 S31 P0 T5000 ; toolhead camera dirty detection\n    ;M1002 gcode_claim_action : 73 ; Build plate alignment detection\n    M972 S34 P0 T5000 ; heatbed plate offset detection\nM623\n\nM1002 gcode_claim_action : 72 ; Hotend Type Detection\nT1001\nM972 S14 P0 T5000 ; nozzle type detection\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} T{filament_map[initial_no_support_extruder] % 2} ; rise temp in advance\n\nG151 P{filament_map[initial_no_support_extruder] % 2} M ; plug the heat nozzle\n\n{if max_print_z >= 145}\nM1002 gcode_claim_action : 75 ; Heatbed underside foreign object detection\nG3811 Z{max_print_z}  ; Detect obstacles at the bottom of the heated bed\n{endif}\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60*0.8} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60*0.8} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M109 S{nozzle_temperature[initial_no_support_extruder]} ; wait tmpr to extrude\n    M83\n    {if(nozzle_diameter == 0.8)}\n        G1 E60 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    {else}\n        G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    {endif}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X175 Y160 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R \n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28 R\nM623\n\n;===== bed leveling end ================================\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\nG90\nG1 Z5 F1200\nG1 X270 Y-0.5 F60000\nG28.140 S0 ; cali pre-extrude z pos\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\nG29.9\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\n    M500\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n    ;==== set ext toodhead cooling fan ==== \n    {if (min_vitrification_temperature <= 50)}\n    M106 P9 S255\n    {endif}\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        {if nozzle_diameter[initial_no_support_extruder] == 0.2}\n            G29.1 Z{-0.01} ; for Textured PEI Plate\n        {else}\n            G29.1 Z{-0.02} ; for Textured PEI Plate\n        {endif}\n    {else}\n        {if nozzle_diameter[initial_no_support_extruder] == 0.2}\n            G29.1 Z{0.01} ; for Textured PEI Plate\n        {endif}\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\n    G29.2 S1 ; ensure z comp turn on\n    G90\n    M83\n    G1 Z5 F1200\n    G1 X270 Y-0.5 F60000\n    G28.14 R0\n    G29.2 S0\n    G91\n    G1 Z0.8 F1200\n    G90\n    G1 X250 F60000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    M83\n{if (filament_type[initial_no_support_extruder] == "TPU")}\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 X290 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G91\n    G3 Z0.4 I1.217 J0 P1 F60000\n    G90\n    M83\n    G29.2 S1 ; ensure z comp turn on\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
; machine_switch_extruder_time = 5.6
; machine_unload_filament_time = 30
; master_extruder_id = 2
; max_bridge_length = 0
; max_layer_height = 0.28,0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08,0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0
; nozzle_diameter = 0.4,0.4
; nozzle_flush_dataset = 1,1
; nozzle_height = 4
; nozzle_temperature = 220,220,220,270
; nozzle_temperature_initial_layer = 220,220,220,260
; nozzle_temperature_range_high = 240,240,240,280
; nozzle_temperature_range_low = 190,190,190,240
; nozzle_type = hardened_steel,hardened_steel
; nozzle_volume = 130,145
; nozzle_volume_type = Standard,Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000,5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200,200
; overhang_1_4_speed = 0,0
; overhang_2_4_speed = 50,50
; overhang_3_4_speed = 30,30
; overhang_4_4_speed = 10,10
; overhang_fan_speed = 100,100,100,80
; overhang_fan_threshold = 50%,50%,50%,25%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10,10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0,0,0
; physical_extruder_map = 1,0
; post_process = 
; pre_start_fan_time = 2,2,2,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = -1
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 1
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 60
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
; print_extruder_id = 1,2
; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL H2D
; printable_area = 0x0,350x0,350x320,0x320
; printable_height = 325
; printer_extruder_id = 1,2
; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; printer_model = Bambu Lab H2D
; printer_notes = 
; printer_settings_id = Bambu Lab H2D 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%,0%
; retract_length_toolchange = 2,2
; retract_lift_above = 0,0
; retract_lift_below = 319,319
; retract_restart_extra = 0,0
; retract_restart_extra_toolchange = 0,0
; retract_when_changing_layer = 1,1
; retraction_distances_when_cut = 10,10
; retraction_distances_when_ec = 10,10,10,10
; retraction_length = 0.8,0.8
; retraction_minimum_travel = 1,1
; retraction_speed = 30,30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 4,4,4,12
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000,100000
; slowdown_end_height = 400,400
; slowdown_end_speed = 1000,1000
; slowdown_start_acc = 100000,100000
; slowdown_start_height = 0,0
; slowdown_start_speed = 1000,1000
; small_perimeter_speed = 50%,50%
; small_perimeter_threshold = 0,0
; smooth_coefficient = 4
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%,100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 350,350
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 40,40,40,0
; supertack_plate_temp_initial_layer = 40,40,40,0
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 1
; support_cooling_filter = 1
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80,80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150,150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,100
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,90
; textured_plate_temp_initial_layer = 55,55,55,90
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;======== H2D 20251104========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\n    M622 J1\n    M993 A2 B2 C2\n    M993 A0 B0 C0\n    \n    M622.1 S0 ; for prev firmware, default turn off\n    M1002 set_flag smooth_safe_pos_suppoprt_flag=1\n    M1002 judge_flag smooth_safe_pos_suppoprt_flag\n    \n    M622 J0\n        {if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                M83\n                G1 Z{max_layer_z + 0.4} F1200\n                M400\n            {endif}\n        {endif}\n\n        {if has_timelapse_safe_pos && timelapse_type == 0 && !spiral_mode}\n            M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n        {else}\n            {if spiral_mode}\n                M971 S11 C10 O0\n                M1004 S5 P1  ; external shutter\n            {else}\n                M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n            {endif}\n        {endif}\n\n        {if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                G90\n                G1 Z{max_layer_z + 3.0} F1200\n                G1 Y295 F30000\n                G1 Y265 F18000\n                M83\n            {endif}\n        {endif}\n    M623\n\n    M622 J1\n        {if !spiral_mode && !(has_timelapse_safe_pos) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                M83\n                G1 Z{max_layer_z + 0.4} F1200\n                M400\n            {endif}\n        {endif}\n\n        {if has_timelapse_safe_pos && !spiral_mode}\n            M9711 M{timelapse_type} E{most_used_physical_extruder_id} U{timelapse_pos_x} V{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n        {else}\n            {if spiral_mode}\n                M971 S11 C10 O0\n                M1004 S5 P1  ; external shutter\n            {else}\n                M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n            {endif}\n        {endif}\n\n        {if !spiral_mode && !(has_timelapse_safe_pos) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                G90\n                G1 Z{max_layer_z + 3.0} F1200\n                G1 Y295 F30000\n                G1 Y265 F18000\n                M83\n            {endif}\n        {endif}\n    M623\n\n    M993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1,1
; top_surface_acceleration = 2000,2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200,200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000,10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250,250
; travel_speed = 1000,1000
; travel_speed_z = 0,0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D Pro 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%,80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1,1
; wipe_distance = 2,2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 250
; wrapping_detection_gcode = ;======== H2D 20250729 clumping ========\n{if !spiral_mode}\n    M622.1 S0 ; for previous firmware, default turn off\n    M1002 set_flag g39_forced_detection_flag=1\n    M1002 judge_flag g39_forced_detection_flag\n    M622 J1\n        {if layer_num == 3 || layer_num == 10 || layer_num == 19}\n            M993 A2 B2 C2 ; nozzle cam detection allow status save.\n            M993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n            M400 P100\n\n            G39\n\n            G90\n            G1 Y295 F30000\n            G1 Y265 F18000\n            \n            M993 A3 B3 C3 ; nozzle cam detection allow status restore.\n        {endif}\n    M623\n{endif}\n
; wrapping_detection_layers = 20
; wrapping_exclude_area = 145x310,256x310,256x326,145x326
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 1
; z_hop = 0.4,0.4
; z_hop_types = Auto Lift,Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R20
M201 X20000 Y20000 Z500 E5000
M203 X1000 Y1000 Z30 E50
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: H2D =========================
;===== date: 20260116 =====================

;M1002 set_flag extrude_cali_flag=1
;M1002 set_flag g29_before_print_flag=1
;M1002 set_flag auto_cali_toolhead_offset_flag=1
;M1002 set_flag build_plate_detect_flag=1

M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400
;M73 P99

M960 S10 P1 ; ext fan led

;=====printer start sound ===================
M17
M400 S1
M1006 S1
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
M1006 W
;=====printer start sound ===================

;===== reset machine status =================
M204 S10000
M630 S0 P0

G90
M17 D ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M1002 set_gcode_claim_speed_level 5 ;Reset speed level
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
G29.1 Z0 ; clear z-trim value first
M983.1 M1 
M901 D4
M481 S0 ; turn off cutter pos comp
G28.140 D0; reset pre-extrude z pos
;===== reset machine status =================

M620 M ;enable remap

;===== avoid end stop =================
G91
G380 S2 Z42 F1200
G380 S2 Z-12 F1200
G90
;===== avoid end stop =================

;==== set airduct mode ==== 


    M145 P0 ; set airduct mode to cooling mode for cooling
    M106 P2 S178 ; turn on auxiliary fan for cooling
    M106 P3 S127 ; turn on chamber fan for cooling
    M140 S0 ; stop heatbed from heating

    M1002 gcode_claim_action : 29
    M191 S0 ; wait for chamber temp
    M106 P2 S0 ; turn off auxiliary fan
    
        
            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling
        
    
    
        M145.2 P0 F1
    

;==== set airduct mode ==== 

;===== start to heat heatbed & hotend==========

    M1002 set_filament_type:PLA

    M104 S140 A
    M140 S55

    ;===== set chamber temperature ==========
    
    ;===== set chamber temperature ==========

;===== start to heat heatbead & hotend==========

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== first homing start =====
M1002 gcode_claim_action : 13

G28 X T300

G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
G150.3 F18000
M400 P200
M972 S24 P0 T2000

M1002 gcode_claim_action : 74 ; Heatbed surface foreign object detection

M972 S26 P0 C0

M972 S35 P0 C0

M972 S41 P0 T5000 ; trash can anti-collision

M1009 Q1 L1
G91
G380 S2 Z30 F1200 ; lower heatbed to move toolhead
G90
G1 X175 Y160 F30000
G28 Z P0 T250
M1009 Q1 L0

;===== first homing end =====

M400
;M73 P99

;===== detection start =====
    
M1002 judge_flag build_plate_detect_flag
M622 S1
    ;M1002 gcode_claim_action : 11 ; Indentifying build plate type
    M972 S19 P0 C0    ; heatbed presence detection
    M972 S31 P0 T5000 ; toolhead camera dirty detection
    ;M1002 gcode_claim_action : 73 ; Build plate alignment detection
    M972 S34 P0 T5000 ; heatbed plate offset detection
M623

M1002 gcode_claim_action : 72 ; Hotend Type Detection
T1001
M972 S14 P0 T5000 ; nozzle type detection

M104 S220 T1 ; rise temp in advance

G151 P1 M ; plug the heat nozzle



;===== detection end =====

M400
;M73 P99

;===== prepare print temperature and material ==========
M400
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on input shaping

G29.2 S0 ; avoid invalid abl data


M620.10 A0 F498.898 H0.4 T240 P220 S1
M620.10 A1 F498.898 H0.4 T240 P220 S1


M620.11 P0 I0 E0


M620.11 K1 I0 R10 F623.623


M628 S1


    M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629

M620 S0A   ; switch material if AMS exist
M1002 gcode_claim_action : 4
M1002 set_filament_type:UNKNOWN
M400
T0
M400
M628 S0
M629
M400
M1002 set_filament_type:PLA
M621 S0A

M104 S220
M400
M106 P1 S0

G29.2 S1
;===== prepare print temperature and material ==========

M400
;M73 P99

;===== auto extrude cali start =========================
M975 S1
M1002 judge_flag extrude_cali_flag

M622 J0
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation
M623

M622 J1
    M1002 set_filament_type:PLA
    M1002 gcode_claim_action : 8

    M109 S220

    G90
    M83
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

M622 J2
    M1002 set_filament_type:PLA
    M1002 gcode_claim_action : 8

    M109 S220

    G90
    M83
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

;===== auto extrude cali end =========================


    M106 P1 S0
    M400 S2
    M109 S220 ; wait tmpr to extrude
    M83
    
        G1 E45 F623.623
    
    G1 E-3 F1800
    M400 P500
    G150.2
    G150.1


G91
M73 P8 R18
G1 Y-16 F12000 ; move away from the trash bin
G90

M400
;M73 P99

;===== wipe right nozzle start =====

M1002 gcode_claim_action : 14
    G150 T220
    
M106 S255 ; turn on fan to cool the nozzle

;===== wipe left nozzle end =====

M400
;M73 P99



M400
;M73 P99

;===== bed leveling ==================================

M1002 judge_flag g29_before_print_flag

M190 S55; ensure bed temp
M109 S140 A
M106 S0 ; turn off fan , too noisy

G91
M73 P9 R18
G1 Z5 F1200
G90
G1 X175 Y160 F30000

M622 J1
    M1002 gcode_claim_action : 1
    G29.20 A3
    G29 A1 O X164.53 Y156.822 I28.7551 J115.648 R 
    M400
    M500 ; save cali data
M623
    
M622 J2
    M1002 gcode_claim_action : 1
    
        G29.20 A4
        G29 A2 O X164.53 Y156.822 I28.7551 J115.648 R
    
    M400
    M500 ; save cali data
M623

M622 J0
    G28 R
M623

;===== bed leveling end ================================

;===== z ofst cali start =====

    M190 S55; ensure bed temp

    G383 O0 M2 T140
    M500

;===== z ofst cali end =====

G39.1 ; cali nozzle wrapped detection pos
M500

G90
M73 P30 R13
G1 Z5 F1200
G1 X270 Y-0.5 F60000
G28.140 S0 ; cali pre-extrude z pos

M141 S0
M104 S220 A

;===== mech mode sweep start =====
    M1002 gcode_claim_action : 3

    G90
    G1 Z5 F1200
    G1 X187 Y160 F20000
    T1000
    M400 P200

    M970.3 Q1 A5 K0 O1
    M974 Q1 S2 P0

    M970.3 Q0 A5 K0 O1
    M974 Q0 S2 P0

    M970.2 Q2 K0 W38 Z0.01
    M974 Q2 S2 P0
    M500

    M975 S1
;===== mech mode sweep end =====

M400
;M73 P99

G150.3 ; move to garbage can to wait for temp
M1026
G29.9

;===== xy ofst cali start =====

M1002 judge_flag auto_cali_toolhead_offset_flag

M622 J0
    M1012.5 N1 R1
    M500
M623

M622 J1
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S220 L1
    M620.17 T1 S220 L0
    G383 O1 T220 L0
    M500
    M141 S0
M623

M622 J2
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S220 L1
    M620.17 T1 S220 L0
    G383.3 T220 L0
    M500
    M141 S0
M623
;===== xy ofst cali end =====

M400
;M73 P99

M1002 gcode_claim_action : 0
M400

;============switch again==================

M211 X0 Y0 Z0 ;turn off soft endstop
G91
G1 Z6 F1200
G90
M1002 set_filament_type:PLA
M620 S0A
M400
T0
M400
M628 S0
M629
M400
M621 S0A

;============switch again==================

M400
;M73 P99

;===== wait temperature reaching the reference value =======

M104 S220 ; rise to print tmpr

M140 S55 
M190 S55 

    ;========turn off light and fans =============
    M960 S1 P0 ; turn off laser
    M960 S2 P0 ; turn off laser
    M106 S0 ; turn off fan
    M106 P2 S0 ; turn off big fan
    ;==== set ext toodhead cooling fan ==== 
    
    M106 P9 S255
    
    ;============set motor current==================
    M400 S1

;===== wait temperature reaching the reference value =======

M400
;M73 P99

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
    
        
            G29.1 Z-0.02 ; for Textured PEI Plate
        
    
    
G150.1

M975 S1 ; turn on mech mode supression
M983.4 S1 ; turn on deformation compensation 
G29.2 S1 ; turn on pos comp
G29.7 S1

G90
M73 P31 R13
G1 Z5 F1200
G1 Y295 F30000
G1 Y265 F18000

;===== nozzle load line ===============================
    G29.2 S1 ; ensure z comp turn on
    G90
    M83
    G1 Z5 F1200
    G1 X270 Y-0.5 F60000
    G28.14 R0
    G29.2 S0
    G91
    G1 Z0.8 F1200
    G90
    G1 X250 F60000
    M109 S220
    M83

    G1 E5 F623.623
    G1 X290 E10 F623.623
    G91
    G3 Z0.4 I1.217 J0 P1 F60000
    G90
    M83
    G29.2 S1 ; ensure z comp turn on
;===== noozle load line end ===========================

M400
;M73 P99

M993 A1 B1 C1 ; nozzle cam detection allowed.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect

M211 Z1
G29.99


; MACHINE_START_GCODE_END
M104 T0 S122 N0 ;Multi extruder pre cooling
; filament start gcode
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F60000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 1/25
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
M106 P2 S0
; OBJECT_ID: 112
G1 E-.4 F1800
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
G1 X175.416 Y155.833 F60000
M204 S6000
G1 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G3 X174.924 Y155.556 I-.417 J.164 E.08198
G1 X175 Y155.549 E.00285
G3 X175.391 Y155.779 I0 J.448 E.0177
M204 S6000
G1 X175.418 Y158.832 F60000
G1 F3000
M204 S500
G3 X174.898 Y158.562 I-.416 J.165 E.0809
G1 X174.997 Y158.532 E.00386
G1 X175.153 Y158.576 E.00601
G3 X175.392 Y158.778 I-.15 J.421 E.01192
; WIPE_START
G1 X175.45 Y158.981 E-.08024
G1 X175.431 Y155.132 E-.05789
G1 X175.362 Y155.268 E-.05801
G1 X175.252 Y155.374 E-.05787
G1 X175.114 Y155.436 E-.05794
G1 X174.962 Y155.449 E-.05787
G1 X174.936 Y155.443 E-.01019
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.486 J1.116 P1  F60000
G1 X176.4 Y158.805 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X176.439 Y158.905 E.00403
G3 X175.799 Y158.598 I-.439 J.094 E.07468
G1 X176 Y158.274 E.01419
G1 X176.201 Y158.598 E.01419
G3 X176.374 Y158.751 I-.201 J.402 E.00872
; WIPE_START
G1 X176.439 Y158.905 E-.06374
G1 X176.447 Y155.057 E-.0578
G1 X176.403 Y155.203 E-.0579
G1 X176.312 Y155.326 E-.05792
G1 X176.186 Y155.411 E-.05796
G1 X176.038 Y155.449 E-.05786
G1 X175.968 Y155.443 E-.02681
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.798 J.919 P1  F60000
G1 X176.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X175.924 Y155.556 I-.417 J.164 E.08198
G1 X176 Y155.549 E.00285
G3 X176.391 Y155.779 I0 J.448 E.0177
; WIPE_START
G1 X176.45 Y155.981 E-.08014
G1 X176.431 Y160.132 E-.05789
G1 X176.362 Y160.268 E-.05801
G1 X176.252 Y160.374 E-.05787
G1 X176.186 Y160.411 E-.02911
G1 X176.038 Y160.449 E-.05787
G1 X175.936 Y160.441 E-.03912
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.462 J1.126 P1  F60000
G1 X177.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X176.924 Y155.556 I-.417 J.164 E.08198
G1 X177 Y155.549 E.00285
G3 X177.391 Y155.779 I0 J.448 E.0177
M204 S6000
G1 X177.401 Y158.806 F60000
G1 F3000
M204 S500
G1 X177.439 Y158.905 E.00396
G3 X176.799 Y158.598 I-.439 J.094 E.07468
G1 X177 Y158.274 E.01419
G1 X177.201 Y158.598 E.01419
G3 X177.375 Y158.752 I-.201 J.402 E.00879
; WIPE_START
G1 X177.439 Y158.905 E-.06305
G1 X177.447 Y155.057 E-.0578
G1 X177.403 Y155.203 E-.0579
G1 X177.312 Y155.326 E-.05793
G1 X177.186 Y155.411 E-.05791
G1 X177.038 Y155.449 E-.0579
G1 X176.966 Y155.443 E-.0275
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.158 J.375 P1  F60000
G1 X177.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X176.924 Y160.556 I-.417 J.164 E.08198
G1 X177 Y160.549 E.00285
G3 X177.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X176.416 Y160.833 F60000
G1 F3000
M204 S500
G3 X175.924 Y160.556 I-.417 J.164 E.08198
G1 X176 Y160.549 E.00285
G3 X176.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X175.416 Y160.833 F60000
G1 F3000
M204 S500
G3 X174.924 Y160.556 I-.417 J.164 E.08198
G1 X175 Y160.549 E.00285
G3 X175.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X174.416 Y160.833 F60000
G1 F3000
M204 S500
G3 X173.924 Y160.556 I-.417 J.164 E.08198
G1 X174 Y160.549 E.00285
G3 X174.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X174.416 Y155.833 F60000
G1 F3000
M204 S500
G3 X173.924 Y155.556 I-.417 J.164 E.08198
G1 X174 Y155.549 E.00285
G3 X174.391 Y155.779 I0 J.448 E.0177
M204 S6000
G1 X174.418 Y158.832 F60000
G1 F3000
M204 S500
G3 X173.898 Y158.562 I-.416 J.165 E.0809
G1 X173.997 Y158.532 E.00386
G1 X174.153 Y158.576 E.00601
G3 X174.392 Y158.778 I-.15 J.421 E.01193
; WIPE_START
G1 X174.45 Y158.981 E-.08024
G1 X174.431 Y155.132 E-.05789
G1 X174.362 Y155.268 E-.05801
G1 X174.252 Y155.374 E-.05787
G1 X174.114 Y155.436 E-.05794
G1 X173.962 Y155.449 E-.05787
G1 X173.936 Y155.443 E-.0102
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.054 J-1.216 P1  F60000
G1 X173.185 Y155.409 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X172.799 Y158.598 I-.185 J-.41 E.05194
G1 X173 Y158.274 E.01419
G1 X173.201 Y158.598 E.01419
G3 X173.238 Y155.381 I-.201 J.402 E.0355
; WIPE_START
G1 X173.038 Y155.449 E-.08019
M73 P32 R13
G1 X172.886 Y155.436 E-.05794
G1 X172.748 Y155.374 E-.05788
G1 X172.638 Y155.268 E-.05789
G1 X172.569 Y155.132 E-.0579
G1 X172.55 Y158.981 E-.05798
G1 X172.555 Y158.955 E-.01021
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.117 J.483 P1  F60000
G1 X173.183 Y160.405 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X172.924 Y155.556 I-.183 J-.408 E.05656
G1 X173 Y155.549 E.00285
G3 X173.236 Y160.377 I0 J.448 E.04313
; WIPE_START
G1 X173.038 Y160.449 E-.07988
G1 X172.886 Y160.436 E-.05794
G1 X172.748 Y160.374 E-.05788
G1 X172.638 Y160.268 E-.05789
G1 X172.569 Y160.132 E-.0579
G1 X172.553 Y160.057 E-.02909
G1 X172.557 Y155.954 E-.03941
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.118 J.482 P1  F60000
G1 X173.183 Y161.405 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X172.924 Y160.556 I-.183 J-.408 E.05656
G1 X173 Y160.549 E.00285
G3 X173.236 Y161.377 I0 J.448 E.04313
M204 S6000
G1 X172.416 Y160.833 F60000
G1 F3000
M204 S500
G3 X171.924 Y160.556 I-.417 J.164 E.08198
G1 X172 Y160.549 E.00285
G3 X172.391 Y160.778 I0 J.448 E.01769
M204 S6000
G1 X172.358 Y160.265 F60000
G1 F3000
M204 S500
G3 X171.924 Y155.556 I-.358 J-.268 E.06501
G1 X172 Y155.549 E.00285
G3 X172.391 Y160.215 I0 J.448 E.03466
M204 S6000
G1 X172.311 Y155.324 F60000
G1 F3000
M204 S500
G3 X171.799 Y158.598 I-.311 J-.325 E.05763
G1 X172 Y158.274 E.01419
G1 X172.201 Y158.598 E.01419
G3 X172.351 Y155.28 I-.201 J.402 E.02981
; WIPE_START
G1 X172.186 Y155.411 E-.08029
G1 X172.038 Y155.449 E-.05786
G1 X171.886 Y155.436 E-.05794
G1 X171.748 Y155.374 E-.05788
G1 X171.638 Y155.268 E-.05789
G1 X171.569 Y155.132 E-.0579
G1 X171.565 Y155.105 E-.01022
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.067 J-.585 P1  F60000
G1 X171.4 Y158.805 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X171.439 Y158.905 E.00403
G3 X170.799 Y158.598 I-.439 J.094 E.07468
G1 X171 Y158.274 E.01419
G1 X171.201 Y158.598 E.01419
G3 X171.374 Y158.751 I-.201 J.402 E.00872
; WIPE_START
G1 X171.439 Y158.905 E-.06374
G1 X171.447 Y155.057 E-.0578
G1 X171.403 Y155.203 E-.0579
G1 X171.312 Y155.326 E-.05793
G1 X171.186 Y155.411 E-.05791
G1 X171.038 Y155.449 E-.0579
G1 X170.968 Y155.443 E-.02681
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.798 J.919 P1  F60000
G1 X171.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X170.924 Y155.556 I-.417 J.164 E.08198
G1 X171 Y155.549 E.00285
G3 X171.391 Y155.779 I0 J.448 E.0177
; WIPE_START
G1 X171.45 Y155.981 E-.08014
G1 X171.431 Y160.132 E-.05789
G1 X171.362 Y160.268 E-.05801
G1 X171.252 Y160.374 E-.05786
G1 X171.186 Y160.411 E-.02907
G1 X171.038 Y160.449 E-.0579
G1 X170.936 Y160.441 E-.03912
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.769 J.943 P1  F60000
G1 X171.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X170.924 Y160.556 I-.417 J.164 E.08198
G1 X171 Y160.549 E.00285
G3 X171.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X170.416 Y160.833 F60000
G1 F3000
M204 S500
G3 X169.924 Y160.556 I-.417 J.164 E.08198
G1 X170 Y160.549 E.00285
G3 X170.391 Y160.778 I0 J.448 E.01769
M204 S6000
G1 X170.358 Y160.265 F60000
G1 F3000
M204 S500
G3 X169.924 Y155.556 I-.358 J-.268 E.06501
G1 X170 Y155.549 E.00285
G3 X170.391 Y160.215 I0 J.448 E.03466
M204 S6000
G1 X170.311 Y155.324 F60000
G1 F3000
M204 S500
G3 X169.799 Y158.598 I-.311 J-.325 E.05763
G1 X170 Y158.274 E.01419
G1 X170.201 Y158.598 E.01419
G3 X170.351 Y155.28 I-.201 J.402 E.02981
; WIPE_START
G1 X170.186 Y155.411 E-.0803
G1 X170.038 Y155.449 E-.05786
G1 X169.886 Y155.436 E-.05795
G1 X169.748 Y155.374 E-.05787
G1 X169.638 Y155.268 E-.05791
G1 X169.569 Y155.132 E-.05789
G1 X169.565 Y155.105 E-.01022
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.072 J-.576 P1  F60000
G1 X169.39 Y158.779 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X169.439 Y158.905 E.00504
G3 X168.799 Y158.598 I-.439 J.094 E.07468
G1 X169 Y158.274 E.01419
G1 X169.201 Y158.598 E.01419
G3 X169.358 Y158.729 I-.201 J.402 E.0077
; WIPE_START
G1 X169.439 Y158.905 E-.07388
G1 X169.447 Y155.057 E-.0578
G1 X169.403 Y155.203 E-.0579
G1 X169.312 Y155.326 E-.05793
G1 X169.186 Y155.411 E-.05791
G1 X169.038 Y155.449 E-.0579
G1 X168.995 Y155.446 E-.01667
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.823 J.897 P1  F60000
G1 X169.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X168.924 Y155.556 I-.417 J.164 E.08198
G1 X169 Y155.549 E.00285
G3 X169.391 Y155.779 I0 J.448 E.0177
; WIPE_START
G1 X169.45 Y155.981 E-.08014
G1 X169.431 Y160.132 E-.05789
G1 X169.362 Y160.268 E-.05801
G1 X169.252 Y160.374 E-.05786
G1 X169.186 Y160.411 E-.02907
G1 X169.038 Y160.449 E-.0579
G1 X168.936 Y160.441 E-.03912
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.769 J.943 P1  F60000
G1 X169.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X168.924 Y160.556 I-.417 J.164 E.08198
G1 X169 Y160.549 E.00285
G3 X169.391 Y160.779 I0 J.448 E.0177
M204 S6000
G1 X168.416 Y160.833 F60000
M104 T0 S210 N0 ;Multi extruder pre heating
G1 F3000
M204 S500
G3 X167.924 Y160.556 I-.417 J.164 E.08198
G1 X168 Y160.549 E.00285
G3 X168.391 Y160.778 I0 J.448 E.01769
; WIPE_START
G1 X168.45 Y160.981 E-.08022
G1 X168.431 Y161.132 E-.05793
G1 X168.362 Y161.268 E-.05796
G1 X168.252 Y161.374 E-.05788
G1 X168.186 Y161.411 E-.02907
G1 X168.038 Y161.449 E-.0579
G1 X167.936 Y161.441 E-.03904
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.938 J-.775 P1  F60000
G1 X167.379 Y160.767 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X167.166 Y161.418 I-.385 J.234 E.02897
G1 X167.088 Y161.523 E.00488
G3 X166.793 Y161.458 I.042 J-.89 E.0113
G3 X166.474 Y160.935 I.296 J-.539 E.02389
G1 X166.575 Y160.852 E.00488
G3 X166.924 Y160.556 I.43 J.152 E.01785
G3 X167.344 Y160.718 I.07 J.446 E.01757
; WIPE_START
G1 X167.441 Y160.905 E-.08012
G1 X167.447 Y161.057 E-.05788
G1 X167.403 Y161.203 E-.05794
G1 X167.312 Y161.326 E-.0579
G1 X167.166 Y161.418 E-.06564
G1 X167.088 Y161.523 E-.04981
G1 X167.06 Y161.517 E-.01071
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1 J-.694 P1  F60000
G1 X166.102 Y160.136 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X166.13 Y160.267 E.00496
G2 X166.257 Y160.522 I.809 J-.242 E.01067
G1 X165.857 Y160.847 E.01921
G1 X165.857 Y160.162 E.02552
G1 X166.043 Y160.143 E.00695
M204 S6000
G1 X166.238 Y155.497 F60000
G1 F3000
M204 S500
G2 X166.091 Y155.874 I1.023 J.619 E.01515
G1 X165.857 Y155.839 E.0088
G1 X165.857 Y155.237 E.02242
G1 X166.189 Y155.463 E.01496
; WIPE_START
G1 X166.156 Y155.661 E-.07609
G1 X166.091 Y155.874 E-.08468
G1 X165.857 Y155.839 E-.08978
G1 X165.857 Y155.498 E-.12945
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.255 J1.19 P1  F60000
G1 X167.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X166.924 Y155.556 I-.417 J.164 E.08198
G1 X167 Y155.549 E.00285
G3 X167.391 Y155.778 I0 J.448 E.01769
; WIPE_START
G1 X167.45 Y155.981 E-.08022
G1 X167.431 Y160.132 E-.05789
G1 X167.362 Y160.268 E-.05801
G1 X167.252 Y160.374 E-.05786
G1 X167.186 Y160.411 E-.02907
G1 X167.038 Y160.449 E-.0579
G1 X166.936 Y160.441 E-.03905
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.248 J1.192 P1  F60000
G1 X168.427 Y160.131 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X167.924 Y155.556 I-.427 J-.134 E.07066
G1 X168 Y155.549 E.00285
G3 X168.441 Y160.072 I0 J.448 E.02901
M204 S6000
G1 X168.401 Y155.202 F60000
G1 F3000
M204 S500
G3 X167.799 Y158.598 I-.401 J-.202 E.06331
G1 X168 Y158.274 E.01419
G1 X168.201 Y158.598 E.01419
G3 X168.425 Y155.147 I-.201 J.402 E.02413
; WIPE_START
G1 X168.312 Y155.326 E-.08025
G1 X168.186 Y155.411 E-.05791
G1 X168.038 Y155.449 E-.0579
G1 X167.886 Y155.436 E-.05794
G1 X167.748 Y155.374 E-.05788
G1 X167.638 Y155.268 E-.05789
G1 X167.625 Y155.244 E-.01022
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.087 J-.548 P1  F60000
G1 X167.414 Y158.825 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X167.415 Y158.833 E.0003
G3 X166.59 Y155.183 I-.417 J.164 E.05155
G1 X166.481 Y155.109 E.00488
G1 X166.509 Y158.894 E.00809
G3 X166.915 Y158.505 I.499 J.114 E.0222
G1 X167.132 Y158.486 E.00809
G1 X167.201 Y158.598 E.00489
G3 X167.336 Y158.704 I-.203 J.4 E.00646
G1 X167.382 Y158.775 E.00313
; WIPE_START
G1 X167.415 Y158.833 E-.02549
G1 X167.441 Y158.905 E-.02902
G1 X167.447 Y155.057 E-.05789
G1 X167.431 Y155.132 E-.029
G1 X167.403 Y155.203 E-.0291
G1 X167.312 Y155.326 E-.05793
G1 X167.186 Y155.411 E-.05791
G1 X167.114 Y155.436 E-.02906
G1 X166.962 Y155.449 E-.05789
G1 X166.944 Y155.446 E-.0067
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.027 J-.653 P1  F60000
G1 X166.251 Y158.357 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X166.068 Y158.721 E.01519
G1 X165.857 Y158.671 E.00807
G1 X165.857 Y158.357 E.0117
G1 X166.191 Y158.357 E.01245
; WIPE_START
G1 X166.068 Y158.721 E-.14619
G1 X165.857 Y158.671 E-.08234
G1 X165.857 Y158.357 E-.1194
G1 X165.941 Y158.357 E-.03207
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.216 J.057 P1  F60000
G1 X166.079 Y161.277 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X166.142 Y161.433 E.00624
G1 X166.271 Y161.643 E.00919
G1 X165.857 Y161.643 E.01542
G1 X165.857 Y161.32 E.01202
G1 X166.02 Y161.289 E.00619
; WIPE_START
G1 X166.142 Y161.433 E-.07162
G1 X166.271 Y161.643 E-.09379
G1 X165.857 Y161.643 E-.15735
G1 X165.857 Y161.492 E-.05724
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.167 J1.205 P1  F60000
G1 X182.401 Y155.202 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X181.799 Y158.598 I-.401 J-.202 E.06331
G1 X182 Y158.274 E.01419
G1 X182.201 Y158.598 E.01419
G3 X182.425 Y155.147 I-.201 J.402 E.02413
M204 S6000
G1 X182.427 Y160.131 F60000
G1 F3000
M204 S500
G3 X181.924 Y155.556 I-.427 J-.134 E.07066
G1 X182 Y155.549 E.00285
G3 X182.441 Y160.072 I0 J.448 E.02901
; WIPE_START
G1 X182.362 Y160.268 E-.08028
G1 X182.252 Y160.374 E-.05786
G1 X182.186 Y160.411 E-.02907
G1 X182.038 Y160.449 E-.0579
G1 X181.886 Y160.436 E-.05794
G1 X181.748 Y160.374 E-.05788
G1 X181.673 Y160.302 E-.03906
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.068 J-.584 P1  F60000
G1 X181.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X180.924 Y155.556 I-.417 J.164 E.08198
G1 X181 Y155.549 E.00285
G3 X181.391 Y155.778 I0 J.448 E.01769
M204 S6000
G1 X181.39 Y158.779 F60000
G1 F3000
M204 S500
G1 X181.439 Y158.905 E.00504
G3 X180.799 Y158.598 I-.439 J.094 E.07468
G1 X181 Y158.274 E.01419
G1 X181.201 Y158.598 E.01419
G3 X181.358 Y158.729 I-.201 J.402 E.0077
; WIPE_START
G1 X181.439 Y158.905 E-.07386
G1 X181.447 Y155.057 E-.0578
G1 X181.403 Y155.203 E-.0579
G1 X181.312 Y155.326 E-.05792
G1 X181.186 Y155.411 E-.05796
G1 X181.038 Y155.449 E-.05786
G1 X180.994 Y155.446 E-.01669
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.331 J-1.171 P1  F60000
G1 X180.36 Y155.266 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X179.898 Y158.562 I-.357 J-.269 E.06385
G1 X179.997 Y158.532 E.00386
G1 X180.153 Y158.576 E.00601
G3 X180.393 Y155.216 I-.15 J.421 E.02897
; WIPE_START
G1 X180.252 Y155.374 E-.08019
G1 X180.114 Y155.436 E-.05791
G1 X179.962 Y155.449 E-.05789
G1 X179.814 Y155.411 E-.05793
G1 X179.688 Y155.326 E-.0579
G1 X179.597 Y155.203 E-.05793
G1 X179.589 Y155.177 E-.01025
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.994 J.702 P1  F60000
G1 X180.358 Y160.265 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X179.924 Y155.556 I-.358 J-.268 E.06501
G1 X180 Y155.549 E.00285
G3 X180.391 Y160.215 I0 J.448 E.03466
; WIPE_START
G1 X180.252 Y160.374 E-.08013
G1 X180.114 Y160.436 E-.05791
G1 X180.038 Y160.449 E-.02906
G1 X179.886 Y160.436 E-.0579
G1 X179.814 Y160.411 E-.02907
G1 X179.688 Y160.326 E-.0579
G1 X179.597 Y160.203 E-.05793
G1 X179.59 Y160.178 E-.01011
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.43 J-1.138 P1  F60000
G1 X179.358 Y160.265 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X178.924 Y155.556 I-.358 J-.268 E.06501
G1 X179 Y155.549 E.00285
G3 X179.391 Y160.215 I0 J.448 E.03466
M204 S6000
G1 X179.311 Y155.324 F60000
G1 F3000
M204 S500
G3 X178.799 Y158.598 I-.311 J-.325 E.05763
G1 X179 Y158.274 E.01419
G1 X179.201 Y158.598 E.01419
G3 X179.351 Y155.28 I-.201 J.402 E.02981
; WIPE_START
G1 X179.186 Y155.411 E-.08028
G1 X179.038 Y155.449 E-.05788
G1 X178.886 Y155.436 E-.05794
G1 X178.748 Y155.374 E-.05788
G1 X178.638 Y155.268 E-.05789
G1 X178.569 Y155.132 E-.0579
G1 X178.565 Y155.105 E-.01022
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.067 J-.585 P1  F60000
G1 X178.4 Y158.805 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X178.439 Y158.905 E.00403
G3 X177.799 Y158.598 I-.439 J.094 E.07468
G1 X178 Y158.274 E.01419
G1 X178.201 Y158.598 E.01419
G3 X178.374 Y158.751 I-.201 J.402 E.00872
; WIPE_START
G1 X178.439 Y158.905 E-.06374
G1 X178.447 Y155.057 E-.0578
G1 X178.403 Y155.203 E-.0579
G1 X178.312 Y155.326 E-.05793
G1 X178.186 Y155.411 E-.05791
G1 X178.038 Y155.449 E-.0579
G1 X177.968 Y155.443 E-.02681
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.798 J.919 P1  F60000
G1 X178.416 Y155.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X177.924 Y155.556 I-.417 J.164 E.08198
G1 X178 Y155.549 E.00285
G3 X178.391 Y155.779 I0 J.448 E.0177
; WIPE_START
G1 X178.45 Y155.981 E-.08014
G1 X178.431 Y160.132 E-.05789
G1 X178.362 Y160.268 E-.05801
G1 X178.252 Y160.374 E-.05786
G1 X178.186 Y160.411 E-.02907
G1 X178.038 Y160.449 E-.0579
G1 X177.936 Y160.441 E-.03912
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.769 J.943 P1  F60000
G1 X178.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
M73 P33 R13
G1 F3000
M204 S500
G3 X177.924 Y160.556 I-.417 J.164 E.08198
G1 X178 Y160.549 E.00285
G3 X178.391 Y160.779 I0 J.448 E.0177
; WIPE_START
G1 X178.45 Y160.981 E-.08015
G1 X178.431 Y161.132 E-.05793
G1 X178.362 Y161.268 E-.05796
G1 X178.252 Y161.374 E-.05788
G1 X178.186 Y161.411 E-.02907
G1 X178.038 Y161.449 E-.0579
G1 X177.936 Y161.441 E-.03911
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.462 J1.126 P1  F60000
G1 X179.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X178.924 Y160.556 I-.417 J.164 E.08198
G1 X179 Y160.549 E.00285
G3 X179.391 Y160.778 I0 J.448 E.01769
; WIPE_START
G1 X179.45 Y160.981 E-.08022
G1 X179.431 Y161.132 E-.05793
G1 X179.362 Y161.268 E-.05794
G1 X179.252 Y161.374 E-.0579
G1 X179.114 Y161.436 E-.05791
G1 X179.038 Y161.449 E-.02906
G1 X178.936 Y161.441 E-.03904
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.462 J1.126 P1  F60000
G1 X180.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X179.924 Y160.556 I-.417 J.164 E.08198
G1 X180 Y160.549 E.00285
G3 X180.391 Y160.778 I0 J.448 E.01769
; WIPE_START
G1 X180.45 Y160.981 E-.08022
G1 X180.431 Y161.132 E-.05793
G1 X180.362 Y161.268 E-.05794
G1 X180.252 Y161.374 E-.0579
G1 X180.114 Y161.436 E-.05791
G1 X180.038 Y161.449 E-.02906
G1 X179.936 Y161.441 E-.03904
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.462 J1.126 P1  F60000
G1 X181.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X180.924 Y160.556 I-.417 J.164 E.08198
G1 X181 Y160.549 E.00285
G3 X181.391 Y160.778 I0 J.448 E.01769
; WIPE_START
G1 X181.45 Y160.981 E-.08022
G1 X181.431 Y161.132 E-.05793
G1 X181.362 Y161.268 E-.05796
G1 X181.252 Y161.374 E-.05788
G1 X181.186 Y161.411 E-.02911
G1 X181.038 Y161.449 E-.05787
G1 X180.936 Y161.441 E-.03904
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.462 J1.126 P1  F60000
G1 X182.416 Y160.833 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X181.924 Y160.556 I-.417 J.164 E.08198
G1 X182 Y160.549 E.00285
G3 X182.391 Y160.778 I0 J.448 E.01769
; WIPE_START
G1 X182.45 Y160.981 E-.08022
G1 X182.431 Y161.132 E-.05793
G1 X182.362 Y161.268 E-.05796
G1 X182.252 Y161.374 E-.05788
G1 X182.186 Y161.411 E-.02907
G1 X182.038 Y161.449 E-.0579
G1 X181.936 Y161.441 E-.03904
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.013 J1.217 P1  F60000
G1 X183.205 Y161.454 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X182.912 Y161.523 I-.283 J-.546 E.01132
G1 X182.834 Y161.418 E.00488
G3 X182.924 Y160.556 I.174 J-.418 E.04314
G3 X183.425 Y160.852 I.073 J.447 E.02354
G1 X183.526 Y160.935 E.00488
G3 X183.449 Y161.226 I-.89 J-.081 E.01129
G3 X183.257 Y161.424 I-.526 J-.318 E.01035
; WIPE_START
G1 X182.912 Y161.523 E-.13627
G1 X182.834 Y161.418 E-.04982
G1 X182.748 Y161.374 E-.03695
G1 X182.638 Y161.268 E-.05789
G1 X182.569 Y161.132 E-.05792
G1 X182.555 Y161.025 E-.04114
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.855 J.866 P1  F60000
G1 X183.183 Y160.405 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X182.924 Y155.556 I-.183 J-.408 E.05657
G1 X183 Y155.549 E.00285
G3 X183.236 Y160.377 I0 J.448 E.04312
M204 S6000
G1 X183.192 Y155.406 F60000
G1 F3000
M204 S500
G1 X183.184 Y155.407 E.00031
G3 X182.799 Y158.598 I-.181 J-.41 E.05155
G1 X182.868 Y158.486 E.00489
G3 X183.245 Y158.561 I.045 J.759 E.01447
G3 X183.519 Y155.11 I-.34 J.512 E.02389
G1 X183.411 Y155.183 E.00488
G3 X183.31 Y155.324 I-.408 J-.186 E.00646
G1 X183.241 Y155.372 E.00313
M204 S6000
G1 X183.932 Y158.721 F60000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X183.749 Y158.357 E.01519
G1 X184.143 Y158.357 E.01469
G1 X184.143 Y158.671 E.0117
G1 X183.991 Y158.708 E.00584
; WIPE_START
G1 X183.749 Y158.357 E-.16182
G1 X184.143 Y158.357 E-.14986
G1 X184.143 Y158.537 E-.06832
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.217 J0 P1  F60000
G1 X184.143 Y155.839 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X183.909 Y155.874 E.0088
G2 X183.762 Y155.497 I-1.172 J.242 E.01515
G1 X184.143 Y155.237 E.01719
G1 X184.143 Y155.779 E.02018
; WIPE_START
G1 X183.909 Y155.874 E-.09584
G1 X183.844 Y155.661 E-.08463
G1 X183.762 Y155.497 E-.06973
G1 X184.044 Y155.305 E-.1298
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.214 J.078 P1  F60000
G1 X184.143 Y160.847 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X183.743 Y160.522 E.0192
G2 X183.898 Y160.136 I-.806 J-.547 E.0156
G1 X184.143 Y160.162 E.00918
G1 X184.143 Y160.787 E.02327
M204 S6000
G1 X183.729 Y161.643 F60000
G1 F3000
M204 S500
G2 X183.921 Y161.277 I-.966 J-.74 E.01546
G1 X184.143 Y161.32 E.00843
G1 X184.143 Y161.643 E.01202
G1 X183.789 Y161.643 E.01319
M204 S6000
G1 X184.6 Y162.1 F60000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X165.4 Y162.1 E.71513
G1 X165.4 Y157.9 E.15643
G1 X184.6 Y157.9 E.71513
G1 X184.6 Y162.04 E.1542
; WIPE_START
G1 X183.6 Y162.043 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.981 J-.72 P1  F60000
G1 X183.39 Y161.757 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219494
G1 F3000
M204 S500
G3 X183.198 Y161.789 I-.476 J-2.24 E.0028
; LINE_WIDTH: 0.19125
G1 X183.01 Y161.805 E.00229
; LINE_WIDTH: 0.156103
G1 X182.821 Y161.821 E.00175
G1 X182.099 Y161.671 E.0068
M204 S6000
G1 X181.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X181.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244957
G1 X180.942 Y161.775 E.00438
G1 X180.792 Y161.762 E.00249
; LINE_WIDTH: 0.301945
G3 X180.216 Y161.642 I1.099 J-6.752 E.01241
M204 S6000
G1 X179.784 Y161.643 F60000
; LINE_WIDTH: 0.301822
G1 F3000
M204 S500
G3 X179.208 Y161.762 I-1.682 J-6.676 E.01241
; LINE_WIDTH: 0.24496
G1 X178.942 Y161.775 E.00438
G1 X178.792 Y161.762 E.00249
; LINE_WIDTH: 0.301945
G3 X178.216 Y161.642 I1.099 J-6.752 E.01241
M204 S6000
G1 X177.784 Y161.643 F60000
; LINE_WIDTH: 0.30185
G1 F3000
M204 S500
G3 X177.208 Y161.762 I-1.678 J-6.656 E.01241
; LINE_WIDTH: 0.24495
G1 X177.058 Y161.775 E.00248
G1 X176.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X176.216 Y161.642 I1.092 J-6.721 E.01241
M204 S6000
G1 X175.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X175.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244945
G1 X175.058 Y161.775 E.00248
G1 X174.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X174.216 Y161.642 I1.092 J-6.72 E.01241
M204 S6000
G1 X173.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X173.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244957
G1 X172.942 Y161.775 E.00438
G1 X172.792 Y161.762 E.00249
; LINE_WIDTH: 0.301945
G3 X172.216 Y161.642 I1.099 J-6.751 E.01241
M204 S6000
G1 X171.784 Y161.643 F60000
; LINE_WIDTH: 0.301851
G1 F3000
M204 S500
G3 X171.208 Y161.762 I-1.678 J-6.654 E.01241
; LINE_WIDTH: 0.244963
G1 X170.942 Y161.775 E.00438
G1 X170.792 Y161.762 E.00249
; LINE_WIDTH: 0.301936
G3 X170.216 Y161.643 I1.117 J-6.851 E.01242
M204 S6000
G1 X169.784 Y161.643 F60000
; LINE_WIDTH: 0.30185
G1 F3000
M204 S500
G3 X169.208 Y161.762 I-1.678 J-6.657 E.01241
; LINE_WIDTH: 0.24495
G1 X169.058 Y161.775 E.00248
G1 X168.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X168.216 Y161.642 I1.092 J-6.72 E.01241
M204 S6000
G1 X167.901 Y161.671 F60000
; LINE_WIDTH: 0.15535
G1 F3000
M204 S500
G1 X167.179 Y161.821 E.00675
; LINE_WIDTH: 0.159186
G1 X166.99 Y161.805 E.00179
; LINE_WIDTH: 0.192523
G3 X166.787 Y161.787 I.104 J-2.345 E.00248
; LINE_WIDTH: 0.22035
G1 X166.61 Y161.757 E.0026
M204 S6000
G1 X166.829 Y161.871 F60000
; LINE_WIDTH: 0.37064
G1 F3000
M204 S500
G2 X167.49 Y161.698 I-1.671 J-7.717 E.01824
G1 X167.5 Y161.695 E.00029
G2 X168.075 Y161.871 I2.353 J-6.628 E.01607
M204 S6000
G1 X167.925 Y161.871 F60000
; LINE_WIDTH: 0.380686
G1 F3000
M204 S500
G2 X168.5 Y161.695 I-1.799 J-6.871 E.01656
G2 X169.074 Y161.871 I2.418 J-6.832 E.01654
M204 S6000
G1 X168.925 Y161.871 F60000
; LINE_WIDTH: 0.380666
G1 F3000
M204 S500
G2 X169.5 Y161.695 I-1.799 J-6.871 E.01655
G2 X170.075 Y161.871 I2.364 J-6.661 E.01655
M204 S6000
G1 X169.925 Y161.871 F60000
; LINE_WIDTH: 0.380634
G1 F3000
M204 S500
G2 X170.5 Y161.695 I-1.801 J-6.876 E.01655
G2 X171.075 Y161.871 I2.391 J-6.751 E.01655
M204 S6000
G1 X170.925 Y161.871 F60000
; LINE_WIDTH: 0.380693
G1 F3000
M204 S500
G2 X171.5 Y161.695 I-1.814 J-6.921 E.01656
G2 X172.075 Y161.871 I2.353 J-6.628 E.01656
M204 S6000
G1 X171.925 Y161.871 F60000
; LINE_WIDTH: 0.380686
G1 F3000
M204 S500
G2 X172.5 Y161.695 I-1.796 J-6.862 E.01656
G2 X173.075 Y161.871 I2.353 J-6.628 E.01656
M204 S6000
G1 X172.925 Y161.871 F60000
; LINE_WIDTH: 0.380682
G1 F3000
M204 S500
G2 X173.5 Y161.695 I-1.796 J-6.862 E.01656
G2 X174.074 Y161.871 I2.382 J-6.717 E.01655
M204 S6000
G1 X173.925 Y161.871 F60000
G1 F3000
M204 S500
G2 X174.5 Y161.695 I-1.796 J-6.862 E.01656
G2 X175.074 Y161.871 I2.382 J-6.718 E.01655
M204 S6000
G1 X174.925 Y161.871 F60000
G1 F3000
M204 S500
G2 X175.5 Y161.695 I-1.796 J-6.862 E.01656
G2 X176.074 Y161.871 I2.382 J-6.718 E.01655
M204 S6000
G1 X175.925 Y161.871 F60000
G1 F3000
M204 S500
G2 X176.5 Y161.695 I-1.795 J-6.861 E.01656
G2 X177.074 Y161.871 I2.382 J-6.718 E.01655
M204 S6000
G1 X176.925 Y161.871 F60000
; LINE_WIDTH: 0.380689
G1 F3000
M204 S500
G2 X177.5 Y161.695 I-1.799 J-6.871 E.01656
G2 X178.074 Y161.871 I2.397 J-6.767 E.01655
M204 S6000
G1 X177.925 Y161.871 F60000
; LINE_WIDTH: 0.380693
G1 F3000
M204 S500
G2 X178.5 Y161.695 I-1.814 J-6.92 E.01656
G2 X179.075 Y161.871 I2.353 J-6.629 E.01656
M204 S6000
G1 X178.925 Y161.871 F60000
; LINE_WIDTH: 0.380682
G1 F3000
M204 S500
G2 X179.5 Y161.695 I-1.853 J-7.046 E.01655
G2 X180.074 Y161.871 I2.442 J-6.91 E.01654
M204 S6000
G1 X179.925 Y161.871 F60000
; LINE_WIDTH: 0.380675
G1 F3000
M204 S500
G2 X180.5 Y161.695 I-1.766 J-6.771 E.01657
G2 X181.075 Y161.871 I2.365 J-6.669 E.01656
M204 S6000
G1 X180.925 Y161.871 F60000
; LINE_WIDTH: 0.380686
G1 F3000
M204 S500
G2 X181.5 Y161.695 I-1.795 J-6.861 E.01656
G2 X182.075 Y161.871 I2.353 J-6.629 E.01656
M204 S6000
G1 X181.925 Y161.871 F60000
; LINE_WIDTH: 0.370624
G1 F3000
M204 S500
G1 X182.49 Y161.698 E.01577
G3 X183.171 Y161.871 I-.768 J4.444 E.01878
M204 S6000
G1 X182.726 Y161.655 F60000
; LINE_WIDTH: 0.301299
G1 F3000
M204 S500
G3 X182.208 Y161.762 I-1.502 J-5.983 E.01113
; LINE_WIDTH: 0.244962
G1 X181.942 Y161.775 E.00438
G1 X181.792 Y161.762 E.00249
; LINE_WIDTH: 0.301945
G3 X181.216 Y161.642 I1.099 J-6.752 E.01241
M204 S6000
G1 X180.784 Y161.643 F60000
; LINE_WIDTH: 0.301822
G1 F3000
M204 S500
G3 X180.208 Y161.762 I-1.682 J-6.677 E.01241
; LINE_WIDTH: 0.244948
G1 X180.058 Y161.775 E.00248
G1 X179.792 Y161.762 E.00438
; LINE_WIDTH: 0.301839
G3 X179.216 Y161.643 I1.104 J-6.786 E.01242
M204 S6000
G1 X178.784 Y161.643 F60000
; LINE_WIDTH: 0.30185
G1 F3000
M204 S500
G3 X178.208 Y161.762 I-1.678 J-6.653 E.01241
; LINE_WIDTH: 0.24495
G1 X178.058 Y161.775 E.00248
G1 X177.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X177.216 Y161.642 I1.092 J-6.721 E.01241
M204 S6000
G1 X176.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X176.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244945
G1 X176.058 Y161.775 E.00248
G1 X175.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X175.216 Y161.642 I1.092 J-6.721 E.01241
M204 S6000
G1 X174.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X174.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244945
G1 X174.058 Y161.775 E.00248
G1 X173.792 Y161.762 E.00438
; LINE_WIDTH: 0.301841
G3 X173.216 Y161.642 I1.092 J-6.72 E.01241
M204 S6000
G1 X172.784 Y161.643 F60000
; LINE_WIDTH: 0.301766
G1 F3000
M204 S500
G3 X172.208 Y161.762 I-1.677 J-6.656 E.01242
; LINE_WIDTH: 0.244957
G1 X171.942 Y161.775 E.00438
G1 X171.792 Y161.762 E.00249
; LINE_WIDTH: 0.301945
G3 X171.216 Y161.642 I1.099 J-6.751 E.01241
M204 S6000
G1 X170.784 Y161.643 F60000
; LINE_WIDTH: 0.301764
G1 F3000
M204 S500
G3 X170.208 Y161.762 I-1.675 J-6.644 E.01241
; LINE_WIDTH: 0.244959
G1 X169.942 Y161.775 E.00438
G1 X169.792 Y161.762 E.00249
; LINE_WIDTH: 0.301936
G3 X169.216 Y161.643 I1.117 J-6.851 E.01242
M204 S6000
G1 X168.784 Y161.643 F60000
; LINE_WIDTH: 0.30185
G1 F3000
M204 S500
G3 X168.208 Y161.762 I-1.678 J-6.657 E.01241
; LINE_WIDTH: 0.244962
G1 X167.942 Y161.775 E.00438
G1 X167.792 Y161.762 E.00249
; LINE_WIDTH: 0.301393
G3 X167.274 Y161.655 I.982 J-6.069 E.01113
; WIPE_START
G1 X167.792 Y161.762 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.005 J-.686 P1  F60000
G1 X165.859 Y158.932 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.121627
G1 F3000
M204 S500
G1 X165.962 Y158.978 E.00072
; LINE_WIDTH: 0.159039
G1 X166.066 Y155.023 E.00107
; LINE_WIDTH: 0.196451
G1 X166.169 Y155.069 E.00141
; LINE_WIDTH: 0.189944
G1 X166.198 Y155.035 E.00053
; LINE_WIDTH: 0.143059
G1 X166.225 Y155.003 E.00034
; LINE_WIDTH: 0.111636
G1 X166.249 Y158.925 E.00046
M204 S6000
G1 X166.557 Y158.258 F60000
; LINE_WIDTH: 0.239583
G1 F3000
M204 S500
G1 X166.717 Y158.223 E.00262
; LINE_WIDTH: 0.213515
G1 X166.857 Y158.205 E.00196
; LINE_WIDTH: 0.178624
G3 X167.247 Y158.188 I.397 J4.585 E.00431
G1 X167.711 Y158.307 E.0053
M204 S6000
G1 X167.761 Y158.226 F60000
; LINE_WIDTH: 0.395677
G1 F3000
M204 S500
G1 X167.5 Y158.306 E.00784
G1 X166.921 Y158.129 E.0174
; WIPE_START
G1 X167.5 Y158.306 E-.26192
G1 X167.761 Y158.226 E-.11808
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.019 J1.217 P1  F60000
G1 X173.835 Y158.129 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.340047
G1 F3000
M204 S500
G1 X174.753 Y158.368 E.02295
M204 S6000
G1 X174.819 Y158.345 F60000
; LINE_WIDTH: 0.282657
G1 F3000
M204 S500
G1 X174.263 Y158.247 E.01103
; LINE_WIDTH: 0.262487
G1 X174.141 Y158.23 E.00222
; LINE_WIDTH: 0.223895
G2 X173.971 Y158.213 I-.145 J.593 E.00252
; LINE_WIDTH: 0.228203
G1 X173.856 Y158.229 E.00176
; LINE_WIDTH: 0.27663
G2 X173.3 Y158.325 I1.066 J7.876 E.01074
M204 S6000
G1 X173.316 Y158.35 F60000
; LINE_WIDTH: 0.340035
G1 F3000
M204 S500
G1 X174.165 Y158.129 E.02124
M204 S6000
G1 X174.835 Y158.129 F60000
; LINE_WIDTH: 0.340047
G1 F3000
M204 S500
G1 X175.684 Y158.35 E.02123
M204 S6000
G1 X175.7 Y158.324 F60000
; LINE_WIDTH: 0.282657
G1 F3000
M204 S500
G1 X175.263 Y158.247 E.00866
; LINE_WIDTH: 0.262487
G1 X175.141 Y158.23 E.00222
; LINE_WIDTH: 0.223895
G2 X174.971 Y158.213 I-.145 J.593 E.00252
; LINE_WIDTH: 0.228203
G1 X174.856 Y158.229 E.00176
; LINE_WIDTH: 0.277346
G2 X174.18 Y158.346 I1.31 J9.581 E.0131
M204 S6000
G1 X174.247 Y158.368 F60000
; LINE_WIDTH: 0.340035
G1 F3000
M204 S500
G1 X175.165 Y158.129 E.02296
; WIPE_START
G1 X174.247 Y158.368 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.052 J1.216 P1  F60000
G1 X179.835 Y158.129 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.340026
G1 F3000
M204 S500
G1 X180.684 Y158.35 E.02124
M204 S6000
G1 X180.7 Y158.324 F60000
; LINE_WIDTH: 0.282661
G1 F3000
M204 S500
G1 X180.263 Y158.247 E.00866
; LINE_WIDTH: 0.262487
G1 X180.141 Y158.23 E.00222
; LINE_WIDTH: 0.223895
G2 X179.971 Y158.213 I-.145 J.593 E.00252
; LINE_WIDTH: 0.228203
G1 X179.856 Y158.229 E.00176
; LINE_WIDTH: 0.27663
G2 X179.3 Y158.325 I1.067 J7.88 E.01074
M204 S6000
G1 X179.316 Y158.35 F60000
; LINE_WIDTH: 0.340035
G1 F3000
M204 S500
G1 X180.165 Y158.129 E.02125
; WIPE_START
G1 X179.316 Y158.35 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.072 J1.215 P1  F60000
G1 X183.079 Y158.129 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.39572
G1 F3000
M204 S500
G1 X182.5 Y158.306 E.01739
G1 X182.239 Y158.226 E.00785
M204 S6000
G1 X182.289 Y158.307 F60000
; LINE_WIDTH: 0.178394
G1 F3000
M204 S500
G1 X182.753 Y158.188 E.00529
G1 X183.13 Y158.204 E.00417
; LINE_WIDTH: 0.209807
G1 X183.267 Y158.221 E.00188
; LINE_WIDTH: 0.238718
G3 X183.443 Y158.258 I-.345 J2.057 E.00286
M204 S6000
G1 X183.751 Y158.925 F60000
; LINE_WIDTH: 0.111633
G1 F3000
M204 S500
G1 X183.775 Y155.003 E.00046
; LINE_WIDTH: 0.14306
G1 X183.802 Y155.035 E.00034
; LINE_WIDTH: 0.188458
G1 X183.829 Y155.067 E.0005
; LINE_WIDTH: 0.196937
G1 X183.935 Y155.023 E.00144
; LINE_WIDTH: 0.159092
G1 X184.038 Y158.978 E.00107
; LINE_WIDTH: 0.121644
G1 X184.142 Y158.932 E.00073
; WIPE_START
M204 S500
G1 X184.038 Y158.978 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S6000
G17
G3 Z.6 I-1.217 J.021 P1  F60000
G1 X185.963 Y268.881 Z.6
G1 Z.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X186.463 Y269.881  
M204 S500
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F3000
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S6000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S500
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F3000
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
M73 P34 R13
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
M204 S6000
G1  X188.333 Y268.506  
M204 S500
G3  X185.174 Y271.932   I-20.220 J-15.475 E0.1773
G3  X181.287 Y271.236   I-1.597 J-2.283 E0.1668
G2  X178.517 Y270.338   I-2.772 J3.829 E0.1125
G2  X173.534 Y270.542   I-1.804 J16.887 E0.1903
G2  X170.621 Y272.326   I9.435 J18.678 E0.1299
G3  X167.977 Y271.674   I-0.830 J-2.322 E0.1096
G3  X164.888 Y268.241   I17.097 J-18.490 E0.1758
G3  X165.765 Y264.879   I2.129 J-1.240 E0.1466
G2  X166.506 Y262.733   I-2.778 J-2.159 E0.0878
G2  X166.360 Y258.278   I-15.319 J-1.727 E0.1700
G2  X164.737 Y255.907   I-7.494 J3.387 E0.1098
G3  X165.093 Y253.506   I1.992 J-0.931 E0.0977
G3  X168.252 Y250.080   I20.215 J15.471 E0.1773
G3  X172.139 Y250.776   I1.597 J2.283 E0.1668
G2  X174.909 Y251.674   I2.772 J-3.830 E0.1125
G2  X179.892 Y251.470   I1.804 J-16.891 E0.1902
G2  X182.805 Y249.686   I-9.426 J-18.663 E0.1299
G3  X183.753 Y249.544   I0.848 J2.414 E0.0367
G3  X185.449 Y250.338   I-0.159 J2.547 E0.0729
G3  X188.538 Y253.771   I-17.091 J18.484 E0.1758
G3  X187.661 Y257.133   I-2.129 J1.240 E0.1466
G2  X186.920 Y259.278   I2.778 J2.159 E0.0878
G2  X187.066 Y263.734   I15.316 J1.728 E0.1700
G2  X188.689 Y266.105   I7.494 J-3.387 E0.1098
G3  X188.333 Y268.506   I-1.992 J0.931 E0.0977
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z.6 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S500
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y253.881  E0.0796
G1  X167.713  E1.4325
G1  Y254.881  E0.0796
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S500
G1 X184.713 Y254.881 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E20

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R0
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R0

M400

M73 P44 R11
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z3.2 F3000

M204 S500


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S0
M106 P2 S0
G1 E-.4 F1800
G1 X190.897 Y264.706 F60000
G1 Z.2
G17
G3 Z.6 I1.217 J0 P1
G1 X190.897 Y247.542 Z.6
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z.2
M73 P45 R11
G1 E.4 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
; LINE_WIDTH: 0.500000
M204 S500
G1  X170.463 Y256.381  E0.1140 F990
G1 E-0.4000 F1800
M204 S6000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
G1  Y255.381 
G1  X170.463 Y256.381   F990
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S500
G1  X185.963  E0.5891 F990
G1  Y256.881  E0.0190
G1  X167.463  E0.7031 F1125
G1  Y257.381  E0.0190
G1  X185.963  E0.7031 F1374
G1  Y257.881  E0.0190
G1  X167.463  E0.7031 F2625
G1  Y258.381  E0.0190
G1  X185.963  E0.7031 F2675
G1  Y258.881  E0.0190
G1  X167.463  E0.7031
G1  Y259.381  E0.0190
G1  X185.963  E0.7031
G1  Y259.881  E0.0190
G1  X167.463  E0.7031
G1  Y260.381  E0.0190
M73 P45 R10
G1  X185.963  E0.7031
G1  Y260.881  E0.0190
G1  X167.463  E0.7031
G1  Y261.381  E0.0190
G1  X185.963  E0.7031
G1  Y261.881  E0.0190
G1  X167.463  E0.7031
G1  Y262.381  E0.0190
G1  X185.963  E0.7031
G1  Y262.881  E0.0190
G1  X167.463  E0.7031
G1  Y263.381  E0.0190
G1  X185.963  E0.7031
G1  Y263.881  E0.0190
G1  X167.463  E0.7031
G1  Y264.381  E0.0190
G1  X185.963  E0.7031
G1  Y264.881  E0.0190
M73 P46 R10
G1  X167.463  E0.7031
G1  Y265.381  E0.0190
G1  X185.963  E0.7031
G1  Y265.881  E0.0190
G1  X167.463  E0.7031
G1  Y266.381  E0.0190
G1  X185.963  E0.7031
G1  Y266.881  E0.0190
G1  X167.463  E0.7031
G1  Y267.381  E0.0190
G1  X185.963  E0.7031
G1  Y267.881  E0.0190
G1  X167.463  E0.7031
G1  Y268.381  E0.0190
G1  X185.963  E0.7031
G1  Y268.881  E0.0190
G1  X167.463  E0.7031
G1  Y269.381  E0.0190
G1  X185.963  E0.7031
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S500
G1 X184.963 Y269.381 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S6000
G1 X192.428 Y160.965
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X189.142 Y160.965 E.12239
G1 X189.142 Y157.679 E.12239
G1 X192.428 Y157.679 E.12239
G1 X192.428 Y160.905 E.12015
M204 S6000
G1 X192.885 Y161.422 F60000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X188.685 Y161.422 E.15643
G1 X188.685 Y157.222 E.15643
G1 X192.885 Y157.222 E.15643
G1 X192.885 Y161.362 E.1542
; WIPE_START
G1 X191.885 Y161.376 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.201 J-.199 P1  F60000
G1 X191.302 Y157.861 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50896
G1 F6300
M204 S500
G1 X192.04 Y158.599 E.0396
G1 X192.04 Y155.258 E.02503
G1 X190.849 Y158.067 E.06395
G1 X190.19 Y158.067 E.02503
G1 X192.04 Y155.917 E.09935
G1 X192.04 Y160.576 E.02503
G1 X189.531 Y158.067 E.13474
G1 X189.531 Y158.726 E.02503
G1 X191.38 Y160.576 E.09934
G1 X190.721 Y160.576 E.02503
G1 X189.531 Y155.385 E.06395
G1 X189.531 Y160.044 E.02503
G1 X190.268 Y160.782 E.0396
; WIPE_START
G1 X189.561 Y160.075 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 1 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z0.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z0.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer1 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 2/25
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S198.9
M106 P2 S191
; open powerlost recovery
M1003 S1
; OBJECT_ID: 152
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22 F60000
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 2 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z0.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z0.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer2 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S162 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.4 F1200

M400
M106 P1 S0
M106 P2 S0


; get travel path for change filament
;M620.1 X54 Y0 F21000 P0
;M620.1 X54 Y0 F21000 P1
;M620.1 X54 Y245 F21000 P2



M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E19

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P47 R10
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z3.4 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y269.131 F60000
G1 Z.4

; filament start gcode
G17
G3 Z.8 I0 J-1.217 P1
G1 X185.963 Y269.131 Z.8
G1 Z.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y269.631 
G1  X185.463 
G1  Y268.631 
G1  X186.963 
G1  Y270.131 
G1  X184.963 
G1  Y268.131 
G1  X182.963 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
M73 P48 R10
G1  X185.963  E0.7031
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y259.381  E0.0285
G1  X185.963  E0.7031
G1  Y258.631  E0.0285
G1  X167.463  E0.7031
G1  Y257.881  E0.0285
G1  X185.963  E0.7031
G1  Y257.131  E0.0285
G1  X167.463  E0.7031
G1  Y256.381  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y270.055  
M204 S8000
G3  X183.574 Y272.013   I-3.488 J-1.982 E0.1317
G3  X181.239 Y270.654   I1.125 J-4.619 E0.1041
G2  X178.521 Y269.881   I-2.725 J4.418 E0.1088
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X188.077 Y268.1 E-.05173
G1 X188.156 Y267.99 E-.05173
G1 X188.226 Y267.873 E-.05174
G1 X188.287 Y267.751 E-.05173
G1 X188.338 Y267.625 E-.05173
G1 X188.379 Y267.495 E-.05174
G1 X188.41 Y267.363 E-.05173
G1 X188.417 Y267.316 E-.01787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.379 Y155.848
G1 Z.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.931 Y155.595 I-.379 J.149 E.06162
G1 X175 Y155.589 E.00214
G3 X175.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X175.41 Y155.982 E-.07507
G1 X175.367 Y160.185 E-.07868
G1 X175.284 Y160.297 E-.05275
G1 X175.169 Y160.374 E-.05284
G1 X175.035 Y160.409 E-.0527
G1 X174.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X176.379 Y155.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y155.595 I-.379 J.149 E.06162
G1 X176 Y155.589 E.00214
G3 X176.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X176.41 Y155.982 E-.07507
G1 X176.367 Y160.185 E-.07868
G1 X176.284 Y160.297 E-.05275
G1 X176.169 Y160.374 E-.05284
G1 X176.035 Y160.409 E-.0527
G1 X175.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X176.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y160.595 I-.379 J.149 E.06162
G1 X176 Y160.589 E.00214
G3 X176.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X175.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X174.931 Y160.595 I-.379 J.149 E.06162
G1 X175 Y160.589 E.00214
G3 X175.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X175.41 Y160.982 E-.07507
G1 X175.367 Y161.185 E-.07869
G1 X175.284 Y161.297 E-.05275
G1 X175.169 Y161.374 E-.05278
G1 X175.035 Y161.409 E-.05275
G1 X174.859 Y161.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.766 J-.946 P1  F60000
G1 X172.281 Y155.293 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y158.595 I-.281 J-.296 E.04675
G1 X172 Y158.589 E.00214
G3 X172.321 Y155.248 I0 J.408 E.02799
; WIPE_START
M204 S8000
G1 X172.169 Y155.374 E-.07509
G1 X172.035 Y155.409 E-.0527
G1 X171.831 Y155.374 E-.07868
G1 X171.716 Y155.297 E-.05271
G1 X171.633 Y155.185 E-.05276
G1 X171.593 Y155.052 E-.05276
G1 X171.594 Y155.012 E-.0153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-1.209 J-.142 P1  F60000
G1 X171.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y160.595 I-.379 J.149 E.06162
G1 X171 Y160.589 E.00214
G3 X171.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X170.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X169.931 Y160.595 I-.379 J.149 E.06162
G1 X170 Y160.589 E.00214
G3 X170.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X170.281 Y160.293 F60000
G1 F12000
M204 S5000
G3 X169.931 Y155.595 I-.281 J-.296 E.04675
G1 X170 Y155.589 E.00214
G3 X170.321 Y160.248 I0 J.408 E.02799
M204 S250
G1 X170.281 Y155.293 F60000
G1 F12000
M204 S5000
G3 X169.931 Y158.595 I-.281 J-.296 E.04675
G1 X170 Y158.589 E.00214
G3 X170.321 Y155.248 I0 J.408 E.02799
; WIPE_START
M204 S8000
G1 X170.169 Y155.374 E-.07509
G1 X170.035 Y155.409 E-.0527
G1 X169.831 Y155.374 E-.07867
G1 X169.716 Y155.297 E-.05271
G1 X169.633 Y155.185 E-.05276
G1 X169.593 Y155.052 E-.05279
G1 X169.594 Y155.012 E-.01529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.112 J1.212 P1  F60000
G1 X171.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y158.595 I-.379 J.149 E.06162
G1 X171 Y158.589 E.00214
G3 X171.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X171.41 Y158.982 E-.07507
G1 X171.367 Y155.185 E-.07868
G1 X171.284 Y155.297 E-.05275
G1 X171.169 Y155.374 E-.05284
G1 X171.035 Y155.409 E-.0527
G1 X170.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X171.379 Y155.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y155.595 I-.379 J.149 E.06162
G1 X171 Y155.589 E.00214
G3 X171.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X171.41 Y155.982 E-.07507
G1 X171.367 Y160.185 E-.07868
G1 X171.284 Y160.297 E-.05275
G1 X171.169 Y160.374 E-.05284
G1 X171.035 Y160.409 E-.0527
G1 X170.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.074 J1.215 P1  F60000
G1 X172.281 Y160.293 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y155.595 I-.281 J-.296 E.04675
G1 X172 Y155.589 E.00214
G3 X172.321 Y160.248 I0 J.408 E.02799
M204 S250
G1 X172.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X171.931 Y160.595 I-.379 J.149 E.06162
G1 X172 Y160.589 E.00214
G3 X172.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X173.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X172.931 Y160.595 I-.167 J-.372 E.04252
G1 X173 Y160.589 E.00214
G3 X173.22 Y161.34 I0 J.408 E.03222
; WIPE_START
M204 S8000
G1 X173.035 Y161.409 E-.07497
G1 X172.831 Y161.374 E-.07868
G1 X172.716 Y161.297 E-.05271
G1 X172.633 Y161.185 E-.05276
G1 X172.593 Y161.052 E-.05276
G1 X172.598 Y160.913 E-.0528
G1 X172.614 Y160.876 E-.01532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.02 J1.217 P1  F60000
G1 X174.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y160.595 I-.379 J.149 E.06162
G1 X174 Y160.589 E.00214
G3 X174.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X174.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y155.595 I-.379 J.149 E.06162
G1 X174 Y155.589 E.00214
G3 X174.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X174.41 Y155.982 E-.07507
G1 X174.367 Y160.185 E-.07868
G1 X174.284 Y160.297 E-.05275
G1 X174.169 Y160.374 E-.05284
G1 X174.035 Y160.409 E-.0527
G1 X173.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.017 J-1.217 P1  F60000
G1 X173.167 Y160.369 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y155.595 I-.167 J-.372 E.04252
G1 X173 Y155.589 E.00214
G3 X173.22 Y160.341 I0 J.408 E.03222
M204 S250
G1 X173.167 Y155.369 F60000
G1 F12000
M204 S5000
G3 X172.931 Y158.595 I-.167 J-.372 E.04252
G1 X173 Y158.589 E.00214
G3 X173.22 Y155.341 I0 J.408 E.03222
; WIPE_START
M204 S8000
G1 X173.035 Y155.409 E-.07492
G1 X172.831 Y155.374 E-.07868
G1 X172.716 Y155.297 E-.05271
G1 X172.633 Y155.185 E-.05276
G1 X172.593 Y155.052 E-.05276
G1 X172.598 Y158.913 E-.05279
G1 X172.614 Y158.876 E-.01537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.019 J1.217 P1  F60000
G1 X174.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y158.595 I-.379 J.149 E.06162
G1 X174 Y158.589 E.00214
G3 X174.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X174.41 Y158.982 E-.07507
G1 X174.367 Y155.185 E-.07868
G1 X174.284 Y155.297 E-.05275
G1 X174.169 Y155.374 E-.05284
G1 X174.035 Y155.409 E-.0527
G1 X173.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X175.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.931 Y158.595 I-.379 J.149 E.06162
G1 X175 Y158.589 E.00214
G3 X175.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X175.41 Y158.982 E-.07507
G1 X175.367 Y155.185 E-.07868
G1 X175.284 Y155.297 E-.05275
G1 X175.169 Y155.374 E-.05284
G1 X175.035 Y155.409 E-.0527
G1 X174.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X176.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y158.595 I-.379 J.149 E.06162
G1 X176 Y158.589 E.00214
G3 X176.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X176.41 Y158.982 E-.07507
G1 X176.367 Y155.185 E-.07868
G1 X176.284 Y155.297 E-.05275
G1 X176.169 Y155.374 E-.05284
G1 X176.035 Y155.409 E-.0527
G1 X175.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X177.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y158.595 I-.379 J.149 E.06162
G1 X177 Y158.589 E.00214
G3 X177.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X177.41 Y158.982 E-.07507
G1 X177.367 Y155.185 E-.07868
G1 X177.284 Y155.297 E-.05275
G1 X177.169 Y155.374 E-.05284
G1 X177.035 Y155.409 E-.0527
G1 X176.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X178.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y158.595 I-.379 J.149 E.06162
G1 X178 Y158.589 E.00214
G3 X178.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X178.41 Y158.982 E-.07507
G1 X178.367 Y155.185 E-.07868
G1 X178.284 Y155.297 E-.05275
G1 X178.169 Y155.374 E-.05284
G1 X178.035 Y155.409 E-.0527
G1 X177.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.074 J1.215 P1  F60000
G1 X179.281 Y155.293 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y158.595 I-.281 J-.296 E.04675
G1 X179 Y158.589 E.00214
G3 X179.321 Y155.248 I0 J.408 E.02799
M204 S250
G1 X180.281 Y155.293 F60000
G1 F12000
M204 S5000
G3 X179.931 Y158.595 I-.281 J-.296 E.04675
G1 X180 Y158.589 E.00214
G3 X180.321 Y155.248 I0 J.408 E.02799
; WIPE_START
M204 S8000
G1 X180.169 Y155.374 E-.07508
G1 X180.035 Y155.409 E-.0527
G1 X179.831 Y155.374 E-.07867
G1 X179.716 Y155.297 E-.05271
G1 X179.633 Y155.185 E-.05278
G1 X179.593 Y155.052 E-.05276
G1 X179.594 Y155.012 E-.0153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-1.073 J.575 P1  F60000
G1 X180.281 Y160.293 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y155.595 I-.281 J-.296 E.04675
G1 X180 Y155.589 E.00214
G3 X180.321 Y160.248 I0 J.408 E.02799
; WIPE_START
M204 S8000
G1 X180.169 Y160.374 E-.07508
G1 X180.035 Y160.409 E-.0527
G1 X179.831 Y160.374 E-.07867
G1 X179.716 Y160.297 E-.05271
G1 X179.633 Y160.185 E-.05278
G1 X179.593 Y160.052 E-.05276
G1 X179.594 Y160.012 E-.0153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.812 J-.907 P1  F60000
G1 X179.281 Y160.293 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y155.595 I-.281 J-.296 E.04675
G1 X179 Y155.589 E.00214
G3 X179.321 Y160.248 I0 J.408 E.02799
; WIPE_START
M204 S8000
G1 X179.169 Y160.374 E-.07508
G1 X179.035 Y160.409 E-.0527
G1 X178.831 Y160.374 E-.07868
G1 X178.716 Y160.297 E-.05271
G1 X178.633 Y160.185 E-.05276
G1 X178.593 Y160.052 E-.05276
G1 X178.594 Y160.012 E-.0153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.739 J-.967 P1  F60000
G1 X178.379 Y155.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y155.595 I-.379 J.149 E.06162
G1 X178 Y155.589 E.00214
G3 X178.353 Y155.793 I0 J.408 E.01312
M204 S250
G1 X177.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y155.595 I-.379 J.149 E.06162
G1 X177 Y155.589 E.00214
G3 X177.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X177.41 Y155.982 E-.07507
G1 X177.367 Y160.185 E-.07868
G1 X177.284 Y160.297 E-.05275
G1 X177.169 Y160.374 E-.05284
G1 X177.035 Y160.409 E-.0527
G1 X176.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X177.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y160.595 I-.379 J.149 E.06162
G1 X177 Y160.589 E.00214
G3 X177.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X177.41 Y160.982 E-.07507
G1 X177.367 Y161.185 E-.07869
G1 X177.284 Y161.297 E-.05275
G1 X177.169 Y161.374 E-.05278
G1 X177.035 Y161.409 E-.05275
G1 X176.859 Y161.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X178.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y160.595 I-.379 J.149 E.06162
G1 X178 Y160.589 E.00214
G3 X178.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X178.41 Y160.982 E-.07507
G1 X178.367 Y161.185 E-.07869
G1 X178.284 Y161.297 E-.05275
G1 X178.169 Y161.374 E-.05278
G1 X178.035 Y161.409 E-.05275
G1 X177.859 Y161.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X179.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y160.595 I-.379 J.149 E.06162
G1 X179 Y160.589 E.00214
G3 X179.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X179.41 Y160.982 E-.07507
G1 X179.367 Y161.185 E-.07869
G1 X179.284 Y161.297 E-.05275
G1 X179.169 Y161.374 E-.05278
G1 X179.035 Y161.409 E-.05275
G1 X178.859 Y161.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X180.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y160.595 I-.379 J.149 E.06162
G1 X180 Y160.589 E.00214
G3 X180.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X180.41 Y160.982 E-.07507
G1 X180.367 Y161.185 E-.07869
G1 X180.284 Y161.297 E-.05275
G1 X180.169 Y161.374 E-.05278
G1 X180.035 Y161.409 E-.05275
G1 X179.859 Y161.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X181.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y160.595 I-.379 J.149 E.06162
G1 X181 Y160.589 E.00214
G3 X181.353 Y160.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X181.41 Y160.982 E-.07507
G1 X181.367 Y161.185 E-.07869
G1 X181.284 Y161.297 E-.05275
G1 X181.169 Y161.374 E-.05277
G1 X181.035 Y161.409 E-.05277
G1 X180.859 Y161.379 E-.06795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.401 J1.149 P1  F60000
G1 X182.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y160.595 I-.379 J.149 E.06162
G1 X182 Y160.589 E.00214
G3 X182.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X183.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y160.595 I-.167 J-.372 E.04252
G1 X183 Y160.589 E.00214
G3 X183.22 Y161.34 I0 J.408 E.03222
M204 S250
G1 X183.167 Y160.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y155.595 I-.167 J-.372 E.04252
G1 X183 Y155.589 E.00214
G3 X183.22 Y160.341 I0 J.408 E.03222
M204 S250
G1 X182.363 Y160.183 F60000
G1 F12000
M204 S5000
G3 X181.931 Y155.595 I-.363 J-.186 E.05099
G1 X182 Y155.589 E.00214
G3 X182.386 Y160.128 I0 J.408 E.02376
M204 S250
G1 X182.363 Y155.183 F60000
G1 F12000
M204 S5000
G3 X181.931 Y158.595 I-.363 J-.186 E.05099
G1 X182 Y158.589 E.00214
G3 X182.386 Y155.128 I0 J.408 E.02376
; WIPE_START
M204 S8000
G1 X182.284 Y155.297 E-.07493
G1 X182.169 Y155.374 E-.05284
G1 X182.035 Y155.409 E-.0527
G1 X181.831 Y155.374 E-.07868
G1 X181.716 Y155.297 E-.05271
G1 X181.633 Y155.185 E-.05276
G1 X181.621 Y155.146 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.945 J-.767 P1  F60000
G1 X181.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y158.595 I-.379 J.149 E.06162
G1 X181 Y158.589 E.00214
G3 X181.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X181.41 Y158.982 E-.07507
G1 X181.367 Y155.185 E-.07868
G1 X181.284 Y155.297 E-.05275
G1 X181.169 Y155.374 E-.05283
G1 X181.035 Y155.409 E-.05272
G1 X180.859 Y155.379 E-.06795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X181.379 Y155.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y155.595 I-.379 J.149 E.06162
G1 X181 Y155.589 E.00214
G3 X181.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X181.41 Y155.982 E-.07507
G1 X181.367 Y160.185 E-.07868
G1 X181.284 Y160.297 E-.05275
G1 X181.169 Y160.374 E-.05283
G1 X181.035 Y160.409 E-.05272
G1 X180.859 Y160.379 E-.06795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.488 J1.115 P1  F60000
G1 X183.167 Y155.369 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.931 Y158.595 I-.167 J-.372 E.04252
G1 X183 Y158.589 E.00214
G3 X183.22 Y155.341 I0 J.408 E.03222
; WIPE_START
M204 S8000
G1 X183.035 Y155.409 E-.07491
G1 X182.831 Y155.374 E-.07868
G1 X182.716 Y155.297 E-.05271
G1 X182.633 Y155.185 E-.05281
G1 X182.593 Y155.052 E-.05273
G1 X182.598 Y158.913 E-.05278
G1 X182.614 Y158.876 E-.01537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-1.048 J.619 P1  F60000
G1 X184.398 Y161.898 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.047
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
M73 P49 R10
G2 X183.358 Y158.275 I-.673 J-.496 E.04732
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; WIPE_START
G1 X183.41 Y161.898 E-.376
G1 X183.408 Y161.888 E-.004
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.137 J-1.209 P1  F60000
G1 X168.363 Y160.183 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.931 Y155.595 I-.363 J-.186 E.05099
G1 X168 Y155.589 E.00214
G3 X168.386 Y160.128 I0 J.408 E.02376
M204 S250
G1 X168.363 Y155.183 F60000
G1 F12000
M204 S5000
G3 X167.931 Y158.595 I-.363 J-.186 E.05099
G1 X168 Y158.589 E.00214
G3 X168.386 Y155.128 I0 J.408 E.02376
; WIPE_START
M204 S8000
G1 X168.284 Y155.297 E-.07493
G1 X168.169 Y155.374 E-.05284
G1 X168.035 Y155.409 E-.0527
G1 X167.831 Y155.374 E-.07868
G1 X167.716 Y155.297 E-.05272
G1 X167.633 Y155.185 E-.05276
G1 X167.621 Y155.146 E-.01537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I.204 J1.2 P1  F60000
G1 X169.379 Y158.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y158.595 I-.379 J.149 E.06162
G1 X169 Y158.589 E.00214
G3 X169.353 Y158.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X169.41 Y158.982 E-.07507
G1 X169.367 Y155.185 E-.07868
G1 X169.284 Y155.297 E-.05275
G1 X169.169 Y155.374 E-.05284
G1 X169.035 Y155.409 E-.0527
G1 X168.859 Y155.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X169.379 Y155.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y155.595 I-.379 J.149 E.06162
G1 X169 Y155.589 E.00214
G3 X169.353 Y155.793 I0 J.408 E.01312
; WIPE_START
M204 S8000
G1 X169.41 Y155.982 E-.07507
G1 X169.367 Y160.185 E-.07868
G1 X169.284 Y160.297 E-.05275
G1 X169.169 Y160.374 E-.05284
G1 X169.035 Y160.409 E-.0527
G1 X168.859 Y160.379 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.814 J.905 P1  F60000
G1 X169.379 Y160.848 Z.8
G1 Z.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y160.595 I-.379 J.149 E.06162
G1 X169 Y160.589 E.00214
G3 X169.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X168.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X167.931 Y160.595 I-.379 J.149 E.06162
G1 X168 Y160.589 E.00214
G3 X168.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X167.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y160.595 I-.379 J.149 E.06162
G1 X167 Y160.589 E.00214
G3 X167.353 Y160.793 I0 J.408 E.01312
M204 S250
G1 X167.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y155.595 I-.379 J.149 E.06162
G1 X167 Y155.589 E.00214
G3 X167.353 Y155.793 I0 J.408 E.01312
M204 S250
G1 X167.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y158.595 I-.379 J.149 E.06162
G1 X167 Y158.589 E.00214
G3 X167.353 Y158.793 I0 J.408 E.01312
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04732
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.047
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; WIPE_START
G1 X166.495 Y158.374 E-.07743
G1 X166.396 Y158.469 E-.05181
G1 X166.254 Y158.7 E-.10316
G1 X166.214 Y158.83 E-.05186
G1 X166.203 Y155.082 E-.09575
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.155 J.384 P1  F60000
G1 X184.059 Y161.425 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35313
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00286
G1 X183.753 Y161.694 E.0082
M204 S10000
G1 X184.059 Y161.425 F60000
; LINE_WIDTH: 0.298164
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278625
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.24352
G2 X184.09 Y160.774 I-2.428 J-.325 E.00894
; LINE_WIDTH: 0.266404
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294529
G1 X184.062 Y160.585 E.00177
; LINE_WIDTH: 0.311728
G1 X183.986 Y160.193 E.00875
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.251519
G1 F15000
M204 S8000
G1 X183.95 Y160.504 E.00126
; LINE_WIDTH: 0.289986
G1 X184.024 Y160.504 E.0015
; LINE_WIDTH: 0.32846
G1 X184.044 Y160.503 E.00045
G1 X184.059 Y160.421 E.00194
; LINE_WIDTH: 0.297315
G1 X184.075 Y160.339 E.00172
; LINE_WIDTH: 0.278575
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243507
G2 X184.09 Y155.774 I-2.426 J-.325 E.00894
; LINE_WIDTH: 0.266404
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294529
G1 X184.062 Y155.585 E.00177
; LINE_WIDTH: 0.311728
G1 X183.986 Y155.193 E.00875
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.251519
G1 F15000
M204 S8000
G1 X183.95 Y155.504 E.00126
; LINE_WIDTH: 0.289986
G1 X184.024 Y155.504 E.0015
; LINE_WIDTH: 0.32846
G1 X184.044 Y155.503 E.00045
G1 X184.059 Y155.421 E.00193
; LINE_WIDTH: 0.297315
G1 X184.075 Y155.339 E.00172
; LINE_WIDTH: 0.278575
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243507
G2 X184.09 Y158.774 I-2.426 J-.325 E.00894
; LINE_WIDTH: 0.266404
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294529
G1 X184.062 Y158.585 E.00177
; LINE_WIDTH: 0.311728
G1 X184.008 Y158.306 E.00624
; WIPE_START
G1 X184.062 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-1.165 J-.351 P1  F60000
G1 X183.141 Y161.643 Z.8
G1 Z.4
G1 E.4 F1800
; LINE_WIDTH: 0.609548
G1 F13236.202
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.57462
G1 F14105.7
G3 X182.196 Y161.839 I-.348 J-1.724 E.00643
; LINE_WIDTH: 0.54043
G1 F15000
G3 X181.76 Y161.834 I-.194 J-1.905 E.01771
; LINE_WIDTH: 0.581543
G1 F13924.403
G1 X181.657 Y161.816 E.0046
; LINE_WIDTH: 0.609666
G1 F13233.448
G1 X181.609 Y161.805 E.00228
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609548
G1 F13236.202
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.57462
G1 F14105.7
G3 X168.196 Y161.839 I-.348 J-1.724 E.00643
; LINE_WIDTH: 0.54043
G1 F15000
G3 X167.76 Y161.834 I-.194 J-1.905 E.01771
; LINE_WIDTH: 0.581543
G1 F13924.403
G1 X167.657 Y161.816 E.0046
; LINE_WIDTH: 0.609666
G1 F13233.448
G1 X166.859 Y161.643 E.03771
M204 S10000
G1 X166.246 Y161.694 F60000
; LINE_WIDTH: 0.353105
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00818
G1 X165.942 Y161.426 E.00285
; LINE_WIDTH: 0.298255
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278697
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243544
G3 X165.91 Y160.774 I2.429 J-.325 E.00895
; LINE_WIDTH: 0.26643
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294593
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311844
G1 X166.014 Y160.194 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.250138
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00125
; LINE_WIDTH: 0.28805
G1 X165.977 Y160.504 E.00147
; LINE_WIDTH: 0.32827
G1 X165.956 Y160.503 E.00048
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.29741
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278675
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243532
G3 X165.91 Y155.774 I2.428 J-.325 E.00895
; LINE_WIDTH: 0.26643
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294593
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311844
G1 X166.014 Y155.194 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.250138
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00125
; LINE_WIDTH: 0.28805
G1 X165.977 Y155.504 E.00147
; LINE_WIDTH: 0.32827
G1 X165.956 Y155.503 E.00048
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.29741
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278675
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243532
G3 X165.91 Y158.774 I2.428 J-.325 E.00895
; LINE_WIDTH: 0.26643
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294593
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.31184
G1 X165.992 Y158.306 E.00624
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 3/25
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-.161 J1.206 P1  F60000
G1 X175.379 Y155.848 Z.8
G1 Z.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.931 Y155.595 I-.379 J.149 E.06161
G1 X175 Y155.589 E.00214
G3 X175.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X175.41 Y155.982 E-.07506
G1 X175.393 Y160.12 E-.05274
G1 X175.33 Y160.244 E-.05283
G1 X175.169 Y160.374 E-.07864
G1 X175.035 Y160.409 E-.05276
G1 X174.896 Y160.397 E-.05278
G1 X174.862 Y160.378 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.401 J1.149 P1  F60000
G1 X176.379 Y155.848 Z1
M104 T0 S210 N0 ;Multi extruder pre heating
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y155.595 I-.379 J.149 E.06161
G1 X176 Y155.589 E.00214
G3 X176.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.41 Y155.982 E-.07506
G1 X176.393 Y160.12 E-.05274
G1 X176.33 Y160.244 E-.05283
G1 X176.169 Y160.374 E-.07864
G1 X176.035 Y160.409 E-.05276
G1 X175.896 Y160.397 E-.05278
G1 X175.862 Y160.378 E-.0152
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X176.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y160.595 I-.379 J.149 E.06161
G1 X176 Y160.589 E.00214
G3 X176.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 3
M204 S250
G1 X175.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X174.931 Y160.595 I-.379 J.149 E.06161
G1 X175 Y160.589 E.00214
G3 X175.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X175.41 Y160.982 E-.07506
G1 X175.393 Y161.12 E-.05278
G1 X175.33 Y161.244 E-.05278
G1 X175.169 Y161.374 E-.07864
G1 X175.035 Y161.409 E-.05276
G1 X174.896 Y161.397 E-.05278
G1 X174.86 Y161.381 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.785 J-.93 P1  F60000
G1 X172.326 Y155.241 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y158.595 I-.326 J-.244 E.04886
G1 X172 Y158.589 E.00214
G3 X172.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X172.169 Y155.374 E-.10027
G1 X172.035 Y155.409 E-.05276
G1 X171.896 Y155.397 E-.05279
G1 X171.716 Y155.297 E-.07862
G1 X171.633 Y155.185 E-.05282
G1 X171.6 Y155.077 E-.04274
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-1.208 J-.151 P1  F60000
G1 X171.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y160.595 I-.379 J.149 E.06161
G1 X171 Y160.589 E.00214
G3 X171.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 6
M204 S250
G1 X170.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X169.931 Y160.595 I-.379 J.149 E.06161
G1 X170 Y160.589 E.00214
G3 X170.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 7
M204 S250
G1 X170.326 Y160.241 F60000
G1 F12000
M204 S5000
G3 X169.931 Y155.595 I-.326 J-.244 E.04886
G1 X170 Y155.589 E.00214
G3 X170.359 Y160.191 I0 J.408 E.02588
; COOLING_NODE: 8
M204 S250
G1 X170.326 Y155.241 F60000
G1 F12000
M204 S5000
G3 X169.931 Y158.595 I-.326 J-.244 E.04886
G1 X170 Y158.589 E.00214
G3 X170.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X170.169 Y155.374 E-.10027
G1 X170.035 Y155.409 E-.05276
G1 X169.896 Y155.397 E-.0528
G1 X169.716 Y155.297 E-.0786
G1 X169.633 Y155.185 E-.05283
G1 X169.6 Y155.077 E-.04274
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.156 J1.207 P1  F60000
G1 X171.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y158.595 I-.379 J.149 E.06161
G1 X171 Y158.589 E.00214
G3 X171.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.41 Y158.982 E-.07506
G1 X171.393 Y155.12 E-.05274
G1 X171.33 Y155.244 E-.05283
G1 X171.169 Y155.374 E-.07864
G1 X171.035 Y155.409 E-.05276
G1 X170.896 Y155.397 E-.0528
G1 X170.862 Y155.378 E-.01517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X171.379 Y155.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y155.595 I-.379 J.149 E.06161
G1 X171 Y155.589 E.00214
G3 X171.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.41 Y155.982 E-.07506
G1 X171.393 Y160.12 E-.05274
G1 X171.33 Y160.244 E-.05283
G1 X171.169 Y160.374 E-.07864
G1 X171.035 Y160.409 E-.05276
G1 X170.896 Y160.397 E-.0528
G1 X170.862 Y160.378 E-.01517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.113 J1.212 P1  F60000
G1 X172.326 Y160.241 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y155.595 I-.326 J-.244 E.04886
G1 X172 Y155.589 E.00214
G3 X172.359 Y160.191 I0 J.408 E.02588
; COOLING_NODE: 12
M204 S250
G1 X172.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X171.931 Y160.595 I-.379 J.149 E.06161
G1 X172 Y160.589 E.00214
G3 X172.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 13
M204 S250
G1 X173.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X172.931 Y160.595 I-.167 J-.372 E.04252
G1 X173 Y160.589 E.00214
G3 X173.22 Y161.341 I0 J.408 E.03223
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.035 Y161.409 E-.07491
G1 X172.896 Y161.397 E-.0528
G1 X172.77 Y161.34 E-.0527
G1 X172.67 Y161.244 E-.05277
G1 X172.593 Y161.052 E-.07862
G1 X172.598 Y160.913 E-.0528
G1 X172.617 Y160.877 E-.0154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.02 J1.217 P1  F60000
G1 X174.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y160.595 I-.379 J.149 E.06161
G1 X174 Y160.589 E.00214
G3 X174.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 15
M204 S250
G1 X174.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y155.595 I-.379 J.149 E.06161
G1 X174 Y155.589 E.00214
G3 X174.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.41 Y155.982 E-.07506
G1 X174.393 Y160.12 E-.05274
G1 X174.33 Y160.244 E-.05283
G1 X174.169 Y160.374 E-.07864
G1 X174.035 Y160.409 E-.05276
G1 X173.896 Y160.397 E-.05278
G1 X173.862 Y160.378 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.016 J-1.217 P1  F60000
G1 X173.167 Y160.369 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y155.595 I-.167 J-.372 E.04252
G1 X173 Y155.589 E.00214
G3 X173.22 Y160.341 I0 J.408 E.03223
; COOLING_NODE: 17
M204 S250
G1 X173.167 Y155.369 F60000
G1 F12000
M204 S5000
G3 X172.931 Y158.595 I-.167 J-.372 E.04252
G1 X173 Y158.589 E.00214
G3 X173.22 Y155.341 I0 J.408 E.03223
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.035 Y155.409 E-.07491
G1 X172.896 Y155.397 E-.05279
G1 X172.716 Y155.297 E-.07862
G1 X172.633 Y155.185 E-.05282
G1 X172.593 Y155.052 E-.05266
G1 X172.598 Y158.913 E-.0528
G1 X172.614 Y158.876 E-.0154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.019 J1.217 P1  F60000
G1 X174.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y158.595 I-.379 J.149 E.06161
G1 X174 Y158.589 E.00214
G3 X174.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.41 Y158.982 E-.07506
G1 X174.393 Y155.12 E-.05274
G1 X174.33 Y155.244 E-.05283
G1 X174.169 Y155.374 E-.07864
G1 X174.035 Y155.409 E-.05276
G1 X173.896 Y155.397 E-.05278
G1 X173.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.401 J1.149 P1  F60000
G1 X175.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.931 Y158.595 I-.379 J.149 E.06161
G1 X175 Y158.589 E.00214
G3 X175.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.41 Y158.982 E-.07507
G1 X175.393 Y155.12 E-.05274
G1 X175.33 Y155.244 E-.05283
G1 X175.169 Y155.374 E-.07864
G1 X175.035 Y155.409 E-.05276
G1 X174.896 Y155.397 E-.05278
G1 X174.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.401 J1.149 P1  F60000
G1 X176.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y158.595 I-.379 J.149 E.06161
G1 X176 Y158.589 E.00214
G3 X176.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.41 Y158.982 E-.07507
G1 X176.393 Y155.12 E-.05274
G1 X176.33 Y155.244 E-.05283
G1 X176.169 Y155.374 E-.07864
G1 X176.035 Y155.409 E-.05276
G1 X175.896 Y155.397 E-.05278
G1 X175.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.401 J1.149 P1  F60000
G1 X177.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y158.595 I-.379 J.149 E.06161
G1 X177 Y158.589 E.00214
G3 X177.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.41 Y158.982 E-.07507
G1 X177.393 Y155.12 E-.05274
G1 X177.33 Y155.244 E-.05283
G1 X177.169 Y155.374 E-.07864
G1 X177.035 Y155.409 E-.05276
G1 X176.896 Y155.397 E-.05278
G1 X176.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.401 J1.149 P1  F60000
G1 X178.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y158.595 I-.379 J.149 E.06161
G1 X178 Y158.589 E.00214
G3 X178.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.41 Y158.982 E-.07507
G1 X178.393 Y155.12 E-.05274
G1 X178.33 Y155.244 E-.05283
G1 X178.169 Y155.374 E-.07864
G1 X178.035 Y155.409 E-.05276
G1 X177.896 Y155.397 E-.05278
G1 X177.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.113 J1.212 P1  F60000
G1 X179.326 Y155.241 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y158.595 I-.326 J-.244 E.04886
G1 X179 Y158.589 E.00214
G3 X179.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 24
M204 S250
G1 X180.326 Y155.241 F60000
G1 F12000
M204 S5000
G3 X179.931 Y158.595 I-.326 J-.244 E.04886
G1 X180 Y158.589 E.00214
G3 X180.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.169 Y155.374 E-.10027
G1 X180.035 Y155.409 E-.05276
G1 X179.896 Y155.397 E-.05278
G1 X179.716 Y155.297 E-.07861
G1 X179.633 Y155.185 E-.05283
G1 X179.6 Y155.077 E-.04275
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-1.033 J.644 P1  F60000
G1 X180.326 Y160.241 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y155.595 I-.326 J-.244 E.04886
G1 X180 Y155.589 E.00214
G3 X180.359 Y160.191 I0 J.408 E.02588
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.169 Y160.374 E-.10027
G1 X180.035 Y160.409 E-.05276
G1 X179.896 Y160.397 E-.05278
G1 X179.716 Y160.297 E-.07861
G1 X179.633 Y160.185 E-.05283
G1 X179.6 Y160.077 E-.04274
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.626 J-1.044 P1  F60000
G1 X179.326 Y160.241 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y155.595 I-.326 J-.244 E.04886
G1 X179 Y155.589 E.00214
G3 X179.359 Y160.191 I0 J.408 E.02588
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.169 Y160.374 E-.10027
G1 X179.035 Y160.409 E-.05276
G1 X178.896 Y160.397 E-.05279
G1 X178.716 Y160.297 E-.07862
G1 X178.633 Y160.185 E-.05282
G1 X178.6 Y160.077 E-.04274
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.877 J-.844 P1  F60000
G1 X178.379 Y155.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y155.595 I-.379 J.149 E.06161
G1 X178 Y155.589 E.00214
G3 X178.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 28
M204 S250
G1 X177.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y155.595 I-.379 J.149 E.06161
G1 X177 Y155.589 E.00214
G3 X177.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.41 Y155.982 E-.07506
G1 X177.393 Y160.12 E-.05274
G1 X177.33 Y160.244 E-.05283
G1 X177.169 Y160.374 E-.07864
G1 X177.035 Y160.409 E-.05276
G1 X176.896 Y160.397 E-.05278
G1 X176.862 Y160.378 E-.0152
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X177.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y160.595 I-.379 J.149 E.06161
G1 X177 Y160.589 E.00214
G3 X177.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.41 Y160.982 E-.07506
G1 X177.393 Y161.12 E-.05278
G1 X177.33 Y161.244 E-.05278
G1 X177.169 Y161.374 E-.07864
G1 X177.035 Y161.409 E-.05276
G1 X176.896 Y161.397 E-.05278
G1 X176.86 Y161.381 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.403 J1.148 P1  F60000
G1 X178.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y160.595 I-.379 J.149 E.06161
G1 X178 Y160.589 E.00214
G3 X178.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.41 Y160.982 E-.07506
G1 X178.393 Y161.12 E-.05278
G1 X178.33 Y161.244 E-.05278
G1 X178.169 Y161.374 E-.07864
G1 X178.035 Y161.409 E-.05276
G1 X177.896 Y161.397 E-.05278
G1 X177.86 Y161.381 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.403 J1.148 P1  F60000
G1 X179.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y160.595 I-.379 J.149 E.06161
G1 X179 Y160.589 E.00214
G3 X179.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.41 Y160.982 E-.07507
G1 X179.393 Y161.12 E-.05278
G1 X179.33 Y161.244 E-.05278
G1 X179.169 Y161.374 E-.07864
G1 X179.035 Y161.409 E-.05276
G1 X178.896 Y161.397 E-.0528
G1 X178.86 Y161.381 E-.01517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.403 J1.148 P1  F60000
G1 X180.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y160.595 I-.379 J.149 E.06161
G1 X180 Y160.589 E.00214
G3 X180.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.41 Y160.982 E-.07506
G1 X180.393 Y161.12 E-.05278
G1 X180.33 Y161.244 E-.05278
G1 X180.169 Y161.374 E-.07864
G1 X180.035 Y161.409 E-.05276
G1 X179.896 Y161.397 E-.05279
G1 X179.86 Y161.381 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.403 J1.148 P1  F60000
G1 X181.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y160.595 I-.379 J.149 E.06161
G1 X181 Y160.589 E.00214
G3 X181.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.41 Y160.982 E-.07506
G1 X181.393 Y161.12 E-.05278
G1 X181.33 Y161.244 E-.05278
G1 X181.169 Y161.374 E-.07864
G1 X181.035 Y161.409 E-.05276
G1 X180.896 Y161.397 E-.0528
G1 X180.86 Y161.381 E-.01517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.403 J1.148 P1  F60000
G1 X182.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y160.595 I-.379 J.149 E.06161
G1 X182 Y160.589 E.00214
G3 X182.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 35
M204 S250
G1 X183.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y160.595 I-.167 J-.372 E.04252
G1 X183 Y160.589 E.00214
G3 X183.22 Y161.341 I0 J.408 E.03223
; COOLING_NODE: 36
M204 S250
G1 X183.167 Y160.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y155.595 I-.167 J-.372 E.04252
G1 X183 Y155.589 E.00214
G3 X183.22 Y160.341 I0 J.408 E.03223
; COOLING_NODE: 37
M204 S250
G1 X182.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X181.931 Y155.595 I-.389 J-.122 E.05311
G1 X182 Y155.589 E.00214
G3 X182.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 38
M204 S250
G1 X182.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X181.931 Y158.595 I-.389 J-.122 E.05311
G1 X182 Y158.589 E.00214
G3 X182.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.33 Y155.244 E-.07512
G1 X182.169 Y155.374 E-.07864
G1 X182.035 Y155.409 E-.05276
G1 X181.896 Y155.397 E-.05279
G1 X181.716 Y155.297 E-.07862
G1 X181.65 Y155.208 E-.04206
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.973 J-.731 P1  F60000
G1 X181.379 Y158.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y158.595 I-.379 J.149 E.06161
G1 X181 Y158.589 E.00214
G3 X181.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.41 Y158.982 E-.07507
G1 X181.393 Y155.12 E-.05274
G1 X181.33 Y155.244 E-.05283
G1 X181.169 Y155.374 E-.07864
G1 X181.035 Y155.409 E-.05276
G1 X180.896 Y155.397 E-.05279
G1 X180.862 Y155.378 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X181.379 Y155.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y155.595 I-.379 J.149 E.06161
G1 X181 Y155.589 E.00214
G3 X181.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X181.41 Y155.982 E-.07506
G1 X181.393 Y160.12 E-.05274
G1 X181.33 Y160.244 E-.05283
G1 X181.169 Y160.374 E-.07864
G1 X181.035 Y160.409 E-.05276
G1 X180.896 Y160.397 E-.05279
G1 X180.862 Y160.378 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I.488 J1.115 P1  F60000
G1 X183.167 Y155.369 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.931 Y158.595 I-.167 J-.372 E.04252
G1 X183 Y158.589 E.00214
G3 X183.22 Y155.341 I0 J.408 E.03223
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.035 Y155.409 E-.07491
G1 X182.896 Y155.397 E-.05279
G1 X182.716 Y155.297 E-.07863
G1 X182.633 Y155.185 E-.05282
G1 X182.593 Y155.052 E-.05266
G1 X182.598 Y158.913 E-.0528
G1 X182.614 Y158.876 E-.0154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-1.048 J.619 P1  F60000
G1 X184.398 Y161.898 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.04699
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.673 J-.496 E.04732
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 42
; WIPE_START
G1 X183.41 Y161.898 E-.37598
G1 X183.408 Y161.888 E-.00402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
M73 P50 R10
G3 Z1 I.142 J-1.209 P1  F60000
G1 X168.389 Y160.119 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.931 Y155.595 I-.389 J-.122 E.05311
G1 X168 Y155.589 E.00214
G3 X168.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 43
M204 S250
G1 X168.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X167.931 Y158.595 I-.389 J-.122 E.05311
G1 X168 Y158.589 E.00214
G3 X168.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 44
M204 S250
G1 X169.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X168.931 Y158.595 I-.379 J.149 E.06161
G1 X169 Y158.589 E.00214
G3 X169.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.41 Y158.982 E-.07506
G1 X169.393 Y155.12 E-.05274
G1 X169.33 Y155.244 E-.05283
G1 X169.169 Y155.374 E-.07864
G1 X169.035 Y155.409 E-.05276
G1 X168.896 Y155.397 E-.05278
G1 X168.862 Y155.378 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X169.379 Y155.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y155.595 I-.379 J.149 E.06161
G1 X169 Y155.589 E.00214
G3 X169.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.41 Y155.982 E-.07506
G1 X169.393 Y160.12 E-.05274
G1 X169.33 Y160.244 E-.05283
G1 X169.169 Y160.374 E-.07864
G1 X169.035 Y160.409 E-.05276
G1 X168.896 Y160.397 E-.05278
G1 X168.862 Y160.378 E-.01519
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.818 J.901 P1  F60000
G1 X169.379 Y160.848 Z1
G1 Z.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y160.595 I-.379 J.149 E.06161
G1 X169 Y160.589 E.00214
G3 X169.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 47
M204 S250
G1 X168.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X167.931 Y160.595 I-.379 J.149 E.06161
G1 X168 Y160.589 E.00214
G3 X168.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 48
M204 S250
G1 X167.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y160.595 I-.379 J.149 E.06161
G1 X167 Y160.589 E.00214
G3 X167.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 49
M204 S250
G1 X167.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y155.595 I-.379 J.149 E.06161
G1 X167 Y155.589 E.00214
G3 X167.353 Y155.793 I0 J.408 E.01313
; COOLING_NODE: 50
M204 S250
G1 X167.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y158.595 I-.379 J.149 E.06161
G1 X167 Y158.589 E.00214
G3 X167.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07745
G1 X166.396 Y158.469 E-.05178
G1 X166.315 Y158.578 E-.05181
G1 X166.214 Y158.831 E-.10325
G1 X166.196 Y158.966 E-.05184
G1 X166.211 Y155.08 E-.04387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.155 J.384 P1  F60000
G1 X184.059 Y161.425 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.353257
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00286
G1 X183.751 Y161.694 E.00825
M204 S10000
G1 X184.059 Y161.425 F60000
; LINE_WIDTH: 0.298118
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278608
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243523
G2 X184.09 Y160.774 I-2.427 J-.325 E.00893
; LINE_WIDTH: 0.26636
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294498
G1 X184.062 Y160.585 E.00177
; LINE_WIDTH: 0.311729
G1 X183.986 Y160.194 E.00874
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.252695
G1 F15000
M204 S8000
G1 X183.95 Y160.504 E.00128
; LINE_WIDTH: 0.291185
G1 X184.025 Y160.504 E.00151
; LINE_WIDTH: 0.328591
G1 X184.044 Y160.503 E.00044
G1 X184.059 Y160.421 E.00194
; LINE_WIDTH: 0.297305
G1 X184.075 Y160.339 E.00172
; LINE_WIDTH: 0.278554
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243494
G2 X184.09 Y155.774 I-2.426 J-.325 E.00893
; LINE_WIDTH: 0.266361
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294498
G1 X184.062 Y155.585 E.00177
; LINE_WIDTH: 0.311729
G1 X183.986 Y155.194 E.00874
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.252695
G1 F15000
M204 S8000
G1 X183.95 Y155.504 E.00128
; LINE_WIDTH: 0.291185
G1 X184.025 Y155.504 E.00151
; LINE_WIDTH: 0.328591
G1 X184.044 Y155.503 E.00044
G1 X184.059 Y155.421 E.00194
; LINE_WIDTH: 0.297305
G1 X184.075 Y155.339 E.00172
; LINE_WIDTH: 0.278554
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243494
G2 X184.09 Y158.774 I-2.426 J-.325 E.00893
; LINE_WIDTH: 0.266361
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294498
G1 X184.062 Y158.585 E.00177
; LINE_WIDTH: 0.311729
G1 X184.008 Y158.306 E.00624
; WIPE_START
G1 X184.062 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-1.165 J-.351 P1  F60000
G1 X183.141 Y161.643 Z1
G1 Z.6
G1 E.4 F1800
; LINE_WIDTH: 0.609608
G1 F13234.815
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574674
G1 F14104.288
G3 X182.196 Y161.839 I-.349 J-1.725 E.00644
; LINE_WIDTH: 0.540451
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.906 E.01773
; LINE_WIDTH: 0.581657
G1 F13921.459
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609723
G1 F13232.122
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609608
G1 F13234.815
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574674
G1 F14104.288
G3 X168.196 Y161.839 I-.349 J-1.725 E.00644
; LINE_WIDTH: 0.540451
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.906 E.01773
; LINE_WIDTH: 0.581657
G1 F13921.459
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609723
G1 F13232.122
G1 X166.859 Y161.643 E.03771
M204 S10000
G1 X166.246 Y161.694 F60000
; LINE_WIDTH: 0.353262
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00817
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298196
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278691
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243533
G3 X165.91 Y160.774 I2.427 J-.325 E.00895
; LINE_WIDTH: 0.26641
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294536
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311727
G1 X166.014 Y160.193 E.00875
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.252549
G1 F15000
M204 S8000
G1 X166.05 Y160.504 E.00128
; LINE_WIDTH: 0.291012
G1 X165.975 Y160.504 E.00151
; LINE_WIDTH: 0.32859
G1 X165.956 Y160.503 E.00044
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297368
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278652
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243522
G3 X165.91 Y155.774 I2.426 J-.325 E.00894
; LINE_WIDTH: 0.26641
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294536
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311727
G1 X166.014 Y155.193 E.00875
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.252549
G1 F15000
M204 S8000
G1 X166.05 Y155.504 E.00128
; LINE_WIDTH: 0.291012
G1 X165.975 Y155.504 E.00151
; LINE_WIDTH: 0.32859
G1 X165.956 Y155.503 E.00044
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297368
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278652
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.24352
G3 X165.91 Y158.774 I2.425 J-.325 E.00894
; LINE_WIDTH: 0.266412
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294518
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.311717
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z1 I-1.197 J.217 P1  F60000
G1 X185.963 Y268.881 Z1
G1 Z.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y269.881  
M204 S8000
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X188.398 Y255.349   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y257.357   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y259.273   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E18

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P50 R9
G1 Y320 F30000
G1 X191.897

M73 P51 R9
G1 Y295
G1 Y265 F18000
G1 Z3.6 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y256.381 F60000
G1 Z.6

; filament start gcode
G17
G3 Z1 I0 J-1.217 P1
G1 X185.963 Y256.381 Z1
G1 Z.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y256.881 
G1  X185.463 
G1  Y255.881 
G1  X186.963 
G1  Y257.381 
G1  X184.963 
G1  Y255.381 
G1  X182.963 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y266.131  E0.0285
G1  X185.963  E0.7031
G1  Y266.881  E0.0285
G1  X167.463  E0.7031
G1  Y267.631  E0.0285
G1  X185.963  E0.7031
G1  Y268.381  E0.0285
G1  X167.463  E0.7031
G1  Y269.131  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X184.963 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3580
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 3 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z1 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z1 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer3 end: 112,152
M625
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z0.6
Z0.36
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X150 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X155 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X160 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X165 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X170 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X175 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X180 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X185 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X190 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X195 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X200 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X205 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X210 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X215 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X220 Y155 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z0.6
Z0.36
G1 E0.40 F150
G4 P400
G0 Z0.6 
G1 E-0.08 F800
G0 X145 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X150 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X155 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X160 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X165 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X170 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X175 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X180 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X185 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X190 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X195 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X200 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X205 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X210 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X215 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X220 Y160 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z0.6
Z0.36
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X150 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X155 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X160 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X165 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X170 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X175 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X180 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X185 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X190 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X195 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X200 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X205 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X210 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X215 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
G0 X220 Y165 Z0.6
Z0.36
G1 E0.40
G4 P400
G0 Z0.6
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 4/25
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3529
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 4 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z1.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z1.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer4 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
M73 P52 R9
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S164 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E17

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z3.8 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y265.141 F60000
G1 Z.8
G17
G3 Z1.2 I-1.217 J0 P1
G1 X190.897 Y274.469 Z1.2
G1 X162.53 Y274.469
G1 X162.53 Y269.131

; filament start gcode
G1 X167.463 Y269.131
G1 Z.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y269.631 
G1  X166.963 
G1  Y268.631 
G1  X168.463 
G1  Y270.131 
G1  X166.463 
G1  Y268.131 
G1  X170.463 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y266.131  E0.0285
M73 P53 R9
G1  X185.963  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y259.381  E0.0285
G1  X167.463  E0.7031
G1  Y258.631  E0.0285
G1  X185.963  E0.7031
G1  Y257.881  E0.0285
G1  X167.463  E0.7031
G1  Y257.131  E0.0285
G1  X185.963  E0.7031
G1  Y256.381  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X165.438 Y268.205  
M204 S8000
G3  X166.125 Y265.161   I1.763 J-1.201 E0.1330
G2  X166.963 Y262.738   I-3.144 J-2.444 E0.0992
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X167.122 Y270.055   E0.0670
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X167.795 Y270.794 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.381 Y155.847
G1 Z.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.939 Y155.593 I-.381 J.152 E.06235
G1 X175.061 Y155.593 E.00372
G3 X175.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 15
M204 S250
G1 X174.381 Y155.847 F60000
G1 F12000
M204 S5000
G3 X173.939 Y155.593 I-.381 J.152 E.06235
G1 X174.061 Y155.593 E.00372
G3 X174.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.407 Y160.052 E-.10054
G1 X174.332 Y160.242 E-.07778
G1 X174.23 Y160.34 E-.05372
G1 X174.104 Y160.397 E-.05273
G1 X173.965 Y160.409 E-.05278
G1 X173.857 Y160.381 E-.04245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.081 J-1.214 P1  F60000
G1 X173.229 Y160.339 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.939 Y155.593 I-.229 J-.34 E.04523
G1 X173.061 Y155.593 E.00372
G3 X173.277 Y160.302 I-.061 J.406 E.02843
; COOLING_NODE: 17
M204 S250
G1 X173.229 Y155.339 F60000
G1 F12000
M204 S5000
G3 X172.939 Y158.593 I-.229 J-.34 E.04523
G1 X173.061 Y158.593 E.00372
G3 X173.277 Y155.302 I-.061 J.406 E.02843
; COOLING_NODE: 4
M204 S250
G1 X172.331 Y155.242 F60000
G1 F12000
M204 S5000
G3 X171.939 Y158.593 I-.331 J-.243 E.04958
G1 X172.061 Y158.593 E.00372
G3 X172.363 Y155.191 I-.061 J.406 E.02409
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X172.23 Y155.34 E-.07594
G1 X172.104 Y155.397 E-.05273
G1 X171.965 Y155.409 E-.05281
G1 X171.77 Y155.34 E-.07863
G1 X171.67 Y155.244 E-.05273
G1 X171.607 Y155.12 E-.05276
G1 X171.602 Y155.083 E-.0144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-1.03 J.648 P1  F60000
G1 X172.331 Y160.242 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.939 Y155.593 I-.331 J-.243 E.04958
G1 X172.061 Y155.593 E.00372
G3 X172.363 Y160.191 I-.061 J.406 E.02409
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X172.23 Y160.34 E-.07594
G1 X172.104 Y160.397 E-.05273
G1 X171.965 Y160.409 E-.05281
G1 X171.77 Y160.34 E-.07863
G1 X171.67 Y160.244 E-.05273
G1 X171.607 Y160.12 E-.05276
G1 X171.602 Y160.083 E-.01439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.888 J-.832 P1  F60000
G1 X171.381 Y155.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.939 Y155.593 I-.381 J.152 E.06235
G1 X171.061 Y155.593 E.00372
G3 X171.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 9
M204 S250
G1 X171.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X170.939 Y158.593 I-.381 J.152 E.06235
G1 X171.061 Y158.593 E.00372
G3 X171.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X171.407 Y155.052 E-.10053
G1 X171.332 Y155.242 E-.07778
G1 X171.23 Y155.34 E-.05372
G1 X171.104 Y155.397 E-.05273
G1 X170.965 Y155.409 E-.05281
G1 X170.857 Y155.381 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.366 J-1.161 P1  F60000
G1 X169.381 Y155.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y155.593 I-.381 J.152 E.06235
G1 X169.061 Y155.593 E.00372
G3 X169.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.41 Y155.98 E-.07416
G1 X169.407 Y160.052 E-.02745
G1 X169.332 Y160.242 E-.07778
G1 X169.23 Y160.34 E-.05372
G1 X169.104 Y160.397 E-.05273
G1 X168.965 Y160.409 E-.05275
G1 X168.86 Y160.382 E-.04141
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.115 J1.211 P1  F60000
G1 X170.331 Y160.242 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.939 Y155.593 I-.331 J-.243 E.04958
G1 X170.061 Y155.593 E.00372
G3 X170.363 Y160.191 I-.061 J.406 E.02408
; COOLING_NODE: 8
M204 S250
G1 X170.331 Y155.242 F60000
G1 F12000
M204 S5000
G3 X169.939 Y158.593 I-.331 J-.243 E.04958
G1 X170.061 Y158.593 E.00372
G3 X170.363 Y155.191 I-.061 J.406 E.02409
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.23 Y155.34 E-.07594
G1 X170.104 Y155.397 E-.05273
G1 X169.965 Y155.409 E-.05281
G1 X169.831 Y155.374 E-.05271
G1 X169.67 Y155.244 E-.07865
G1 X169.607 Y155.12 E-.05276
G1 X169.602 Y155.083 E-.01439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.888 J-.832 P1  F60000
G1 X169.381 Y158.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y158.593 I-.381 J.152 E.06235
G1 X169.061 Y158.593 E.00372
G3 X169.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 43
M204 S250
G1 X168.407 Y155.052 F60000
G1 F12000
M204 S5000
G3 X167.939 Y158.593 I-.407 J-.053 E.05592
G1 X168.061 Y158.593 E.00372
G3 X168.41 Y158.992 I-.061 J.406 E.01774
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.332 Y155.242 E-.09957
G1 X168.23 Y155.34 E-.05372
G1 X168.104 Y155.397 E-.05273
G1 X167.965 Y155.409 E-.05281
G1 X167.77 Y155.34 E-.07863
G1 X167.689 Y155.263 E-.04254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.9 J.819 P1  F60000
G1 X168.407 Y160.052 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.939 Y155.593 I-.407 J-.053 E.05592
G1 X168.061 Y155.593 E.00372
G3 X168.41 Y155.992 I-.061 J.406 E.01774
; COOLING_NODE: 47
M204 S250
G1 X168.381 Y160.847 F60000
G1 F12000
M204 S5000
G3 X167.939 Y160.593 I-.381 J.152 E.06235
G1 X168.061 Y160.593 E.00372
G3 X168.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X168.407 Y161.052 E-.10052
G1 X168.367 Y161.185 E-.05283
G1 X168.23 Y161.34 E-.07864
G1 X168.104 Y161.397 E-.05273
G1 X167.965 Y161.409 E-.05281
G1 X167.86 Y161.372 E-.04247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.397 J1.15 P1  F60000
G1 X169.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y160.593 I-.381 J.152 E.06235
G1 X169.061 Y160.593 E.00372
G3 X169.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X169.41 Y160.98 E-.07416
G1 X169.407 Y161.052 E-.02743
G1 X169.367 Y161.185 E-.05283
G1 X169.284 Y161.296 E-.05268
G1 X169.169 Y161.374 E-.05285
G1 X168.965 Y161.409 E-.07859
G1 X168.86 Y161.382 E-.04146
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.404 J1.148 P1  F60000
G1 X170.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.939 Y160.593 I-.381 J.152 E.06235
G1 X170.061 Y160.593 E.00372
G3 X170.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X170.407 Y161.052 E-.10053
G1 X170.367 Y161.185 E-.05283
G1 X170.23 Y161.34 E-.07864
G1 X170.104 Y161.397 E-.05273
G1 X169.965 Y161.409 E-.05281
G1 X169.857 Y161.381 E-.04246
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.402 J1.148 P1  F60000
G1 X171.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.939 Y160.593 I-.381 J.152 E.06235
G1 X171.061 Y160.593 E.00372
G3 X171.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X171.407 Y161.052 E-.10052
G1 X171.367 Y161.185 E-.05283
G1 X171.23 Y161.34 E-.07864
G1 X171.104 Y161.397 E-.05273
G1 X170.965 Y161.409 E-.05281
G1 X170.857 Y161.381 E-.04247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.403 J1.148 P1  F60000
G1 X172.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.939 Y160.593 I-.381 J.152 E.06235
G1 X172.061 Y160.593 E.00372
G3 X172.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X172.407 Y161.052 E-.10052
G1 X172.367 Y161.185 E-.05283
G1 X172.23 Y161.34 E-.07864
G1 X172.104 Y161.397 E-.05273
G1 X171.965 Y161.409 E-.05281
G1 X171.86 Y161.372 E-.04247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.029 J1.217 P1  F60000
G1 X173.229 Y161.339 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.939 Y160.593 I-.229 J-.34 E.04523
G1 X173.061 Y160.593 E.00372
G3 X173.276 Y161.302 I-.061 J.406 E.02844
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.07496
G1 X172.965 Y161.409 E-.05281
G1 X172.77 Y161.34 E-.07863
G1 X172.67 Y161.244 E-.05273
G1 X172.607 Y161.12 E-.05276
G1 X172.59 Y160.983 E-.05279
G1 X172.598 Y160.943 E-.01531
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.066 J1.215 P1  F60000
G1 X174.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.939 Y160.593 I-.381 J.152 E.06235
G1 X174.061 Y160.593 E.00372
G3 X174.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.407 Y161.052 E-.10052
G1 X174.367 Y161.185 E-.05283
G1 X174.23 Y161.34 E-.07864
G1 X174.104 Y161.397 E-.05273
G1 X173.965 Y161.409 E-.05278
G1 X173.857 Y161.381 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.402 J1.148 P1  F60000
G1 X175.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.939 Y160.593 I-.381 J.152 E.06235
G1 X175.061 Y160.593 E.00372
G3 X175.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X175.407 Y161.052 E-.10052
G1 X175.367 Y161.185 E-.05283
G1 X175.23 Y161.34 E-.07864
G1 X175.104 Y161.397 E-.05273
G1 X174.965 Y161.409 E-.05278
G1 X174.857 Y161.381 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.402 J1.148 P1  F60000
G1 X176.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.939 Y160.593 I-.381 J.152 E.06235
G1 X176.061 Y160.593 E.00372
G3 X176.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X176.407 Y161.052 E-.10052
G1 X176.367 Y161.185 E-.05283
G1 X176.23 Y161.34 E-.07864
G1 X176.104 Y161.397 E-.05273
G1 X175.965 Y161.409 E-.05278
G1 X175.857 Y161.381 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.402 J1.148 P1  F60000
G1 X177.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.939 Y160.593 I-.381 J.152 E.06235
G1 X177.061 Y160.593 E.00372
G3 X177.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 28
M204 S250
G1 X177.381 Y155.847 F60000
G1 F12000
M204 S5000
G3 X176.939 Y155.593 I-.381 J.152 E.06235
G1 X177.061 Y155.593 E.00372
G3 X177.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 21
M204 S250
G1 X177.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X176.939 Y158.593 I-.381 J.152 E.06235
G1 X177.061 Y158.593 E.00372
G3 X177.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.41 Y158.983 E-.07513
G1 X177.37 Y155.177 E-.07547
G1 X177.284 Y155.296 E-.05585
G1 X177.169 Y155.374 E-.05285
G1 X177.035 Y155.409 E-.05268
G1 X176.897 Y155.398 E-.05276
G1 X176.86 Y155.381 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.403 J1.148 P1  F60000
G1 X178.381 Y158.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.939 Y158.593 I-.381 J.152 E.06235
G1 X178.061 Y158.593 E.00372
G3 X178.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.407 Y155.052 E-.10053
G1 X178.332 Y155.242 E-.07778
G1 X178.23 Y155.34 E-.05372
G1 X178.104 Y155.397 E-.05273
G1 X177.965 Y155.409 E-.05278
G1 X177.857 Y155.381 E-.04246
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.808 J.91 P1  F60000
G1 X178.381 Y155.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.939 Y155.593 I-.381 J.152 E.06235
G1 X178.061 Y155.593 E.00372
G3 X178.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X178.407 Y160.052 E-.10054
G1 X178.332 Y160.242 E-.07778
G1 X178.23 Y160.34 E-.05372
G1 X178.104 Y160.397 E-.05273
G1 X177.965 Y160.409 E-.05278
G1 X177.86 Y160.372 E-.04245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.107 J1.212 P1  F60000
G1 X179.331 Y160.242 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.939 Y155.593 I-.331 J-.243 E.04958
G1 X179.061 Y155.593 E.00372
G3 X179.363 Y160.191 I-.061 J.406 E.02409
; COOLING_NODE: 23
M204 S250
G1 X179.331 Y155.242 F60000
G1 F12000
M204 S5000
G3 X178.939 Y158.593 I-.331 J-.243 E.04958
G1 X179.061 Y158.593 E.00372
G3 X179.363 Y155.191 I-.061 J.406 E.02409
; COOLING_NODE: 24
M204 S250
G1 X180.331 Y155.242 F60000
G1 F12000
M204 S5000
G3 X179.939 Y158.593 I-.331 J-.243 E.04958
G1 X180.061 Y158.593 E.00372
G3 X180.363 Y155.191 I-.061 J.406 E.02409
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.23 Y155.34 E-.07593
G1 X180.104 Y155.397 E-.05273
G1 X179.965 Y155.409 E-.05275
G1 X179.831 Y155.374 E-.05278
G1 X179.67 Y155.244 E-.07864
G1 X179.607 Y155.12 E-.05276
G1 X179.602 Y155.083 E-.0144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-1.03 J.648 P1  F60000
G1 X180.331 Y160.242 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.939 Y155.593 I-.331 J-.243 E.04958
G1 X180.061 Y155.593 E.00372
G3 X180.363 Y160.191 I-.061 J.406 E.02409
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.23 Y160.34 E-.07594
G1 X180.104 Y160.397 E-.05273
G1 X179.965 Y160.409 E-.05275
G1 X179.831 Y160.374 E-.05278
G1 X179.67 Y160.244 E-.07864
G1 X179.607 Y160.12 E-.05276
G1 X179.602 Y160.083 E-.0144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.16 J1.206 P1  F60000
G1 X181.381 Y155.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.939 Y155.593 I-.381 J.152 E.06235
G1 X181.061 Y155.593 E.00372
G3 X181.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 39
M204 S250
G1 X181.381 Y158.847 F60000
M73 P54 R9
G1 F12000
M204 S5000
G3 X180.939 Y158.593 I-.381 J.152 E.06235
G1 X181.061 Y158.593 E.00372
G3 X181.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X181.407 Y155.052 E-.10054
G1 X181.332 Y155.242 E-.07778
G1 X181.23 Y155.34 E-.05372
G1 X181.104 Y155.397 E-.05273
G1 X180.965 Y155.409 E-.05281
G1 X180.86 Y155.372 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.247 J1.192 P1  F60000
G1 X182.407 Y155.052 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.939 Y158.593 I-.407 J-.053 E.05592
G1 X182.061 Y158.593 E.00372
G3 X182.41 Y158.992 I-.061 J.406 E.01774
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.332 Y155.242 E-.09957
G1 X182.23 Y155.34 E-.05372
G1 X182.104 Y155.397 E-.05273
G1 X181.965 Y155.409 E-.05281
G1 X181.77 Y155.34 E-.07863
G1 X181.689 Y155.263 E-.04254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.9 J.819 P1  F60000
G1 X182.407 Y160.052 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.939 Y155.593 I-.407 J-.053 E.05592
G1 X182.061 Y155.593 E.00372
G3 X182.41 Y155.992 I-.061 J.406 E.01774
; COOLING_NODE: 36
M204 S250
G1 X183.229 Y160.339 F60000
G1 F12000
M204 S5000
G3 X182.939 Y155.593 I-.229 J-.34 E.04523
G1 X183.061 Y155.593 E.00372
G3 X183.277 Y160.302 I-.061 J.406 E.02843
; COOLING_NODE: 41
M204 S250
G1 X183.229 Y155.339 F60000
G1 F12000
M204 S5000
G3 X182.939 Y158.593 I-.229 J-.34 E.04523
G1 X183.061 Y158.593 E.00372
G3 X183.277 Y155.302 I-.061 J.406 E.02843
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.104 Y155.397 E-.07508
G1 X182.965 Y155.409 E-.05281
G1 X182.831 Y155.374 E-.05269
G1 X182.716 Y155.296 E-.05282
G1 X182.633 Y155.185 E-.05272
G1 X182.59 Y158.983 E-.07867
G1 X182.598 Y158.943 E-.0152
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-1.039 J.633 P1  F60000
G1 X184.398 Y161.898 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.632 Y160.507 I-.364 J-.715 E.04691
G2 X183.632 Y155.507 I-.695 J-.5 E.03543
G2 X183.358 Y158.275 I-.677 J-.496 E.04737
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 35
; WIPE_START
G1 X183.41 Y161.898 E-.37598
G1 X183.408 Y161.888 E-.00402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.157 J-.376 P1  F60000
G1 X183.229 Y161.339 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X182.939 Y160.593 I-.229 J-.34 E.04523
G1 X183.061 Y160.593 E.00372
G3 X183.276 Y161.302 I-.061 J.406 E.02844
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.104 Y161.397 E-.07496
G1 X182.965 Y161.409 E-.05281
G1 X182.831 Y161.374 E-.05269
G1 X182.716 Y161.296 E-.05282
G1 X182.607 Y161.12 E-.07858
G1 X182.59 Y160.983 E-.05281
G1 X182.598 Y160.943 E-.01532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.494 J-1.112 P1  F60000
G1 X182.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.939 Y160.593 I-.381 J.152 E.06235
G1 X182.061 Y160.593 E.00372
G3 X182.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 33
M204 S250
G1 X181.381 Y160.847 F60000
G1 F12000
M204 S5000
G3 X180.939 Y160.593 I-.381 J.152 E.06235
G1 X181.061 Y160.593 E.00372
G3 X181.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 32
M204 S250
G1 X180.381 Y160.847 F60000
G1 F12000
M204 S5000
G3 X179.939 Y160.593 I-.381 J.152 E.06235
G1 X180.061 Y160.593 E.00372
G3 X180.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 31
M204 S250
G1 X179.381 Y160.847 F60000
G1 F12000
M204 S5000
G3 X178.939 Y160.593 I-.381 J.152 E.06235
G1 X179.061 Y160.593 E.00372
G3 X179.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 30
M204 S250
G1 X178.381 Y160.847 F60000
G1 F12000
M204 S5000
G3 X177.939 Y160.593 I-.381 J.152 E.06235
G1 X178.061 Y160.593 E.00372
G3 X178.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X178.407 Y161.052 E-.10052
G1 X178.367 Y161.185 E-.05283
G1 X178.23 Y161.34 E-.07864
G1 X178.104 Y161.397 E-.05273
G1 X177.965 Y161.409 E-.05278
G1 X177.86 Y161.372 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I.874 J-.847 P1  F60000
G1 X176.381 Y155.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.939 Y155.593 I-.381 J.152 E.06235
G1 X176.061 Y155.593 E.00372
G3 X176.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 20
M204 S250
G1 X176.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X175.939 Y158.593 I-.381 J.152 E.06235
G1 X176.061 Y158.593 E.00372
G3 X176.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 19
M204 S250
G1 X175.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X174.939 Y158.593 I-.381 J.152 E.06235
G1 X175.061 Y158.593 E.00372
G3 X175.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 18
M204 S250
G1 X174.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X173.939 Y158.593 I-.381 J.152 E.06235
G1 X174.061 Y158.593 E.00372
G3 X174.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X174.407 Y155.052 E-.10053
G1 X174.332 Y155.242 E-.07778
G1 X174.23 Y155.34 E-.05372
G1 X174.104 Y155.397 E-.05273
G1 X173.965 Y155.409 E-.05278
G1 X173.857 Y155.381 E-.04245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.269 J-1.187 P1  F60000
G1 X167.381 Y160.847 Z1.2
G1 Z.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.939 Y160.593 I-.381 J.152 E.06235
G1 X167.061 Y160.593 E.00372
G3 X167.355 Y160.793 I-.061 J.406 E.01131
; COOLING_NODE: 49
M204 S250
G1 X167.381 Y155.847 F60000
G1 F12000
M204 S5000
G3 X166.939 Y155.593 I-.381 J.152 E.06235
G1 X167.061 Y155.593 E.00372
G3 X167.355 Y155.793 I-.061 J.406 E.01131
; COOLING_NODE: 50
M204 S250
G1 X167.381 Y158.847 F60000
G1 F12000
M204 S5000
G3 X166.939 Y158.593 I-.381 J.152 E.06235
G1 X167.061 Y158.593 E.00372
G3 X167.355 Y158.793 I-.061 J.406 E.01131
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04732
G2 X166.37 Y160.505 I.689 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.218 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07725
G1 X166.396 Y158.469 E-.05193
G1 X166.315 Y158.578 E-.05188
G1 X166.214 Y158.83 E-.10318
G1 X166.196 Y158.966 E-.05187
G1 X166.211 Y155.08 E-.04389
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.155 J.384 P1  F60000
G1 X184.058 Y161.425 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.353011
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00285
G1 X183.757 Y161.694 E.00812
M204 S10000
G1 X184.058 Y161.425 F60000
; LINE_WIDTH: 0.298197
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278628
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243506
G2 X184.09 Y160.775 I-2.426 J-.325 E.00893
; LINE_WIDTH: 0.266306
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294369
G1 X184.062 Y160.586 E.00177
; LINE_WIDTH: 0.311572
G1 X183.986 Y160.193 E.00875
M204 S10000
G1 X183.874 Y160.502 F60000
; LINE_WIDTH: 0.306512
G1 F15000
M204 S8000
G1 X183.959 Y160.502 E.00182
; LINE_WIDTH: 0.331965
G1 X184.044 Y160.502 E.002
; LINE_WIDTH: 0.328047
G1 X184.06 Y160.417 E.00202
; LINE_WIDTH: 0.296619
G1 X184.075 Y160.34 E.00163
; LINE_WIDTH: 0.2787
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243523
G2 X184.09 Y155.775 I-2.424 J-.325 E.00893
; LINE_WIDTH: 0.266306
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294369
G1 X184.062 Y155.586 E.00177
; LINE_WIDTH: 0.311572
G1 X183.986 Y155.193 E.00875
M204 S10000
G1 X183.874 Y155.502 F60000
; LINE_WIDTH: 0.306512
G1 F15000
M204 S8000
G1 X183.959 Y155.502 E.00182
; LINE_WIDTH: 0.331965
G1 X184.044 Y155.502 E.002
; LINE_WIDTH: 0.328047
G1 X184.06 Y155.417 E.00202
; LINE_WIDTH: 0.296619
G1 X184.075 Y155.34 E.00163
; LINE_WIDTH: 0.2787
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243523
G2 X184.09 Y158.775 I-2.424 J-.325 E.00893
; LINE_WIDTH: 0.266306
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294369
G1 X184.062 Y158.586 E.00177
; LINE_WIDTH: 0.311572
G1 X184.008 Y158.306 E.00625
; WIPE_START
G1 X184.062 Y158.586 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-1.165 J-.351 P1  F60000
G1 X183.141 Y161.643 Z1.2
G1 Z.8
G1 E.4 F1800
; LINE_WIDTH: 0.609516
G1 F13236.956
M204 S8000
G1 X182.343 Y161.816 E.03773
; LINE_WIDTH: 0.57466
G1 F14104.641
G3 X182.196 Y161.839 I-.35 J-1.731 E.00642
; LINE_WIDTH: 0.540442
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.905 E.01773
; LINE_WIDTH: 0.581522
G1 F13924.947
G1 X181.657 Y161.816 E.00458
; LINE_WIDTH: 0.609528
G1 F13236.663
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.806 F60000
; LINE_WIDTH: 0.609516
G1 F13236.956
M204 S8000
G1 X168.343 Y161.816 E.00226
; LINE_WIDTH: 0.57466
G1 F14104.641
G3 X168.196 Y161.839 I-.35 J-1.731 E.00642
; LINE_WIDTH: 0.540442
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.905 E.01773
; LINE_WIDTH: 0.581522
G1 F13924.947
G1 X167.657 Y161.816 E.00458
; LINE_WIDTH: 0.609528
G1 F13236.663
G1 X166.859 Y161.644 E.03773
M204 S10000
G1 X166.241 Y161.694 F60000
; LINE_WIDTH: 0.353207
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00807
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298221
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278729
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243539
G3 X165.91 Y160.774 I2.425 J-.325 E.00895
; LINE_WIDTH: 0.266414
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294467
G1 X165.938 Y160.586 E.00177
; LINE_WIDTH: 0.311647
G1 X166.014 Y160.193 E.00875
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.251726
G1 F15000
M204 S8000
G1 X166.05 Y160.504 E.00127
; LINE_WIDTH: 0.289906
G1 X165.976 Y160.503 E.0015
; LINE_WIDTH: 0.328495
G1 X165.956 Y160.503 E.00045
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.29744
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278729
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243539
G3 X165.91 Y155.774 I2.425 J-.325 E.00895
; LINE_WIDTH: 0.266414
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294467
G1 X165.938 Y155.586 E.00177
; LINE_WIDTH: 0.311647
G1 X166.014 Y155.193 E.00875
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.251726
G1 F15000
M204 S8000
G1 X166.05 Y155.504 E.00127
; LINE_WIDTH: 0.289906
G1 X165.976 Y155.503 E.0015
; LINE_WIDTH: 0.328495
G1 X165.956 Y155.503 E.00045
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.29744
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278729
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.24354
G3 X165.91 Y158.774 I2.424 J-.325 E.00895
; LINE_WIDTH: 0.266417
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294462
G1 X165.938 Y158.586 E.00177
; LINE_WIDTH: 0.311642
G1 X165.992 Y158.306 E.00624
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.586 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 5/25
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.154 J1.207 P1  F60000
M104 T0 S210 N0 ;Multi extruder pre heating
G1 X175.357 Y155.791 Z1.2
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.863 Y155.613 I-.353 J.205 E.06134
G1 X174.939 Y155.593 E.00242
G3 X175.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X175.4 Y155.905 E-.06869
G1 X175.407 Y160.052 E-.05616
G1 X175.367 Y160.185 E-.05274
G1 X175.284 Y160.297 E-.05276
G1 X175.104 Y160.397 E-.07865
G1 X174.965 Y160.409 E-.05276
G1 X174.919 Y160.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X176.357 Y155.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.863 Y155.613 I-.353 J.205 E.06134
G1 X175.939 Y155.593 E.00242
G3 X176.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.4 Y155.905 E-.06869
G1 X176.407 Y160.052 E-.05616
G1 X176.367 Y160.185 E-.05274
G1 X176.284 Y160.297 E-.05276
G1 X176.104 Y160.397 E-.07865
G1 X175.965 Y160.409 E-.05276
G1 X175.919 Y160.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.814 J.905 P1  F60000
G1 X176.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.863 Y160.613 I-.353 J.205 E.06134
G1 X175.939 Y160.593 E.00242
G3 X176.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 3
M204 S250
G1 X175.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X174.863 Y160.613 I-.353 J.205 E.06134
G1 X174.939 Y160.593 E.00242
G3 X175.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 14
M204 S250
G1 X174.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X173.863 Y160.613 I-.353 J.205 E.06134
G1 X173.939 Y160.593 E.00242
G3 X174.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 15
M204 S250
G1 X174.357 Y155.791 F60000
G1 F12000
M204 S5000
G3 X173.863 Y155.613 I-.353 J.205 E.06134
G1 X173.939 Y155.593 E.00242
G3 X174.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 18
M204 S250
G1 X174.357 Y158.791 F60000
G1 F12000
M204 S5000
G3 X173.863 Y158.613 I-.353 J.205 E.06134
G1 X173.939 Y158.593 E.00242
G3 X174.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.4 Y158.905 E-.06869
G1 X174.407 Y155.052 E-.05616
G1 X174.367 Y155.185 E-.05274
G1 X174.284 Y155.297 E-.05276
G1 X174.104 Y155.397 E-.07865
G1 X173.965 Y155.409 E-.05276
G1 X173.919 Y155.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X175.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.863 Y158.613 I-.353 J.205 E.06134
G1 X174.939 Y158.593 E.00242
G3 X175.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.4 Y158.905 E-.06869
G1 X175.407 Y155.052 E-.05616
G1 X175.367 Y155.185 E-.05274
G1 X175.284 Y155.297 E-.05276
G1 X175.104 Y155.397 E-.07865
G1 X174.965 Y155.409 E-.05276
G1 X174.919 Y155.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X176.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.863 Y158.613 I-.353 J.205 E.06134
G1 X175.939 Y158.593 E.00242
G3 X176.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.4 Y158.905 E-.06869
G1 X176.407 Y155.052 E-.05616
G1 X176.367 Y155.185 E-.05274
G1 X176.284 Y155.297 E-.05276
G1 X176.104 Y155.397 E-.07865
G1 X175.965 Y155.409 E-.05276
G1 X175.919 Y155.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X177.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.863 Y158.613 I-.353 J.205 E.06134
G1 X176.939 Y158.593 E.00242
G3 X177.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.4 Y158.905 E-.06869
G1 X177.407 Y155.052 E-.05616
G1 X177.367 Y155.185 E-.05274
G1 X177.284 Y155.297 E-.05276
G1 X177.104 Y155.397 E-.07865
G1 X176.965 Y155.409 E-.05276
G1 X176.919 Y155.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X178.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.863 Y158.613 I-.353 J.205 E.06134
G1 X177.939 Y158.593 E.00242
G3 X178.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.4 Y158.905 E-.06869
G1 X178.407 Y155.052 E-.05616
G1 X178.367 Y155.185 E-.05274
G1 X178.284 Y155.297 E-.05276
G1 X178.104 Y155.397 E-.07865
G1 X177.965 Y155.409 E-.05276
G1 X177.919 Y155.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.814 J.905 P1  F60000
G1 X178.357 Y155.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.863 Y155.613 I-.353 J.205 E.06134
G1 X177.939 Y155.593 E.00242
G3 X178.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 28
M204 S250
G1 X177.357 Y155.791 F60000
G1 F12000
M204 S5000
G3 X176.863 Y155.613 I-.353 J.205 E.06134
G1 X176.939 Y155.593 E.00242
G3 X177.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.4 Y155.905 E-.06869
G1 X177.407 Y160.052 E-.05616
G1 X177.367 Y160.185 E-.05274
G1 X177.284 Y160.297 E-.05276
G1 X177.104 Y160.397 E-.07865
G1 X176.965 Y160.409 E-.05276
G1 X176.919 Y160.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.814 J.905 P1  F60000
G1 X177.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.863 Y160.613 I-.353 J.205 E.06134
G1 X176.939 Y160.593 E.00242
G3 X177.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.4 Y160.905 E-.06869
G1 X177.407 Y161.052 E-.05616
G1 X177.367 Y161.185 E-.05274
G1 X177.284 Y161.297 E-.05276
G1 X177.104 Y161.397 E-.07865
G1 X176.965 Y161.409 E-.05276
G1 X176.919 Y161.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X178.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.863 Y160.613 I-.353 J.205 E.06134
G1 X177.939 Y160.593 E.00242
G3 X178.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.4 Y160.905 E-.06869
G1 X178.407 Y161.052 E-.05616
G1 X178.367 Y161.185 E-.05274
G1 X178.284 Y161.297 E-.05276
G1 X178.104 Y161.397 E-.07865
G1 X177.965 Y161.409 E-.05276
G1 X177.919 Y161.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.473 J1.121 P1  F60000
G1 X179.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.863 Y160.613 I-.353 J.205 E.06134
G1 X178.939 Y160.593 E.00242
G3 X179.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.4 Y160.905 E-.06871
G1 X179.407 Y161.052 E-.05615
G1 X179.367 Y161.185 E-.05274
G1 X179.284 Y161.297 E-.05276
G1 X179.104 Y161.397 E-.07865
G1 X178.965 Y161.409 E-.05276
G1 X178.92 Y161.394 E-.01824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.471 J1.122 P1  F60000
G1 X180.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.863 Y160.613 I-.353 J.205 E.06134
G1 X179.939 Y160.593 E.00242
G3 X180.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 25
M204 S250
G1 X180.366 Y160.184 F60000
G1 F12000
M204 S5000
G3 X179.863 Y155.613 I-.362 J-.188 E.04871
G1 X179.939 Y155.593 E.00242
G3 X180.39 Y160.129 I.064 J.403 E.02586
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.284 Y160.297 E-.07516
G1 X180.104 Y160.397 E-.07865
G1 X179.965 Y160.409 E-.05276
G1 X179.831 Y160.374 E-.05276
G1 X179.67 Y160.244 E-.07864
G1 X179.62 Y160.146 E-.04203
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.184 J-1.203 P1  F60000
G1 X179.366 Y160.184 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.863 Y155.613 I-.362 J-.188 E.04871
G1 X178.939 Y155.593 E.00242
G3 X179.39 Y160.129 I.064 J.403 E.02586
; COOLING_NODE: 23
M204 S250
G1 X179.366 Y155.184 F60000
G1 F12000
M204 S5000
G3 X178.863 Y158.613 I-.362 J-.188 E.04871
G1 X178.939 Y158.593 E.00242
G3 X179.39 Y155.129 I.064 J.403 E.02586
; COOLING_NODE: 24
M204 S250
G1 X180.366 Y155.184 F60000
G1 F12000
M204 S5000
G3 X179.863 Y158.613 I-.362 J-.188 E.04871
G1 X179.939 Y158.593 E.00242
G3 X180.39 Y155.129 I.064 J.403 E.02586
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X180.284 Y155.297 E-.07516
G1 X180.104 Y155.397 E-.07865
G1 X179.965 Y155.409 E-.05276
G1 X179.831 Y155.374 E-.05276
G1 X179.67 Y155.244 E-.07864
G1 X179.62 Y155.146 E-.04203
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.243 J1.192 P1  F60000
G1 X181.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.863 Y158.613 I-.353 J.205 E.06134
G1 X180.939 Y158.593 E.00242
G3 X181.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.4 Y158.905 E-.06871
G1 X181.407 Y155.052 E-.05615
G1 X181.367 Y155.185 E-.05274
G1 X181.284 Y155.297 E-.05276
G1 X181.104 Y155.397 E-.07865
G1 X180.965 Y155.409 E-.05276
G1 X180.92 Y155.394 E-.01824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.819 J.9 P1  F60000
G1 X181.357 Y155.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.863 Y155.613 I-.353 J.205 E.06134
G1 X180.939 Y155.593 E.00242
G3 X181.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.4 Y155.905 E-.06871
G1 X181.407 Y160.052 E-.05615
G1 X181.367 Y160.185 E-.05274
G1 X181.284 Y160.297 E-.05276
G1 X181.104 Y160.397 E-.07865
G1 X180.965 Y160.409 E-.05276
G1 X180.92 Y160.394 E-.01824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.819 J.9 P1  F60000
G1 X181.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.863 Y160.613 I-.353 J.205 E.06134
G1 X180.939 Y160.593 E.00242
G3 X181.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.4 Y160.905 E-.06871
G1 X181.407 Y161.052 E-.05615
G1 X181.367 Y161.185 E-.05274
G1 X181.284 Y161.297 E-.05276
G1 X181.104 Y161.397 E-.07865
G1 X180.965 Y161.409 E-.05276
G1 X180.92 Y161.394 E-.01824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.471 J1.122 P1  F60000
G1 X182.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.863 Y160.613 I-.353 J.205 E.06134
G1 X181.939 Y160.593 E.00242
G3 X182.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.4 Y160.905 E-.06871
G1 X182.407 Y161.052 E-.05615
G1 X182.367 Y161.185 E-.05274
G1 X182.284 Y161.297 E-.05276
G1 X182.104 Y161.397 E-.07865
G1 X181.965 Y161.409 E-.05276
G1 X181.92 Y161.394 E-.01824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.088 J1.214 P1  F60000
G1 X183.282 Y161.295 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.863 Y160.613 I-.279 J-.298 E.04445
G1 X182.939 Y160.593 E.00242
G3 X183.323 Y161.25 I.064 J.403 E.03013
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.104 Y161.397 E-.10046
G1 X182.965 Y161.409 E-.05276
G1 X182.773 Y161.342 E-.07749
G1 X182.67 Y161.244 E-.05399
G1 X182.607 Y161.12 E-.05277
G1 X182.593 Y161.009 E-.04254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.129 J.454 P1  F60000
G1 X183.282 Y155.295 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.863 Y158.613 I-.279 J-.298 E.04445
G1 X182.939 Y158.593 E.00242
G3 X183.323 Y155.25 I.064 J.403 E.03013
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.104 Y155.397 E-.10045
G1 X182.965 Y155.409 E-.05276
G1 X182.773 Y155.342 E-.07749
G1 X182.67 Y155.244 E-.05399
G1 X182.607 Y155.12 E-.05279
G1 X182.602 Y155.008 E-.04252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.076 J.569 P1  F60000
G1 X183.282 Y160.295 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.863 Y155.613 I-.279 J-.298 E.04445
G1 X182.939 Y155.593 E.00242
G3 X183.323 Y160.25 I.064 J.403 E.03013
; COOLING_NODE: 37
M204 S250
G1 X182.408 Y160.052 F60000
G1 F12000
M204 S5000
G3 X181.863 Y155.613 I-.404 J-.056 E.053
G1 X181.939 Y155.593 E.00242
G3 X182.412 Y155.992 I.064 J.403 E.02158
; COOLING_NODE: 38
M204 S250
G1 X182.408 Y155.052 F60000
G1 F12000
M204 S5000
G3 X181.863 Y158.613 I-.404 J-.056 E.053
G1 X181.939 Y158.593 E.00242
G3 X182.412 Y158.992 I.064 J.403 E.02158
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X182.367 Y155.185 E-.07517
G1 X182.284 Y155.297 E-.05276
G1 X182.104 Y155.397 E-.07865
G1 X181.965 Y155.409 E-.05276
G1 X181.773 Y155.342 E-.07749
G1 X181.69 Y155.264 E-.04318
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.849 J.872 P1  F60000
G1 X184.398 Y161.898 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.388 J-.721 E.04666
G2 X183.63 Y155.505 I-.646 J-.5 E.0357
G2 X183.358 Y158.275 I-.648 J-.502 E.04766
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 8
; WIPE_START
G1 X183.41 Y161.898 E-.37599
G1 X183.408 Y161.888 E-.00401
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.247 J-1.192 P1  F60000
G1 X170.366 Y155.184 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X169.863 Y158.613 I-.362 J-.188 E.04871
G1 X169.939 Y158.593 E.00242
G3 X170.39 Y155.129 I.064 J.403 E.02586
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.284 Y155.297 E-.07516
G1 X170.104 Y155.397 E-.07865
G1 X169.965 Y155.409 E-.05276
G1 X169.773 Y155.342 E-.07749
G1 X169.67 Y155.244 E-.05398
G1 X169.62 Y155.146 E-.04197
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.977 J-.726 P1  F60000
G1 X169.357 Y158.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.863 Y158.613 I-.353 J.205 E.06134
G1 X168.939 Y158.593 E.00242
G3 X169.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 43
M204 S250
G1 X168.408 Y155.052 F60000
G1 F12000
M204 S5000
G3 X167.863 Y158.613 I-.404 J-.056 E.053
G1 X167.939 Y158.593 E.00242
G3 X168.412 Y158.992 I.064 J.403 E.02158
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.367 Y155.185 E-.07517
G1 X168.284 Y155.297 E-.05276
G1 X168.104 Y155.397 E-.07865
G1 X167.965 Y155.409 E-.05276
G1 X167.773 Y155.342 E-.07749
G1 X167.69 Y155.264 E-.04318
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.9 J.819 P1  F60000
G1 X168.408 Y160.052 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
M73 P55 R9
G3 X167.863 Y155.613 I-.404 J-.056 E.053
G1 X167.939 Y155.593 E.00242
G3 X168.412 Y155.992 I.064 J.403 E.02158
; COOLING_NODE: 45
M204 S250
G1 X169.357 Y155.791 F60000
G1 F12000
M204 S5000
G3 X168.863 Y155.613 I-.353 J.205 E.06134
G1 X168.939 Y155.593 E.00242
G3 X169.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.4 Y155.905 E-.06869
G1 X169.407 Y160.052 E-.05616
G1 X169.367 Y160.185 E-.05274
G1 X169.284 Y160.297 E-.05276
G1 X169.104 Y160.397 E-.07865
G1 X168.965 Y160.409 E-.05276
G1 X168.919 Y160.397 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.177 J1.204 P1  F60000
G1 X170.366 Y160.184 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.863 Y155.613 I-.362 J-.188 E.04871
G1 X169.939 Y155.593 E.00242
G3 X170.39 Y160.129 I.064 J.403 E.02586
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X170.284 Y160.297 E-.07516
G1 X170.104 Y160.397 E-.07865
G1 X169.965 Y160.409 E-.05276
G1 X169.773 Y160.342 E-.07749
G1 X169.67 Y160.244 E-.05398
G1 X169.62 Y160.146 E-.04197
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.244 J1.192 P1  F60000
G1 X171.357 Y155.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.863 Y155.613 I-.353 J.205 E.06134
G1 X170.939 Y155.593 E.00242
G3 X171.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 9
M204 S250
G1 X171.357 Y158.791 F60000
G1 F12000
M204 S5000
G3 X170.863 Y158.613 I-.353 J.205 E.06134
G1 X170.939 Y158.593 E.00242
G3 X171.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X171.4 Y158.905 E-.06869
G1 X171.407 Y155.052 E-.05616
G1 X171.367 Y155.185 E-.05274
G1 X171.284 Y155.297 E-.05276
G1 X171.104 Y155.397 E-.07865
G1 X170.965 Y155.409 E-.05276
G1 X170.92 Y155.394 E-.01825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.174 J1.204 P1  F60000
G1 X172.366 Y155.184 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.863 Y158.613 I-.362 J-.188 E.04871
G1 X171.939 Y158.593 E.00242
G3 X172.39 Y155.129 I.064 J.403 E.02586
; COOLING_NODE: 17
M204 S250
G1 X173.282 Y155.295 F60000
G1 F12000
M204 S5000
G3 X172.863 Y158.613 I-.279 J-.298 E.04445
G1 X172.939 Y158.593 E.00242
G3 X173.323 Y155.25 I.064 J.403 E.03013
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X173.104 Y155.397 E-.10046
G1 X172.965 Y155.409 E-.05276
G1 X172.773 Y155.342 E-.07749
G1 X172.67 Y155.244 E-.05399
G1 X172.607 Y155.12 E-.05279
G1 X172.603 Y155.008 E-.04252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.193 J-.24 P1  F60000
G1 X172.366 Y160.184 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.863 Y155.613 I-.362 J-.188 E.04871
G1 X171.939 Y155.593 E.00242
G3 X172.39 Y160.129 I.064 J.403 E.02586
; COOLING_NODE: 16
M204 S250
G1 X173.282 Y160.295 F60000
G1 F12000
M204 S5000
G3 X172.863 Y155.613 I-.279 J-.298 E.04445
G1 X172.939 Y155.593 E.00242
G3 X173.323 Y160.25 I.064 J.403 E.03013
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.104 Y160.397 E-.10046
G1 X172.965 Y160.409 E-.05276
G1 X172.773 Y160.342 E-.07749
G1 X172.67 Y160.244 E-.05399
G1 X172.607 Y160.12 E-.05279
G1 X172.603 Y160.008 E-.04252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.076 J.569 P1  F60000
G1 X173.282 Y161.295 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.863 Y160.613 I-.279 J-.298 E.04445
G1 X172.939 Y160.593 E.00242
G3 X173.323 Y161.25 I.064 J.403 E.03013
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.10046
G1 X172.965 Y161.409 E-.05276
G1 X172.773 Y161.342 E-.07749
G1 X172.67 Y161.244 E-.05399
G1 X172.607 Y161.12 E-.05279
G1 X172.602 Y161.008 E-.04251
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.807 J-.911 P1  F60000
G1 X172.357 Y160.791 Z1.4
G1 Z1
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.863 Y160.613 I-.353 J.205 E.06134
G1 X171.939 Y160.593 E.00242
G3 X172.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 5
M204 S250
G1 X171.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X170.863 Y160.613 I-.353 J.205 E.06134
G1 X170.939 Y160.593 E.00242
G3 X171.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 6
M204 S250
G1 X170.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X169.863 Y160.613 I-.353 J.205 E.06134
G1 X169.939 Y160.593 E.00242
G3 X170.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 46
M204 S250
G1 X169.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X168.863 Y160.613 I-.353 J.205 E.06134
G1 X168.939 Y160.593 E.00242
G3 X169.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 47
M204 S250
G1 X168.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X167.863 Y160.613 I-.353 J.205 E.06134
G1 X167.939 Y160.593 E.00242
G3 X168.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 48
M204 S250
G1 X167.357 Y160.791 F60000
G1 F12000
M204 S5000
G3 X166.863 Y160.613 I-.353 J.205 E.06134
G1 X166.939 Y160.593 E.00242
G3 X167.323 Y160.741 I.064 J.403 E.01324
; COOLING_NODE: 49
M204 S250
G1 X167.357 Y155.791 F60000
G1 F12000
M204 S5000
G3 X166.863 Y155.613 I-.353 J.205 E.06134
G1 X166.939 Y155.593 E.00242
G3 X167.323 Y155.741 I.064 J.403 E.01324
; COOLING_NODE: 50
M204 S250
G1 X167.357 Y158.791 F60000
G1 F12000
M204 S5000
G3 X166.863 Y158.613 I-.353 J.205 E.06134
G1 X166.939 Y158.593 E.00242
G3 X167.323 Y158.741 I.064 J.403 E.01324
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.401 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.633 Y161.712 I.63 J.495 E.04679
G1 X166.587 Y161.898 E.00636
G1 X165.602 Y161.898 E.03269
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07738
G1 X166.396 Y158.469 E-.05177
G1 X166.254 Y158.7 E-.10329
G1 X166.214 Y158.831 E-.05189
G1 X166.203 Y155.082 E-.09566
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.149 J.401 P1  F60000
G1 X184.042 Y161.511 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331204
G1 F15000
M204 S8000
G1 X184.059 Y161.425 E.00205
; LINE_WIDTH: 0.294478
G1 X184.078 Y161.32 E.0022
; LINE_WIDTH: 0.244906
G2 X184.084 Y160.712 I-2.513 J-.328 E.01002
; LINE_WIDTH: 0.283998
G1 X184.064 Y160.608 E.00209
; LINE_WIDTH: 0.317582
G3 X184.075 Y160.34 I.339 J-.12 E.00615
; LINE_WIDTH: 0.257939
G2 X184.097 Y160.132 I-6.897 J-.846 E.00365
; LINE_WIDTH: 0.240062
G2 X184.084 Y155.712 I-3.336 J-.104 E.00676
; LINE_WIDTH: 0.283998
G1 X184.064 Y155.608 E.00209
; LINE_WIDTH: 0.317582
G3 X184.075 Y155.34 I.339 J-.12 E.00615
; LINE_WIDTH: 0.257939
G2 X184.097 Y155.132 I-6.897 J-.846 E.00365
; LINE_WIDTH: 0.240061
G2 X184.084 Y158.712 I-3.335 J-.104 E.00676
; LINE_WIDTH: 0.287758
G1 X184.06 Y158.588 E.00252
; LINE_WIDTH: 0.337041
G1 X184.036 Y158.464 E.00303
G1 X184.01 Y158.446 E.00075
; LINE_WIDTH: 0.305086
G1 X183.771 Y158.306 E.00592
M204 S10000
G1 X184.042 Y161.511 F60000
; LINE_WIDTH: 0.358633
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00067
G1 X183.758 Y161.694 E.00823
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609634
G1 F13234.204
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574692
G1 F14103.789
G3 X182.196 Y161.839 I-.35 J-1.731 E.00643
; LINE_WIDTH: 0.540437
G1 F15000
G3 X181.76 Y161.834 I-.194 J-1.906 E.01772
; LINE_WIDTH: 0.586246
G1 F13803.868
G3 X181.632 Y161.81 I.271 J-1.846 E.00576
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609634
G1 F13234.204
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.574692
G1 F14103.789
G3 X168.196 Y161.839 I-.35 J-1.731 E.00643
; LINE_WIDTH: 0.540437
G1 F15000
G3 X167.76 Y161.834 I-.194 J-1.906 E.01772
; LINE_WIDTH: 0.600195
G1 F13458.355
G3 X166.85 Y161.648 I2.207 J-13.139 E.04218
M204 S10000
G1 X166.253 Y161.694 F60000
; LINE_WIDTH: 0.353401
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00833
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298146
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278671
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243516
G3 X165.91 Y160.774 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266358
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.29454
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311764
G1 X166.014 Y160.194 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.25284
G1 F15000
M204 S8000
G1 X166.05 Y160.504 E.00128
; LINE_WIDTH: 0.291102
G1 X165.975 Y160.503 E.00151
; LINE_WIDTH: 0.328603
G1 X165.956 Y160.503 E.00044
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297413
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.2787
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243518
G3 X165.91 Y155.774 I2.427 J-.325 E.00894
; LINE_WIDTH: 0.26636
G1 X165.925 Y155.671 E.00191
; LINE_WIDTH: 0.294559
G1 X165.938 Y155.585 E.00178
; LINE_WIDTH: 0.311793
G1 X166.014 Y155.194 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.252849
G1 F15000
M204 S8000
G1 X166.05 Y155.504 E.00128
; LINE_WIDTH: 0.291122
G1 X165.975 Y155.503 E.00151
; LINE_WIDTH: 0.328604
G1 X165.956 Y155.503 E.00044
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297413
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.2787
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243518
G3 X165.91 Y158.774 I2.427 J-.325 E.00894
; LINE_WIDTH: 0.26636
G1 X165.925 Y158.671 E.00191
; LINE_WIDTH: 0.294559
G1 X165.938 Y158.585 E.00178
; LINE_WIDTH: 0.311797
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z1.4 I-1.217 J.017 P1  F60000
G1 X167.463 Y268.881 Z1.4
G1 Z1
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y269.881  
M204 S8000
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.4 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z1
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
M73 P55 R8
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E16

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P56 R8
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z4 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y264.706 F60000
G1 Z1
G17
G3 Z1.4 I1.217 J0 P1
G1 X190.897 Y247.542 Z1.4
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z1
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
G1  Y255.381 
G1  X170.463 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y266.131  E0.0285
G1  X167.463  E0.7031
G1  Y266.881  E0.0285
G1  X185.963  E0.7031
G1  Y267.631  E0.0285
G1  X167.463  E0.7031
G1  Y268.381  E0.0285
G1  X185.963  E0.7031
G1  Y269.131  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X168.463 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3481
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 5 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z1.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z1.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer5 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 6/25
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
M73 P57 R8
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3421
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 6 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z1.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z1.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer6 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z1.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S164 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E15

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z4.2 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y269.131 F60000
G1 Z1.2

; filament start gcode
G17
G3 Z1.6 I0 J-1.217 P1
G1 X185.963 Y269.131 Z1.6
G1 Z1.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y269.631 
G1  X185.463 
G1  Y268.631 
G1  X186.963 
G1  Y270.131 
G1  X184.963 
G1  Y268.131 
G1  X182.963 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y267.631  E0.0285
M73 P58 R8
G1  X167.463  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y259.381  E0.0285
G1  X185.963  E0.7031
G1  Y258.631  E0.0285
G1  X167.463  E0.7031
G1  Y257.881  E0.0285
G1  X185.963  E0.7031
G1  Y257.131  E0.0285
G1  X167.463  E0.7031
G1  Y256.381  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y270.055  
M204 S8000
G3  X183.574 Y272.013   I-3.488 J-1.982 E0.1317
G3  X181.239 Y270.654   I1.125 J-4.619 E0.1041
G2  X178.521 Y269.881   I-2.725 J4.418 E0.1088
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X188.077 Y268.1 E-.05173
G1 X188.156 Y267.99 E-.05173
G1 X188.226 Y267.873 E-.05174
G1 X188.287 Y267.751 E-.05173
G1 X188.338 Y267.625 E-.05173
G1 X188.379 Y267.495 E-.05174
G1 X188.41 Y267.363 E-.05173
G1 X188.417 Y267.316 E-.01787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.335 Y155.766
G1 Z1.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.87 Y155.61 I-.337 J.233 E.063
G1 X174.976 Y155.59 E.00333
G3 X175.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 15
M204 S250
G1 X174.335 Y155.766 F60000
G1 F12000
M204 S5000
G3 X173.87 Y155.61 I-.337 J.233 E.063
G1 X173.976 Y155.59 E.00333
G3 X174.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 18
M204 S250
G1 X174.335 Y158.766 F60000
G1 F12000
M204 S5000
G3 X173.87 Y158.61 I-.337 J.233 E.063
G1 X173.976 Y158.59 E.00333
G3 X174.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.402 Y158.914 E-.08371
G1 X174.407 Y155.052 E-.05271
G1 X174.364 Y155.192 E-.05561
G1 X174.233 Y155.338 E-.07457
G1 X174.104 Y155.397 E-.05423
G1 X173.965 Y155.409 E-.05278
G1 X173.949 Y155.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.509 J1.105 P1  F60000
G1 X175.335 Y158.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.87 Y158.61 I-.337 J.233 E.063
G1 X174.976 Y158.59 E.00333
G3 X175.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X175.402 Y158.914 E-.08372
G1 X175.407 Y155.052 E-.05271
G1 X175.364 Y155.192 E-.05561
G1 X175.233 Y155.338 E-.07457
G1 X175.104 Y155.397 E-.05423
G1 X174.965 Y155.409 E-.05278
G1 X174.949 Y155.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.302 J1.179 P1  F60000
G1 X180.348 Y160.786 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.87 Y160.61 I-.35 J.214 E.06232
G1 X179.976 Y160.59 E.00333
G3 X180.313 Y160.737 I.021 J.41 E.01169
; COOLING_NODE: 25
M204 S250
G1 X180.361 Y160.19 F60000
G1 F12000
M204 S5000
G3 X179.87 Y155.61 I-.363 J-.191 E.04933
G1 X179.976 Y155.59 E.00333
G3 X180.385 Y160.135 I.021 J.41 E.02468
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.233 Y160.338 E-.09631
G1 X180.104 Y160.397 E-.05423
G1 X179.965 Y160.409 E-.05278
G1 X179.831 Y160.374 E-.05278
G1 X179.716 Y160.297 E-.05275
G1 X179.615 Y160.143 E-.06996
G1 X179.614 Y160.139 E-.0012
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.238 J1.193 P1  F60000
G1 X181.351 Y155.793 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.87 Y155.61 I-.354 J.207 E.06205
G1 X180.976 Y155.59 E.00333
G3 X181.317 Y155.743 I.021 J.409 E.01192
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.411 Y155.979 E-.09634
G1 X181.393 Y160.12 E-.05422
G1 X181.301 Y160.28 E-.06997
G1 X181.233 Y160.338 E-.03392
G1 X181.104 Y160.397 E-.05423
G1 X180.965 Y160.409 E-.05278
G1 X180.918 Y160.397 E-.01853
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.82 J.899 P1  F60000
G1 X181.351 Y160.793 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.87 Y160.61 I-.354 J.207 E.06205
G1 X180.976 Y160.59 E.00333
G3 X181.317 Y160.743 I.021 J.409 E.01192
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.411 Y160.979 E-.09634
G1 X181.393 Y161.12 E-.05427
G1 X181.301 Y161.28 E-.06992
G1 X181.233 Y161.338 E-.03393
G1 X181.104 Y161.397 E-.05423
G1 X180.965 Y161.409 E-.05278
G1 X180.918 Y161.397 E-.01853
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.173 J1.205 P1  F60000
G1 X184.398 Y161.898 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.633 Y160.49 I-.378 J-.726 E.04745
G2 X183.633 Y155.49 I-.655 J-.5 E.03564
G2 X183.358 Y158.275 I-.641 J-.494 E.04715
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 35
; WIPE_START
G1 X183.41 Y161.898 E-.376
G1 X183.408 Y161.888 E-.00401
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.159 J-.37 P1  F60000
G1 X183.232 Y161.336 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X182.87 Y160.61 I-.234 J-.336 E.04326
G1 X182.976 Y160.59 E.00333
G3 X183.278 Y161.298 I.021 J.409 E.03071
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.104 Y161.397 E-.0764
G1 X182.965 Y161.409 E-.05278
G1 X182.831 Y161.374 E-.05277
G1 X182.716 Y161.297 E-.05273
G1 X182.607 Y161.12 E-.07866
G1 X182.59 Y160.983 E-.05276
G1 X182.6 Y160.948 E-.0139
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.643 J-1.033 P1  F60000
G1 X182.351 Y160.793 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.87 Y160.61 I-.354 J.207 E.06205
G1 X181.976 Y160.59 E.00333
G3 X182.317 Y160.743 I.021 J.409 E.01192
; COOLING_NODE: 37
M204 S250
G1 X182.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X181.87 Y155.61 I-.392 J-.12 E.05165
G1 X181.976 Y155.59 E.00333
G3 X182.403 Y160.061 I.021 J.409 E.02232
; COOLING_NODE: 36
M204 S250
G1 X183.232 Y160.336 F60000
G1 F12000
M204 S5000
G3 X182.87 Y155.61 I-.234 J-.336 E.04326
G1 X182.976 Y155.59 E.00333
G3 X183.278 Y160.298 I.021 J.409 E.03071
; COOLING_NODE: 41
M204 S250
G1 X183.232 Y155.336 F60000
G1 F12000
M204 S5000
G3 X182.87 Y158.61 I-.234 J-.336 E.04326
G1 X182.976 Y158.59 E.00333
G3 X183.278 Y155.298 I.021 J.409 E.03071
; COOLING_NODE: 38
M204 S250
G1 X182.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X181.87 Y158.61 I-.392 J-.12 E.05165
G1 X181.976 Y158.59 E.00333
G3 X182.403 Y155.061 I.021 J.409 E.02232
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.301 Y155.28 E-.09187
G1 X182.233 Y155.338 E-.03392
G1 X182.104 Y155.397 E-.05423
G1 X181.965 Y155.409 E-.05278
G1 X181.831 Y155.374 E-.05277
G1 X181.67 Y155.244 E-.07868
G1 X181.651 Y155.207 E-.01575
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.986 J-.713 P1  F60000
G1 X181.351 Y158.793 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.87 Y158.61 I-.354 J.207 E.06205
G1 X180.976 Y158.59 E.00333
G3 X181.317 Y158.743 I.021 J.409 E.01192
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X181.411 Y158.979 E-.09634
G1 X181.393 Y155.12 E-.05422
G1 X181.301 Y155.28 E-.06997
G1 X181.233 Y155.338 E-.03392
G1 X181.104 Y155.397 E-.05423
G1 X180.965 Y155.409 E-.05278
G1 X180.918 Y155.397 E-.01853
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.424 J-1.141 P1  F60000
G1 X180.361 Y155.19 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.87 Y158.61 I-.363 J-.191 E.04933
G1 X179.976 Y158.59 E.00333
G3 X180.385 Y155.135 I.021 J.41 E.02468
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X180.233 Y155.338 E-.0963
G1 X180.104 Y155.397 E-.05423
G1 X179.965 Y155.409 E-.05278
G1 X179.831 Y155.374 E-.05278
G1 X179.716 Y155.297 E-.05275
G1 X179.615 Y155.143 E-.06996
G1 X179.614 Y155.139 E-.0012
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.227 J-1.196 P1  F60000
G1 X179.357 Y155.188 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.87 Y158.61 I-.36 J-.191 E.04899
G1 X178.976 Y158.59 E.00333
G3 X179.381 Y155.133 I.02 J.407 E.02458
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X179.233 Y155.338 E-.09613
G1 X179.104 Y155.397 E-.05423
G1 X178.965 Y155.409 E-.05278
G1 X178.831 Y155.374 E-.05277
G1 X178.67 Y155.244 E-.07868
G1 X178.616 Y155.137 E-.04541
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.97 J-.735 P1  F60000
G1 X178.335 Y158.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.87 Y158.61 I-.337 J.233 E.063
G1 X177.976 Y158.59 E.00333
G3 X178.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.402 Y158.914 E-.08371
G1 X178.407 Y155.052 E-.05272
G1 X178.364 Y155.192 E-.05561
G1 X178.233 Y155.338 E-.07457
G1 X178.104 Y155.397 E-.05423
G1 X177.965 Y155.409 E-.05278
G1 X177.949 Y155.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.832 J.888 P1  F60000
G1 X178.335 Y155.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.87 Y155.61 I-.337 J.233 E.063
G1 X177.976 Y155.59 E.00333
G3 X178.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X178.402 Y155.914 E-.08372
G1 X178.407 Y160.052 E-.05272
G1 X178.364 Y160.192 E-.05561
G1 X178.233 Y160.338 E-.07457
G1 X178.104 Y160.397 E-.05423
G1 X177.965 Y160.409 E-.05278
G1 X177.949 Y160.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.185 J1.203 P1  F60000
G1 X179.357 Y160.188 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.87 Y155.61 I-.36 J-.191 E.04899
G1 X178.976 Y155.59 E.00333
G3 X179.381 Y160.133 I.02 J.407 E.02458
; COOLING_NODE: 31
M204 S250
G1 X179.346 Y160.787 F60000
G1 F12000
M204 S5000
G3 X178.87 Y160.61 I-.349 J.21 E.06189
G1 X178.976 Y160.59 E.00333
G3 X179.312 Y160.738 I.02 J.407 E.01167
; COOLING_NODE: 30
M204 S250
G1 X178.335 Y160.766 F60000
G1 F12000
M204 S5000
G3 X177.87 Y160.61 I-.337 J.233 E.063
G1 X177.976 Y160.59 E.00333
G3 X178.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 29
M204 S250
G1 X177.335 Y160.766 F60000
G1 F12000
M204 S5000
G3 X176.87 Y160.61 I-.337 J.233 E.063
G1 X176.976 Y160.59 E.00333
G3 X177.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 28
M204 S250
G1 X177.335 Y155.766 F60000
G1 F12000
M204 S5000
G3 X176.87 Y155.61 I-.337 J.233 E.063
G1 X176.976 Y155.59 E.00333
G3 X177.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 21
M204 S250
G1 X177.335 Y158.766 F60000
G1 F12000
M204 S5000
G3 X176.87 Y158.61 I-.337 J.233 E.063
G1 X176.976 Y158.59 E.00333
G3 X177.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 20
M204 S250
G1 X176.335 Y158.766 F60000
G1 F12000
M204 S5000
G3 X175.87 Y158.61 I-.337 J.233 E.063
G1 X175.976 Y158.59 E.00333
G3 X176.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.402 Y158.914 E-.08371
G1 X176.407 Y155.052 E-.05272
G1 X176.364 Y155.192 E-.05561
G1 X176.233 Y155.338 E-.07457
G1 X176.104 Y155.397 E-.05423
G1 X175.965 Y155.409 E-.05278
G1 X175.949 Y155.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.832 J.888 P1  F60000
G1 X176.335 Y155.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.87 Y155.61 I-.337 J.233 E.063
G1 X175.976 Y155.59 E.00333
G3 X176.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.402 Y155.914 E-.08372
G1 X176.407 Y160.052 E-.05272
G1 X176.364 Y160.192 E-.05561
G1 X176.233 Y160.338 E-.07457
G1 X176.104 Y160.397 E-.05423
G1 X175.965 Y160.409 E-.05278
G1 X175.949 Y160.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.832 J.888 P1  F60000
G1 X176.335 Y160.766 Z1.6
G1 Z1.2
G1 E.4 F1800
M73 P59 R8
G1 F12000
M204 S5000
G3 X175.87 Y160.61 I-.337 J.233 E.063
G1 X175.976 Y160.59 E.00333
G3 X176.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 3
M204 S250
G1 X175.335 Y160.766 F60000
G1 F12000
M204 S5000
G3 X174.87 Y160.61 I-.337 J.233 E.063
G1 X174.976 Y160.59 E.00333
G3 X175.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 14
M204 S250
G1 X174.335 Y160.766 F60000
G1 F12000
M204 S5000
G3 X173.87 Y160.61 I-.337 J.233 E.063
G1 X173.976 Y160.59 E.00333
G3 X174.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X174.402 Y160.914 E-.08372
G1 X174.407 Y161.052 E-.05272
G1 X174.364 Y161.192 E-.05563
G1 X174.233 Y161.338 E-.07453
G1 X174.104 Y161.397 E-.05423
G1 X173.965 Y161.409 E-.05278
G1 X173.949 Y161.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.117 J-1.211 P1  F60000
G1 X173.232 Y161.336 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.87 Y160.61 I-.234 J-.336 E.04326
G1 X172.976 Y160.59 E.00333
G3 X173.278 Y161.298 I.021 J.409 E.03071
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.0764
G1 X172.965 Y161.409 E-.05278
G1 X172.831 Y161.374 E-.05277
G1 X172.67 Y161.244 E-.07866
G1 X172.607 Y161.12 E-.05275
G1 X172.59 Y160.983 E-.05275
G1 X172.6 Y160.948 E-.01391
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.651 J-1.028 P1  F60000
G1 X172.346 Y160.787 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.87 Y160.61 I-.349 J.21 E.06189
G1 X171.976 Y160.59 E.00333
G3 X172.312 Y160.738 I.02 J.407 E.01167
; COOLING_NODE: 5
M204 S250
G1 X171.334 Y160.767 F60000
G1 F12000
M204 S5000
G3 X170.87 Y160.61 I-.337 J.23 E.06261
G1 X170.976 Y160.59 E.00333
G3 X171.296 Y160.72 I.02 J.407 E.01096
; COOLING_NODE: 10
M204 S250
G1 X171.334 Y155.767 F60000
G1 F12000
M204 S5000
G3 X170.87 Y155.61 I-.337 J.23 E.06261
G1 X170.976 Y155.59 E.00333
G3 X171.296 Y155.72 I.02 J.407 E.01096
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.402 Y155.914 E-.08368
G1 X171.407 Y160.052 E-.05272
G1 X171.364 Y160.192 E-.05561
G1 X171.233 Y160.338 E-.07457
G1 X171.104 Y160.397 E-.05423
G1 X170.965 Y160.409 E-.05278
G1 X170.949 Y160.405 E-.00641
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.185 J1.203 P1  F60000
G1 X172.357 Y160.188 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.87 Y155.61 I-.36 J-.191 E.04899
G1 X171.976 Y155.59 E.00333
G3 X172.381 Y160.133 I.02 J.407 E.02458
; COOLING_NODE: 16
M204 S250
G1 X173.232 Y160.336 F60000
G1 F12000
M204 S5000
G3 X172.87 Y155.61 I-.234 J-.336 E.04326
G1 X172.976 Y155.59 E.00333
G3 X173.278 Y160.298 I.021 J.409 E.03071
; COOLING_NODE: 17
M204 S250
G1 X173.232 Y155.336 F60000
G1 F12000
M204 S5000
G3 X172.87 Y158.61 I-.234 J-.336 E.04326
G1 X172.976 Y158.59 E.00333
G3 X173.278 Y155.298 I.021 J.409 E.03071
; COOLING_NODE: 4
M204 S250
G1 X172.357 Y155.188 F60000
G1 F12000
M204 S5000
G3 X171.87 Y158.61 I-.36 J-.191 E.04899
G1 X171.976 Y158.59 E.00333
G3 X172.381 Y155.133 I.02 J.407 E.02458
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.233 Y155.338 E-.09613
G1 X172.104 Y155.397 E-.05423
G1 X171.965 Y155.409 E-.05278
G1 X171.831 Y155.374 E-.05277
G1 X171.67 Y155.244 E-.07868
G1 X171.616 Y155.137 E-.04541
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.968 J-.738 P1  F60000
G1 X171.334 Y158.767 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.87 Y158.61 I-.337 J.23 E.06261
G1 X170.976 Y158.59 E.00333
G3 X171.296 Y158.72 I.02 J.407 E.01096
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X171.402 Y158.914 E-.08368
G1 X171.407 Y155.052 E-.05272
G1 X171.364 Y155.192 E-.05561
G1 X171.233 Y155.338 E-.07457
G1 X171.104 Y155.397 E-.05423
G1 X170.965 Y155.409 E-.05278
G1 X170.949 Y155.405 E-.00642
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.418 J-1.143 P1  F60000
G1 X170.361 Y155.19 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.87 Y158.61 I-.363 J-.191 E.04933
G1 X169.976 Y158.59 E.00333
G3 X170.385 Y155.135 I.021 J.41 E.02468
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.233 Y155.338 E-.09631
G1 X170.104 Y155.397 E-.05423
G1 X169.965 Y155.409 E-.05278
G1 X169.831 Y155.374 E-.05276
G1 X169.716 Y155.297 E-.05276
G1 X169.615 Y155.143 E-.06996
G1 X169.614 Y155.139 E-.00119
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.974 J-.73 P1  F60000
G1 X169.335 Y158.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.87 Y158.61 I-.337 J.233 E.063
G1 X168.976 Y158.59 E.00333
G3 X169.297 Y158.72 I.021 J.409 E.01097
; COOLING_NODE: 43
M204 S250
G1 X168.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X167.87 Y158.61 I-.392 J-.12 E.05165
G1 X167.976 Y158.59 E.00333
G3 X168.403 Y155.061 I.021 J.409 E.02232
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.301 Y155.28 E-.09187
G1 X168.233 Y155.338 E-.03392
G1 X168.104 Y155.397 E-.05423
G1 X167.965 Y155.409 E-.05278
G1 X167.831 Y155.374 E-.05277
G1 X167.67 Y155.244 E-.07868
G1 X167.651 Y155.207 E-.01574
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.946 J.766 P1  F60000
G1 X168.389 Y160.119 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.87 Y155.61 I-.392 J-.12 E.05165
G1 X167.976 Y155.59 E.00333
G3 X168.403 Y160.061 I.021 J.409 E.02232
; COOLING_NODE: 47
M204 S250
G1 X168.351 Y160.793 F60000
G1 F12000
M204 S5000
G3 X167.87 Y160.61 I-.354 J.207 E.06205
G1 X167.976 Y160.59 E.00333
G3 X168.317 Y160.743 I.021 J.409 E.01192
; COOLING_NODE: 48
M204 S250
G1 X167.351 Y160.793 F60000
G1 F12000
M204 S5000
G3 X166.87 Y160.61 I-.354 J.207 E.06205
G1 X166.976 Y160.59 E.00333
G3 X167.317 Y160.743 I.021 J.409 E.01192
; COOLING_NODE: 49
M204 S250
G1 X167.351 Y155.793 F60000
G1 F12000
M204 S5000
G3 X166.87 Y155.61 I-.354 J.207 E.06205
G1 X166.976 Y155.59 E.00333
G3 X167.317 Y155.743 I.021 J.409 E.01192
; COOLING_NODE: 50
M204 S250
G1 X167.351 Y158.793 F60000
G1 F12000
M204 S5000
G3 X166.87 Y158.61 I-.354 J.207 E.06205
G1 X166.976 Y158.59 E.00333
G3 X167.317 Y158.743 I.021 J.409 E.01192
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 7
; WIPE_START
G1 X166.495 Y158.374 E-.07725
G1 X166.396 Y158.469 E-.05187
G1 X166.315 Y158.578 E-.05188
G1 X166.214 Y158.831 E-.1033
G1 X166.196 Y158.966 E-.05186
G1 X166.211 Y155.08 E-.04384
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.314 J1.176 P1  F60000
G1 X170.361 Y160.19 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X169.87 Y155.61 I-.363 J-.191 E.04933
G1 X169.976 Y155.59 E.00333
G3 X170.385 Y160.135 I.021 J.41 E.02468
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X170.233 Y160.338 E-.09631
G1 X170.104 Y160.397 E-.05423
G1 X169.965 Y160.409 E-.05278
G1 X169.831 Y160.374 E-.05276
G1 X169.716 Y160.297 E-.05276
G1 X169.615 Y160.143 E-.06996
G1 X169.614 Y160.139 E-.00119
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.974 J-.73 P1  F60000
G1 X169.335 Y155.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.87 Y155.61 I-.337 J.233 E.063
G1 X168.976 Y155.59 E.00333
G3 X169.297 Y155.72 I.021 J.409 E.01097
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.402 Y155.914 E-.08372
G1 X169.407 Y160.052 E-.05271
G1 X169.364 Y160.192 E-.05561
G1 X169.233 Y160.338 E-.07457
G1 X169.104 Y160.397 E-.05423
G1 X168.965 Y160.409 E-.05278
G1 X168.949 Y160.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.832 J.888 P1  F60000
G1 X169.335 Y160.766 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.87 Y160.61 I-.337 J.233 E.063
G1 X168.976 Y160.59 E.00333
G3 X169.297 Y160.72 I.021 J.409 E.01097
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X169.402 Y160.914 E-.08372
G1 X169.407 Y161.052 E-.05272
G1 X169.364 Y161.192 E-.05563
G1 X169.233 Y161.338 E-.07453
G1 X169.104 Y161.397 E-.05423
G1 X168.965 Y161.409 E-.05278
G1 X168.949 Y161.405 E-.00638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I.493 J1.113 P1  F60000
G1 X170.348 Y160.786 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.87 Y160.61 I-.35 J.214 E.06232
G1 X169.976 Y160.59 E.00333
G3 X170.313 Y160.737 I.021 J.41 E.01169
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X170.402 Y160.914 E-.07509
G1 X170.407 Y161.052 E-.05273
G1 X170.364 Y161.192 E-.05563
G1 X170.233 Y161.338 E-.07453
G1 X170.104 Y161.397 E-.05423
G1 X169.965 Y161.409 E-.05278
G1 X169.927 Y161.399 E-.015
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-.073 J1.215 P1  F60000
G1 X184.79 Y162.29 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.154 J.386 P1  F60000
G1 X184.056 Y161.439 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.300792
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00211
; LINE_WIDTH: 0.278764
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243531
G2 X184.09 Y160.775 I-2.426 J-.325 E.00894
; LINE_WIDTH: 0.267441
G1 X184.074 Y160.663 E.00205
; LINE_WIDTH: 0.297864
G1 X184.06 Y160.57 E.00196
; LINE_WIDTH: 0.327878
G3 X184.059 Y160.421 I.222 J-.076 E.00354
; LINE_WIDTH: 0.29727
G1 X184.075 Y160.34 E.00171
; LINE_WIDTH: 0.278652
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243511
G2 X184.09 Y155.775 I-2.426 J-.325 E.00893
; LINE_WIDTH: 0.267441
G1 X184.074 Y155.663 E.00205
; LINE_WIDTH: 0.297864
G1 X184.06 Y155.57 E.00196
; LINE_WIDTH: 0.327878
G3 X184.059 Y155.421 I.222 J-.076 E.00354
; LINE_WIDTH: 0.29727
G1 X184.075 Y155.34 E.00171
; LINE_WIDTH: 0.278652
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243511
G2 X184.09 Y158.775 I-2.426 J-.325 E.00893
; LINE_WIDTH: 0.267441
G1 X184.074 Y158.663 E.00205
; LINE_WIDTH: 0.297864
G1 X184.06 Y158.57 E.00196
; LINE_WIDTH: 0.317558
G1 X184.006 Y158.306 E.00605
M204 S10000
G1 X184.056 Y161.439 F60000
; LINE_WIDTH: 0.334818
G1 F15000
M204 S8000
G1 X184.037 Y161.537 E.00238
G1 X183.772 Y161.694 E.00732
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609611
G1 F13234.724
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574666
G1 F14104.487
G3 X182.196 Y161.839 I-.349 J-1.729 E.00643
; LINE_WIDTH: 0.540429
G1 F15000
G3 X181.76 Y161.834 I-.194 J-1.907 E.01772
; LINE_WIDTH: 0.581528
G1 F13924.804
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609605
G1 F13234.871
G1 X181.609 Y161.805 E.00228
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609611
G1 F13234.724
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.574666
G1 F14104.487
G3 X168.196 Y161.839 I-.349 J-1.729 E.00643
; LINE_WIDTH: 0.540429
G1 F15000
G3 X167.76 Y161.834 I-.194 J-1.907 E.01772
; LINE_WIDTH: 0.581528
G1 F13924.804
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609605
G1 F13234.871
G1 X166.859 Y161.643 E.03772
M204 S10000
G1 X166.246 Y161.694 F60000
; LINE_WIDTH: 0.353275
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00818
G1 X165.942 Y161.425 E.00285
; LINE_WIDTH: 0.298218
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278721
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243532
G3 X165.91 Y160.774 I2.425 J-.325 E.00894
; LINE_WIDTH: 0.266398
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294504
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311702
G1 X166.014 Y160.193 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.250658
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00125
; LINE_WIDTH: 0.288209
G1 X165.977 Y160.503 E.00148
; LINE_WIDTH: 0.328305
G1 X165.956 Y160.503 E.00048
G1 X165.941 Y160.421 E.00192
; LINE_WIDTH: 0.297465
G1 X165.925 Y160.34 E.00171
; LINE_WIDTH: 0.278722
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243536
G3 X165.91 Y155.774 I2.427 J-.325 E.00895
; LINE_WIDTH: 0.266398
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294504
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311702
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.250658
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00125
; LINE_WIDTH: 0.288209
G1 X165.977 Y155.503 E.00148
; LINE_WIDTH: 0.328305
G1 X165.956 Y155.503 E.00048
G1 X165.941 Y155.421 E.00192
; LINE_WIDTH: 0.297465
G1 X165.925 Y155.34 E.00171
; LINE_WIDTH: 0.278722
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243536
G3 X165.91 Y158.774 I2.427 J-.325 E.00895
; LINE_WIDTH: 0.266398
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294504
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.311707
G1 X165.992 Y158.306 E.00624
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z1.2
Z0.96
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X150 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X155 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X160 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X165 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X170 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X175 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X180 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X185 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X190 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X195 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X200 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X205 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X210 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X215 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X220 Y155 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z1.2
Z0.96
G1 E0.40 F150
G4 P400
G0 Z0.6 
G1 E-0.08 F800
G0 X145 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X150 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X155 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X160 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X165 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X170 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X175 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X180 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X185 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X190 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X195 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X200 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X205 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X210 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X215 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X220 Y160 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z1.2
Z0.96
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X150 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X155 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X160 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X165 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X170 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X175 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X180 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X185 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X190 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X195 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X200 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X205 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X210 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X215 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
G0 X220 Y165 Z1.2
Z0.96
G1 E0.40
G4 P400
G0 Z1.2
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 7/25
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.155 J1.207 P1  F60000
G1 X175.349 Y155.794 Z1.6
G1 Z1.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.87 Y155.61 I-.352 J.201 E.06125
G1 X174.974 Y155.59 E.00326
G3 X175.315 Y155.744 I.023 J.405 E.01195
; COOLING_NODE: 19
M204 S250
G1 X175.349 Y158.794 F60000
G1 F12000
M204 S5000
G3 X174.87 Y158.61 I-.352 J.201 E.06125
G1 X174.974 Y158.59 E.00326
G3 X175.315 Y158.744 I.023 J.405 E.01195
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.411 Y158.978 E-.09616
G1 X175.393 Y155.12 E-.05446
G1 X175.302 Y155.278 E-.06902
G1 X175.234 Y155.338 E-.03468
G1 X175.104 Y155.397 E-.05442
G1 X174.922 Y155.403 E-.06905
G1 X174.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.475 J1.12 P1  F60000
G1 X176.349 Y158.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.87 Y158.61 I-.352 J.201 E.06125
G1 X175.974 Y158.59 E.00326
G3 X176.315 Y158.744 I.023 J.405 E.01194
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.411 Y158.978 E-.09616
G1 X176.393 Y155.12 E-.05445
G1 X176.302 Y155.278 E-.06902
G1 X176.234 Y155.338 E-.03469
G1 X176.104 Y155.398 E-.05442
G1 X175.922 Y155.403 E-.06905
G1 X175.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.818 J.901 P1  F60000
G1 X176.349 Y155.794 Z1.8
G1 Z1.4
G1 E.4 F1800
M104 T0 S210 N0 ;Multi extruder pre heating
G1 F12000
M204 S5000
G3 X175.87 Y155.61 I-.352 J.201 E.06125
G1 X175.974 Y155.59 E.00326
G3 X176.315 Y155.744 I.023 J.405 E.01194
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X176.411 Y155.978 E-.09616
G1 X176.393 Y160.12 E-.05445
G1 X176.302 Y160.278 E-.06902
G1 X176.234 Y160.338 E-.03469
G1 X176.104 Y160.398 E-.05442
G1 X175.922 Y160.403 E-.06905
G1 X175.916 Y160.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.475 J1.12 P1  F60000
G1 X177.349 Y155.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.87 Y155.61 I-.352 J.201 E.06125
G1 X176.974 Y155.59 E.00326
G3 X177.315 Y155.744 I.023 J.405 E.01194
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.411 Y155.978 E-.09616
G1 X177.393 Y160.12 E-.05445
G1 X177.302 Y160.278 E-.06902
G1 X177.234 Y160.338 E-.03469
G1 X177.104 Y160.398 E-.05442
G1 X176.922 Y160.403 E-.06905
G1 X176.916 Y160.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.818 J.901 P1  F60000
G1 X177.349 Y160.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.87 Y160.61 I-.352 J.201 E.06125
G1 X176.974 Y160.59 E.00326
G3 X177.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 2
M204 S250
G1 X176.349 Y160.794 F60000
G1 F12000
M204 S5000
G3 X175.87 Y160.61 I-.352 J.201 E.06125
G1 X175.974 Y160.59 E.00326
G3 X176.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 3
M204 S250
G1 X175.349 Y160.794 F60000
G1 F12000
M204 S5000
G3 X174.87 Y160.61 I-.352 J.201 E.06125
G1 X174.974 Y160.59 E.00326
G3 X175.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 14
M204 S250
G1 X174.349 Y160.794 F60000
G1 F12000
M204 S5000
G3 X173.87 Y160.61 I-.352 J.201 E.06125
G1 X173.974 Y160.59 E.00326
G3 X174.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 15
M204 S250
G1 X174.349 Y155.794 F60000
G1 F12000
M204 S5000
G3 X173.87 Y155.61 I-.352 J.201 E.06125
G1 X173.974 Y155.59 E.00326
G3 X174.315 Y155.744 I.023 J.405 E.01195
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.411 Y155.978 E-.09616
G1 X174.393 Y160.12 E-.05446
G1 X174.302 Y160.278 E-.06902
G1 X174.234 Y160.338 E-.03468
G1 X174.104 Y160.397 E-.05442
G1 X173.922 Y160.403 E-.06905
G1 X173.916 Y160.402 E-.00222
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.247 J-1.192 P1  F60000
G1 X173.297 Y160.273 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.87 Y155.61 I-.3 J-.276 E.04576
G1 X172.974 Y155.59 E.00326
G3 X173.334 Y160.226 I.023 J.407 E.02784
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.234 Y160.338 E-.05729
G1 X173.104 Y160.398 E-.05442
G1 X172.958 Y160.409 E-.0555
G1 X172.773 Y160.343 E-.07453
G1 X172.67 Y160.244 E-.05442
G1 X172.607 Y160.12 E-.05272
G1 X172.604 Y160.038 E-.03113
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-1.061 J.596 P1  F60000
G1 X173.297 Y161.273 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.87 Y160.61 I-.3 J-.276 E.04576
G1 X172.974 Y160.59 E.00326
G3 X173.334 Y161.226 I.023 J.407 E.02784
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.234 Y161.338 E-.05729
G1 X173.104 Y161.398 E-.05442
G1 X172.958 Y161.409 E-.0555
G1 X172.773 Y161.343 E-.07453
G1 X172.67 Y161.244 E-.05441
G1 X172.607 Y161.12 E-.05272
G1 X172.604 Y161.038 E-.03114
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.854 J-.867 P1  F60000
G1 X172.347 Y160.786 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.87 Y160.61 I-.35 J.214 E.06231
G1 X171.974 Y160.59 E.00326
G3 X172.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 5
M204 S250
G1 X171.35 Y160.793 F60000
G1 F12000
M204 S5000
G3 X170.87 Y160.61 I-.353 J.204 E.06166
G1 X170.974 Y160.59 E.00326
G3 X171.316 Y160.743 I.023 J.407 E.01197
; COOLING_NODE: 6
M204 S250
G1 X170.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X169.87 Y160.61 I-.35 J.214 E.06231
G1 X169.974 Y160.59 E.00326
G3 X170.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 46
M204 S250
G1 X169.349 Y160.794 F60000
G1 F12000
M204 S5000
G3 X168.87 Y160.61 I-.352 J.201 E.06125
G1 X168.974 Y160.59 E.00326
G3 X169.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 47
M204 S250
G1 X168.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X167.87 Y160.61 I-.35 J.214 E.06231
G1 X167.974 Y160.59 E.00326
G3 X168.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 48
M204 S250
G1 X167.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X166.87 Y160.61 I-.35 J.214 E.06231
G1 X166.974 Y160.59 E.00326
G3 X167.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 49
M204 S250
G1 X167.347 Y155.786 F60000
G1 F12000
M204 S5000
G3 X166.87 Y155.61 I-.35 J.214 E.06231
G1 X166.974 Y155.59 E.00326
G3 X167.312 Y155.737 I.023 J.41 E.01176
; COOLING_NODE: 50
M204 S250
G1 X167.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X166.87 Y158.61 I-.35 J.214 E.06231
G1 X166.974 Y158.59 E.00326
G3 X167.312 Y158.737 I.023 J.41 E.01176
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.401 J.734 E.04732
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.635 Y161.735 I.675 J.498 E.04721
G1 X166.577 Y161.898 E.00573
G1 X165.602 Y161.898 E.03235
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 43
; WIPE_START
G1 X166.495 Y158.374 E-.07739
G1 X166.396 Y158.469 E-.05171
G1 X166.315 Y158.578 E-.05184
G1 X166.214 Y158.831 E-.10337
G1 X166.203 Y155.082 E-.09569
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.061 J1.215 P1  F60000
G1 X168.361 Y155.19 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.87 Y158.61 I-.363 J-.19 E.04933
G1 X167.974 Y158.59 E.00326
G3 X168.385 Y155.135 I.023 J.41 E.02474
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.234 Y155.338 E-.09623
G1 X168.104 Y155.398 E-.05442
G1 X167.958 Y155.409 E-.0555
G1 X167.773 Y155.343 E-.07453
G1 X167.67 Y155.244 E-.05442
G1 X167.617 Y155.139 E-.0449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.993 J.703 P1  F60000
G1 X168.361 Y160.19 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.87 Y155.61 I-.363 J-.19 E.04933
G1 X167.974 Y155.59 E.00326
G3 X168.385 Y160.135 I.023 J.41 E.02474
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X168.234 Y160.338 E-.09623
G1 X168.104 Y160.398 E-.05442
G1 X167.958 Y160.409 E-.0555
G1 X167.773 Y160.343 E-.07453
G1 X167.67 Y160.244 E-.05442
G1 X167.617 Y160.139 E-.0449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.238 J1.194 P1  F60000
G1 X169.349 Y155.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.87 Y155.61 I-.352 J.201 E.06125
G1 X168.974 Y155.59 E.00326
G3 X169.315 Y155.744 I.023 J.405 E.01195
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.411 Y155.978 E-.09616
G1 X169.393 Y160.12 E-.05446
G1 X169.302 Y160.278 E-.06902
G1 X169.234 Y160.338 E-.03469
G1 X169.104 Y160.398 E-.05442
G1 X168.922 Y160.403 E-.06905
G1 X168.916 Y160.402 E-.00222
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.178 J1.204 P1  F60000
G1 X170.357 Y160.188 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.87 Y155.61 I-.36 J-.191 E.04899
G1 X169.974 Y155.59 E.00326
G3 X170.381 Y160.133 I.023 J.407 E.02464
; COOLING_NODE: 8
M204 S250
G1 X170.357 Y155.188 F60000
G1 F12000
M204 S5000
G3 X169.87 Y158.61 I-.36 J-.191 E.04899
G1 X169.974 Y158.59 E.00326
G3 X170.381 Y155.133 I.023 J.407 E.02464
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.234 Y155.338 E-.09605
G1 X170.104 Y155.398 E-.05442
G1 X169.965 Y155.409 E-.05276
G1 X169.831 Y155.374 E-.05277
G1 X169.67 Y155.244 E-.07866
G1 X169.616 Y155.138 E-.04533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.961 J-.747 P1  F60000
G1 X169.349 Y158.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.87 Y158.61 I-.352 J.201 E.06125
G1 X168.974 Y158.59 E.00326
G3 X169.315 Y158.744 I.023 J.405 E.01194
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X169.411 Y158.978 E-.09616
G1 X169.393 Y155.12 E-.05446
G1 X169.302 Y155.278 E-.06902
G1 X169.234 Y155.338 E-.03469
G1 X169.104 Y155.398 E-.05442
G1 X168.922 Y155.403 E-.06905
G1 X168.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.295 J1.181 P1  F60000
G1 X171.351 Y158.792 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.87 Y158.61 I-.354 J.207 E.06204
G1 X170.974 Y158.59 E.00326
G3 X171.317 Y158.743 I.023 J.409 E.01198
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.411 Y158.978 E-.09625
G1 X171.393 Y155.12 E-.05446
G1 X171.302 Y155.278 E-.06902
G1 X171.234 Y155.338 E-.03469
G1 X171.104 Y155.398 E-.05442
G1 X170.965 Y155.409 E-.05276
G1 X170.918 Y155.397 E-.01841
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.821 J.899 P1  F60000
G1 X171.351 Y155.792 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.87 Y155.61 I-.354 J.207 E.06204
G1 X170.974 Y155.59 E.00326
G3 X171.317 Y155.743 I.023 J.409 E.01198
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.411 Y155.978 E-.09624
G1 X171.393 Y160.12 E-.05446
G1 X171.302 Y160.278 E-.06902
G1 X171.234 Y160.338 E-.03469
G1 X171.104 Y160.398 E-.05442
G1 X170.965 Y160.409 E-.05276
G1 X170.918 Y160.397 E-.01841
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.173 J1.205 P1  F60000
G1 X172.361 Y160.19 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.87 Y155.61 I-.363 J-.19 E.04933
G1 X171.974 Y155.59 E.00326
G3 X172.385 Y160.135 I.023 J.41 E.02474
; COOLING_NODE: 4
M204 S250
G1 X172.361 Y155.19 F60000
G1 F12000
M204 S5000
G3 X171.87 Y158.61 I-.363 J-.19 E.04933
G1 X171.974 Y158.59 E.00326
G3 X172.385 Y155.135 I.023 J.41 E.02474
; COOLING_NODE: 17
M204 S250
G1 X173.297 Y155.273 F60000
G1 F12000
M204 S5000
G3 X172.87 Y158.61 I-.3 J-.276 E.04576
G1 X172.974 Y158.59 E.00326
G3 X173.334 Y155.226 I.023 J.407 E.02784
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.234 Y155.338 E-.05729
G1 X173.104 Y155.398 E-.05442
G1 X172.958 Y155.409 E-.0555
G1 X172.773 Y155.343 E-.07453
G1 X172.67 Y155.244 E-.05442
G1 X172.607 Y155.12 E-.05272
G1 X172.604 Y155.038 E-.03113
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.169 J1.205 P1  F60000
G1 X174.349 Y158.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.87 Y158.61 I-.352 J.201 E.06125
G1 X173.974 Y158.59 E.00326
G3 X174.315 Y158.744 I.023 J.405 E.01195
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X174.411 Y158.978 E-.09616
G1 X174.393 Y155.12 E-.05446
G1 X174.302 Y155.278 E-.06902
G1 X174.234 Y155.338 E-.03468
G1 X174.104 Y155.397 E-.05442
G1 X173.922 Y155.403 E-.06905
G1 X173.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.212 J1.198 P1  F60000
G1 X177.349 Y158.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.87 Y158.61 I-.352 J.201 E.06125
G1 X176.974 Y158.59 E.00326
G3 X177.315 Y158.744 I.023 J.405 E.01194
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.411 Y158.978 E-.09616
G1 X177.393 Y155.12 E-.05445
G1 X177.302 Y155.278 E-.06902
G1 X177.234 Y155.338 E-.03469
G1 X177.104 Y155.398 E-.05442
G1 X176.922 Y155.403 E-.06905
G1 X176.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.475 J1.12 P1  F60000
G1 X178.349 Y158.794 Z1.8
G1 Z1.4
G1 E.4 F1800
M73 P60 R8
G1 F12000
M204 S5000
G3 X177.87 Y158.61 I-.352 J.201 E.06125
G1 X177.974 Y158.59 E.00326
G3 X178.315 Y158.744 I.023 J.405 E.01194
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.411 Y158.978 E-.09616
G1 X178.393 Y155.12 E-.05445
G1 X178.302 Y155.278 E-.06902
G1 X178.234 Y155.338 E-.03469
G1 X178.104 Y155.398 E-.05442
G1 X177.922 Y155.403 E-.06905
G1 X177.916 Y155.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.818 J.901 P1  F60000
G1 X178.349 Y155.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.87 Y155.61 I-.352 J.201 E.06125
G1 X177.974 Y155.59 E.00326
G3 X178.315 Y155.744 I.023 J.405 E.01194
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178.411 Y155.978 E-.09616
G1 X178.393 Y160.12 E-.05445
G1 X178.302 Y160.278 E-.06902
G1 X178.234 Y160.338 E-.03469
G1 X178.104 Y160.398 E-.05442
G1 X177.922 Y160.403 E-.06905
G1 X177.916 Y160.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.818 J.901 P1  F60000
G1 X178.349 Y160.794 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.87 Y160.61 I-.352 J.201 E.06125
G1 X177.974 Y160.59 E.00326
G3 X178.315 Y160.744 I.023 J.405 E.01194
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.411 Y160.978 E-.09617
G1 X178.393 Y161.12 E-.05443
G1 X178.302 Y161.278 E-.06904
G1 X178.234 Y161.338 E-.03469
G1 X178.104 Y161.398 E-.05442
G1 X177.922 Y161.403 E-.06905
G1 X177.916 Y161.402 E-.00221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.481 J1.118 P1  F60000
G1 X179.347 Y160.786 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.87 Y160.61 I-.35 J.214 E.06231
G1 X178.974 Y160.59 E.00326
G3 X179.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 26
M204 S250
G1 X179.361 Y160.19 F60000
G1 F12000
M204 S5000
G3 X178.87 Y155.61 I-.363 J-.19 E.04933
G1 X178.974 Y155.59 E.00326
G3 X179.385 Y160.135 I.023 J.41 E.02474
; COOLING_NODE: 23
M204 S250
G1 X179.361 Y155.19 F60000
G1 F12000
M204 S5000
G3 X178.87 Y158.61 I-.363 J-.19 E.04933
G1 X178.974 Y158.59 E.00326
G3 X179.385 Y155.135 I.023 J.41 E.02474
; COOLING_NODE: 24
M204 S250
G1 X180.357 Y155.188 F60000
G1 F12000
M204 S5000
G3 X179.87 Y158.61 I-.36 J-.191 E.04899
G1 X179.974 Y158.59 E.00326
G3 X180.381 Y155.133 I.023 J.407 E.02464
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.234 Y155.338 E-.09605
G1 X180.104 Y155.398 E-.05442
G1 X179.965 Y155.409 E-.05276
G1 X179.831 Y155.374 E-.05277
G1 X179.67 Y155.244 E-.07866
G1 X179.616 Y155.138 E-.04534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.839 J.881 P1  F60000
G1 X181.347 Y160.786 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.87 Y160.61 I-.35 J.214 E.06231
G1 X180.974 Y160.59 E.00326
G3 X181.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 32
M204 S250
G1 X180.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X179.87 Y160.61 I-.35 J.214 E.06231
G1 X179.974 Y160.59 E.00326
G3 X180.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 25
M204 S250
G1 X180.357 Y160.188 F60000
G1 F12000
M204 S5000
G3 X179.87 Y155.61 I-.36 J-.191 E.04899
G1 X179.974 Y155.59 E.00326
G3 X180.381 Y160.133 I.023 J.407 E.02464
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.234 Y160.338 E-.09605
G1 X180.104 Y160.398 E-.05442
G1 X179.965 Y160.409 E-.05276
G1 X179.831 Y160.374 E-.05277
G1 X179.67 Y160.244 E-.07866
G1 X179.616 Y160.138 E-.04533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.242 J1.193 P1  F60000
G1 X181.347 Y155.786 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.87 Y155.61 I-.35 J.214 E.06231
G1 X180.974 Y155.59 E.00326
G3 X181.312 Y155.737 I.023 J.41 E.01176
; COOLING_NODE: 39
M204 S250
G1 X181.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X180.87 Y158.61 I-.35 J.214 E.06231
G1 X180.974 Y158.59 E.00326
G3 X181.312 Y158.737 I.023 J.41 E.01176
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X181.402 Y158.914 E-.0751
G1 X181.407 Y155.052 E-.05276
G1 X181.364 Y155.192 E-.05548
G1 X181.234 Y155.338 E-.07449
G1 X181.104 Y155.398 E-.05442
G1 X180.958 Y155.409 E-.0555
G1 X180.928 Y155.398 E-.01226
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.175 J1.204 P1  F60000
G1 X182.361 Y155.19 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.87 Y158.61 I-.363 J-.19 E.04933
G1 X181.974 Y158.59 E.00326
G3 X182.385 Y155.135 I.023 J.41 E.02474
; COOLING_NODE: 41
M204 S250
G1 X183.297 Y155.273 F60000
G1 F12000
M204 S5000
G3 X182.87 Y158.61 I-.3 J-.276 E.04578
G1 X182.974 Y158.59 E.00326
G3 X183.335 Y155.226 I.023 J.407 E.02785
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.234 Y155.338 E-.05728
G1 X183.104 Y155.398 E-.05442
G1 X182.965 Y155.409 E-.05275
G1 X182.792 Y155.354 E-.06906
G1 X182.67 Y155.244 E-.06248
G1 X182.607 Y155.12 E-.05278
G1 X182.604 Y155.038 E-.03123
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-1.061 J.596 P1  F60000
G1 X183.297 Y160.273 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.87 Y155.61 I-.3 J-.276 E.04578
G1 X182.974 Y155.59 E.00326
G3 X183.335 Y160.226 I.023 J.407 E.02785
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X183.234 Y160.338 E-.05728
G1 X183.104 Y160.398 E-.05442
G1 X182.965 Y160.409 E-.05275
G1 X182.792 Y160.354 E-.06906
G1 X182.67 Y160.244 E-.06248
G1 X182.607 Y160.12 E-.05278
G1 X182.604 Y160.038 E-.03124
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-1.061 J.596 P1  F60000
G1 X183.297 Y161.273 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.87 Y160.61 I-.3 J-.276 E.04578
G1 X182.974 Y160.59 E.00326
G3 X183.335 Y161.226 I.023 J.407 E.02785
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.234 Y161.338 E-.05728
G1 X183.104 Y161.398 E-.05442
G1 X182.965 Y161.409 E-.05275
G1 X182.792 Y161.354 E-.06906
G1 X182.67 Y161.244 E-.06248
G1 X182.607 Y161.12 E-.05276
G1 X182.604 Y161.038 E-.03125
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I.853 J-.868 P1  F60000
G1 X182.347 Y160.786 Z1.8
G1 Z1.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.87 Y160.61 I-.35 J.214 E.06231
G1 X181.974 Y160.59 E.00326
G3 X182.312 Y160.737 I.023 J.41 E.01176
; COOLING_NODE: 37
M204 S250
G1 X182.361 Y160.19 F60000
G1 F12000
M204 S5000
G3 X181.87 Y155.61 I-.363 J-.19 E.04933
G1 X181.974 Y155.59 E.00326
G3 X182.385 Y160.135 I.023 J.41 E.02474
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.234 Y160.338 E-.09623
G1 X182.104 Y160.398 E-.05442
G1 X181.958 Y160.409 E-.0555
G1 X181.773 Y160.343 E-.07453
G1 X181.67 Y160.244 E-.05442
G1 X181.617 Y160.139 E-.0449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.651 J1.028 P1  F60000
G1 X184.398 Y161.898 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.626 Y160.499 I-.364 J-.716 E.04722
G2 X183.626 Y155.499 I-.626 J-.5 E.03582
G2 X183.358 Y158.275 I-.638 J-.502 E.0475
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.154 J.386 P1  F60000
G1 X184.056 Y161.438 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336069
G1 F15000
M204 S8000
G1 X184.037 Y161.537 E.0024
G1 X183.773 Y161.694 E.00735
M204 S10000
G1 X184.056 Y161.438 F60000
; LINE_WIDTH: 0.300662
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00211
; LINE_WIDTH: 0.278615
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.258318
G2 X184 Y160.13 I-4.018 J-.334 E.021
M204 S10000
G1 X183.985 Y155.805 F60000
; LINE_WIDTH: 0.32912
G1 F15000
M204 S8000
G1 X184.03 Y155.572 E.00552
; LINE_WIDTH: 0.295994
G2 X184.078 Y155.32 I-2.963 J-.693 E.0053
; LINE_WIDTH: 0.255961
G2 X184.025 Y158.306 I-2.916 J-.356 E.01772
M204 S10000
G1 X184 Y155.13 F60000
; LINE_WIDTH: 0.258318
G1 F15000
M204 S8000
G3 X184.078 Y160.32 I-3.94 J.856 E.02101
; LINE_WIDTH: 0.295996
G3 X184.03 Y160.572 I-3.011 J-.441 E.0053
; LINE_WIDTH: 0.329126
G1 X183.985 Y160.805 E.00552
; WIPE_START
G1 X184.03 Y160.572 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-.936 J-.777 P1  F60000
G1 X183.141 Y161.643 Z1.8
G1 Z1.4
G1 E.4 F1800
; LINE_WIDTH: 0.609635
G1 F13234.165
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574653
G1 F14104.824
G3 X182.196 Y161.839 I-.348 J-1.72 E.00644
; LINE_WIDTH: 0.543001
G1 F14997.583
G3 X181.724 Y161.828 I-.194 J-1.781 E.01931
; LINE_WIDTH: 0.58615
G1 F13806.32
G1 X181.662 Y161.817 E.00281
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609635
G1 F13234.165
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574653
G1 F14104.824
G3 X168.196 Y161.839 I-.348 J-1.72 E.00644
; LINE_WIDTH: 0.543001
G1 F14997.583
G3 X167.724 Y161.828 I-.194 J-1.781 E.01931
; LINE_WIDTH: 0.58615
G1 F13806.32
G1 X166.864 Y161.674 E.03865
M204 S10000
G1 X166.249 Y161.694 F60000
; LINE_WIDTH: 0.353129
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00824
G1 X165.942 Y161.426 E.00285
; LINE_WIDTH: 0.298215
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278627
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243529
G3 X165.91 Y160.774 I2.43 J-.325 E.00894
; LINE_WIDTH: 0.26637
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294554
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311784
G1 X166.014 Y160.193 E.00875
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.251352
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00126
; LINE_WIDTH: 0.289257
G1 X165.976 Y160.503 E.00149
; LINE_WIDTH: 0.328404
G1 X165.956 Y160.503 E.00046
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.29741
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278675
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243534
G3 X165.91 Y155.774 I2.429 J-.325 E.00894
; LINE_WIDTH: 0.266368
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294558
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311784
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.251352
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00126
; LINE_WIDTH: 0.289257
G1 X165.976 Y155.503 E.00149
; LINE_WIDTH: 0.328404
G1 X165.956 Y155.503 E.00046
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.29741
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278675
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243534
G3 X165.91 Y158.774 I2.429 J-.325 E.00894
; LINE_WIDTH: 0.266368
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294558
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.311788
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z1.8 I-1.197 J.217 P1  F60000
G1 X185.963 Y268.881 Z1.8
G1 Z1.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y269.881  
M204 S8000
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
M73 P60 R7
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X188.398 Y255.349   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y257.357   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y259.273   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #7
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.8 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z1.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E14

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P61 R7
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z4.4 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y256.381 F60000
G1 Z1.4

; filament start gcode
G17
G3 Z1.8 I0 J-1.217 P1
G1 X185.963 Y256.381 Z1.8
G1 Z1.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y256.881 
G1  X185.463 
G1  Y255.881 
G1  X186.963 
G1  Y257.381 
G1  X184.963 
G1  Y255.381 
G1  X182.963 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y266.131  E0.0285
G1  X185.963  E0.7031
G1  Y266.881  E0.0285
G1  X167.463  E0.7031
G1  Y267.631  E0.0285
G1  X185.963  E0.7031
G1  Y268.381  E0.0285
G1  X167.463  E0.7031
G1  Y269.131  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X184.963 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3349
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 7 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z1.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z1.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer7 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 8/25
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
M73 P62 R7
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3265
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 8 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer8 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z1.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S162 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E13

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z4.6 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y265.141 F60000
G1 Z1.6
G17
G3 Z2 I-1.217 J0 P1
G1 X190.897 Y274.469 Z2
G1 X162.53 Y274.469
G1 X162.53 Y269.131

; filament start gcode
G1 X167.463 Y269.131
G1 Z1.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y269.631 
G1  X166.963 
G1  Y268.631 
G1  X168.463 
G1  Y270.131 
G1  X166.463 
G1  Y268.131 
G1  X170.463 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
M73 P63 R7
G1  X185.963  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y259.381  E0.0285
G1  X167.463  E0.7031
G1  Y258.631  E0.0285
G1  X185.963  E0.7031
G1  Y257.881  E0.0285
G1  X167.463  E0.7031
G1  Y257.131  E0.0285
G1  X185.963  E0.7031
G1  Y256.381  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X165.438 Y268.205  
M204 S8000
G3  X166.125 Y265.161   I1.763 J-1.201 E0.1330
G2  X166.963 Y262.738   I-3.144 J-2.444 E0.0992
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X167.122 Y270.055   E0.0670
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X167.795 Y270.794 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.329 Y155.764
G1 Z1.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.869 Y155.61 I-.333 J.231 E.06235
G1 X174.971 Y155.59 E.00319
G3 X175.292 Y155.717 I.025 J.405 E.01093
; COOLING_NODE: 19
M204 S250
G1 X175.329 Y158.764 F60000
G1 F12000
M204 S5000
G3 X174.869 Y158.61 I-.333 J.231 E.06235
G1 X174.971 Y158.59 E.00319
G3 X175.292 Y158.717 I.025 J.405 E.01093
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X175.402 Y158.914 E-.08549
G1 X175.407 Y155.059 E-.05534
G1 X175.333 Y155.241 E-.07445
G1 X175.23 Y155.34 E-.05457
G1 X175.103 Y155.398 E-.0528
G1 X174.953 Y155.403 E-.05734
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.316 J1.175 P1  F60000
G1 X177.33 Y158.763 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y158.61 I-.334 J.234 E.06274
G1 X176.971 Y158.59 E.00319
G3 X177.292 Y158.717 I.025 J.407 E.01095
; COOLING_NODE: 20
M204 S250
G1 X176.329 Y158.764 F60000
G1 F12000
M204 S5000
G3 X175.869 Y158.61 I-.333 J.231 E.06235
G1 X175.971 Y158.59 E.00319
G3 X176.292 Y158.717 I.025 J.405 E.01093
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.402 Y158.914 E-.08549
G1 X176.407 Y155.059 E-.05534
G1 X176.333 Y155.241 E-.07445
G1 X176.23 Y155.34 E-.05457
G1 X176.103 Y155.398 E-.0528
G1 X175.953 Y155.403 E-.05735
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.842 J.879 P1  F60000
G1 X176.329 Y155.764 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y155.61 I-.333 J.231 E.06235
G1 X175.971 Y155.59 E.00319
G3 X176.292 Y155.717 I.025 J.405 E.01093
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X176.402 Y155.914 E-.08549
G1 X176.407 Y160.059 E-.05534
G1 X176.333 Y160.241 E-.07445
G1 X176.23 Y160.34 E-.05457
G1 X176.103 Y160.398 E-.0528
G1 X175.953 Y160.403 E-.05735
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.512 J1.104 P1  F60000
G1 X177.33 Y155.763 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y155.61 I-.334 J.234 E.06274
G1 X176.971 Y155.59 E.00319
G3 X177.292 Y155.717 I.025 J.407 E.01095
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.402 Y155.914 E-.08553
G1 X177.407 Y160.059 E-.05534
G1 X177.333 Y160.241 E-.07445
G1 X177.23 Y160.34 E-.05457
G1 X177.103 Y160.398 E-.0528
G1 X176.965 Y160.409 E-.05273
G1 X176.954 Y160.406 E-.00458
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.837 J.884 P1  F60000
G1 X177.33 Y160.763 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y160.61 I-.334 J.234 E.06274
G1 X176.971 Y160.59 E.00319
G3 X177.292 Y160.717 I.025 J.407 E.01095
; COOLING_NODE: 2
M204 S250
G1 X176.329 Y160.764 F60000
G1 F12000
M204 S5000
G3 X175.869 Y160.61 I-.333 J.231 E.06235
G1 X175.971 Y160.59 E.00319
G3 X176.292 Y160.717 I.025 J.405 E.01093
; COOLING_NODE: 3
M204 S250
G1 X175.329 Y160.764 F60000
G1 F12000
M204 S5000
G3 X174.869 Y160.61 I-.333 J.231 E.06235
G1 X174.971 Y160.59 E.00319
G3 X175.292 Y160.717 I.025 J.405 E.01093
; COOLING_NODE: 14
M204 S250
G1 X174.331 Y160.763 F60000
G1 F12000
M204 S5000
G3 X173.869 Y160.61 I-.334 J.237 E.06313
G1 X173.971 Y160.59 E.00319
G3 X174.293 Y160.716 I.026 J.409 E.01096
; COOLING_NODE: 15
M204 S250
G1 X174.331 Y155.763 F60000
G1 F12000
M204 S5000
G3 X173.869 Y155.61 I-.334 J.237 E.06313
G1 X173.971 Y155.59 E.00319
G3 X174.293 Y155.716 I.026 J.409 E.01096
; COOLING_NODE: 18
M204 S250
G1 X174.331 Y158.763 F60000
G1 F12000
M204 S5000
G3 X173.869 Y158.61 I-.334 J.237 E.06313
G1 X173.971 Y158.59 E.00319
G3 X174.293 Y158.716 I.026 J.409 E.01096
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.402 Y158.914 E-.08556
G1 X174.407 Y155.059 E-.05534
G1 X174.333 Y155.241 E-.07445
G1 X174.23 Y155.34 E-.05457
G1 X174.103 Y155.398 E-.0528
G1 X173.953 Y155.398 E-.05728
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.307 J-1.178 P1  F60000
G1 X173.324 Y155.234 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.869 Y158.61 I-.328 J-.239 E.04695
G1 X172.971 Y158.59 E.00319
G3 X173.356 Y155.183 I.025 J.405 E.02633
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173.23 Y155.34 E-.0766
G1 X173.103 Y155.398 E-.0528
G1 X172.924 Y155.404 E-.06807
G1 X172.77 Y155.34 E-.06341
G1 X172.67 Y155.244 E-.05282
G1 X172.607 Y155.12 E-.0527
G1 X172.603 Y155.085 E-.01361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.598 J-1.06 P1  F60000
G1 X172.33 Y155.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y158.61 I-.333 J-.239 E.04757
G1 X171.971 Y158.59 E.00319
G3 X172.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X172.23 Y155.34 E-.07671
G1 X172.103 Y155.398 E-.0528
G1 X171.924 Y155.404 E-.06807
G1 X171.77 Y155.34 E-.06341
G1 X171.67 Y155.244 E-.05282
G1 X171.607 Y155.12 E-.0527
G1 X171.603 Y155.085 E-.01349
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.029 J.649 P1  F60000
G1 X172.33 Y160.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y155.61 I-.333 J-.239 E.04757
G1 X171.971 Y155.59 E.00319
G3 X172.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 16
M204 S250
G1 X173.324 Y160.234 F60000
G1 F12000
M204 S5000
G3 X172.869 Y155.61 I-.328 J-.239 E.04695
G1 X172.971 Y155.59 E.00319
G3 X173.356 Y160.183 I.025 J.405 E.02633
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.23 Y160.34 E-.0766
G1 X173.103 Y160.398 E-.0528
G1 X172.924 Y160.404 E-.06807
G1 X172.77 Y160.34 E-.06341
G1 X172.67 Y160.244 E-.05282
G1 X172.607 Y160.12 E-.0527
G1 X172.603 Y160.085 E-.0136
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.031 J.647 P1  F60000
G1 X173.324 Y161.234 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.869 Y160.61 I-.328 J-.239 E.04695
G1 X172.971 Y160.59 E.00319
G3 X173.356 Y161.183 I.025 J.405 E.02633
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.23 Y161.34 E-.0766
G1 X173.103 Y161.398 E-.0528
G1 X172.924 Y161.404 E-.06807
G1 X172.77 Y161.34 E-.06341
G1 X172.67 Y161.244 E-.05282
G1 X172.607 Y161.12 E-.05272
G1 X172.603 Y161.085 E-.01358
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.925 J-.791 P1  F60000
G1 X172.347 Y160.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y160.61 I-.35 J.213 E.0623
G1 X171.971 Y160.59 E.00319
G3 X172.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 5
M204 S250
G1 X171.33 Y160.763 F60000
G1 F12000
M204 S5000
G3 X170.869 Y160.61 I-.334 J.234 E.06274
G1 X170.971 Y160.59 E.00319
G3 X171.292 Y160.717 I.025 J.407 E.01095
; COOLING_NODE: 10
M204 S250
G1 X171.33 Y155.763 F60000
G1 F12000
M204 S5000
G3 X170.869 Y155.61 I-.334 J.234 E.06274
G1 X170.971 Y155.59 E.00319
G3 X171.292 Y155.717 I.025 J.407 E.01095
; COOLING_NODE: 9
M204 S250
G1 X171.33 Y158.763 F60000
G1 F12000
M204 S5000
G3 X170.869 Y158.61 I-.334 J.234 E.06274
G1 X170.971 Y158.59 E.00319
G3 X171.292 Y158.717 I.025 J.407 E.01095
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X171.402 Y158.914 E-.08552
G1 X171.407 Y155.059 E-.05534
G1 X171.333 Y155.241 E-.07445
G1 X171.23 Y155.34 E-.05457
G1 X171.103 Y155.398 E-.0528
G1 X170.965 Y155.409 E-.05271
G1 X170.954 Y155.406 E-.0046
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.315 J-1.175 P1  F60000
G1 X170.33 Y155.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.869 Y158.61 I-.333 J-.239 E.04757
G1 X169.971 Y158.59 E.00319
G3 X170.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X170.23 Y155.34 E-.07671
G1 X170.103 Y155.398 E-.0528
G1 X169.965 Y155.409 E-.05271
G1 X169.794 Y155.355 E-.0681
G1 X169.67 Y155.244 E-.06346
G1 X169.607 Y155.12 E-.05271
G1 X169.603 Y155.085 E-.0135
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.029 J.649 P1  F60000
G1 X170.33 Y160.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.869 Y155.61 I-.333 J-.239 E.04757
G1 X169.971 Y155.59 E.00319
G3 X170.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 6
M204 S250
G1 X170.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X169.869 Y160.61 I-.35 J.213 E.0623
G1 X169.971 Y160.59 E.00319
G3 X170.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 46
M204 S250
G1 X169.329 Y160.764 F60000
G1 F12000
M204 S5000
G3 X168.869 Y160.61 I-.333 J.231 E.06235
G1 X168.971 Y160.59 E.00319
G3 X169.292 Y160.717 I.025 J.405 E.01093
; COOLING_NODE: 47
M204 S250
G1 X168.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X167.869 Y160.61 I-.35 J.213 E.0623
G1 X167.971 Y160.59 E.00319
G3 X168.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 42
M204 S250
G1 X168.33 Y160.238 F60000
G1 F12000
M204 S5000
G3 X167.869 Y155.61 I-.333 J-.239 E.04757
G1 X167.971 Y155.59 E.00319
G3 X168.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.23 Y160.34 E-.07671
G1 X168.103 Y160.398 E-.0528
G1 X167.924 Y160.404 E-.06807
G1 X167.77 Y160.34 E-.06341
G1 X167.67 Y160.244 E-.05282
G1 X167.607 Y160.12 E-.0527
G1 X167.603 Y160.085 E-.0135
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.925 J-.791 P1  F60000
G1 X167.347 Y155.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.869 Y155.61 I-.35 J.213 E.0623
M73 P64 R7
G1 X166.971 Y155.59 E.00319
G3 X167.312 Y155.737 I.026 J.409 E.01183
; COOLING_NODE: 50
M204 S250
G1 X167.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X166.869 Y158.61 I-.35 J.213 E.0623
G1 X166.971 Y158.59 E.00319
G3 X167.312 Y158.737 I.026 J.409 E.01183
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 43
; WIPE_START
G1 X166.495 Y158.374 E-.07737
G1 X166.396 Y158.469 E-.05188
G1 X166.254 Y158.7 E-.10317
G1 X166.214 Y158.83 E-.05185
G1 X166.196 Y158.966 E-.05183
G1 X166.211 Y155.08 E-.04391
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.091 J1.214 P1  F60000
G1 X168.33 Y155.238 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.869 Y158.61 I-.333 J-.239 E.04757
G1 X167.971 Y158.59 E.00319
G3 X168.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.23 Y155.34 E-.07671
G1 X168.103 Y155.398 E-.0528
G1 X167.924 Y155.404 E-.06807
G1 X167.77 Y155.34 E-.06341
G1 X167.67 Y155.244 E-.05282
G1 X167.607 Y155.12 E-.0527
G1 X167.603 Y155.085 E-.01349
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.223 J1.196 P1  F60000
G1 X169.329 Y158.764 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y158.61 I-.333 J.231 E.06235
G1 X168.971 Y158.59 E.00319
G3 X169.292 Y158.717 I.025 J.405 E.01093
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.402 Y158.914 E-.08549
G1 X169.407 Y155.059 E-.05534
G1 X169.333 Y155.241 E-.07445
G1 X169.23 Y155.34 E-.05457
G1 X169.103 Y155.398 E-.0528
G1 X168.953 Y155.403 E-.05735
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.842 J.879 P1  F60000
G1 X169.329 Y155.764 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y155.61 I-.333 J.231 E.06235
G1 X168.971 Y155.59 E.00319
G3 X169.292 Y155.717 I.025 J.405 E.01093
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X169.402 Y155.914 E-.08549
G1 X169.407 Y160.059 E-.05534
G1 X169.333 Y160.241 E-.07445
G1 X169.23 Y160.34 E-.05457
G1 X169.103 Y160.398 E-.0528
G1 X168.953 Y160.403 E-.05735
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.283 J-1.184 P1  F60000
G1 X167.347 Y160.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.869 Y160.61 I-.35 J.213 E.0623
G1 X166.971 Y160.59 E.00319
G3 X167.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X167.402 Y160.914 E-.07511
G1 X167.407 Y161.059 E-.05534
G1 X167.333 Y161.241 E-.07445
G1 X167.23 Y161.34 E-.05457
G1 X167.103 Y161.398 E-.0528
G1 X166.925 Y161.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.068 J1.215 P1  F60000
G1 X178.33 Y160.763 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y160.61 I-.334 J.234 E.06274
G1 X177.971 Y160.59 E.00319
G3 X178.292 Y160.717 I.025 J.407 E.01095
; COOLING_NODE: 27
M204 S250
G1 X178.33 Y155.763 F60000
G1 F12000
M204 S5000
G3 X177.869 Y155.61 I-.334 J.234 E.06274
G1 X177.971 Y155.59 E.00319
G3 X178.292 Y155.717 I.025 J.407 E.01095
; COOLING_NODE: 22
M204 S250
G1 X178.33 Y158.763 F60000
G1 F12000
M204 S5000
G3 X177.869 Y158.61 I-.334 J.234 E.06274
G1 X177.971 Y158.59 E.00319
G3 X178.292 Y158.717 I.025 J.407 E.01095
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.402 Y158.914 E-.08553
G1 X178.407 Y155.059 E-.05534
G1 X178.333 Y155.241 E-.07445
G1 X178.23 Y155.34 E-.05457
G1 X178.103 Y155.398 E-.0528
G1 X177.965 Y155.409 E-.05273
G1 X177.954 Y155.406 E-.00458
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.147 J1.208 P1  F60000
G1 X179.33 Y155.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y158.61 I-.333 J-.239 E.04757
G1 X178.971 Y158.59 E.00319
G3 X179.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X179.23 Y155.34 E-.07671
G1 X179.103 Y155.398 E-.0528
G1 X178.924 Y155.404 E-.06807
G1 X178.77 Y155.34 E-.06341
G1 X178.67 Y155.244 E-.05282
G1 X178.607 Y155.12 E-.0527
G1 X178.603 Y155.085 E-.01349
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.029 J.649 P1  F60000
G1 X179.33 Y160.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y155.61 I-.333 J-.239 E.04757
G1 X178.971 Y155.59 E.00319
G3 X179.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 31
M204 S250
G1 X179.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X178.869 Y160.61 I-.35 J.213 E.0623
G1 X178.971 Y160.59 E.00319
G3 X179.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.402 Y160.914 E-.07511
G1 X179.407 Y161.059 E-.05534
G1 X179.333 Y161.241 E-.07445
G1 X179.23 Y161.34 E-.05457
G1 X179.103 Y161.398 E-.0528
G1 X178.925 Y161.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.485 J1.116 P1  F60000
G1 X180.347 Y160.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y160.61 I-.35 J.213 E.0623
G1 X179.971 Y160.59 E.00319
G3 X180.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.402 Y160.914 E-.07511
G1 X180.407 Y161.059 E-.05534
G1 X180.333 Y161.241 E-.07445
G1 X180.23 Y161.34 E-.05457
G1 X180.103 Y161.398 E-.0528
G1 X179.958 Y161.409 E-.05536
G1 X179.928 Y161.398 E-.01238
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.482 J1.118 P1  F60000
G1 X181.347 Y160.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y160.61 I-.35 J.213 E.0623
G1 X180.971 Y160.59 E.00319
G3 X181.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.402 Y160.914 E-.07511
G1 X181.407 Y161.059 E-.05534
G1 X181.333 Y161.241 E-.07445
G1 X181.23 Y161.34 E-.05457
G1 X181.103 Y161.398 E-.0528
G1 X180.925 Y161.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.485 J1.116 P1  F60000
G1 X182.347 Y160.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y160.61 I-.35 J.213 E.0623
G1 X181.971 Y160.59 E.00319
G3 X182.312 Y160.737 I.026 J.409 E.01183
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.402 Y160.914 E-.07511
G1 X182.407 Y161.059 E-.05534
G1 X182.333 Y161.241 E-.07445
G1 X182.23 Y161.34 E-.05457
G1 X182.103 Y161.398 E-.0528
G1 X181.925 Y161.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.142 J1.209 P1  F60000
G1 X183.33 Y161.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.869 Y160.61 I-.333 J-.239 E.04754
G1 X182.971 Y160.59 E.00319
G3 X183.361 Y161.187 I.026 J.409 E.02656
; COOLING_NODE: 36
M204 S250
G1 X183.33 Y160.238 F60000
G1 F12000
M204 S5000
G3 X182.869 Y155.61 I-.333 J-.239 E.04754
G1 X182.971 Y155.59 E.00319
G3 X183.361 Y160.187 I.026 J.409 E.02656
; COOLING_NODE: 41
M204 S250
G1 X183.33 Y155.238 F60000
G1 F12000
M204 S5000
G3 X182.869 Y158.61 I-.333 J-.239 E.04753
G1 X182.971 Y158.59 E.00319
G3 X183.361 Y155.187 I.026 J.409 E.02656
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X183.23 Y155.34 E-.0767
G1 X183.103 Y155.398 E-.0528
G1 X182.897 Y155.398 E-.07862
G1 X182.77 Y155.34 E-.05276
G1 X182.67 Y155.244 E-.05277
G1 X182.607 Y155.12 E-.05273
G1 X182.603 Y155.085 E-.01361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.598 J-1.06 P1  F60000
G1 X182.33 Y155.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y158.61 I-.333 J-.239 E.04757
G1 X181.971 Y158.59 E.00319
G3 X182.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.23 Y155.34 E-.07671
G1 X182.103 Y155.398 E-.0528
G1 X181.924 Y155.404 E-.06807
G1 X181.77 Y155.34 E-.06341
G1 X181.67 Y155.244 E-.05282
G1 X181.607 Y155.12 E-.0527
G1 X181.603 Y155.085 E-.01349
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.029 J.649 P1  F60000
G1 X182.33 Y160.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y155.61 I-.333 J-.239 E.04757
G1 X181.971 Y155.59 E.00319
G3 X182.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X182.23 Y160.34 E-.07671
G1 X182.103 Y160.398 E-.0528
G1 X181.924 Y160.404 E-.06807
G1 X181.77 Y160.34 E-.06341
G1 X181.67 Y160.244 E-.05282
G1 X181.607 Y160.12 E-.0527
G1 X181.603 Y160.085 E-.0135
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.925 J-.791 P1  F60000
G1 X181.347 Y155.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y155.61 I-.35 J.213 E.0623
G1 X180.971 Y155.59 E.00319
G3 X181.312 Y155.737 I.026 J.409 E.01183
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X181.402 Y155.914 E-.07511
G1 X181.407 Y160.059 E-.05534
G1 X181.333 Y160.241 E-.07445
G1 X181.23 Y160.34 E-.05457
G1 X181.103 Y160.398 E-.0528
G1 X180.925 Y160.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.326 J-1.173 P1  F60000
G1 X180.33 Y160.238 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y155.61 I-.333 J-.239 E.04757
G1 X179.971 Y155.59 E.00319
G3 X180.362 Y160.187 I.026 J.409 E.02657
; COOLING_NODE: 24
M204 S250
G1 X180.33 Y155.238 F60000
G1 F12000
M204 S5000
G3 X179.869 Y158.61 I-.333 J-.239 E.04757
G1 X179.971 Y158.59 E.00319
G3 X180.362 Y155.187 I.026 J.409 E.02657
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X180.23 Y155.34 E-.07671
G1 X180.103 Y155.398 E-.0528
G1 X179.958 Y155.409 E-.05536
G1 X179.774 Y155.343 E-.07442
G1 X179.67 Y155.244 E-.05465
G1 X179.607 Y155.12 E-.0527
G1 X179.603 Y155.085 E-.01337
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I.206 J1.199 P1  F60000
G1 X181.347 Y158.786 Z2
G1 Z1.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y158.61 I-.35 J.213 E.0623
G1 X180.971 Y158.59 E.00319
G3 X181.312 Y158.737 I.026 J.409 E.01183
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X181.402 Y158.914 E-.07511
G1 X181.407 Y155.059 E-.05534
G1 X181.333 Y155.241 E-.07445
G1 X181.23 Y155.34 E-.05457
G1 X181.103 Y155.398 E-.0528
G1 X180.925 Y155.404 E-.06773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-.71 J.988 P1  F60000
G1 X184.398 Y161.898 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.637 Y160.501 I-.377 J-.724 E.04698
G2 X183.637 Y155.501 I-.677 J-.5 E.03552
G2 X183.358 Y158.275 I-.654 J-.496 E.04753
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
M204 S10000
G1 X184.007 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.315852
G1 F15000
M204 S8000
G1 X184.061 Y161.424 E.00612
; LINE_WIDTH: 0.292725
G1 X184.078 Y161.303 E.00249
; LINE_WIDTH: 0.242663
G2 X184.088 Y160.757 I-2.281 J-.314 E.00892
; LINE_WIDTH: 0.270275
G1 X184.074 Y160.662 E.00178
; LINE_WIDTH: 0.303595
G2 X184.053 Y160.537 I-1.147 J.123 E.00269
; LINE_WIDTH: 0.329116
G3 X184.061 Y160.424 I.193 J-.043 E.00266
; LINE_WIDTH: 0.29271
G1 X184.078 Y160.303 E.00249
; LINE_WIDTH: 0.242661
G2 X184.088 Y155.757 I-2.28 J-.314 E.00892
; LINE_WIDTH: 0.270275
G1 X184.074 Y155.662 E.00178
; LINE_WIDTH: 0.303595
G2 X184.053 Y155.537 I-1.147 J.123 E.00269
; LINE_WIDTH: 0.329116
G3 X184.061 Y155.424 I.193 J-.043 E.00266
; LINE_WIDTH: 0.29271
G1 X184.078 Y155.303 E.00249
; LINE_WIDTH: 0.242662
G2 X184.088 Y158.757 I-2.281 J-.314 E.00892
; LINE_WIDTH: 0.270279
G1 X184.074 Y158.662 E.00178
; LINE_WIDTH: 0.313662
G2 X184.006 Y158.306 I-3.271 J.441 E.008
; WIPE_START
G1 X184.074 Y158.662 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.162 J-.363 P1  F60000
G1 X183.141 Y161.643 Z2
G1 Z1.6
G1 E.4 F1800
; LINE_WIDTH: 0.609565
G1 F13235.814
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574623
G1 F14105.618
G3 X182.196 Y161.839 I-.347 J-1.717 E.00644
; LINE_WIDTH: 0.538188
G1 F15000
G3 X181.816 Y161.84 I-.199 J-2.371 E.01536
; LINE_WIDTH: 0.570154
G1 F14225.196
G1 X181.679 Y161.82 E.00595
; LINE_WIDTH: 0.602686
G1 F13398.46
G1 X181.619 Y161.808 E.0028
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609565
G1 F13235.814
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574623
G1 F14105.618
G3 X168.196 Y161.839 I-.347 J-1.717 E.00644
; LINE_WIDTH: 0.538188
G1 F15000
G3 X167.816 Y161.84 I-.199 J-2.371 E.01536
; LINE_WIDTH: 0.570154
G1 F14225.196
G1 X167.679 Y161.82 E.00595
; LINE_WIDTH: 0.602686
G1 F13398.46
G1 X166.856 Y161.652 E.0383
M204 S10000
G1 X166.246 Y161.694 F60000
; LINE_WIDTH: 0.353308
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00818
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298165
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278653
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243527
G3 X165.91 Y160.774 I2.425 J-.325 E.00894
; LINE_WIDTH: 0.266451
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.29458
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311815
G1 X166.014 Y160.194 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.251902
G1 F15000
M204 S8000
G1 X166.05 Y160.504 E.00127
; LINE_WIDTH: 0.289979
G1 X165.976 Y160.503 E.0015
; LINE_WIDTH: 0.328478
G1 X165.956 Y160.503 E.00045
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297413
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278687
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243525
G3 X165.91 Y155.774 I2.426 J-.325 E.00895
; LINE_WIDTH: 0.266453
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294585
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311815
G1 X166.014 Y155.194 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.251902
G1 F15000
M204 S8000
G1 X166.05 Y155.504 E.00127
; LINE_WIDTH: 0.289979
G1 X165.976 Y155.503 E.0015
; LINE_WIDTH: 0.328478
G1 X165.956 Y155.503 E.00045
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297413
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278687
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243525
G3 X165.91 Y158.774 I2.426 J-.325 E.00895
; LINE_WIDTH: 0.266454
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294585
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.31183
G1 X165.992 Y158.306 E.00624
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 9/25
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.155 J1.207 P1  F60000
G1 X175.351 Y155.792 Z2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.869 Y155.61 I-.353 J.208 E.06209
G1 X174.969 Y155.591 E.00312
G3 X175.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X175.411 Y155.977 E-.09619
G1 X175.393 Y160.12 E-.0548
G1 X175.306 Y160.274 E-.06716
G1 X175.235 Y160.338 E-.03626
G1 X175.104 Y160.397 E-.05475
G1 X174.965 Y160.409 E-.0528
G1 X174.919 Y160.397 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X176.351 Y155.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y155.61 I-.353 J.208 E.06209
G1 X175.969 Y155.591 E.00312
G3 X176.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.411 Y155.977 E-.09619
G1 X176.393 Y160.12 E-.0548
G1 X176.306 Y160.274 E-.06716
G1 X176.235 Y160.338 E-.03626
G1 X176.104 Y160.397 E-.05475
G1 X175.965 Y160.409 E-.0528
G1 X175.919 Y160.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.821 J.898 P1  F60000
G1 X176.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y160.61 I-.353 J.208 E.06209
G1 X175.969 Y160.591 E.00312
G3 X176.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 3
M204 S250
G1 X175.351 Y160.792 F60000
G1 F12000
M204 S5000
G3 X174.869 Y160.61 I-.353 J.208 E.06209
G1 X174.969 Y160.591 E.00312
G3 X175.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X175.411 Y160.977 E-.0962
G1 X175.393 Y161.12 E-.05479
G1 X175.306 Y161.274 E-.06717
G1 X175.235 Y161.338 E-.03626
G1 X175.104 Y161.397 E-.05475
G1 X174.965 Y161.409 E-.0528
G1 X174.919 Y161.397 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.767 J-.945 P1  F60000
G1 X172.304 Y155.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y158.61 I-.307 J-.272 E.04623
G1 X171.969 Y158.591 E.00312
G3 X172.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X172.235 Y155.338 E-.05881
G1 X172.104 Y155.397 E-.05475
G1 X171.965 Y155.409 E-.05278
G1 X171.825 Y155.372 E-.05524
G1 X171.673 Y155.249 E-.07438
G1 X171.607 Y155.12 E-.05477
G1 X171.597 Y155.044 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.205 J-.171 P1  F60000
G1 X171.349 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y160.61 I-.353 J.205 E.06166
G1 X170.969 Y160.591 E.00312
G3 X171.315 Y160.743 I.028 J.407 E.01209
; COOLING_NODE: 6
M204 S250
G1 X170.349 Y160.792 F60000
G1 F12000
M204 S5000
G3 X169.869 Y160.61 I-.353 J.205 E.06166
M104 T0 S210 N0 ;Multi extruder pre heating
G1 X169.969 Y160.591 E.00312
G3 X170.315 Y160.743 I.028 J.407 E.01209
; COOLING_NODE: 7
M204 S250
G1 X170.3 Y160.269 F60000
G1 F12000
M204 S5000
G3 X169.869 Y155.61 I-.304 J-.272 E.04592
G1 X169.969 Y155.591 E.00312
G3 X170.337 Y160.222 I.028 J.407 E.02783
; COOLING_NODE: 8
M204 S250
G1 X170.3 Y155.269 F60000
G1 F12000
M204 S5000
G3 X169.869 Y158.61 I-.304 J-.272 E.04592
G1 X169.969 Y158.591 E.00312
G3 X170.337 Y155.222 I.028 J.407 E.02783
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X170.235 Y155.338 E-.05883
G1 X170.104 Y155.397 E-.05475
G1 X169.965 Y155.409 E-.05278
G1 X169.831 Y155.374 E-.05276
G1 X169.716 Y155.297 E-.05275
G1 X169.607 Y155.12 E-.07865
G1 X169.597 Y155.043 E-.02948
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.173 J1.205 P1  F60000
G1 X171.349 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y158.61 I-.353 J.205 E.06166
G1 X170.969 Y158.591 E.00312
G3 X171.315 Y158.743 I.028 J.407 E.01209
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.411 Y158.977 E-.09614
G1 X171.393 Y155.12 E-.0548
G1 X171.306 Y155.274 E-.06716
G1 X171.235 Y155.338 E-.03626
G1 X171.104 Y155.397 E-.05475
G1 X170.965 Y155.409 E-.05278
G1 X170.919 Y155.397 E-.01811
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.823 J.896 P1  F60000
G1 X171.349 Y155.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y155.61 I-.353 J.205 E.06166
G1 X170.969 Y155.591 E.00312
G3 X171.315 Y155.743 I.028 J.407 E.01209
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.411 Y155.977 E-.09614
G1 X171.393 Y160.12 E-.0548
G1 X171.306 Y160.274 E-.06716
G1 X171.235 Y160.338 E-.03626
G1 X171.104 Y160.397 E-.05475
G1 X170.965 Y160.409 E-.05278
G1 X170.919 Y160.397 E-.01811
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.11 J1.212 P1  F60000
G1 X172.304 Y160.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y155.61 I-.307 J-.272 E.04623
G1 X171.969 Y155.591 E.00312
G3 X172.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 12
M204 S250
G1 X172.351 Y160.792 F60000
G1 F12000
M204 S5000
G3 X171.869 Y160.61 I-.353 J.208 E.06209
G1 X171.969 Y160.591 E.00312
G3 X172.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X172.411 Y160.977 E-.09618
G1 X172.393 Y161.12 E-.05479
G1 X172.306 Y161.274 E-.06717
G1 X172.235 Y161.338 E-.03626
G1 X172.104 Y161.397 E-.05475
G1 X171.965 Y161.409 E-.05278
G1 X171.919 Y161.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.109 J1.212 P1  F60000
G1 X173.304 Y161.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.869 Y160.61 I-.307 J-.272 E.04623
G1 X172.969 Y160.591 E.00312
G3 X173.34 Y161.224 I.028 J.409 E.02797
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.235 Y161.338 E-.05882
G1 X173.104 Y161.397 E-.05475
G1 X172.965 Y161.409 E-.05278
G1 X172.825 Y161.372 E-.05524
G1 X172.673 Y161.249 E-.07438
G1 X172.607 Y161.12 E-.05479
G1 X172.597 Y161.044 E-.02923
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.173 J1.205 P1  F60000
G1 X174.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.869 Y160.61 I-.353 J.208 E.06209
G1 X173.969 Y160.591 E.00312
G3 X174.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 15
M204 S250
G1 X174.351 Y155.792 F60000
G1 F12000
M204 S5000
G3 X173.869 Y155.61 I-.353 J.208 E.06209
G1 X173.969 Y155.591 E.00312
G3 X174.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.411 Y155.977 E-.09619
G1 X174.393 Y160.12 E-.0548
G1 X174.306 Y160.274 E-.06716
G1 X174.235 Y160.338 E-.03626
G1 X174.104 Y160.397 E-.05475
G1 X173.965 Y160.409 E-.0528
G1 X173.919 Y160.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.242 J-1.193 P1  F60000
G1 X173.304 Y160.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.869 Y155.61 I-.307 J-.272 E.04623
G1 X172.969 Y155.591 E.00312
G3 X173.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 17
M204 S250
G1 X173.304 Y155.272 F60000
G1 F12000
M204 S5000
G3 X172.869 Y158.61 I-.307 J-.272 E.04623
G1 X172.969 Y158.591 E.00312
G3 X173.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.235 Y155.338 E-.05881
G1 X173.104 Y155.397 E-.05475
G1 X172.965 Y155.409 E-.05278
G1 X172.825 Y155.372 E-.05524
G1 X172.673 Y155.249 E-.07438
G1 X172.607 Y155.12 E-.05477
G1 X172.597 Y155.044 E-.02926
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.173 J1.205 P1  F60000
G1 X174.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.869 Y158.61 I-.353 J.208 E.06209
G1 X173.969 Y158.591 E.00312
G3 X174.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.411 Y158.977 E-.09619
G1 X174.393 Y155.12 E-.0548
G1 X174.306 Y155.274 E-.06716
G1 X174.235 Y155.338 E-.03626
G1 X174.104 Y155.397 E-.05475
G1 X173.965 Y155.409 E-.0528
G1 X173.919 Y155.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X175.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.869 Y158.61 I-.353 J.208 E.06209
G1 X174.969 Y158.591 E.00312
G3 X175.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.411 Y158.977 E-.0962
G1 X175.393 Y155.12 E-.0548
G1 X175.306 Y155.274 E-.06716
G1 X175.235 Y155.338 E-.03626
G1 X175.104 Y155.397 E-.05475
G1 X174.965 Y155.409 E-.0528
G1 X174.919 Y155.397 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X176.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y158.61 I-.353 J.208 E.06209
G1 X175.969 Y158.591 E.00312
G3 X176.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.411 Y158.977 E-.09619
G1 X176.393 Y155.12 E-.0548
G1 X176.306 Y155.274 E-.06716
G1 X176.235 Y155.338 E-.03626
G1 X176.104 Y155.397 E-.05475
G1 X175.965 Y155.409 E-.0528
G1 X175.919 Y155.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X177.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y158.61 I-.353 J.208 E.06209
G1 X176.969 Y158.591 E.00312
G3 X177.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.411 Y158.977 E-.09619
G1 X177.393 Y155.12 E-.0548
G1 X177.306 Y155.274 E-.06716
G1 X177.235 Y155.338 E-.03626
G1 X177.104 Y155.397 E-.05475
G1 X176.965 Y155.409 E-.0528
G1 X176.919 Y155.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X178.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y158.61 I-.353 J.208 E.06209
G1 X177.969 Y158.591 E.00312
G3 X178.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.411 Y158.977 E-.09619
G1 X178.393 Y155.12 E-.0548
G1 X178.306 Y155.274 E-.06716
G1 X178.235 Y155.338 E-.03626
G1 X178.104 Y155.397 E-.05475
G1 X177.965 Y155.409 E-.0528
G1 X177.919 Y155.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.109 J1.212 P1  F60000
G1 X179.304 Y155.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y158.61 I-.307 J-.272 E.04623
G1 X178.969 Y158.591 E.00312
G3 X179.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 24
M204 S250
G1 X180.3 Y155.269 F60000
G1 F12000
M204 S5000
G3 X179.869 Y158.61 I-.304 J-.272 E.04591
G1 X179.969 Y158.591 E.00312
G3 X180.337 Y155.222 I.028 J.407 E.02783
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.235 Y155.338 E-.05883
G1 X180.104 Y155.397 E-.05475
G1 X179.965 Y155.409 E-.0528
G1 X179.831 Y155.374 E-.05273
G1 X179.716 Y155.297 E-.05276
G1 X179.607 Y155.12 E-.07865
G1 X179.597 Y155.043 E-.02948
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.056 J.605 P1  F60000
G1 X180.3 Y160.269 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y155.61 I-.304 J-.272 E.04591
G1 X179.969 Y155.591 E.00312
G3 X180.337 Y160.222 I.028 J.407 E.02783
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.235 Y160.338 E-.05884
G1 X180.104 Y160.397 E-.05475
G1 X179.965 Y160.409 E-.0528
G1 X179.831 Y160.374 E-.05273
G1 X179.716 Y160.297 E-.05276
G1 X179.607 Y160.12 E-.07865
G1 X179.597 Y160.043 E-.02948
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.748 J-.96 P1  F60000
G1 X179.304 Y160.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y155.61 I-.307 J-.272 E.04623
G1 X178.969 Y155.591 E.00312
G3 X179.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.235 Y160.338 E-.05881
G1 X179.104 Y160.397 E-.05475
G1 X178.965 Y160.409 E-.05278
G1 X178.825 Y160.372 E-.05524
G1 X178.673 Y160.249 E-.07438
G1 X178.607 Y160.12 E-.05477
G1 X178.597 Y160.044 E-.02926
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.87 J-.851 P1  F60000
G1 X178.351 Y155.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y155.61 I-.353 J.208 E.06209
G1 X177.969 Y155.591 E.00312
G3 X178.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 28
M204 S250
G1 X177.351 Y155.792 F60000
G1 F12000
M204 S5000
G3 X176.869 Y155.61 I-.353 J.208 E.06209
G1 X176.969 Y155.591 E.00312
M73 P65 R7
G3 X177.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.411 Y155.977 E-.09619
G1 X177.393 Y160.12 E-.0548
G1 X177.306 Y160.274 E-.06716
G1 X177.235 Y160.338 E-.03626
G1 X177.104 Y160.397 E-.05475
G1 X176.965 Y160.409 E-.0528
G1 X176.919 Y160.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.821 J.898 P1  F60000
G1 X177.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y160.61 I-.353 J.208 E.06209
G1 X176.969 Y160.591 E.00312
G3 X177.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.411 Y160.977 E-.0962
G1 X177.393 Y161.12 E-.05479
G1 X177.306 Y161.274 E-.06717
G1 X177.235 Y161.338 E-.03626
G1 X177.104 Y161.397 E-.05475
G1 X176.965 Y161.409 E-.0528
G1 X176.919 Y161.397 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X178.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y160.61 I-.353 J.208 E.06209
G1 X177.969 Y160.591 E.00312
G3 X178.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.411 Y160.977 E-.0962
G1 X178.393 Y161.12 E-.05479
G1 X178.306 Y161.274 E-.06717
G1 X178.235 Y161.338 E-.03626
G1 X178.104 Y161.397 E-.05475
G1 X177.965 Y161.409 E-.0528
G1 X177.919 Y161.397 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X179.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y160.61 I-.353 J.208 E.06209
G1 X178.969 Y160.591 E.00312
G3 X179.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.411 Y160.977 E-.09619
G1 X179.393 Y161.12 E-.05479
G1 X179.306 Y161.274 E-.06717
G1 X179.235 Y161.338 E-.03626
G1 X179.104 Y161.397 E-.05475
G1 X178.965 Y161.409 E-.05278
G1 X178.919 Y161.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X180.349 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y160.61 I-.353 J.205 E.06166
G1 X179.969 Y160.591 E.00312
G3 X180.315 Y160.743 I.028 J.407 E.01209
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.411 Y160.977 E-.09613
G1 X180.393 Y161.12 E-.05479
G1 X180.306 Y161.274 E-.06717
G1 X180.235 Y161.338 E-.03626
G1 X180.104 Y161.397 E-.05475
G1 X179.965 Y161.409 E-.0528
G1 X179.919 Y161.397 E-.0181
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X181.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y160.61 I-.353 J.208 E.06209
G1 X180.969 Y160.591 E.00312
G3 X181.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.411 Y160.977 E-.09619
G1 X181.393 Y161.12 E-.05479
G1 X181.306 Y161.274 E-.06717
G1 X181.235 Y161.338 E-.03626
G1 X181.104 Y161.397 E-.05475
G1 X180.965 Y161.409 E-.05278
G1 X180.919 Y161.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.474 J1.121 P1  F60000
G1 X182.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y160.61 I-.353 J.208 E.06209
G1 X181.969 Y160.591 E.00312
G3 X182.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.411 Y160.977 E-.09619
G1 X182.393 Y161.12 E-.05479
G1 X182.306 Y161.274 E-.06717
G1 X182.235 Y161.338 E-.03626
G1 X182.104 Y161.397 E-.05475
G1 X181.965 Y161.409 E-.05278
G1 X181.919 Y161.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.109 J1.212 P1  F60000
G1 X183.304 Y161.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.869 Y160.61 I-.307 J-.272 E.04623
G1 X182.969 Y160.591 E.00312
G3 X183.34 Y161.224 I.028 J.409 E.02797
; COOLING_NODE: 36
M204 S250
G1 X183.304 Y160.272 F60000
G1 F12000
M204 S5000
G3 X182.869 Y155.61 I-.307 J-.272 E.04623
G1 X182.969 Y155.591 E.00312
G3 X183.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X183.235 Y160.338 E-.05881
G1 X183.104 Y160.397 E-.05475
G1 X182.965 Y160.409 E-.05278
G1 X182.825 Y160.372 E-.05524
G1 X182.673 Y160.249 E-.07439
G1 X182.607 Y160.12 E-.05476
G1 X182.597 Y160.044 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.746 J-.961 P1  F60000
G1 X182.304 Y160.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y155.61 I-.307 J-.272 E.04623
G1 X181.969 Y155.591 E.00312
G3 X182.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 38
M204 S250
G1 X182.304 Y155.272 F60000
G1 F12000
M204 S5000
G3 X181.869 Y158.61 I-.307 J-.272 E.04623
G1 X181.969 Y158.591 E.00312
G3 X182.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.235 Y155.338 E-.05881
G1 X182.104 Y155.397 E-.05475
G1 X181.965 Y155.409 E-.05278
G1 X181.825 Y155.372 E-.05524
G1 X181.673 Y155.249 E-.07438
G1 X181.607 Y155.12 E-.05477
G1 X181.597 Y155.044 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.87 J-.851 P1  F60000
G1 X181.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y158.61 I-.353 J.208 E.06209
G1 X180.969 Y158.591 E.00312
G3 X181.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.411 Y158.977 E-.09618
G1 X181.393 Y155.12 E-.0548
G1 X181.306 Y155.274 E-.06716
G1 X181.235 Y155.338 E-.03626
G1 X181.104 Y155.397 E-.05475
G1 X180.965 Y155.409 E-.05278
G1 X180.919 Y155.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.821 J.898 P1  F60000
G1 X181.351 Y155.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y155.61 I-.353 J.208 E.06209
G1 X180.969 Y155.591 E.00312
G3 X181.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X181.411 Y155.977 E-.09618
G1 X181.393 Y160.12 E-.0548
G1 X181.306 Y160.274 E-.06716
G1 X181.235 Y160.338 E-.03626
G1 X181.104 Y160.397 E-.05475
G1 X180.965 Y160.409 E-.05278
G1 X180.919 Y160.397 E-.01806
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.519 J1.101 P1  F60000
G1 X183.304 Y155.272 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.869 Y158.61 I-.307 J-.272 E.04623
G1 X182.969 Y158.591 E.00312
G3 X183.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.235 Y155.338 E-.05881
G1 X183.104 Y155.397 E-.05475
G1 X182.965 Y155.409 E-.05278
G1 X182.825 Y155.372 E-.05524
G1 X182.673 Y155.249 E-.07439
G1 X182.607 Y155.12 E-.05476
G1 X182.597 Y155.044 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.029 J.649 P1  F60000
G1 X184.398 Y161.898 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.627 Y160.5 I-.364 J-.716 E.0472
G2 X183.627 Y155.5 I-.628 J-.5 E.03581
G2 X183.358 Y158.275 I-.64 J-.502 E.0475
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 42
; WIPE_START
G1 X183.41 Y161.898 E-.37598
G1 X183.408 Y161.888 E-.00402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.129 J-1.21 P1  F60000
G1 X168.304 Y160.272 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.869 Y155.61 I-.307 J-.272 E.04623
G1 X167.969 Y155.591 E.00312
G3 X168.34 Y160.224 I.028 J.409 E.02797
; COOLING_NODE: 43
M204 S250
G1 X168.304 Y155.272 F60000
G1 F12000
M204 S5000
G3 X167.869 Y158.61 I-.307 J-.272 E.04623
G1 X167.969 Y158.591 E.00312
G3 X168.34 Y155.224 I.028 J.409 E.02797
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.235 Y155.338 E-.05881
G1 X168.104 Y155.397 E-.05475
G1 X167.965 Y155.409 E-.05278
G1 X167.825 Y155.372 E-.05524
G1 X167.673 Y155.249 E-.07438
G1 X167.607 Y155.12 E-.05477
G1 X167.597 Y155.044 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.173 J1.205 P1  F60000
G1 X169.351 Y158.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y158.61 I-.353 J.208 E.06209
G1 X168.969 Y158.591 E.00312
G3 X169.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.411 Y158.977 E-.09619
G1 X169.393 Y155.12 E-.0548
G1 X169.306 Y155.274 E-.06716
G1 X169.235 Y155.338 E-.03626
G1 X169.104 Y155.397 E-.05475
G1 X168.965 Y155.409 E-.0528
G1 X168.919 Y155.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.821 J.898 P1  F60000
G1 X169.351 Y155.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y155.61 I-.353 J.208 E.06209
G1 X168.969 Y155.591 E.00312
G3 X169.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.411 Y155.977 E-.09619
G1 X169.393 Y160.12 E-.0548
G1 X169.306 Y160.274 E-.06716
G1 X169.235 Y160.338 E-.03626
G1 X169.104 Y160.397 E-.05475
G1 X168.965 Y160.409 E-.0528
G1 X168.919 Y160.397 E-.01804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.821 J.898 P1  F60000
G1 X169.351 Y160.792 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y160.61 I-.353 J.208 E.06209
G1 X168.969 Y160.591 E.00312
G3 X169.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 47
M204 S250
G1 X168.351 Y160.792 F60000
G1 F12000
M204 S5000
G3 X167.869 Y160.61 I-.353 J.208 E.06209
G1 X167.969 Y160.591 E.00312
G3 X168.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 48
M204 S250
G1 X167.351 Y160.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y160.61 I-.353 J.208 E.06209
G1 X166.969 Y160.591 E.00312
G3 X167.316 Y160.742 I.028 J.409 E.01211
; COOLING_NODE: 49
M204 S250
G1 X167.351 Y155.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y155.61 I-.353 J.208 E.06209
G1 X166.969 Y155.591 E.00312
G3 X167.316 Y155.742 I.028 J.409 E.01211
; COOLING_NODE: 50
M204 S250
G1 X167.351 Y158.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y158.61 I-.353 J.208 E.06209
G1 X166.969 Y158.591 E.00312
G3 X167.316 Y158.742 I.028 J.409 E.01211
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.369 Y155.504 I.376 J.728 E.04761
M73 P65 R6
G2 X166.369 Y160.504 I.649 J.5 E.03568
G2 X166.645 Y161.723 I.638 J.496 E.04738
G1 X166.593 Y161.898 E.00606
G1 X165.602 Y161.898 E.03288
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07734
G1 X166.385 Y158.479 E-.05771
G1 X166.284 Y158.632 E-.06963
G1 X166.216 Y158.812 E-.073
G1 X166.196 Y158.966 E-.05899
G1 X166.211 Y155.079 E-.04333
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.154 J.386 P1  F60000
G1 X184.056 Y161.438 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.33829
G1 F15000
M204 S8000
G1 X184.037 Y161.537 E.00244
G1 X183.772 Y161.694 E.00742
M204 S10000
G1 X184.056 Y161.438 F60000
; LINE_WIDTH: 0.300498
G1 F15000
M204 S8000
G1 X184.075 Y161.339 E.0021
; LINE_WIDTH: 0.278573
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.25976
G2 X183.999 Y160.136 I-3.958 J-.328 E.02103
M204 S10000
G1 X183.985 Y155.806 F60000
; LINE_WIDTH: 0.329153
G1 F15000
M204 S8000
G1 X184.03 Y155.573 E.00554
; LINE_WIDTH: 0.295966
G2 X184.078 Y155.32 I-2.965 J-.694 E.00531
; LINE_WIDTH: 0.257198
G2 X184.023 Y158.306 I-2.884 J-.353 E.01782
M204 S10000
G1 X183.999 Y155.136 F60000
; LINE_WIDTH: 0.259763
G1 F15000
M204 S8000
G3 X184.078 Y160.32 I-3.878 J.855 E.02103
; LINE_WIDTH: 0.295966
G3 X184.03 Y160.573 I-3.012 J-.44 E.00531
; LINE_WIDTH: 0.329153
G1 X183.985 Y160.806 E.00554
; WIPE_START
G1 X184.03 Y160.573 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.936 J-.777 P1  F60000
G1 X183.141 Y161.643 Z2.2
G1 Z1.8
G1 E.4 F1800
; LINE_WIDTH: 0.609579
G1 F13235.489
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574699
G1 F14103.621
G3 X182.196 Y161.839 I-.347 J-1.716 E.00643
; LINE_WIDTH: 0.54044
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.906 E.01773
; LINE_WIDTH: 0.583734
G1 F13867.988
G1 X181.644 Y161.814 E.00518
; LINE_WIDTH: 0.619084
G1 F13017.144
G1 X181.578 Y161.798 E.00321
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609579
G1 F13235.489
M204 S8000
G1 X168.343 Y161.816 E.00226
; LINE_WIDTH: 0.574699
G1 F14103.621
G3 X168.196 Y161.839 I-.347 J-1.716 E.00643
; LINE_WIDTH: 0.54044
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.906 E.01773
; LINE_WIDTH: 0.583734
G1 F13867.988
G1 X167.644 Y161.814 E.00518
; LINE_WIDTH: 0.619084
G1 F13017.144
G1 X166.875 Y161.635 E.03709
M204 S10000
G1 X166.244 Y161.694 F60000
; LINE_WIDTH: 0.353066
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00814
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.29818
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278652
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243977
G3 X165.912 Y160.749 I2.485 J-.329 E.00937
; LINE_WIDTH: 0.2778
G3 X165.935 Y160.612 I1.209 J.136 E.00267
; LINE_WIDTH: 0.322879
G1 X165.956 Y160.499 E.00261
; LINE_WIDTH: 0.328151
G1 X165.972 Y160.499 E.00038
; LINE_WIDTH: 0.297857
G1 X165.988 Y160.499 E.00034
; LINE_WIDTH: 0.261372
G1 X166.012 Y160.498 E.00042
; LINE_WIDTH: 0.225267
G1 X166.028 Y160.498 E.00025
; LINE_WIDTH: 0.200227
G1 X166.126 Y160.498 E.00126
M204 S10000
G1 X165.956 Y160.499 F60000
; LINE_WIDTH: 0.327879
G1 F15000
M204 S8000
G1 X165.94 Y160.42 E.00188
; LINE_WIDTH: 0.297078
G1 X165.925 Y160.34 E.00168
; LINE_WIDTH: 0.278681
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243982
G3 X165.912 Y155.749 I2.486 J-.33 E.00938
; LINE_WIDTH: 0.2778
G3 X165.935 Y155.612 I1.209 J.136 E.00267
; LINE_WIDTH: 0.322879
G1 X165.956 Y155.499 E.00261
; LINE_WIDTH: 0.327879
G1 X165.94 Y155.42 E.00188
; LINE_WIDTH: 0.297078
G1 X165.925 Y155.34 E.00168
; LINE_WIDTH: 0.278681
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243982
G3 X165.912 Y158.749 I2.486 J-.33 E.00938
; LINE_WIDTH: 0.279069
G3 X165.937 Y158.605 I1.268 J.143 E.00282
; LINE_WIDTH: 0.326732
G1 X165.958 Y158.485 E.00281
; LINE_WIDTH: 0.350748
G1 X165.963 Y158.463 E.00056
G1 X166.242 Y158.306 E.00803
M204 S10000
G1 X166.126 Y155.498 F60000
; LINE_WIDTH: 0.200227
G1 F15000
M204 S8000
G1 X166.028 Y155.498 E.00126
; LINE_WIDTH: 0.225267
G1 X166.012 Y155.498 E.00025
; LINE_WIDTH: 0.261372
G1 X165.988 Y155.499 E.00042
; LINE_WIDTH: 0.297857
G1 X165.972 Y155.499 E.00034
; LINE_WIDTH: 0.328151
G1 X165.956 Y155.499 E.00038
; WIPE_START
M204 S8000
G1 X165.972 Y155.499 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z2.2 I-1.217 J.017 P1  F60000
G1 X167.463 Y268.881 Z2.2
G1 Z1.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y269.881  
M204 S8000
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #9
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2.2 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z1.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E12

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P66 R6
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z4.8 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y264.706 F60000
G1 Z1.8
G17
G3 Z2.2 I1.217 J0 P1
G1 X190.897 Y247.542 Z2.2
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z1.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
G1  Y255.381 
G1  X170.463 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y266.131  E0.0285
G1  X167.463  E0.7031
G1  Y266.881  E0.0285
G1  X185.963  E0.7031
G1  Y267.631  E0.0285
G1  X167.463  E0.7031
G1  Y268.381  E0.0285
G1  X185.963  E0.7031
G1  Y269.131  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
M73 P67 R6
G1 F5400
M204 S8000
G1 X168.463 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3171
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 9 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z2.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z2.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer9 end: 112,152
M625
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z1.8
Z1.56
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X150 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X155 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X160 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X165 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X170 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X175 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X180 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X185 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X190 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X195 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X200 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X205 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X210 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X215 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X220 Y155 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z1.8
Z1.56
G1 E0.40 F150
G4 P400
G0 Z0.6 
G1 E-0.08 F800
G0 X145 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X150 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X155 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X160 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X165 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X170 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X175 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X180 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X185 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X190 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X195 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X200 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X205 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X210 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X215 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X220 Y160 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z1.8
Z1.56
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X150 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X155 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X160 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X165 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X170 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X175 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X180 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X185 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X190 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X195 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X200 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X205 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X210 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X215 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
G0 X220 Y165 Z1.8
Z1.56
G1 E0.40
G4 P400
G0 Z1.8
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 10/25
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3067
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 10 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z2.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z2.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer10 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S160 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E11

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z5 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y269.131 F60000
G1 Z2

; filament start gcode
G17
G3 Z2.4 I0 J-1.217 P1
G1 X185.963 Y269.131 Z2.4
G1 Z2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
M73 P68 R6
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y269.631 
G1  X185.463 
G1  Y268.631 
G1  X186.963 
G1  Y270.131 
G1  X184.963 
G1  Y268.131 
G1  X182.963 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y259.381  E0.0285
G1  X185.963  E0.7031
G1  Y258.631  E0.0285
G1  X167.463  E0.7031
G1  Y257.881  E0.0285
G1  X185.963  E0.7031
G1  Y257.131  E0.0285
G1  X167.463  E0.7031
G1  Y256.381  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y270.055  
M204 S8000
G3  X183.574 Y272.013   I-3.488 J-1.982 E0.1317
G3  X181.239 Y270.654   I1.125 J-4.619 E0.1041
G2  X178.521 Y269.881   I-2.725 J4.418 E0.1088
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X188.077 Y268.1 E-.05173
G1 X188.156 Y267.99 E-.05173
G1 X188.226 Y267.873 E-.05174
G1 X188.287 Y267.751 E-.05173
G1 X188.338 Y267.625 E-.05173
G1 X188.379 Y267.495 E-.05174
G1 X188.41 Y267.363 E-.05173
G1 X188.417 Y267.316 E-.01787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.364 Y155.818
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.869 Y155.61 I-.367 J.182 E.06117
G1 X174.966 Y155.591 E.00306
G3 X175.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X175.401 Y155.908 E-.0596
G1 X175.407 Y160.052 E-.05495
G1 X175.367 Y160.185 E-.0527
G1 X175.23 Y160.34 E-.0787
G1 X175.103 Y160.397 E-.05277
G1 X174.965 Y160.409 E-.05277
G1 X174.893 Y160.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X176.364 Y155.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y155.61 I-.367 J.182 E.06117
G1 X175.966 Y155.591 E.00306
G3 X176.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.401 Y155.908 E-.0596
G1 X176.407 Y160.052 E-.05494
G1 X176.367 Y160.185 E-.0527
G1 X176.23 Y160.34 E-.0787
G1 X176.103 Y160.397 E-.05277
G1 X175.965 Y160.409 E-.05277
G1 X175.893 Y160.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.817 J.902 P1  F60000
G1 X176.364 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y160.61 I-.367 J.182 E.06117
G1 X175.966 Y160.591 E.00306
G3 X176.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 3
M204 S250
G1 X175.364 Y160.818 F60000
G1 F12000
M204 S5000
G3 X174.869 Y160.61 I-.367 J.182 E.06117
G1 X174.966 Y160.591 E.00306
G3 X175.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X175.401 Y160.908 E-.0596
G1 X175.407 Y161.052 E-.05494
G1 X175.367 Y161.185 E-.05272
G1 X175.23 Y161.34 E-.07869
G1 X175.103 Y161.397 E-.05277
G1 X174.965 Y161.409 E-.05277
G1 X174.893 Y161.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.781 J-.933 P1  F60000
G1 X172.325 Y155.24 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y158.61 I-.328 J-.243 E.04711
G1 X171.966 Y158.591 E.00306
G3 X172.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X172.23 Y155.34 E-.07492
G1 X172.103 Y155.397 E-.05277
G1 X171.959 Y155.409 E-.05511
G1 X171.775 Y155.344 E-.07432
G1 X171.67 Y155.244 E-.055
G1 X171.607 Y155.12 E-.05275
G1 X171.602 Y155.081 E-.01513
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-1.206 J-.166 P1  F60000
G1 X171.363 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y160.61 I-.366 J.179 E.06079
G1 X170.966 Y160.591 E.00306
G3 X171.333 Y160.766 I.03 J.407 E.01307
; COOLING_NODE: 6
M204 S250
G1 X170.349 Y160.792 F60000
G1 F12000
M204 S5000
G3 X169.869 Y160.61 I-.353 J.205 E.0617
G1 X169.966 Y160.591 E.00306
G3 X170.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 7
M204 S250
G1 X170.325 Y160.24 F60000
G1 F12000
M204 S5000
G3 X169.869 Y155.61 I-.328 J-.243 E.04711
G1 X169.966 Y155.591 E.00306
G3 X170.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 8
M204 S250
G1 X170.325 Y155.24 F60000
G1 F12000
M204 S5000
G3 X169.869 Y158.61 I-.328 J-.243 E.04711
G1 X169.966 Y158.591 E.00306
G3 X170.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X170.23 Y155.34 E-.07492
G1 X170.103 Y155.397 E-.05277
G1 X169.965 Y155.409 E-.05278
G1 X169.831 Y155.374 E-.05275
G1 X169.716 Y155.297 E-.05275
G1 X169.619 Y155.152 E-.06622
G1 X169.607 Y155.08 E-.02781
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.179 J1.204 P1  F60000
G1 X171.363 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y158.61 I-.366 J.179 E.06079
G1 X170.966 Y158.591 E.00306
G3 X171.333 Y158.766 I.03 J.407 E.01307
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.401 Y158.908 E-.05961
G1 X171.407 Y155.052 E-.05495
G1 X171.367 Y155.185 E-.0527
G1 X171.23 Y155.34 E-.0787
G1 X171.103 Y155.397 E-.05277
G1 X170.965 Y155.409 E-.05278
G1 X170.893 Y155.39 E-.02849
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.819 J.9 P1  F60000
G1 X171.363 Y155.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.869 Y155.61 I-.366 J.179 E.06079
G1 X170.966 Y155.591 E.00306
G3 X171.333 Y155.766 I.03 J.407 E.01307
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.401 Y155.908 E-.05961
G1 X171.407 Y160.052 E-.05494
G1 X171.367 Y160.185 E-.0527
G1 X171.23 Y160.34 E-.0787
G1 X171.103 Y160.397 E-.05277
G1 X170.965 Y160.409 E-.05278
G1 X170.893 Y160.39 E-.02849
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.127 J1.21 P1  F60000
G1 X172.325 Y160.24 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.869 Y155.61 I-.328 J-.243 E.04711
G1 X171.966 Y155.591 E.00306
G3 X172.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 12
M204 S250
G1 X172.349 Y160.792 F60000
G1 F12000
M204 S5000
G3 X171.869 Y160.61 I-.353 J.205 E.0617
G1 X171.966 Y160.591 E.00306
G3 X172.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X172.411 Y160.977 E-.09609
G1 X172.393 Y161.12 E-.05499
G1 X172.33 Y161.244 E-.05274
G1 X172.23 Y161.34 E-.05275
G1 X172.103 Y161.397 E-.05277
G1 X171.959 Y161.409 E-.05512
G1 X171.92 Y161.396 E-.01554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.057 J1.216 P1  F60000
G1 X173.226 Y161.335 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.869 Y160.61 I-.23 J-.337 E.04289
G1 X172.966 Y160.591 E.00306
G3 X173.273 Y161.297 I.03 J.407 E.03097
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.103 Y161.397 E-.07488
G1 X172.959 Y161.409 E-.05511
G1 X172.775 Y161.344 E-.07432
G1 X172.67 Y161.244 E-.05499
G1 X172.607 Y161.12 E-.05269
G1 X172.589 Y160.976 E-.05517
G1 X172.599 Y160.944 E-.01284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.087 J1.214 P1  F60000
G1 X174.364 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.869 Y160.61 I-.367 J.182 E.06117
G1 X173.966 Y160.591 E.00306
G3 X174.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 15
M204 S250
G1 X174.364 Y155.818 F60000
G1 F12000
M204 S5000
G3 X173.869 Y155.61 I-.367 J.182 E.06117
G1 X173.966 Y155.591 E.00306
G3 X174.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.401 Y155.908 E-.0596
G1 X174.407 Y160.052 E-.05494
G1 X174.367 Y160.185 E-.0527
G1 X174.23 Y160.34 E-.0787
G1 X174.103 Y160.397 E-.05277
G1 X173.965 Y160.409 E-.05277
G1 X173.893 Y160.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.101 J-1.213 P1  F60000
G1 X173.226 Y160.335 Z2.4
G1 Z2
G1 E.4 F1800
M73 P69 R6
G1 F12000
M204 S5000
G3 X172.869 Y155.61 I-.23 J-.337 E.04289
G1 X172.966 Y155.591 E.00306
G3 X173.273 Y160.297 I.03 J.407 E.03097
; COOLING_NODE: 17
M204 S250
G1 X173.226 Y155.335 F60000
G1 F12000
M204 S5000
G3 X172.869 Y158.61 I-.23 J-.337 E.04289
G1 X172.966 Y158.591 E.00306
G3 X173.273 Y155.297 I.03 J.407 E.03097
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.103 Y155.397 E-.07488
G1 X172.959 Y155.409 E-.05511
G1 X172.775 Y155.344 E-.07432
G1 X172.67 Y155.244 E-.055
G1 X172.607 Y155.12 E-.05275
G1 X172.589 Y158.976 E-.05511
G1 X172.599 Y158.944 E-.01284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.087 J1.214 P1  F60000
G1 X174.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.869 Y158.61 I-.367 J.182 E.06117
G1 X173.966 Y158.591 E.00306
G3 X174.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.401 Y158.908 E-.0596
G1 X174.407 Y155.052 E-.05495
G1 X174.367 Y155.185 E-.0527
G1 X174.23 Y155.34 E-.0787
G1 X174.103 Y155.397 E-.05277
G1 X173.965 Y155.409 E-.05277
G1 X173.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X175.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.869 Y158.61 I-.367 J.182 E.06117
G1 X174.966 Y158.591 E.00306
G3 X175.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.401 Y158.908 E-.0596
G1 X175.407 Y155.052 E-.05495
G1 X175.367 Y155.185 E-.0527
G1 X175.23 Y155.34 E-.0787
G1 X175.103 Y155.397 E-.05277
G1 X174.965 Y155.409 E-.05277
G1 X174.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X176.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.869 Y158.61 I-.367 J.182 E.06117
G1 X175.966 Y158.591 E.00306
G3 X176.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.401 Y158.908 E-.0596
G1 X176.407 Y155.052 E-.05495
G1 X176.367 Y155.185 E-.0527
G1 X176.23 Y155.34 E-.0787
G1 X176.103 Y155.397 E-.05277
G1 X175.965 Y155.409 E-.05277
G1 X175.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X177.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y158.61 I-.367 J.182 E.06117
G1 X176.966 Y158.591 E.00306
G3 X177.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.401 Y158.908 E-.0596
G1 X177.407 Y155.052 E-.05495
G1 X177.367 Y155.185 E-.0527
G1 X177.23 Y155.34 E-.0787
G1 X177.103 Y155.397 E-.05277
G1 X176.965 Y155.409 E-.05277
G1 X176.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X178.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y158.61 I-.367 J.182 E.06117
G1 X177.966 Y158.591 E.00306
G3 X178.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.401 Y158.908 E-.0596
G1 X178.407 Y155.052 E-.05495
G1 X178.367 Y155.185 E-.0527
G1 X178.23 Y155.34 E-.0787
G1 X178.103 Y155.397 E-.05277
G1 X177.965 Y155.409 E-.05277
G1 X177.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.127 J1.21 P1  F60000
G1 X179.325 Y155.24 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y158.61 I-.328 J-.243 E.04711
G1 X178.966 Y158.591 E.00306
G3 X179.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 24
M204 S250
G1 X180.325 Y155.24 F60000
G1 F12000
M204 S5000
G3 X179.869 Y158.61 I-.328 J-.243 E.04711
G1 X179.966 Y158.591 E.00306
G3 X180.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.23 Y155.34 E-.07492
G1 X180.103 Y155.397 E-.05277
G1 X179.965 Y155.409 E-.05277
G1 X179.831 Y155.374 E-.05277
G1 X179.716 Y155.297 E-.05273
G1 X179.619 Y155.152 E-.06622
G1 X179.607 Y155.08 E-.02781
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-1.035 J.64 P1  F60000
G1 X180.325 Y160.24 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y155.61 I-.328 J-.243 E.04711
G1 X179.966 Y155.591 E.00306
G3 X180.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.23 Y160.34 E-.07493
G1 X180.103 Y160.397 E-.05277
G1 X179.965 Y160.409 E-.05277
G1 X179.831 Y160.374 E-.05277
G1 X179.716 Y160.297 E-.05273
G1 X179.619 Y160.152 E-.06622
G1 X179.607 Y160.08 E-.02781
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.602 J-1.058 P1  F60000
G1 X179.325 Y160.24 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y155.61 I-.328 J-.243 E.04711
G1 X178.966 Y155.591 E.00306
G3 X179.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.23 Y160.34 E-.07493
G1 X179.103 Y160.397 E-.05277
G1 X178.959 Y160.409 E-.05511
G1 X178.775 Y160.344 E-.07432
G1 X178.67 Y160.244 E-.055
G1 X178.607 Y160.12 E-.05275
G1 X178.602 Y160.081 E-.01513
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.903 J-.816 P1  F60000
G1 X178.364 Y155.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y155.61 I-.367 J.182 E.06117
G1 X177.966 Y155.591 E.00306
G3 X178.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 28
M204 S250
G1 X177.364 Y155.818 F60000
G1 F12000
M204 S5000
G3 X176.869 Y155.61 I-.367 J.182 E.06117
G1 X176.966 Y155.591 E.00306
G3 X177.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.401 Y155.908 E-.0596
G1 X177.407 Y160.052 E-.05494
G1 X177.367 Y160.185 E-.0527
G1 X177.23 Y160.34 E-.0787
G1 X177.103 Y160.397 E-.05277
G1 X176.965 Y160.409 E-.05277
G1 X176.893 Y160.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.817 J.902 P1  F60000
G1 X177.364 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.869 Y160.61 I-.367 J.182 E.06117
G1 X176.966 Y160.591 E.00306
G3 X177.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.401 Y160.908 E-.05961
G1 X177.407 Y161.052 E-.05494
G1 X177.367 Y161.185 E-.05272
G1 X177.23 Y161.34 E-.07869
G1 X177.103 Y161.397 E-.05277
G1 X176.965 Y161.409 E-.05277
G1 X176.893 Y161.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.441 J1.134 P1  F60000
G1 X178.364 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.869 Y160.61 I-.367 J.182 E.06117
G1 X177.966 Y160.591 E.00306
G3 X178.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.401 Y160.908 E-.05961
G1 X178.407 Y161.052 E-.05494
G1 X178.367 Y161.185 E-.05272
G1 X178.23 Y161.34 E-.07869
G1 X178.103 Y161.397 E-.05277
G1 X177.965 Y161.409 E-.05277
G1 X177.893 Y161.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.462 J1.126 P1  F60000
G1 X179.349 Y160.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.869 Y160.61 I-.353 J.205 E.0617
G1 X178.966 Y160.591 E.00306
G3 X179.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.411 Y160.977 E-.09609
G1 X179.393 Y161.12 E-.05499
G1 X179.33 Y161.244 E-.05274
G1 X179.23 Y161.34 E-.05275
G1 X179.103 Y161.397 E-.05277
G1 X178.959 Y161.409 E-.05511
G1 X178.92 Y161.396 E-.01554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.473 J1.121 P1  F60000
G1 X180.349 Y160.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.869 Y160.61 I-.353 J.205 E.0617
G1 X179.966 Y160.591 E.00306
G3 X180.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.411 Y160.977 E-.09609
G1 X180.393 Y161.12 E-.05499
G1 X180.33 Y161.244 E-.05274
G1 X180.23 Y161.34 E-.05275
G1 X180.103 Y161.397 E-.05277
G1 X179.965 Y161.409 E-.05277
G1 X179.92 Y161.397 E-.01788
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.474 J1.121 P1  F60000
G1 X181.349 Y160.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y160.61 I-.353 J.205 E.0617
G1 X180.966 Y160.591 E.00306
G3 X181.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.411 Y160.977 E-.09609
G1 X181.393 Y161.12 E-.05499
G1 X181.33 Y161.244 E-.05274
G1 X181.23 Y161.34 E-.05275
G1 X181.103 Y161.397 E-.05277
G1 X180.959 Y161.409 E-.05511
G1 X180.92 Y161.396 E-.01554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.473 J1.121 P1  F60000
G1 X182.349 Y160.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.869 Y160.61 I-.353 J.205 E.0617
G1 X181.966 Y160.591 E.00306
G3 X182.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.411 Y160.977 E-.09609
G1 X182.393 Y161.12 E-.05499
G1 X182.33 Y161.244 E-.05274
G1 X182.23 Y161.34 E-.05275
G1 X182.103 Y161.397 E-.05277
G1 X181.959 Y161.409 E-.05511
G1 X181.92 Y161.396 E-.01554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.057 J1.216 P1  F60000
G1 X183.226 Y161.335 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.869 Y160.61 I-.23 J-.337 E.04289
G1 X182.966 Y160.591 E.00306
G3 X183.273 Y161.297 I.03 J.407 E.03097
; COOLING_NODE: 36
M204 S250
G1 X183.226 Y160.335 F60000
G1 F12000
M204 S5000
G3 X182.869 Y155.61 I-.23 J-.337 E.04289
G1 X182.966 Y155.591 E.00306
G3 X183.273 Y160.297 I.03 J.407 E.03097
; COOLING_NODE: 37
M204 S250
G1 X182.325 Y160.24 F60000
G1 F12000
M204 S5000
G3 X181.869 Y155.61 I-.328 J-.243 E.04711
G1 X181.966 Y155.591 E.00306
G3 X182.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 38
M204 S250
G1 X182.325 Y155.24 F60000
G1 F12000
M204 S5000
G3 X181.869 Y158.61 I-.328 J-.243 E.04711
G1 X181.966 Y158.591 E.00306
G3 X182.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.23 Y155.34 E-.07492
G1 X182.103 Y155.397 E-.05277
G1 X181.959 Y155.409 E-.05511
G1 X181.775 Y155.344 E-.07432
G1 X181.67 Y155.244 E-.055
G1 X181.607 Y155.12 E-.05275
G1 X181.602 Y155.081 E-.01513
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.915 J-.803 P1  F60000
G1 X181.349 Y158.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y158.61 I-.353 J.205 E.0617
G1 X180.966 Y158.591 E.00306
G3 X181.315 Y158.743 I.03 J.407 E.01216
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.411 Y158.977 E-.09609
G1 X181.393 Y155.12 E-.05498
G1 X181.33 Y155.244 E-.05275
G1 X181.23 Y155.34 E-.05275
G1 X181.103 Y155.397 E-.05277
G1 X180.959 Y155.409 E-.05511
G1 X180.92 Y155.396 E-.01555
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.826 J.893 P1  F60000
G1 X181.349 Y155.792 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.869 Y155.61 I-.353 J.205 E.0617
G1 X180.966 Y155.591 E.00306
G3 X181.315 Y155.743 I.03 J.407 E.01216
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X181.411 Y155.977 E-.09609
G1 X181.393 Y160.12 E-.05497
G1 X181.33 Y160.244 E-.05276
G1 X181.23 Y160.34 E-.05275
G1 X181.103 Y160.397 E-.05277
G1 X180.959 Y160.409 E-.05511
G1 X180.92 Y160.396 E-.01555
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.509 J1.106 P1  F60000
G1 X183.226 Y155.335 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.869 Y158.61 I-.23 J-.337 E.04289
G1 X182.966 Y158.591 E.00306
G3 X183.273 Y155.297 I.03 J.407 E.03097
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.103 Y155.397 E-.07487
G1 X182.959 Y155.409 E-.05511
G1 X182.775 Y155.344 E-.07432
G1 X182.67 Y155.244 E-.05498
G1 X182.607 Y155.12 E-.0528
G1 X182.589 Y158.976 E-.05508
G1 X182.599 Y158.944 E-.01284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-1.039 J.633 P1  F60000
G1 X184.398 Y161.898 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.631 Y160.503 I-.39 J-.722 E.04669
G2 X183.631 Y155.503 I-.65 J-.5 E.03567
G2 X183.358 Y158.275 I-.649 J-.5 E.0476
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 42
; WIPE_START
G1 X183.41 Y161.898 E-.37598
G1 X183.408 Y161.888 E-.00402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.132 J-1.21 P1  F60000
G1 X168.325 Y160.24 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.869 Y155.61 I-.328 J-.243 E.04711
G1 X167.966 Y155.591 E.00306
G3 X168.357 Y160.189 I.03 J.407 E.02675
; COOLING_NODE: 43
M204 S250
G1 X168.325 Y155.24 F60000
G1 F12000
M204 S5000
G3 X167.869 Y158.61 I-.328 J-.243 E.04711
G1 X167.966 Y158.591 E.00306
G3 X168.357 Y155.189 I.03 J.407 E.02675
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.23 Y155.34 E-.07492
G1 X168.103 Y155.397 E-.05277
G1 X167.959 Y155.409 E-.05511
G1 X167.775 Y155.344 E-.07432
G1 X167.67 Y155.244 E-.055
G1 X167.607 Y155.12 E-.05275
G1 X167.602 Y155.081 E-.01513
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.18 J1.204 P1  F60000
G1 X169.364 Y158.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y158.61 I-.367 J.182 E.06117
G1 X168.966 Y158.591 E.00306
G3 X169.334 Y158.766 I.031 J.409 E.01309
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.401 Y158.908 E-.0596
G1 X169.407 Y155.052 E-.05495
G1 X169.367 Y155.185 E-.0527
G1 X169.23 Y155.34 E-.0787
G1 X169.103 Y155.397 E-.05277
G1 X168.965 Y155.409 E-.05277
G1 X168.893 Y155.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.817 J.902 P1  F60000
G1 X169.364 Y155.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y155.61 I-.367 J.182 E.06117
G1 X168.966 Y155.591 E.00306
G3 X169.334 Y155.766 I.031 J.409 E.01309
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.401 Y155.908 E-.0596
G1 X169.407 Y160.052 E-.05494
G1 X169.367 Y160.185 E-.0527
G1 X169.23 Y160.34 E-.0787
G1 X169.103 Y160.397 E-.05277
G1 X168.965 Y160.409 E-.05277
G1 X168.893 Y160.39 E-.02851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.817 J.902 P1  F60000
G1 X169.364 Y160.818 Z2.4
G1 Z2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.869 Y160.61 I-.367 J.182 E.06117
G1 X168.966 Y160.591 E.00306
G3 X169.334 Y160.766 I.031 J.409 E.01309
; COOLING_NODE: 47
M204 S250
G1 X168.349 Y160.792 F60000
G1 F12000
M204 S5000
G3 X167.869 Y160.61 I-.353 J.205 E.0617
G1 X167.966 Y160.591 E.00306
G3 X168.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 48
M204 S250
G1 X167.349 Y160.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y160.61 I-.353 J.205 E.0617
G1 X166.966 Y160.591 E.00306
G3 X167.315 Y160.743 I.03 J.407 E.01216
; COOLING_NODE: 49
M204 S250
G1 X167.349 Y155.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y155.61 I-.353 J.205 E.0617
G1 X166.966 Y155.591 E.00306
G3 X167.315 Y155.743 I.03 J.407 E.01216
; COOLING_NODE: 50
M204 S250
G1 X167.349 Y158.792 F60000
G1 F12000
M204 S5000
G3 X166.869 Y158.61 I-.353 J.205 E.0617
G1 X166.966 Y158.591 E.00306
G3 X167.315 Y158.743 I.03 J.407 E.01216
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.38 J.729 E.0476
G2 X166.37 Y160.505 I.646 J.5 E.0357
G2 X166.635 Y161.735 I.675 J.498 E.04721
G1 X166.577 Y161.898 E.00573
G1 X165.602 Y161.898 E.03235
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07733
G1 X166.396 Y158.469 E-.05183
G1 X166.305 Y158.592 E-.05815
G1 X166.231 Y158.762 E-.07077
G1 X166.196 Y158.948 E-.07187
G1 X166.201 Y155.08 E-.05005
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.149 J.401 P1  F60000
G1 X184.042 Y161.511 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331218
G1 F15000
M204 S8000
G1 X184.059 Y161.425 E.00204
; LINE_WIDTH: 0.294469
G1 X184.078 Y161.32 E.0022
; LINE_WIDTH: 0.244493
G2 X184.085 Y160.728 I-2.496 J-.327 E.00974
; LINE_WIDTH: 0.281363
G1 X184.065 Y160.613 E.00227
; LINE_WIDTH: 0.316427
G3 X184.075 Y160.34 I.361 J-.123 E.00623
; LINE_WIDTH: 0.257931
G2 X184.097 Y160.132 I-6.937 J-.85 E.00366
; LINE_WIDTH: 0.239267
G2 X184.085 Y155.728 I-3.275 J-.106 E.00647
; LINE_WIDTH: 0.281363
G1 X184.065 Y155.613 E.00227
; LINE_WIDTH: 0.316422
G3 X184.075 Y155.34 I.361 J-.123 E.00623
; LINE_WIDTH: 0.257938
G2 X184.097 Y155.132 I-6.903 J-.846 E.00366
; LINE_WIDTH: 0.239266
G2 X184.085 Y158.728 I-3.276 J-.106 E.00647
; LINE_WIDTH: 0.281563
G1 X184.065 Y158.612 E.0023
; LINE_WIDTH: 0.322868
G1 X184.044 Y158.496 E.00269
; LINE_WIDTH: 0.356416
G1 X184.037 Y158.463 E.00084
G1 X183.748 Y158.306 E.00841
M204 S10000
G1 X184.042 Y161.511 F60000
; LINE_WIDTH: 0.35869
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00067
G1 X183.749 Y161.694 E.00844
M204 S10000
G1 X183.141 Y161.644 F60000
; LINE_WIDTH: 0.609555
G1 F13236.047
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574633
G1 F14105.367
G3 X182.196 Y161.839 I-.349 J-1.724 E.00644
; LINE_WIDTH: 0.542122
G1 F15000
G3 X181.736 Y161.83 I-.194 J-1.783 E.01877
; LINE_WIDTH: 0.581615
G1 F13922.542
G1 X181.675 Y161.819 E.00271
; WIPE_START
G1 X181.736 Y161.83 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I.011 J-1.217 P1  F60000
G1 X166.246 Y161.694 Z2.4
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.353125
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00817
G1 X165.942 Y161.426 E.00285
; LINE_WIDTH: 0.298282
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278729
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.246661
G3 X165.921 Y160.681 I2.389 J-.323 E.01065
; LINE_WIDTH: 0.278236
G1 X166.003 Y160.142 E.01045
M204 S10000
G1 X166.123 Y160.501 F60000
; LINE_WIDTH: 0.250433
G1 F15000
M204 S8000
G1 X166.049 Y160.502 E.00125
; LINE_WIDTH: 0.291084
G1 X165.975 Y160.504 E.0015
; LINE_WIDTH: 0.32905
G1 X165.957 Y160.504 E.00043
G1 X165.941 Y160.422 E.00195
; LINE_WIDTH: 0.297516
G1 X165.925 Y160.34 E.00173
; LINE_WIDTH: 0.278651
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.246653
G3 X165.921 Y155.681 I2.389 J-.322 E.01065
; LINE_WIDTH: 0.278232
G1 X166.003 Y155.142 E.01045
M204 S10000
G1 X166.123 Y155.501 F60000
; LINE_WIDTH: 0.250434
G1 F15000
M204 S8000
G1 X166.049 Y155.502 E.00125
; LINE_WIDTH: 0.291085
G1 X165.975 Y155.504 E.0015
; LINE_WIDTH: 0.329051
G1 X165.957 Y155.504 E.00043
G1 X165.941 Y155.422 E.00195
; LINE_WIDTH: 0.297516
G1 X165.925 Y155.34 E.00173
; LINE_WIDTH: 0.278651
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.246653
G3 X165.921 Y158.681 I2.389 J-.322 E.01065
; LINE_WIDTH: 0.278232
G1 X165.978 Y158.306 E.00727
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.921 Y158.681 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 11/25
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-.142 J1.209 P1  F60000
G1 X175.346 Y155.787 Z2.4
G1 Z2.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.868 Y155.61 I-.349 J.211 E.06185
G1 X174.964 Y155.591 E.00299
G3 X175.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 19
M204 S250
G1 X175.346 Y158.787 F60000
G1 F12000
M204 S5000
G3 X174.868 Y158.61 I-.349 J.211 E.06185
G1 X174.964 Y158.591 E.00299
G3 X175.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.402 Y158.913 E-.07504
G1 X175.407 Y155.058 E-.05497
G1 X175.334 Y155.24 E-.07435
G1 X175.23 Y155.34 E-.05508
G1 X175.104 Y155.397 E-.05274
G1 X174.932 Y155.405 E-.06533
G1 X174.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X176.346 Y158.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.868 Y158.61 I-.349 J.211 E.06185
G1 X175.964 Y158.591 E.00299
G3 X176.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.402 Y158.913 E-.07504
G1 X176.407 Y155.058 E-.05497
G1 X176.334 Y155.24 E-.07435
G1 X176.23 Y155.34 E-.05508
G1 X176.104 Y155.397 E-.05274
G1 X175.932 Y155.405 E-.06533
G1 X175.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X177.346 Y158.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.868 Y158.61 I-.349 J.211 E.06185
G1 X176.964 Y158.591 E.00299
G3 X177.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X177.402 Y158.913 E-.07504
G1 X177.407 Y155.058 E-.05497
G1 X177.334 Y155.24 E-.07435
G1 X177.23 Y155.34 E-.05508
G1 X177.104 Y155.397 E-.05274
G1 X176.932 Y155.405 E-.06533
G1 X176.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.821 J.899 P1  F60000
G1 X177.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.868 Y155.61 I-.349 J.211 E.06185
G1 X176.964 Y155.591 E.00299
G3 X177.311 Y155.738 I.033 J.407 E.01204
M104 T0 S210 N0 ;Multi extruder pre heating
; COOLING_NODE: 1
M204 S250
G1 X176.346 Y155.787 F60000
G1 F12000
M204 S5000
G3 X175.868 Y155.61 I-.349 J.211 E.06185
G1 X175.964 Y155.591 E.00299
G3 X176.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.402 Y155.913 E-.07504
G1 X176.407 Y160.058 E-.05497
G1 X176.334 Y160.24 E-.07435
G1 X176.23 Y160.34 E-.05508
G1 X176.104 Y160.397 E-.05274
G1 X175.932 Y160.405 E-.06533
G1 X175.926 Y160.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.821 J.899 P1  F60000
G1 X176.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.868 Y160.61 I-.349 J.211 E.06185
G1 X175.964 Y160.591 E.00299
G3 X176.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X176.402 Y160.913 E-.07505
G1 X176.407 Y161.058 E-.05498
G1 X176.334 Y161.24 E-.07433
G1 X176.23 Y161.34 E-.05509
G1 X176.104 Y161.397 E-.05274
G1 X175.932 Y161.405 E-.06533
G1 X175.926 Y161.403 E-.00249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X177.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.868 Y160.61 I-.349 J.211 E.06185
G1 X176.964 Y160.591 E.00299
G3 X177.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.402 Y160.913 E-.07505
G1 X177.407 Y161.058 E-.05498
G1 X177.334 Y161.24 E-.07433
G1 X177.23 Y161.34 E-.05509
G1 X177.104 Y161.397 E-.05274
G1 X176.932 Y161.405 E-.06533
G1 X176.926 Y161.403 E-.00249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X178.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y160.61 I-.349 J.211 E.06185
G1 X177.964 Y160.591 E.00299
G3 X178.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.402 Y160.913 E-.07505
G1 X178.407 Y161.058 E-.05498
G1 X178.334 Y161.24 E-.07433
G1 X178.23 Y161.34 E-.05509
G1 X178.104 Y161.397 E-.05274
G1 X177.932 Y161.405 E-.06533
G1 X177.926 Y161.403 E-.00249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X179.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y160.61 I-.349 J.211 E.06185
G1 X178.964 Y160.591 E.00299
G3 X179.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.402 Y160.913 E-.07507
G1 X179.407 Y161.058 E-.05498
G1 X179.334 Y161.24 E-.07433
G1 X179.23 Y161.34 E-.05509
G1 X179.104 Y161.397 E-.05274
G1 X178.932 Y161.405 E-.06533
G1 X178.926 Y161.403 E-.00247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X180.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.868 Y160.61 I-.349 J.211 E.06187
G1 X179.964 Y160.591 E.00299
G3 X180.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.402 Y160.913 E-.07507
G1 X180.407 Y161.058 E-.05498
G1 X180.334 Y161.24 E-.07433
G1 X180.23 Y161.34 E-.05509
G1 X180.104 Y161.397 E-.05274
G1 X179.965 Y161.409 E-.05279
G1 X179.927 Y161.399 E-.01501
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.482 J1.117 P1  F60000
G1 X181.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.868 Y160.61 I-.349 J.211 E.06185
G1 X180.964 Y160.591 E.00299
G3 X181.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.402 Y160.913 E-.07507
G1 X181.407 Y161.058 E-.05498
G1 X181.334 Y161.24 E-.07433
G1 X181.23 Y161.34 E-.05509
G1 X181.104 Y161.397 E-.05274
G1 X180.932 Y161.405 E-.06533
G1 X180.926 Y161.403 E-.00247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.484 J1.116 P1  F60000
G1 X182.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y160.61 I-.349 J.211 E.06185
G1 X181.964 Y160.591 E.00299
G3 X182.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.402 Y160.913 E-.07507
G1 X182.407 Y161.058 E-.05498
G1 X182.334 Y161.24 E-.07433
G1 X182.23 Y161.34 E-.05509
G1 X182.104 Y161.397 E-.05274
G1 X181.932 Y161.405 E-.06533
G1 X181.926 Y161.403 E-.00247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.064 J1.215 P1  F60000
G1 X183.226 Y161.335 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.868 Y160.61 I-.23 J-.337 E.04286
G1 X182.964 Y160.591 E.00299
G3 X183.273 Y161.297 I.033 J.407 E.03104
; COOLING_NODE: 36
M204 S250
G1 X183.226 Y160.335 F60000
G1 F12000
M204 S5000
G3 X182.868 Y155.61 I-.23 J-.337 E.04286
G1 X182.964 Y155.591 E.00299
M73 P70 R6
G3 X183.273 Y160.297 I.033 J.407 E.03104
; COOLING_NODE: 37
M204 S250
G1 X182.328 Y160.235 F60000
G1 F12000
M204 S5000
G3 X181.868 Y155.61 I-.331 J-.238 E.04726
G1 X181.964 Y155.591 E.00299
G3 X182.359 Y160.184 I.033 J.407 E.02664
; COOLING_NODE: 38
M204 S250
G1 X182.328 Y155.235 F60000
G1 F12000
M204 S5000
G3 X181.868 Y158.61 I-.331 J-.238 E.04726
G1 X181.964 Y158.591 E.00299
G3 X182.359 Y155.184 I.033 J.407 E.02664
; COOLING_NODE: 41
M204 S250
G1 X183.226 Y155.335 F60000
G1 F12000
M204 S5000
G3 X182.868 Y158.61 I-.23 J-.337 E.04286
G1 X182.964 Y158.591 E.00299
G3 X183.273 Y155.297 I.033 J.407 E.03104
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X183.104 Y155.397 E-.07489
G1 X182.932 Y155.405 E-.06533
G1 X182.836 Y155.377 E-.03785
G1 X182.716 Y155.297 E-.0551
G1 X182.607 Y155.12 E-.07865
G1 X182.589 Y158.977 E-.05497
G1 X182.6 Y158.943 E-.01321
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.679 J-1.01 P1  F60000
G1 X181.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.868 Y155.61 I-.349 J.211 E.06185
G1 X180.964 Y155.591 E.00299
G3 X181.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 39
M204 S250
G1 X181.346 Y158.787 F60000
G1 F12000
M204 S5000
G3 X180.868 Y158.61 I-.349 J.211 E.06185
G1 X180.964 Y158.591 E.00299
G3 X181.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X181.402 Y158.913 E-.07506
G1 X181.407 Y155.058 E-.05497
G1 X181.334 Y155.24 E-.07435
G1 X181.23 Y155.34 E-.05508
G1 X181.104 Y155.397 E-.05274
G1 X180.932 Y155.405 E-.06533
G1 X180.926 Y155.403 E-.00248
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.329 J-1.172 P1  F60000
G1 X180.328 Y155.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.868 Y158.61 I-.332 J-.238 E.04727
G1 X179.964 Y158.591 E.00299
G3 X180.36 Y155.184 I.033 J.407 E.02665
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.23 Y155.34 E-.07714
G1 X180.104 Y155.397 E-.05274
G1 X179.965 Y155.409 E-.05279
G1 X179.825 Y155.372 E-.05495
G1 X179.673 Y155.25 E-.07436
G1 X179.607 Y155.12 E-.05512
G1 X179.603 Y155.087 E-.01291
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-1.029 J.65 P1  F60000
G1 X180.328 Y160.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.868 Y155.61 I-.332 J-.238 E.04727
G1 X179.964 Y155.591 E.00299
G3 X180.36 Y160.184 I.033 J.407 E.02665
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.23 Y160.34 E-.07714
G1 X180.104 Y160.397 E-.05274
G1 X179.965 Y160.409 E-.05279
G1 X179.825 Y160.372 E-.05495
G1 X179.673 Y160.25 E-.07436
G1 X179.607 Y160.12 E-.05512
G1 X179.603 Y160.087 E-.01291
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.578 J-1.071 P1  F60000
G1 X179.328 Y160.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y155.61 I-.331 J-.238 E.04726
G1 X178.964 Y155.591 E.00299
G3 X179.359 Y160.184 I.033 J.407 E.02664
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.23 Y160.34 E-.07714
G1 X179.104 Y160.397 E-.05274
G1 X178.932 Y160.405 E-.06533
G1 X178.836 Y160.377 E-.03785
G1 X178.716 Y160.297 E-.0551
G1 X178.607 Y160.12 E-.07865
G1 X178.603 Y160.086 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.923 J-.794 P1  F60000
G1 X178.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y155.61 I-.349 J.211 E.06185
G1 X177.964 Y155.591 E.00299
G3 X178.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 22
M204 S250
G1 X178.346 Y158.787 F60000
G1 F12000
M204 S5000
G3 X177.868 Y158.61 I-.349 J.211 E.06185
G1 X177.964 Y158.591 E.00299
G3 X178.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.402 Y158.913 E-.07504
G1 X178.407 Y155.058 E-.05497
G1 X178.334 Y155.24 E-.07435
G1 X178.23 Y155.34 E-.05508
G1 X178.104 Y155.397 E-.05274
G1 X177.932 Y155.405 E-.06533
G1 X177.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.145 J1.208 P1  F60000
G1 X179.328 Y155.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y158.61 I-.331 J-.238 E.04726
G1 X178.964 Y158.591 E.00299
G3 X179.359 Y155.184 I.033 J.407 E.02664
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X179.23 Y155.34 E-.07714
G1 X179.104 Y155.397 E-.05274
G1 X178.932 Y155.405 E-.06533
G1 X178.836 Y155.377 E-.03785
G1 X178.716 Y155.297 E-.0551
G1 X178.607 Y155.12 E-.07865
G1 X178.603 Y155.086 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.085 J-1.214 P1  F60000
G1 X174.346 Y158.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.868 Y158.61 I-.349 J.211 E.06185
G1 X173.964 Y158.591 E.00299
G3 X174.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.402 Y158.913 E-.07504
G1 X174.407 Y155.058 E-.05497
G1 X174.334 Y155.24 E-.07435
G1 X174.23 Y155.34 E-.05508
G1 X174.104 Y155.397 E-.05274
G1 X173.932 Y155.405 E-.06533
G1 X173.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.119 J-1.211 P1  F60000
G1 X173.226 Y155.335 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y158.61 I-.23 J-.337 E.04286
G1 X172.964 Y158.591 E.00299
G3 X173.273 Y155.297 I.033 J.407 E.03104
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X173.104 Y155.397 E-.0749
G1 X172.932 Y155.405 E-.06533
G1 X172.836 Y155.377 E-.03785
G1 X172.716 Y155.297 E-.0551
G1 X172.607 Y155.12 E-.07865
G1 X172.589 Y158.977 E-.05497
G1 X172.6 Y158.943 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-1.11 J.5 P1  F60000
G1 X173.226 Y160.335 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y155.61 I-.23 J-.337 E.04286
G1 X172.964 Y155.591 E.00299
G3 X173.273 Y160.297 I.033 J.407 E.03104
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X173.104 Y160.397 E-.07489
G1 X172.932 Y160.405 E-.06533
G1 X172.836 Y160.377 E-.03785
G1 X172.716 Y160.297 E-.0551
G1 X172.607 Y160.12 E-.07865
G1 X172.589 Y155.977 E-.05497
G1 X172.6 Y155.943 E-.01321
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.109 J1.212 P1  F60000
G1 X174.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.868 Y155.61 I-.349 J.211 E.06185
G1 X173.964 Y155.591 E.00299
G3 X174.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.402 Y155.913 E-.07504
G1 X174.407 Y160.058 E-.05497
G1 X174.334 Y160.24 E-.07435
G1 X174.23 Y160.34 E-.05508
G1 X174.104 Y160.397 E-.05274
G1 X173.932 Y160.405 E-.06533
G1 X173.926 Y160.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.317 J1.175 P1  F60000
G1 X175.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.868 Y160.61 I-.349 J.211 E.06185
G1 X174.964 Y160.591 E.00299
G3 X175.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 14
M204 S250
G1 X174.346 Y160.787 F60000
G1 F12000
M204 S5000
G3 X173.868 Y160.61 I-.349 J.211 E.06185
G1 X173.964 Y160.591 E.00299
G3 X174.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X174.402 Y160.913 E-.07504
G1 X174.407 Y161.058 E-.05498
G1 X174.334 Y161.24 E-.07433
G1 X174.23 Y161.34 E-.05509
G1 X174.104 Y161.397 E-.05274
G1 X173.932 Y161.405 E-.06533
G1 X173.926 Y161.403 E-.00249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.119 J-1.211 P1  F60000
G1 X173.226 Y161.335 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y160.61 I-.23 J-.337 E.04286
G1 X172.964 Y160.591 E.00299
G3 X173.273 Y161.297 I.033 J.407 E.03104
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.0749
G1 X172.932 Y161.405 E-.06533
G1 X172.836 Y161.377 E-.03785
G1 X172.716 Y161.297 E-.0551
G1 X172.607 Y161.12 E-.07865
G1 X172.589 Y160.977 E-.05497
G1 X172.6 Y160.943 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.639 J-1.035 P1  F60000
G1 X172.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.868 Y160.61 I-.349 J.211 E.06185
G1 X171.964 Y160.591 E.00299
G3 X172.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 11
M204 S250
G1 X172.328 Y160.235 F60000
G1 F12000
M204 S5000
G3 X171.868 Y155.61 I-.331 J-.238 E.04726
G1 X171.964 Y155.591 E.00299
G3 X172.359 Y160.184 I.033 J.407 E.02664
; COOLING_NODE: 4
M204 S250
G1 X172.328 Y155.235 F60000
G1 F12000
M204 S5000
G3 X171.868 Y158.61 I-.331 J-.238 E.04726
G1 X171.964 Y158.591 E.00299
G3 X172.359 Y155.184 I.033 J.407 E.02664
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.23 Y155.34 E-.07714
G1 X172.104 Y155.397 E-.05274
G1 X171.932 Y155.405 E-.06533
G1 X171.836 Y155.377 E-.03785
G1 X171.716 Y155.297 E-.0551
G1 X171.607 Y155.12 E-.07865
G1 X171.603 Y155.086 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.923 J-.793 P1  F60000
G1 X171.346 Y158.787 Z2.6
G1 Z2.2
G1 E.4 F1800
M73 P70 R5
G1 F12000
M204 S5000
G3 X170.868 Y158.61 I-.349 J.211 E.06187
G1 X170.964 Y158.591 E.00299
G3 X171.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.402 Y158.913 E-.07504
G1 X171.407 Y155.058 E-.05497
G1 X171.334 Y155.24 E-.07435
G1 X171.23 Y155.34 E-.05508
G1 X171.104 Y155.397 E-.05274
G1 X170.965 Y155.409 E-.05278
G1 X170.927 Y155.399 E-.01505
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.826 J.893 P1  F60000
G1 X171.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y155.61 I-.349 J.211 E.06187
G1 X170.964 Y155.591 E.00299
G3 X171.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.402 Y155.913 E-.07504
G1 X171.407 Y160.058 E-.05497
G1 X171.334 Y160.24 E-.07435
G1 X171.23 Y160.34 E-.05508
G1 X171.104 Y160.397 E-.05274
G1 X170.965 Y160.409 E-.05278
G1 X170.927 Y160.399 E-.01505
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.827 J.893 P1  F60000
G1 X171.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y160.61 I-.349 J.211 E.06187
G1 X170.964 Y160.591 E.00299
G3 X171.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X171.402 Y160.913 E-.07505
G1 X171.407 Y161.058 E-.05498
G1 X171.334 Y161.24 E-.07433
G1 X171.23 Y161.34 E-.05509
G1 X171.104 Y161.397 E-.05274
G1 X170.965 Y161.409 E-.05278
G1 X170.927 Y161.399 E-.01504
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.173 J-.324 P1  F60000
G1 X170.328 Y155.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y158.61 I-.332 J-.238 E.04727
G1 X169.964 Y158.591 E.00299
G3 X170.36 Y155.184 I.033 J.407 E.02665
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.23 Y155.34 E-.07714
G1 X170.104 Y155.397 E-.05274
G1 X169.965 Y155.409 E-.05277
G1 X169.825 Y155.372 E-.05496
G1 X169.673 Y155.25 E-.07436
G1 X169.607 Y155.12 E-.05512
G1 X169.603 Y155.087 E-.0129
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.924 J-.793 P1  F60000
G1 X169.346 Y158.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y158.61 I-.349 J.211 E.06185
G1 X168.964 Y158.591 E.00299
G3 X169.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.402 Y158.913 E-.07504
G1 X169.407 Y155.058 E-.05497
G1 X169.334 Y155.24 E-.07435
G1 X169.23 Y155.34 E-.05508
G1 X169.104 Y155.397 E-.05274
G1 X168.932 Y155.405 E-.06533
G1 X168.926 Y155.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.821 J.899 P1  F60000
G1 X169.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y155.61 I-.349 J.211 E.06185
G1 X168.964 Y155.591 E.00299
G3 X169.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.402 Y155.913 E-.07504
G1 X169.407 Y160.058 E-.05497
G1 X169.334 Y160.24 E-.07435
G1 X169.23 Y160.34 E-.05508
G1 X169.104 Y160.397 E-.05274
G1 X168.932 Y160.405 E-.06533
G1 X168.926 Y160.403 E-.0025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.145 J1.208 P1  F60000
G1 X170.328 Y160.235 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y155.61 I-.332 J-.238 E.04727
G1 X169.964 Y155.591 E.00299
G3 X170.36 Y160.184 I.033 J.407 E.02665
; COOLING_NODE: 6
M204 S250
G1 X170.346 Y160.787 F60000
G1 F12000
M204 S5000
G3 X169.868 Y160.61 I-.349 J.211 E.06187
G1 X169.964 Y160.591 E.00299
G3 X170.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 46
M204 S250
G1 X169.346 Y160.787 F60000
G1 F12000
M204 S5000
G3 X168.868 Y160.61 I-.349 J.211 E.06185
G1 X168.964 Y160.591 E.00299
G3 X169.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 47
M204 S250
G1 X168.346 Y160.787 F60000
G1 F12000
M204 S5000
G3 X167.868 Y160.61 I-.349 J.211 E.06185
G1 X167.964 Y160.591 E.00299
G3 X168.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 42
M204 S250
G1 X168.328 Y160.235 F60000
G1 F12000
M204 S5000
G3 X167.868 Y155.61 I-.331 J-.238 E.04726
G1 X167.964 Y155.591 E.00299
G3 X168.359 Y160.184 I.033 J.407 E.02664
; COOLING_NODE: 43
M204 S250
G1 X168.328 Y155.235 F60000
G1 F12000
M204 S5000
G3 X167.868 Y158.61 I-.331 J-.238 E.04726
G1 X167.964 Y158.591 E.00299
G3 X168.359 Y155.184 I.033 J.407 E.02664
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X168.23 Y155.34 E-.07714
G1 X168.104 Y155.397 E-.05274
G1 X167.932 Y155.405 E-.06533
G1 X167.836 Y155.377 E-.03785
G1 X167.716 Y155.297 E-.0551
G1 X167.607 Y155.12 E-.07865
G1 X167.603 Y155.086 E-.0132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I.785 J-.93 P1  F60000
G1 X166.642 Y158.275 Z2.6
G1 Z2.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.38 J.729 E.04761
G2 X166.37 Y160.505 I.646 J.5 E.0357
G2 X166.637 Y161.715 I.624 J.497 E.04711
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 50
M204 S250
G1 X167.346 Y158.787 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X166.868 Y158.61 I-.349 J.211 E.06185
G1 X166.964 Y158.591 E.00299
G3 X167.311 Y158.738 I.033 J.407 E.01204
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167.402 Y158.913 E-.07506
G1 X167.407 Y155.058 E-.05497
G1 X167.334 Y155.24 E-.07435
G1 X167.23 Y155.34 E-.05508
G1 X167.104 Y155.397 E-.05274
G1 X166.932 Y155.405 E-.06533
G1 X166.926 Y155.403 E-.00248
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.821 J.899 P1  F60000
G1 X167.346 Y155.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.868 Y155.61 I-.349 J.211 E.06185
G1 X166.964 Y155.591 E.00299
G3 X167.311 Y155.738 I.033 J.407 E.01204
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.402 Y155.913 E-.07506
G1 X167.407 Y160.058 E-.05497
G1 X167.334 Y160.24 E-.07435
G1 X167.23 Y160.34 E-.05508
G1 X167.104 Y160.397 E-.05274
G1 X166.932 Y160.405 E-.06533
G1 X166.926 Y160.403 E-.00248
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.821 J.899 P1  F60000
G1 X167.346 Y160.787 Z2.6
G1 Z2.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.868 Y160.61 I-.349 J.211 E.06185
G1 X166.964 Y160.591 E.00299
G3 X167.311 Y160.738 I.033 J.407 E.01204
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.402 Y160.913 E-.07506
G1 X167.407 Y161.058 E-.05498
G1 X167.334 Y161.24 E-.07433
G1 X167.23 Y161.34 E-.05509
G1 X167.104 Y161.397 E-.05274
G1 X166.932 Y161.405 E-.06533
G1 X166.926 Y161.403 E-.00247
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.034 J1.216 P1  F60000
G1 X184.398 Y161.898 Z2.6
G1 Z2.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.634 Y160.51 I-.355 J-.713 E.0469
G2 X183.634 Y155.51 I-.659 J-.5 E.03562
G2 X183.358 Y158.275 I-.659 J-.501 E.04778
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
M204 S10000
G1 X184.009 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.309649
G1 F15000
M204 S8000
G1 X184.064 Y161.409 E.00632
; LINE_WIDTH: 0.288227
G1 X184.08 Y161.293 E.00234
; LINE_WIDTH: 0.242144
G2 X184.088 Y160.756 I-2.295 J-.304 E.00873
; LINE_WIDTH: 0.268922
G1 X184.075 Y160.671 E.00159
; LINE_WIDTH: 0.308625
G2 X183.987 Y160.196 I-5.559 J.787 E.01045
M204 S10000
G1 X183.988 Y155.803 F60000
; LINE_WIDTH: 0.30963
G1 F15000
M204 S8000
G1 X184.064 Y155.409 E.00872
; LINE_WIDTH: 0.288223
G1 X184.08 Y155.293 E.00234
; LINE_WIDTH: 0.242145
G2 X184.088 Y158.756 I-2.295 J-.304 E.00873
; LINE_WIDTH: 0.268918
G1 X184.075 Y158.671 E.00159
; LINE_WIDTH: 0.3077
G2 X184.008 Y158.306 I-4.281 J.596 E.00802
M204 S10000
G1 X183.987 Y155.196 F60000
; LINE_WIDTH: 0.308624
G1 F15000
M204 S8000
G3 X184.075 Y155.671 I-5.466 J1.261 E.01045
; LINE_WIDTH: 0.268918
G1 X184.088 Y155.756 E.00159
; LINE_WIDTH: 0.242145
G3 X184.08 Y160.293 I-2.303 J.233 E.00873
; LINE_WIDTH: 0.288223
G1 X184.064 Y160.409 E.00234
; LINE_WIDTH: 0.30963
G1 X183.988 Y160.803 E.00872
; WIPE_START
G1 X184.064 Y160.409 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I-.975 J-.729 P1  F60000
G1 X183.141 Y161.643 Z2.6
G1 Z2.2
G1 E.4 F1800
; LINE_WIDTH: 0.609651
G1 F13233.789
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574716
G1 F14103.156
G3 X182.196 Y161.839 I-.347 J-1.712 E.00644
; LINE_WIDTH: 0.537737
G1 F15000
G3 X181.829 Y161.842 I-.201 J-2.334 E.01483
; LINE_WIDTH: 0.567774
G1 F14289.698
G1 X181.684 Y161.821 E.00624
; LINE_WIDTH: 0.601025
G1 F13438.348
G1 X181.621 Y161.809 E.00295
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609651
G1 F13233.789
M204 S8000
G1 X168.343 Y161.816 E.00226
; LINE_WIDTH: 0.574716
G1 F14103.156
G3 X168.196 Y161.839 I-.347 J-1.712 E.00644
; LINE_WIDTH: 0.537737
G1 F15000
G3 X167.829 Y161.842 I-.201 J-2.334 E.01483
; LINE_WIDTH: 0.567774
G1 F14289.698
G1 X167.684 Y161.821 E.00624
; LINE_WIDTH: 0.601025
G1 F13438.348
G1 X166.856 Y161.655 E.03844
M204 S10000
G1 X166.242 Y161.694 F60000
; LINE_WIDTH: 0.353105
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.0081
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298148
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278611
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.246409
G3 X165.92 Y160.686 I2.395 J-.322 E.01054
; LINE_WIDTH: 0.276656
G1 X166.002 Y160.139 E.01053
M204 S10000
G1 X166.123 Y160.5 F60000
; LINE_WIDTH: 0.250435
G1 F15000
M204 S8000
G1 X166.049 Y160.502 E.00125
; LINE_WIDTH: 0.291536
G1 X165.974 Y160.504 E.0015
; LINE_WIDTH: 0.329066
G1 X165.957 Y160.504 E.00042
G1 X165.941 Y160.422 E.00195
; LINE_WIDTH: 0.297482
G1 X165.925 Y160.34 E.00173
; LINE_WIDTH: 0.278645
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.246415
G3 X165.92 Y155.686 I2.395 J-.323 E.01055
; LINE_WIDTH: 0.276656
G1 X166.002 Y155.139 E.01053
M204 S10000
G1 X166.123 Y155.5 F60000
; LINE_WIDTH: 0.250435
G1 F15000
M204 S8000
G1 X166.049 Y155.502 E.00125
; LINE_WIDTH: 0.291536
G1 X165.974 Y155.504 E.0015
; LINE_WIDTH: 0.329066
G1 X165.957 Y155.504 E.00042
G1 X165.941 Y155.422 E.00195
; LINE_WIDTH: 0.297482
G1 X165.925 Y155.34 E.00173
; LINE_WIDTH: 0.278645
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.246414
G3 X165.92 Y158.686 I2.395 J-.323 E.01055
; LINE_WIDTH: 0.27666
G1 X165.977 Y158.306 E.00732
; WIPE_START
M204 S8000
G1 X165.92 Y158.686 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z2.6 I-1.197 J.218 P1  F60000
G1 X185.963 Y268.881 Z2.6
G1 Z2.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y269.881  
M204 S8000
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X188.398 Y255.349   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y257.357   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y259.273   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #11
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2.6 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z2.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E10

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P71 R5
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z5.2 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y256.381 F60000
G1 Z2.2

; filament start gcode
G17
G3 Z2.6 I0 J-1.217 P1
G1 X185.963 Y256.381 Z2.6
G1 Z2.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y256.881 
G1  X185.463 
G1  Y255.881 
G1  X186.963 
G1  Y257.381 
G1  X184.963 
G1  Y255.381 
G1  X182.963 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
M73 P72 R5
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y266.131  E0.0285
G1  X185.963  E0.7031
G1  Y266.881  E0.0285
G1  X167.463  E0.7031
G1  Y267.631  E0.0285
G1  X185.963  E0.7031
G1  Y268.381  E0.0285
G1  X167.463  E0.7031
G1  Y269.131  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X184.963 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z2.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2954
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z2.6
G1 Z2.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 11 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z2.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z2.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer11 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 12/25
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z2.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2832
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 12 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z2.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z2.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer12 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #12
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z2.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S164 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E9

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P73 R5
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z5.4 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y265.141 F60000
G1 Z2.4
G17
G3 Z2.8 I-1.217 J0 P1
G1 X190.897 Y274.469 Z2.8
G1 X162.53 Y274.469
G1 X162.53 Y269.131

; filament start gcode
G1 X167.463 Y269.131
G1 Z2.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y269.631 
G1  X166.963 
G1  Y268.631 
G1  X168.463 
G1  Y270.131 
G1  X166.463 
G1  Y268.131 
G1  X170.463 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y259.381  E0.0285
G1  X167.463  E0.7031
G1  Y258.631  E0.0285
G1  X185.963  E0.7031
G1  Y257.881  E0.0285
G1  X167.463  E0.7031
G1  Y257.131  E0.0285
G1  X185.963  E0.7031
G1  Y256.381  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X165.438 Y268.205  
M204 S8000
G3  X166.125 Y265.161   I1.763 J-1.201 E0.1330
G2  X166.963 Y262.738   I-3.144 J-2.444 E0.0992
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X167.122 Y270.055   E0.0670
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X167.795 Y270.794 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.361 Y155.814
G1 Z2.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.868 Y155.611 I-.364 J.184 E.06086
G1 X174.961 Y155.591 E.00293
G3 X175.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 15
M204 S250
G1 X174.361 Y155.814 F60000
G1 F12000
M204 S5000
G3 X173.868 Y155.611 I-.364 J.184 E.06086
G1 X173.961 Y155.591 E.00293
G3 X174.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 18
M204 S250
G1 X174.361 Y158.814 F60000
G1 F12000
M204 S5000
G3 X173.868 Y158.611 I-.364 J.184 E.06086
G1 X173.961 Y158.591 E.00293
G3 X174.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.401 Y158.907 E-.06118
G1 X174.407 Y155.052 E-.05527
G1 X174.367 Y155.185 E-.05272
G1 X174.261 Y155.317 E-.06439
G1 X174.103 Y155.397 E-.06715
G1 X173.965 Y155.409 E-.05277
G1 X173.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.447 J1.132 P1  F60000
G1 X175.361 Y158.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.868 Y158.611 I-.364 J.184 E.06086
G1 X174.961 Y158.591 E.00293
G3 X175.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.401 Y158.907 E-.06118
G1 X175.407 Y155.052 E-.05527
G1 X175.367 Y155.185 E-.05272
G1 X175.261 Y155.317 E-.06439
G1 X175.103 Y155.397 E-.06715
G1 X174.965 Y155.409 E-.05277
G1 X174.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.447 J1.132 P1  F60000
G1 X176.361 Y158.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
M73 P74 R5
G3 X175.868 Y158.611 I-.364 J.184 E.06086
G1 X175.961 Y158.591 E.00293
G3 X176.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.401 Y158.907 E-.06118
G1 X176.407 Y155.052 E-.05527
G1 X176.367 Y155.185 E-.05272
G1 X176.261 Y155.317 E-.06439
G1 X176.103 Y155.397 E-.06715
G1 X175.965 Y155.409 E-.05277
G1 X175.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.82 J.9 P1  F60000
G1 X176.361 Y155.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.868 Y155.611 I-.364 J.184 E.06086
G1 X175.961 Y155.591 E.00293
G3 X176.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.401 Y155.907 E-.06118
G1 X176.407 Y160.052 E-.05527
G1 X176.367 Y160.185 E-.05272
G1 X176.261 Y160.317 E-.06439
G1 X176.103 Y160.397 E-.06715
G1 X175.965 Y160.409 E-.05277
G1 X175.898 Y160.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.82 J.9 P1  F60000
G1 X176.361 Y160.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.868 Y160.611 I-.364 J.184 E.06086
G1 X175.961 Y160.591 E.00293
G3 X176.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 3
M204 S250
G1 X175.361 Y160.814 F60000
G1 F12000
M204 S5000
G3 X174.868 Y160.611 I-.364 J.184 E.06086
G1 X174.961 Y160.591 E.00293
G3 X175.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 14
M204 S250
G1 X174.361 Y160.814 F60000
G1 F12000
M204 S5000
G3 X173.868 Y160.611 I-.364 J.184 E.06086
G1 X173.961 Y160.591 E.00293
G3 X174.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X174.401 Y160.907 E-.06118
G1 X174.407 Y161.052 E-.05527
G1 X174.367 Y161.185 E-.0527
G1 X174.261 Y161.317 E-.06441
G1 X174.103 Y161.397 E-.06715
G1 X173.965 Y161.409 E-.05277
G1 X173.898 Y161.392 E-.02652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.145 J-1.208 P1  F60000
G1 X173.259 Y161.315 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y160.611 I-.262 J-.316 E.04427
G1 X172.961 Y160.591 E.00293
G3 X173.303 Y161.273 I.036 J.409 E.03011
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.103 Y161.397 E-.08912
G1 X172.96 Y161.409 E-.05479
G1 X172.775 Y161.344 E-.07439
G1 X172.67 Y161.244 E-.05522
G1 X172.607 Y161.12 E-.05274
G1 X172.595 Y160.979 E-.05374
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.709 J-.989 P1  F60000
G1 X172.362 Y160.813 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.868 Y160.611 I-.365 J.187 E.06129
G1 X171.961 Y160.591 E.00293
G3 X172.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 5
M204 S250
G1 X171.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X170.868 Y160.611 I-.365 J.187 E.06129
G1 X170.961 Y160.591 E.00293
G3 X171.331 Y160.762 I.036 J.409 E.0131
; COOLING_NODE: 10
M204 S250
G1 X171.362 Y155.813 F60000
G1 F12000
M204 S5000
G3 X170.868 Y155.611 I-.365 J.187 E.06129
G1 X170.961 Y155.591 E.00293
G3 X171.331 Y155.762 I.036 J.409 E.0131
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.401 Y155.907 E-.06117
G1 X171.407 Y160.052 E-.05527
G1 X171.367 Y160.185 E-.05272
G1 X171.261 Y160.317 E-.06439
G1 X171.103 Y160.397 E-.06715
G1 X170.965 Y160.409 E-.05278
G1 X170.898 Y160.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.171 J1.205 P1  F60000
G1 X172.364 Y160.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.868 Y155.611 I-.367 J-.184 E.04948
G1 X171.961 Y155.591 E.00293
G3 X172.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 16
M204 S250
G1 X173.259 Y160.315 F60000
G1 F12000
M204 S5000
G3 X172.868 Y155.611 I-.262 J-.316 E.04427
G1 X172.961 Y155.591 E.00293
G3 X173.303 Y160.273 I.036 J.409 E.03011
; COOLING_NODE: 17
M204 S250
G1 X173.259 Y155.315 F60000
G1 F12000
M204 S5000
G3 X172.868 Y158.611 I-.262 J-.316 E.04427
G1 X172.961 Y158.591 E.00293
G3 X173.303 Y155.273 I.036 J.409 E.03011
; COOLING_NODE: 4
M204 S250
G1 X172.364 Y155.183 F60000
G1 F12000
M204 S5000
G3 X171.868 Y158.611 I-.367 J-.184 E.04948
G1 X171.961 Y158.591 E.00293
G3 X172.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.261 Y155.317 E-.08642
G1 X172.103 Y155.397 E-.06715
G1 X171.96 Y155.409 E-.05479
G1 X171.775 Y155.344 E-.07439
G1 X171.67 Y155.244 E-.05522
G1 X171.62 Y155.145 E-.04203
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.962 J-.745 P1  F60000
G1 X171.362 Y158.813 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y158.611 I-.365 J.187 E.06129
G1 X170.961 Y158.591 E.00293
G3 X171.331 Y158.762 I.036 J.409 E.0131
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X171.401 Y158.907 E-.06117
G1 X171.407 Y155.052 E-.05527
G1 X171.367 Y155.185 E-.05272
G1 X171.261 Y155.317 E-.0644
G1 X171.103 Y155.397 E-.06715
G1 X170.965 Y155.409 E-.05278
G1 X170.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.442 J-1.134 P1  F60000
G1 X170.364 Y155.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y158.611 I-.367 J-.184 E.04948
G1 X169.961 Y158.591 E.00293
G3 X170.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.261 Y155.317 E-.08642
G1 X170.103 Y155.397 E-.06715
G1 X169.965 Y155.409 E-.05278
G1 X169.831 Y155.374 E-.05274
G1 X169.712 Y155.293 E-.05477
G1 X169.62 Y155.145 E-.06615
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.959 J-.75 P1  F60000
G1 X169.361 Y158.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y158.611 I-.364 J.184 E.06086
G1 X168.961 Y158.591 E.00293
G3 X169.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.401 Y158.907 E-.06118
G1 X169.407 Y155.052 E-.05527
G1 X169.367 Y155.185 E-.05272
G1 X169.261 Y155.317 E-.06439
G1 X169.103 Y155.397 E-.06715
G1 X168.965 Y155.409 E-.05277
G1 X168.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.82 J.9 P1  F60000
G1 X169.361 Y155.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y155.611 I-.364 J.184 E.06086
G1 X168.961 Y155.591 E.00293
G3 X169.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.401 Y155.907 E-.06118
G1 X169.407 Y160.052 E-.05527
G1 X169.367 Y160.185 E-.05272
G1 X169.261 Y160.317 E-.06439
G1 X169.103 Y160.397 E-.06715
G1 X168.965 Y160.409 E-.05277
G1 X168.898 Y160.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.171 J1.205 P1  F60000
G1 X170.364 Y160.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y155.611 I-.367 J-.184 E.04948
G1 X169.961 Y155.591 E.00293
G3 X170.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 6
M204 S250
G1 X170.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X169.868 Y160.611 I-.365 J.187 E.06129
G1 X169.961 Y160.591 E.00293
G3 X170.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 46
M204 S250
G1 X169.361 Y160.814 F60000
G1 F12000
M204 S5000
G3 X168.868 Y160.611 I-.364 J.184 E.06086
G1 X168.961 Y160.591 E.00293
G3 X169.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 47
M204 S250
G1 X168.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X167.868 Y160.611 I-.365 J.187 E.06129
G1 X167.961 Y160.591 E.00293
G3 X168.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 48
M204 S250
G1 X167.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X166.868 Y160.611 I-.365 J.187 E.06129
G1 X166.961 Y160.591 E.00293
G3 X167.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 49
M204 S250
G1 X167.362 Y155.813 F60000
G1 F12000
M204 S5000
G3 X166.868 Y155.611 I-.365 J.187 E.06129
G1 X166.961 Y155.591 E.00293
G3 X167.331 Y155.762 I.036 J.409 E.01309
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X167.401 Y155.907 E-.06119
G1 X167.407 Y160.052 E-.05526
G1 X167.367 Y160.185 E-.05272
G1 X167.261 Y160.317 E-.06439
G1 X167.103 Y160.397 E-.06715
G1 X166.96 Y160.409 E-.05479
G1 X166.899 Y160.388 E-.0245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.168 J1.205 P1  F60000
G1 X168.364 Y160.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.868 Y155.611 I-.367 J-.184 E.04948
G1 X167.961 Y155.591 E.00293
G3 X168.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 43
M204 S250
G1 X168.364 Y155.183 F60000
G1 F12000
M204 S5000
G3 X167.868 Y158.611 I-.367 J-.184 E.04948
G1 X167.961 Y158.591 E.00293
G3 X168.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X168.261 Y155.317 E-.08642
G1 X168.103 Y155.397 E-.06715
G1 X167.96 Y155.409 E-.05479
G1 X167.775 Y155.344 E-.07439
G1 X167.67 Y155.244 E-.05522
G1 X167.62 Y155.145 E-.04203
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.962 J-.745 P1  F60000
G1 X167.362 Y158.813 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.868 Y158.611 I-.365 J.187 E.06129
G1 X166.961 Y158.591 E.00293
G3 X167.331 Y158.762 I.036 J.409 E.01309
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.38 J.729 E.0476
G2 X166.37 Y160.505 I.651 J.5 E.03567
G2 X166.635 Y161.735 I.675 J.498 E.04721
G1 X166.577 Y161.898 E.00573
G1 X165.602 Y161.898 E.03235
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 21
; WIPE_START
G1 X166.495 Y158.374 E-.07735
G1 X166.315 Y158.578 E-.10329
G1 X166.245 Y158.717 E-.05901
G1 X166.201 Y158.904 E-.07294
G1 X166.199 Y155.081 E-.06742
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.029 J1.217 P1  F60000
G1 X177.361 Y158.814 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X176.868 Y158.611 I-.364 J.184 E.06086
G1 X176.961 Y158.591 E.00293
G3 X177.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X177.401 Y158.907 E-.06118
G1 X177.407 Y155.052 E-.05527
G1 X177.367 Y155.185 E-.05272
G1 X177.261 Y155.317 E-.06439
G1 X177.103 Y155.397 E-.06715
G1 X176.965 Y155.409 E-.05277
G1 X176.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.82 J.9 P1  F60000
G1 X177.361 Y155.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.868 Y155.611 I-.364 J.184 E.06086
G1 X176.961 Y155.591 E.00293
G3 X177.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.401 Y155.907 E-.06118
G1 X177.407 Y160.052 E-.05527
G1 X177.367 Y160.185 E-.05272
G1 X177.261 Y160.317 E-.06439
G1 X177.103 Y160.397 E-.06715
G1 X176.965 Y160.409 E-.05277
G1 X176.898 Y160.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.82 J.9 P1  F60000
G1 X177.361 Y160.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.868 Y160.611 I-.364 J.184 E.06086
G1 X176.961 Y160.591 E.00293
G3 X177.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.401 Y160.907 E-.06118
G1 X177.407 Y161.052 E-.05527
G1 X177.367 Y161.185 E-.0527
G1 X177.261 Y161.317 E-.06441
G1 X177.103 Y161.397 E-.06715
G1 X176.965 Y161.409 E-.05277
G1 X176.898 Y161.392 E-.02652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.447 J1.132 P1  F60000
G1 X178.361 Y160.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y160.611 I-.364 J.184 E.06086
G1 X177.961 Y160.591 E.00293
G3 X178.33 Y160.762 I.035 J.406 E.01307
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.401 Y160.907 E-.06118
G1 X178.407 Y161.052 E-.05527
G1 X178.367 Y161.185 E-.0527
G1 X178.261 Y161.317 E-.06441
G1 X178.103 Y161.397 E-.06715
G1 X177.965 Y161.409 E-.05277
G1 X177.898 Y161.392 E-.02652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.447 J1.132 P1  F60000
G1 X179.362 Y160.813 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y160.611 I-.365 J.187 E.06129
G1 X178.961 Y160.591 E.00293
G3 X179.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 26
M204 S250
G1 X179.364 Y160.183 F60000
G1 F12000
M204 S5000
G3 X178.868 Y155.611 I-.367 J-.184 E.04948
G1 X178.961 Y155.591 E.00293
G3 X179.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.261 Y160.317 E-.08642
G1 X179.103 Y160.397 E-.06715
G1 X178.96 Y160.409 E-.05479
G1 X178.775 Y160.344 E-.07439
G1 X178.67 Y160.244 E-.05522
G1 X178.62 Y160.145 E-.04203
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.959 J-.749 P1  F60000
G1 X178.361 Y155.814 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y155.611 I-.364 J.184 E.06086
G1 X177.961 Y155.591 E.00293
G3 X178.33 Y155.762 I.035 J.406 E.01307
; COOLING_NODE: 22
M204 S250
G1 X178.361 Y158.814 F60000
G1 F12000
M204 S5000
G3 X177.868 Y158.611 I-.364 J.184 E.06086
G1 X177.961 Y158.591 E.00293
G3 X178.33 Y158.762 I.035 J.406 E.01307
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.401 Y158.907 E-.06118
G1 X178.407 Y155.052 E-.05527
G1 X178.367 Y155.185 E-.05272
G1 X178.261 Y155.317 E-.06439
G1 X178.103 Y155.397 E-.06715
G1 X177.965 Y155.409 E-.05277
G1 X177.898 Y155.392 E-.02653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.171 J1.205 P1  F60000
G1 X179.364 Y155.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y158.611 I-.367 J-.184 E.04948
G1 X178.961 Y158.591 E.00293
G3 X179.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 24
M204 S250
G1 X180.364 Y155.183 F60000
G1 F12000
M204 S5000
G3 X179.868 Y158.611 I-.367 J-.184 E.04948
G1 X179.961 Y158.591 E.00293
G3 X180.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.261 Y155.317 E-.08642
G1 X180.103 Y155.397 E-.06715
G1 X179.965 Y155.409 E-.05277
G1 X179.831 Y155.374 E-.05275
G1 X179.712 Y155.293 E-.05476
G1 X179.62 Y155.145 E-.06616
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.989 J.709 P1  F60000
G1 X180.364 Y160.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.868 Y155.611 I-.367 J-.184 E.04948
G1 X179.961 Y155.591 E.00293
G3 X180.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 32
M204 S250
G1 X180.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X179.868 Y160.611 I-.365 J.187 E.06129
G1 X179.961 Y160.591 E.00293
G3 X180.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.401 Y160.907 E-.06119
G1 X180.407 Y161.052 E-.05527
G1 X180.367 Y161.185 E-.0527
G1 X180.261 Y161.317 E-.06441
G1 X180.103 Y161.397 E-.06715
G1 X179.965 Y161.409 E-.05277
G1 X179.898 Y161.392 E-.02652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.447 J1.132 P1  F60000
G1 X181.362 Y160.813 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.868 Y160.611 I-.365 J.187 E.06129
G1 X180.961 Y160.591 E.00293
G3 X181.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 40
M204 S250
G1 X181.362 Y155.813 F60000
G1 F12000
M204 S5000
G3 X180.868 Y155.611 I-.365 J.187 E.06129
G1 X180.961 Y155.591 E.00293
G3 X181.331 Y155.762 I.036 J.409 E.01309
; COOLING_NODE: 39
M204 S250
G1 X181.362 Y158.813 F60000
G1 F12000
M204 S5000
G3 X180.868 Y158.611 I-.365 J.187 E.06129
G1 X180.961 Y158.591 E.00293
G3 X181.331 Y158.762 I.036 J.409 E.01309
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X181.401 Y158.907 E-.06119
G1 X181.407 Y155.052 E-.05526
G1 X181.367 Y155.185 E-.05272
G1 X181.261 Y155.317 E-.06439
G1 X181.103 Y155.397 E-.06715
G1 X180.96 Y155.409 E-.05479
G1 X180.899 Y155.388 E-.0245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.168 J1.205 P1  F60000
G1 X182.364 Y155.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y158.611 I-.367 J-.184 E.04948
G1 X181.961 Y158.591 E.00293
G3 X182.387 Y155.128 I.036 J.409 E.0249
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.261 Y155.317 E-.08642
G1 X182.103 Y155.397 E-.06715
G1 X181.96 Y155.409 E-.05479
G1 X181.775 Y155.344 E-.07439
G1 X181.67 Y155.244 E-.05522
G1 X181.62 Y155.145 E-.04204
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-.989 J.709 P1  F60000
G1 X182.364 Y160.183 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y155.611 I-.367 J-.184 E.04948
G1 X181.961 Y155.591 E.00293
G3 X182.387 Y160.128 I.036 J.409 E.0249
; COOLING_NODE: 34
M204 S250
G1 X182.362 Y160.813 F60000
G1 F12000
M204 S5000
G3 X181.868 Y160.611 I-.365 J.187 E.06129
G1 X181.961 Y160.591 E.00293
G3 X182.331 Y160.762 I.036 J.409 E.01309
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.401 Y160.907 E-.06119
G1 X182.407 Y161.052 E-.05527
G1 X182.367 Y161.185 E-.0527
G1 X182.261 Y161.317 E-.06441
G1 X182.103 Y161.397 E-.06715
G1 X181.96 Y161.409 E-.05479
G1 X181.899 Y161.388 E-.0245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.065 J1.215 P1  F60000
G1 X183.259 Y161.315 Z2.8
G1 Z2.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.868 Y160.611 I-.262 J-.316 E.04427
G1 X182.961 Y160.591 E.00293
G3 X183.303 Y161.273 I.036 J.409 E.03011
; COOLING_NODE: 36
M204 S250
G1 X183.259 Y160.315 F60000
G1 F12000
M204 S5000
G3 X182.868 Y155.611 I-.262 J-.316 E.04427
G1 X182.961 Y155.591 E.00293
G3 X183.303 Y160.273 I.036 J.409 E.03011
; COOLING_NODE: 41
M204 S250
G1 X183.259 Y155.315 F60000
G1 F12000
M204 S5000
G3 X182.868 Y158.611 I-.262 J-.316 E.04427
G1 X182.961 Y158.591 E.00293
G3 X183.303 Y155.273 I.036 J.409 E.03011
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.103 Y155.397 E-.08912
G1 X182.96 Y155.409 E-.05479
G1 X182.775 Y155.344 E-.07439
G1 X182.67 Y155.244 E-.05522
G1 X182.607 Y155.12 E-.05277
G1 X182.595 Y158.979 E-.05371
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I-1.035 J.64 P1  F60000
G1 X184.398 Y161.898 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.407 Y161.898 E.03288
G1 X183.355 Y161.723 E.00606
G2 X183.631 Y160.504 I-.363 J-.723 E.04738
G2 X183.631 Y155.504 I-.649 J-.5 E.03568
G2 X183.358 Y158.275 I-.649 J-.501 E.04761
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.149 J.401 P1  F60000
G1 X184.042 Y161.511 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331144
G1 F15000
M204 S8000
G1 X184.059 Y161.425 E.00204
; LINE_WIDTH: 0.294503
G1 X184.078 Y161.32 E.00219
; LINE_WIDTH: 0.244605
G2 X184.085 Y160.724 I-2.495 J-.327 E.00982
; LINE_WIDTH: 0.282055
G1 X184.065 Y160.612 E.00223
; LINE_WIDTH: 0.316762
G3 X184.075 Y160.34 I.355 J-.122 E.00621
; LINE_WIDTH: 0.257953
G2 X184.097 Y160.132 I-6.911 J-.848 E.00366
; LINE_WIDTH: 0.239464
G2 X184.085 Y155.724 I-3.286 J-.105 E.00655
; LINE_WIDTH: 0.282055
G1 X184.065 Y155.612 E.00223
; LINE_WIDTH: 0.316762
G3 X184.075 Y155.34 I.355 J-.122 E.00621
; LINE_WIDTH: 0.257953
G2 X184.097 Y155.132 I-6.911 J-.848 E.00366
; LINE_WIDTH: 0.239464
G2 X184.085 Y158.724 I-3.286 J-.105 E.00655
; LINE_WIDTH: 0.283315
G1 X184.063 Y158.605 E.00238
; LINE_WIDTH: 0.326639
G1 X184.042 Y158.485 E.00281
; LINE_WIDTH: 0.350829
G1 X184.037 Y158.463 E.00057
G1 X183.758 Y158.306 E.00804
M204 S10000
G1 X184.042 Y161.511 F60000
; LINE_WIDTH: 0.358728
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00067
G1 X183.752 Y161.694 E.00838
M204 S10000
G1 X183.125 Y161.635 F60000
; LINE_WIDTH: 0.618971
G1 F13019.678
M204 S8000
G1 X182.355 Y161.814 E.03709
; LINE_WIDTH: 0.583673
G1 F13869.555
G1 X182.24 Y161.833 E.00517
; LINE_WIDTH: 0.543036
G1 F14996.522
G3 X181.744 Y161.831 I-.239 J-1.858 E.02024
; LINE_WIDTH: 0.578748
G1 F13997.039
G1 X181.684 Y161.821 E.00269
; WIPE_START
G1 X181.744 Y161.831 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I.011 J-1.217 P1  F60000
G1 X166.25 Y161.694 Z2.8
G1 Z2.4
G1 E.4 F1800
; LINE_WIDTH: 0.353188
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00826
G1 X165.942 Y161.425 E.00285
; LINE_WIDTH: 0.29822
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.245596
G3 X165.917 Y160.737 I2.353 J-.333 E.00999
; LINE_WIDTH: 0.279513
G1 X165.931 Y160.617 E.00232
; LINE_WIDTH: 0.298884
G1 X166.01 Y160.175 E.00937
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.250915
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00126
; LINE_WIDTH: 0.288952
G1 X165.977 Y160.504 E.00149
; LINE_WIDTH: 0.328357
G1 X165.956 Y160.503 E.00047
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297374
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.245585
G3 X165.917 Y155.737 I2.353 J-.333 E.00999
; LINE_WIDTH: 0.279513
G1 X165.931 Y155.617 E.00232
; LINE_WIDTH: 0.298884
G1 X166.01 Y155.175 E.00937
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.250915
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00126
; LINE_WIDTH: 0.288952
G1 X165.977 Y155.504 E.00149
; LINE_WIDTH: 0.328357
G1 X165.956 Y155.503 E.00047
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297374
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.245585
G3 X165.917 Y158.737 I2.353 J-.333 E.00999
; LINE_WIDTH: 0.279513
G1 X165.931 Y158.617 E.00232
; LINE_WIDTH: 0.298889
G1 X165.986 Y158.306 E.0066
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z2.4
Z2.16
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X150 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X155 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X160 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X165 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X170 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X175 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X180 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X185 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X190 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X195 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X200 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X205 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X210 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X215 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X220 Y155 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z2.4
Z2.16
G1 E0.40 F150
G4 P400
G0 Z0.6 
G1 E-0.08 F800
G0 X145 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X150 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X155 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X160 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X165 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X170 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X175 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X180 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X185 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X190 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X195 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X200 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X205 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X210 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X215 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X220 Y160 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z2.4
Z2.16
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X150 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X155 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X160 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X165 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X170 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X175 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X180 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X185 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X190 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X195 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X200 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X205 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X210 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X215 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
G0 X220 Y165 Z2.4
Z2.16
G1 E0.40
G4 P400
G0 Z2.4
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.931 Y158.617 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 13/25
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-.146 J1.208 P1  F60000
G1 X175.323 Y155.753 Z2.8
G1 Z2.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.868 Y155.611 I-.326 J.242 E.06279
G1 X174.959 Y155.591 E.00287
M104 T0 S210 N0 ;Multi extruder pre heating
G3 X175.284 Y155.708 I.038 J.405 E.01095
; COOLING_NODE: 15
M204 S250
G1 X174.323 Y155.753 F60000
G1 F12000
M204 S5000
G3 X173.868 Y155.611 I-.326 J.242 E.06279
G1 X173.959 Y155.591 E.00287
G3 X174.284 Y155.708 I.038 J.405 E.01095
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.402 Y155.913 E-.08998
G1 X174.407 Y160.052 E-.05278
G1 X174.365 Y160.189 E-.05458
G1 X174.236 Y160.337 E-.07445
G1 X174.104 Y160.397 E-.05536
G1 X173.965 Y160.404 E-.05284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.187 J-1.203 P1  F60000
G1 X173.279 Y160.298 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y155.611 I-.281 J-.298 E.04502
G1 X172.959 Y155.591 E.00287
G3 X173.319 Y160.253 I.039 J.408 E.02939
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.11 Y160.396 E-.09617
G1 X172.965 Y160.409 E-.05537
G1 X172.831 Y160.374 E-.05278
G1 X172.67 Y160.244 E-.07865
G1 X172.607 Y160.12 E-.05273
G1 X172.602 Y160.004 E-.0443
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.079 J.564 P1  F60000
G1 X173.279 Y161.298 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y160.611 I-.281 J-.298 E.04502
G1 X172.959 Y160.591 E.00287
G3 X173.319 Y161.253 I.039 J.408 E.02939
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.11 Y161.396 E-.09617
G1 X172.965 Y161.409 E-.05537
G1 X172.831 Y161.374 E-.05278
G1 X172.67 Y161.244 E-.07865
G1 X172.607 Y161.12 E-.05275
G1 X172.602 Y161.004 E-.04428
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.175 J1.204 P1  F60000
G1 X174.323 Y160.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.868 Y160.611 I-.326 J.242 E.06279
G1 X173.959 Y160.591 E.00287
G3 X174.284 Y160.708 I.038 J.405 E.01095
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.402 Y160.913 E-.08998
G1 X174.407 Y161.052 E-.05278
G1 X174.365 Y161.189 E-.05459
G1 X174.236 Y161.337 E-.07446
G1 X174.104 Y161.397 E-.05536
G1 X173.965 Y161.404 E-.05284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.526 J1.097 P1  F60000
G1 X175.323 Y160.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.868 Y160.611 I-.326 J.242 E.06279
G1 X174.959 Y160.591 E.00287
G3 X175.284 Y160.708 I.038 J.405 E.01095
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X175.402 Y160.913 E-.08998
G1 X175.407 Y161.052 E-.05278
G1 X175.365 Y161.189 E-.05459
G1 X175.236 Y161.337 E-.07446
G1 X175.104 Y161.397 E-.05536
G1 X174.965 Y161.404 E-.05284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.526 J1.097 P1  F60000
G1 X176.323 Y160.754 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.868 Y160.611 I-.326 J.242 E.06275
G1 X175.959 Y160.591 E.00287
G3 X176.284 Y160.708 I.038 J.404 E.01095
; COOLING_NODE: 1
M204 S250
G1 X176.323 Y155.754 F60000
G1 F12000
M204 S5000
G3 X175.868 Y155.611 I-.326 J.242 E.06275
G1 X175.959 Y155.591 E.00287
G3 X176.284 Y155.708 I.038 J.404 E.01095
; COOLING_NODE: 20
M204 S250
G1 X176.323 Y158.754 F60000
G1 F12000
M204 S5000
G3 X175.868 Y158.611 I-.326 J.242 E.06275
G1 X175.959 Y158.591 E.00287
G3 X176.284 Y158.708 I.038 J.404 E.01095
; COOLING_NODE: 19
M204 S250
G1 X175.323 Y158.754 F60000
G1 F12000
M204 S5000
G3 X174.868 Y158.611 I-.326 J.242 E.06278
G1 X174.959 Y158.591 E.00287
M73 P75 R5
G3 X175.284 Y158.708 I.038 J.405 E.01095
; COOLING_NODE: 18
M204 S250
G1 X174.323 Y158.753 F60000
G1 F12000
M204 S5000
G3 X173.868 Y158.611 I-.326 J.242 E.06278
G1 X173.959 Y158.591 E.00287
G3 X174.284 Y158.708 I.038 J.405 E.01095
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.402 Y158.913 E-.08997
G1 X174.407 Y155.052 E-.05278
G1 X174.365 Y155.189 E-.05458
G1 X174.236 Y155.337 E-.07445
G1 X174.104 Y155.397 E-.05536
G1 X173.965 Y155.404 E-.05286
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.187 J-1.203 P1  F60000
G1 X173.279 Y155.298 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.868 Y158.611 I-.281 J-.298 E.04502
G1 X172.959 Y158.591 E.00287
G3 X173.319 Y155.253 I.039 J.408 E.02939
; COOLING_NODE: 4
M204 S250
G1 X172.364 Y155.183 F60000
G1 F12000
M204 S5000
G3 X171.868 Y158.611 I-.366 J-.184 E.04942
G1 X171.959 Y158.591 E.00287
G3 X172.387 Y155.128 I.039 J.408 E.02498
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X172.281 Y155.3 E-.0769
G1 X172.11 Y155.396 E-.07439
G1 X171.965 Y155.409 E-.05537
G1 X171.831 Y155.374 E-.05278
G1 X171.67 Y155.244 E-.07865
G1 X171.62 Y155.146 E-.04191
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.989 J.709 P1  F60000
G1 X172.364 Y160.183 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.868 Y155.611 I-.366 J-.184 E.04943
G1 X171.959 Y155.591 E.00287
G3 X172.387 Y160.128 I.039 J.408 E.02498
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X172.281 Y160.3 E-.0769
G1 X172.11 Y160.396 E-.07439
G1 X171.965 Y160.409 E-.05537
G1 X171.831 Y160.374 E-.05278
G1 X171.67 Y160.244 E-.07865
G1 X171.62 Y160.146 E-.04191
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.971 J-.733 P1  F60000
G1 X171.324 Y155.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y155.611 I-.326 J.244 E.06305
G1 X170.959 Y155.591 E.00287
G3 X171.284 Y155.708 I.038 J.406 E.01096
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.402 Y155.913 E-.09
G1 X171.407 Y160.052 E-.05278
G1 X171.365 Y160.189 E-.05458
G1 X171.236 Y160.337 E-.07445
G1 X171.104 Y160.397 E-.05536
G1 X170.965 Y160.409 E-.05275
G1 X170.965 Y160.409 E-.00007
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.842 J.878 P1  F60000
G1 X171.324 Y160.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y160.611 I-.326 J.244 E.06305
G1 X170.959 Y160.591 E.00287
G3 X171.284 Y160.708 I.038 J.406 E.01096
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X171.402 Y160.913 E-.09001
G1 X171.407 Y161.052 E-.05278
G1 X171.365 Y161.189 E-.05459
G1 X171.236 Y161.337 E-.07446
G1 X171.104 Y161.397 E-.05536
G1 X170.965 Y161.409 E-.05275
G1 X170.965 Y161.409 E-.00007
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.53 J1.096 P1  F60000
G1 X172.324 Y160.752 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.868 Y160.611 I-.327 J.247 E.06344
G1 X171.959 Y160.591 E.00287
G3 X172.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.402 Y160.913 E-.09006
G1 X172.407 Y161.052 E-.05278
G1 X172.367 Y161.185 E-.05274
G1 X172.281 Y161.3 E-.05465
G1 X172.11 Y161.396 E-.07439
G1 X171.965 Y161.409 E-.05537
G1 X171.965 Y161.409 E-.00001
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.183 J-.286 P1  F60000
G1 X171.324 Y158.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.868 Y158.611 I-.326 J.244 E.06304
G1 X170.959 Y158.591 E.00287
G3 X171.284 Y158.708 I.038 J.406 E.01096
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X171.402 Y158.913 E-.09
G1 X171.407 Y155.052 E-.05278
G1 X171.365 Y155.189 E-.05458
G1 X171.236 Y155.337 E-.07445
G1 X171.104 Y155.397 E-.05536
G1 X170.965 Y155.409 E-.05275
G1 X170.965 Y155.409 E-.00007
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.42 J-1.142 P1  F60000
G1 X170.358 Y155.186 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y158.611 I-.361 J-.189 E.04897
G1 X169.959 Y158.591 E.00287
G3 X170.382 Y155.131 I.038 J.406 E.02503
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.236 Y155.337 E-.09606
G1 X170.104 Y155.397 E-.05536
G1 X169.965 Y155.409 E-.05275
G1 X169.831 Y155.374 E-.05277
G1 X169.716 Y155.296 E-.05278
G1 X169.621 Y155.159 E-.06342
G1 X169.618 Y155.141 E-.00687
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.968 J-.737 P1  F60000
G1 X169.323 Y158.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y158.611 I-.326 J.242 E.06278
G1 X168.959 Y158.591 E.00287
G3 X169.284 Y158.708 I.038 J.405 E.01095
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.402 Y158.913 E-.08997
G1 X169.407 Y155.052 E-.05278
G1 X169.365 Y155.189 E-.05458
G1 X169.236 Y155.337 E-.07445
G1 X169.104 Y155.397 E-.05536
G1 X168.965 Y155.404 E-.05286
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.849 J.872 P1  F60000
G1 X169.323 Y155.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.868 Y155.611 I-.326 J.242 E.06279
G1 X168.959 Y155.591 E.00287
G3 X169.284 Y155.708 I.038 J.405 E.01095
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.402 Y155.913 E-.08998
G1 X169.407 Y160.052 E-.05278
G1 X169.365 Y160.189 E-.05458
G1 X169.236 Y160.337 E-.07445
G1 X169.104 Y160.397 E-.05536
G1 X168.965 Y160.404 E-.05284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.188 J1.202 P1  F60000
G1 X170.358 Y160.186 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.868 Y155.611 I-.361 J-.189 E.04897
G1 X169.959 Y155.591 E.00287
G3 X170.382 Y160.131 I.038 J.406 E.02503
; COOLING_NODE: 6
M204 S250
G1 X170.323 Y160.753 F60000
G1 F12000
M204 S5000
G3 X169.868 Y160.611 I-.326 J.244 E.06305
G1 X169.959 Y160.591 E.00287
G3 X170.284 Y160.708 I.038 J.406 E.01096
; COOLING_NODE: 46
M204 S250
G1 X169.323 Y160.753 F60000
G1 F12000
M204 S5000
G3 X168.868 Y160.611 I-.326 J.242 E.06279
G1 X168.959 Y160.591 E.00287
G3 X169.284 Y160.708 I.038 J.405 E.01095
; COOLING_NODE: 47
M204 S250
G1 X168.324 Y160.752 F60000
G1 F12000
M204 S5000
G3 X167.868 Y160.611 I-.327 J.247 E.06344
G1 X167.959 Y160.591 E.00287
G3 X168.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 48
M204 S250
G1 X167.324 Y160.752 F60000
G1 F12000
M204 S5000
G3 X166.868 Y160.611 I-.327 J.247 E.06344
G1 X166.959 Y160.591 E.00287
G3 X167.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 49
M204 S250
G1 X167.324 Y155.752 F60000
G1 F12000
M204 S5000
G3 X166.868 Y155.611 I-.327 J.247 E.06344
G1 X166.959 Y155.591 E.00287
G3 X167.285 Y155.707 I.039 J.408 E.01097
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X167.402 Y155.913 E-.09006
G1 X167.407 Y160.052 E-.05278
G1 X167.367 Y160.185 E-.05274
G1 X167.281 Y160.3 E-.05465
G1 X167.11 Y160.396 E-.07439
G1 X166.965 Y160.409 E-.05537
G1 X166.965 Y160.409 E-.00001
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.191 J1.202 P1  F60000
G1 X168.362 Y160.188 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.868 Y155.611 I-.364 J-.188 E.04928
G1 X167.959 Y155.591 E.00287
G3 X168.385 Y160.132 I.039 J.408 E.02513
; COOLING_NODE: 43
M204 S250
G1 X168.362 Y155.188 F60000
G1 F12000
M204 S5000
G3 X167.868 Y158.611 I-.364 J-.188 E.04928
G1 X167.959 Y158.591 E.00287
G3 X168.385 Y155.132 I.039 J.408 E.02513
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X168.236 Y155.337 E-.09622
G1 X168.104 Y155.397 E-.05536
G1 X167.965 Y155.409 E-.05275
M73 P75 R4
G1 X167.831 Y155.374 E-.05278
G1 X167.67 Y155.244 E-.07865
G1 X167.617 Y155.14 E-.04424
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.971 J-.733 P1  F60000
G1 X167.324 Y158.752 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.868 Y158.611 I-.327 J.247 E.06344
G1 X166.959 Y158.591 E.00287
G3 X167.285 Y158.707 I.039 J.408 E.01097
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 40
; WIPE_START
G1 X166.495 Y158.374 E-.07735
G1 X166.396 Y158.469 E-.05179
G1 X166.254 Y158.7 E-.10337
G1 X166.214 Y158.831 E-.05188
G1 X166.203 Y155.082 E-.09561
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.054 J1.216 P1  F60000
G1 X181.324 Y155.752 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X180.868 Y155.611 I-.327 J.247 E.06344
G1 X180.959 Y155.591 E.00287
G3 X181.285 Y155.707 I.039 J.408 E.01097
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X181.402 Y155.913 E-.09006
G1 X181.407 Y160.052 E-.05278
G1 X181.365 Y160.189 E-.05458
G1 X181.236 Y160.337 E-.07445
G1 X181.104 Y160.397 E-.05536
G1 X180.965 Y160.409 E-.05275
G1 X180.965 Y160.409 E-.00002
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.191 J1.202 P1  F60000
G1 X182.362 Y160.188 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y155.611 I-.364 J-.188 E.04928
G1 X181.959 Y155.591 E.00287
G3 X182.385 Y160.132 I.039 J.408 E.02513
; COOLING_NODE: 36
M204 S250
G1 X183.234 Y160.334 F60000
G1 F12000
M204 S5000
G3 X182.868 Y155.611 I-.237 J-.335 E.04325
G1 X182.959 Y155.591 E.00287
G3 X183.28 Y160.296 I.039 J.408 E.03116
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X183.104 Y160.397 E-.07748
G1 X182.965 Y160.409 E-.05275
G1 X182.831 Y160.374 E-.05278
G1 X182.716 Y160.297 E-.05275
G1 X182.607 Y160.12 E-.07864
G1 X182.6 Y155.948 E-.06559
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.107 J.506 P1  F60000
G1 X183.234 Y161.334 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.868 Y160.611 I-.237 J-.335 E.04325
G1 X182.959 Y160.591 E.00287
G3 X183.28 Y161.296 I.039 J.408 E.03116
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.104 Y161.397 E-.07747
G1 X182.965 Y161.409 E-.05275
G1 X182.831 Y161.374 E-.05278
G1 X182.67 Y161.244 E-.07863
G1 X182.607 Y161.12 E-.05278
G1 X182.6 Y160.948 E-.06559
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.705 J-.992 P1  F60000
G1 X182.324 Y160.752 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y160.611 I-.327 J.247 E.06344
G1 X181.959 Y160.591 E.00287
G3 X182.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 33
M204 S250
G1 X181.324 Y160.752 F60000
G1 F12000
M204 S5000
G3 X180.868 Y160.611 I-.327 J.247 E.06344
G1 X180.959 Y160.591 E.00287
G3 X181.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 32
M204 S250
G1 X180.323 Y160.753 F60000
G1 F12000
M204 S5000
G3 X179.868 Y160.611 I-.326 J.244 E.06302
G1 X179.959 Y160.591 E.00287
G3 X180.284 Y160.708 I.038 J.406 E.01096
; COOLING_NODE: 31
M204 S250
G1 X179.324 Y160.752 F60000
G1 F12000
M204 S5000
G3 X178.868 Y160.611 I-.327 J.247 E.06344
G1 X178.959 Y160.591 E.00287
G3 X179.285 Y160.707 I.039 J.408 E.01097
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.402 Y160.913 E-.09006
G1 X179.407 Y161.052 E-.05278
G1 X179.365 Y161.189 E-.05459
G1 X179.236 Y161.337 E-.07446
G1 X179.104 Y161.397 E-.05536
G1 X178.965 Y161.409 E-.05275
G1 X178.965 Y161.409 E-.00002
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.135 J-.44 P1  F60000
G1 X178.323 Y155.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y155.611 I-.326 J.242 E.06279
G1 X177.959 Y155.591 E.00287
G3 X178.284 Y155.708 I.038 J.405 E.01095
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178.402 Y155.913 E-.08998
G1 X178.407 Y160.052 E-.05278
G1 X178.365 Y160.189 E-.05458
G1 X178.236 Y160.337 E-.07445
G1 X178.104 Y160.397 E-.05536
G1 X177.965 Y160.404 E-.05285
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.849 J.872 P1  F60000
G1 X178.323 Y160.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y160.611 I-.326 J.242 E.06279
G1 X177.959 Y160.591 E.00287
G3 X178.284 Y160.708 I.038 J.405 E.01095
; COOLING_NODE: 29
M204 S250
G1 X177.323 Y160.753 F60000
G1 F12000
M204 S5000
G3 X176.868 Y160.611 I-.326 J.242 E.06279
G1 X176.959 Y160.591 E.00287
G3 X177.284 Y160.708 I.038 J.405 E.01095
; COOLING_NODE: 28
M204 S250
G1 X177.323 Y155.753 F60000
G1 F12000
M204 S5000
G3 X176.868 Y155.611 I-.326 J.242 E.06279
G1 X176.959 Y155.591 E.00287
G3 X177.284 Y155.708 I.038 J.405 E.01095
; COOLING_NODE: 21
M204 S250
G1 X177.323 Y158.753 F60000
G1 F12000
M204 S5000
G3 X176.868 Y158.611 I-.326 J.242 E.06278
G1 X176.959 Y158.591 E.00287
G3 X177.284 Y158.708 I.038 J.405 E.01095
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.402 Y158.913 E-.08997
G1 X177.407 Y155.052 E-.05278
G1 X177.365 Y155.189 E-.05458
G1 X177.236 Y155.337 E-.07445
G1 X177.104 Y155.397 E-.05536
G1 X176.965 Y155.404 E-.05286
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.526 J1.097 P1  F60000
G1 X178.323 Y158.753 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.868 Y158.611 I-.326 J.242 E.06278
G1 X177.959 Y158.591 E.00287
G3 X178.284 Y158.708 I.038 J.405 E.01095
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.402 Y158.913 E-.08997
G1 X178.407 Y155.052 E-.05278
G1 X178.365 Y155.189 E-.05458
G1 X178.236 Y155.337 E-.07445
G1 X178.104 Y155.397 E-.05536
G1 X177.965 Y155.404 E-.05286
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.187 J1.203 P1  F60000
G1 X179.362 Y155.188 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y158.611 I-.364 J-.188 E.04928
G1 X178.959 Y158.591 E.00287
G3 X179.385 Y155.132 I.039 J.408 E.02513
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X179.236 Y155.337 E-.09622
G1 X179.104 Y155.397 E-.05536
G1 X178.965 Y155.409 E-.05275
G1 X178.831 Y155.374 E-.05278
G1 X178.67 Y155.244 E-.07865
G1 X178.617 Y155.14 E-.04424
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.992 J.705 P1  F60000
G1 X179.362 Y160.188 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.868 Y155.611 I-.364 J-.188 E.04928
G1 X178.959 Y155.591 E.00287
G3 X179.385 Y160.132 I.039 J.408 E.02513
; COOLING_NODE: 25
M204 S250
G1 X180.361 Y160.182 F60000
G1 F12000
M204 S5000
G3 X179.868 Y155.611 I-.363 J-.185 E.04909
G1 X179.959 Y155.591 E.00287
G3 X180.384 Y160.126 I.038 J.406 E.02488
; COOLING_NODE: 24
M204 S250
G1 X180.361 Y155.182 F60000
G1 F12000
M204 S5000
G3 X179.868 Y158.611 I-.363 J-.185 E.04909
G1 X179.959 Y158.591 E.00287
G3 X180.384 Y155.126 I.038 J.406 E.02488
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X180.281 Y155.3 E-.07681
G1 X180.11 Y155.396 E-.07439
G1 X179.965 Y155.409 E-.05537
G1 X179.831 Y155.374 E-.05274
G1 X179.716 Y155.296 E-.05281
G1 X179.621 Y155.159 E-.06342
G1 X179.619 Y155.147 E-.00446
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.275 J1.186 P1  F60000
G1 X181.324 Y158.752 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.868 Y158.611 I-.327 J.247 E.06344
G1 X180.959 Y158.591 E.00287
G3 X181.285 Y158.707 I.039 J.408 E.01097
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X181.402 Y158.913 E-.09006
G1 X181.407 Y155.052 E-.05278
G1 X181.365 Y155.189 E-.05458
G1 X181.236 Y155.337 E-.07445
G1 X181.104 Y155.397 E-.05536
G1 X180.965 Y155.409 E-.05275
G1 X180.965 Y155.409 E-.00002
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.191 J1.202 P1  F60000
G1 X182.362 Y155.188 Z3
G1 Z2.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.868 Y158.611 I-.364 J-.188 E.04928
G1 X181.959 Y158.591 E.00287
G3 X182.385 Y155.132 I.039 J.408 E.02513
; COOLING_NODE: 41
M204 S250
G1 X183.234 Y155.334 F60000
G1 F12000
M204 S5000
G3 X182.868 Y158.611 I-.237 J-.335 E.04325
G1 X182.959 Y158.591 E.00287
G3 X183.28 Y155.296 I.039 J.408 E.03116
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.104 Y155.397 E-.07748
G1 X182.965 Y155.409 E-.05275
G1 X182.831 Y155.374 E-.05278
G1 X182.716 Y155.297 E-.05275
G1 X182.607 Y155.12 E-.07864
G1 X182.6 Y158.948 E-.0656
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.039 J.633 P1  F60000
G1 X184.398 Y161.898 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.631 Y160.495 I-.372 J-.721 E.04728
G2 X183.631 Y155.495 I-.648 J-.5 E.03569
G2 X183.358 Y158.275 I-.642 J-.497 E.04736
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.154 J.386 P1  F60000
G1 X184.057 Y161.435 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.299973
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00202
; LINE_WIDTH: 0.278652
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243522
G2 X184.09 Y160.774 I-2.428 J-.325 E.00894
; LINE_WIDTH: 0.268375
G1 X184.073 Y160.657 E.00217
; LINE_WIDTH: 0.300494
G1 X184.058 Y160.559 E.0021
; LINE_WIDTH: 0.328226
G3 X184.06 Y160.42 I.19 J-.068 E.0033
; LINE_WIDTH: 0.297123
G1 X184.075 Y160.34 E.00168
; LINE_WIDTH: 0.278677
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243528
G2 X184.09 Y155.774 I-2.428 J-.325 E.00894
; LINE_WIDTH: 0.268375
G1 X184.073 Y155.657 E.00217
; LINE_WIDTH: 0.300494
G1 X184.058 Y155.559 E.0021
; LINE_WIDTH: 0.328226
G3 X184.06 Y155.42 I.19 J-.068 E.0033
; LINE_WIDTH: 0.297123
G1 X184.075 Y155.34 E.00168
; LINE_WIDTH: 0.278677
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243528
G2 X184.09 Y158.774 I-2.428 J-.325 E.00894
; LINE_WIDTH: 0.268382
G1 X184.073 Y158.657 E.00217
; LINE_WIDTH: 0.300511
G1 X184.058 Y158.559 E.0021
; LINE_WIDTH: 0.322217
G1 X184.005 Y158.306 E.00589
M204 S10000
G1 X184.057 Y161.435 F60000
; LINE_WIDTH: 0.341934
G1 F15000
M204 S8000
G1 X184.037 Y161.537 E.00254
G1 X183.768 Y161.694 E.0076
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609588
G1 F13235.282
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574656
G1 F14104.74
G3 X182.196 Y161.839 I-.35 J-1.733 E.00644
; LINE_WIDTH: 0.540445
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.907 E.01773
; LINE_WIDTH: 0.581579
G1 F13923.483
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609628
G1 F13234.332
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609588
G1 F13235.282
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574656
G1 F14104.74
G3 X168.196 Y161.839 I-.35 J-1.733 E.00644
; LINE_WIDTH: 0.540445
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.907 E.01773
; LINE_WIDTH: 0.581579
G1 F13923.483
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609628
G1 F13234.332
G1 X166.859 Y161.643 E.03772
M204 S10000
G1 X166.773 Y161.971 F60000
; LINE_WIDTH: 0.661768
G1 F12119.306
M204 S8000
G2 X168.022 Y161.605 I-2.596 J-11.189 E.06563
; WIPE_START
G1 X167.489 Y161.78 E-.21303
G1 X167.065 Y161.893 E-.16697
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.288 J-1.182 P1  F60000
G1 X166.249 Y161.694 Z3
G1 Z2.6
G1 E.4 F1800
; LINE_WIDTH: 0.353136
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00824
G1 X165.942 Y161.426 E.00285
; LINE_WIDTH: 0.298253
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278673
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243521
G3 X165.91 Y160.775 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266333
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294471
G1 X165.938 Y160.585 E.00178
; LINE_WIDTH: 0.311702
G1 X166.014 Y160.193 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.250771
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00125
; LINE_WIDTH: 0.288558
G1 X165.977 Y160.503 E.00148
; LINE_WIDTH: 0.328344
G1 X165.956 Y160.503 E.00047
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297445
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278699
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243533
G3 X165.91 Y155.775 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266332
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294471
G1 X165.938 Y155.585 E.00178
; LINE_WIDTH: 0.311702
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.250771
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00125
; LINE_WIDTH: 0.288558
G1 X165.977 Y155.503 E.00148
; LINE_WIDTH: 0.328344
G1 X165.956 Y155.503 E.00047
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297445
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278699
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243533
G3 X165.91 Y158.775 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266327
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294452
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.311674
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z3 I-1.217 J.017 P1  F60000
G1 X167.463 Y268.881 Z3
G1 Z2.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y269.881  
M204 S8000
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #13
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z3 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z2.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E8

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


M73 P76 R4
;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z5.6 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y264.706 F60000
G1 Z2.6
G17
G3 Z3 I1.217 J0 P1
G1 X190.897 Y247.542 Z3
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z2.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
G1  Y255.381 
G1  X170.463 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
M73 P77 R4
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y266.131  E0.0285
G1  X167.463  E0.7031
G1  Y266.881  E0.0285
G1  X185.963  E0.7031
G1  Y267.631  E0.0285
G1  X167.463  E0.7031
G1  Y268.381  E0.0285
G1  X185.963  E0.7031
G1  Y269.131  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X168.463 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z2.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2702
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 13 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z3 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z3 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer13 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 14/25
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z2.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2565
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 14 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z3.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z3.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer14 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #14
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z2.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S162 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E7

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P78 R4
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z5.8 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y269.131 F60000
G1 Z2.8

; filament start gcode
G17
G3 Z3.2 I0 J-1.217 P1
G1 X185.963 Y269.131 Z3.2
G1 Z2.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y269.631 
G1  X185.463 
G1  Y268.631 
G1  X186.963 
G1  Y270.131 
G1  X184.963 
G1  Y268.131 
G1  X182.963 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y259.381  E0.0285
G1  X185.963  E0.7031
G1  Y258.631  E0.0285
G1  X167.463  E0.7031
G1  Y257.881  E0.0285
G1  X185.963  E0.7031
G1  Y257.131  E0.0285
G1  X167.463  E0.7031
G1  Y256.381  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y270.055  
M204 S8000
G3  X183.574 Y272.013   I-3.488 J-1.982 E0.1317
G3  X181.239 Y270.654   I1.125 J-4.619 E0.1041
G2  X178.521 Y269.881   I-2.725 J4.418 E0.1088
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X188.077 Y268.1 E-.05173
G1 X188.156 Y267.99 E-.05173
G1 X188.226 Y267.873 E-.05174
G1 X188.287 Y267.751 E-.05173
G1 X188.338 Y267.625 E-.05173
G1 X188.379 Y267.495 E-.05174
G1 X188.41 Y267.363 E-.05173
G1 X188.417 Y267.316 E-.01787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.347 Y155.786
G1 Z2.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
M73 P79 R4
G1 F12000
M204 S5000
G3 X174.867 Y155.611 I-.349 J.211 E.06181
G1 X174.956 Y155.592 E.00281
G3 X175.312 Y155.737 I.041 J.406 E.01228
; COOLING_NODE: 15
M204 S250
G1 X174.348 Y155.786 F60000
G1 F12000
M204 S5000
G3 X173.867 Y155.611 I-.35 J.214 E.0622
G1 X173.956 Y155.592 E.00281
G3 X174.313 Y155.737 I.041 J.408 E.0123
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.402 Y155.913 E-.07513
G1 X174.407 Y160.057 E-.05444
G1 X174.335 Y160.239 E-.07445
G1 X174.23 Y160.34 E-.05552
G1 X174.104 Y160.397 E-.05275
G1 X173.925 Y160.397 E-.0677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.108 J-1.212 P1  F60000
G1 X173.226 Y160.335 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.867 Y155.611 I-.229 J-.338 E.04277
G1 X172.957 Y155.592 E.00281
G3 X173.274 Y160.298 I.041 J.406 E.03132
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.104 Y160.397 E-.07494
G1 X172.965 Y160.409 E-.05274
G1 X172.807 Y160.363 E-.06252
G1 X172.67 Y160.244 E-.06903
G1 X172.607 Y160.12 E-.05275
G1 X172.589 Y155.978 E-.05446
G1 X172.6 Y155.944 E-.01357
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-1.109 J.5 P1  F60000
G1 X173.229 Y161.339 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.867 Y160.611 I-.231 J-.339 E.04305
G1 X172.957 Y160.592 E.00281
G3 X173.276 Y161.301 I.041 J.408 E.03149
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.07506
G1 X172.965 Y161.409 E-.05274
G1 X172.807 Y161.363 E-.06252
G1 X172.67 Y161.244 E-.06903
G1 X172.607 Y161.12 E-.05278
G1 X172.589 Y160.978 E-.05444
G1 X172.6 Y160.944 E-.01345
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.109 J1.212 P1  F60000
G1 X174.347 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.867 Y160.611 I-.349 J.211 E.06181
G1 X173.956 Y160.592 E.00281
G3 X174.312 Y160.737 I.041 J.406 E.01228
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.402 Y160.913 E-.07511
G1 X174.407 Y161.052 E-.05277
G1 X174.33 Y161.244 E-.07863
G1 X174.23 Y161.34 E-.05278
G1 X174.104 Y161.397 E-.05275
G1 X173.925 Y161.397 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.481 J1.118 P1  F60000
G1 X175.348 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.867 Y160.611 I-.35 J.214 E.06223
G1 X174.956 Y160.592 E.00281
G3 X175.313 Y160.737 I.041 J.408 E.01231
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X175.402 Y160.913 E-.07514
G1 X175.407 Y161.052 E-.05277
G1 X175.33 Y161.244 E-.07862
G1 X175.23 Y161.34 E-.05278
G1 X175.104 Y161.397 E-.05275
G1 X174.965 Y161.409 E-.05276
G1 X174.927 Y161.398 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.739 J.967 P1  F60000
G1 X178.348 Y158.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y158.611 I-.35 J.214 E.0622
G1 X177.957 Y158.592 E.00281
G3 X178.313 Y158.737 I.041 J.408 E.0123
; COOLING_NODE: 21
M204 S250
G1 X177.348 Y158.786 F60000
G1 F12000
M204 S5000
G3 X176.867 Y158.611 I-.35 J.214 E.0622
G1 X176.957 Y158.592 E.00281
G3 X177.313 Y158.737 I.041 J.408 E.0123
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X177.402 Y158.913 E-.07513
G1 X177.407 Y155.057 E-.05444
G1 X177.335 Y155.239 E-.07445
G1 X177.23 Y155.34 E-.05551
G1 X177.104 Y155.397 E-.05277
G1 X176.925 Y155.397 E-.0677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.823 J.896 P1  F60000
G1 X177.348 Y155.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.867 Y155.611 I-.35 J.214 E.0622
G1 X176.957 Y155.592 E.00281
G3 X177.313 Y155.737 I.041 J.408 E.0123
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.402 Y155.913 E-.07513
G1 X177.407 Y160.057 E-.05444
G1 X177.335 Y160.239 E-.07445
G1 X177.23 Y160.34 E-.05551
G1 X177.104 Y160.397 E-.05277
G1 X176.925 Y160.397 E-.0677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.826 J.894 P1  F60000
G1 X177.347 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.867 Y160.611 I-.349 J.211 E.06181
G1 X176.957 Y160.592 E.00281
G3 X177.312 Y160.737 I.041 J.406 E.01228
; COOLING_NODE: 2
M204 S250
G1 X176.348 Y160.786 F60000
G1 F12000
M204 S5000
G3 X175.867 Y160.611 I-.35 J.214 E.06223
G1 X175.957 Y160.592 E.00281
G3 X176.313 Y160.737 I.041 J.408 E.01231
; COOLING_NODE: 1
M204 S250
G1 X176.347 Y155.786 F60000
G1 F12000
M204 S5000
G3 X175.867 Y155.611 I-.349 J.211 E.06181
G1 X175.957 Y155.592 E.00281
G3 X176.312 Y155.737 I.041 J.406 E.01228
; COOLING_NODE: 20
M204 S250
G1 X176.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X175.867 Y158.611 I-.349 J.211 E.06181
G1 X175.957 Y158.592 E.00281
G3 X176.312 Y158.737 I.041 J.406 E.01228
; COOLING_NODE: 19
M204 S250
G1 X175.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X174.867 Y158.611 I-.349 J.211 E.06181
G1 X174.956 Y158.592 E.00281
G3 X175.312 Y158.737 I.041 J.406 E.01228
; COOLING_NODE: 18
M204 S250
G1 X174.348 Y158.786 F60000
G1 F12000
M204 S5000
G3 X173.867 Y158.611 I-.35 J.214 E.0622
G1 X173.956 Y158.592 E.00281
G3 X174.313 Y158.737 I.041 J.408 E.0123
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.402 Y158.913 E-.07513
G1 X174.407 Y155.057 E-.05444
G1 X174.335 Y155.239 E-.07445
G1 X174.23 Y155.34 E-.05552
G1 X174.104 Y155.397 E-.05275
G1 X173.925 Y155.397 E-.0677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.108 J-1.212 P1  F60000
G1 X173.226 Y155.335 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.867 Y158.611 I-.229 J-.338 E.04277
G1 X172.957 Y158.592 E.00281
G3 X173.274 Y155.298 I.041 J.406 E.03132
; COOLING_NODE: 4
M204 S250
G1 X172.332 Y155.237 F60000
G1 F12000
M204 S5000
G3 X171.867 Y158.611 I-.334 J-.237 E.04751
G1 X171.957 Y158.592 E.00281
G3 X172.363 Y155.185 I.041 J.408 E.027
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.23 Y155.34 E-.07765
G1 X172.104 Y155.397 E-.05275
G1 X171.965 Y155.409 E-.05274
G1 X171.807 Y155.363 E-.06252
G1 X171.67 Y155.244 E-.06903
G1 X171.607 Y155.12 E-.05275
G1 X171.603 Y155.088 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.926 J-.789 P1  F60000
G1 X171.347 Y158.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.867 Y158.611 I-.349 J.211 E.06181
G1 X170.957 Y158.592 E.00281
G3 X171.312 Y158.737 I.041 J.406 E.01229
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.402 Y158.913 E-.07511
G1 X171.407 Y155.057 E-.05444
G1 X171.335 Y155.239 E-.07445
G1 X171.23 Y155.34 E-.05551
G1 X171.104 Y155.397 E-.05277
G1 X170.965 Y155.409 E-.05273
G1 X170.927 Y155.398 E-.01499
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.827 J.893 P1  F60000
G1 X171.347 Y155.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.867 Y155.611 I-.349 J.211 E.06181
G1 X170.957 Y155.592 E.00281
G3 X171.312 Y155.737 I.041 J.406 E.01229
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.402 Y155.913 E-.07511
G1 X171.407 Y160.057 E-.05444
G1 X171.335 Y160.239 E-.07445
G1 X171.23 Y160.34 E-.05551
G1 X171.104 Y160.397 E-.05277
G1 X170.965 Y160.409 E-.05273
G1 X170.927 Y160.398 E-.01499
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.825 J.895 P1  F60000
G1 X171.348 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.867 Y160.611 I-.35 J.214 E.06223
G1 X170.957 Y160.592 E.00281
G3 X171.313 Y160.737 I.041 J.408 E.01231
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X171.402 Y160.913 E-.07514
G1 X171.407 Y161.052 E-.05277
G1 X171.33 Y161.244 E-.07862
G1 X171.23 Y161.34 E-.05277
G1 X171.104 Y161.397 E-.05277
G1 X170.965 Y161.409 E-.05273
G1 X170.927 Y161.398 E-.0152
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.463 J1.126 P1  F60000
G1 X172.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.867 Y160.611 I-.362 J.188 E.06101
G1 X171.957 Y160.592 E.00281
G3 X172.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 11
M204 S250
G1 X172.332 Y160.237 F60000
G1 F12000
M204 S5000
G3 X171.867 Y155.611 I-.334 J-.237 E.04751
G1 X171.957 Y155.592 E.00281
G3 X172.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X172.23 Y160.34 E-.07765
G1 X172.104 Y160.397 E-.05275
G1 X171.965 Y160.409 E-.05274
G1 X171.807 Y160.363 E-.06252
G1 X171.67 Y160.244 E-.06903
G1 X171.607 Y160.12 E-.05275
G1 X171.603 Y160.088 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.611 J-1.053 P1  F60000
G1 X170.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.867 Y160.611 I-.362 J.188 E.06101
G1 X169.957 Y160.592 E.00281
G3 X170.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 7
M204 S250
G1 X170.332 Y160.237 F60000
G1 F12000
M204 S5000
G3 X169.867 Y155.611 I-.334 J-.237 E.04751
G1 X169.957 Y155.592 E.00281
G3 X170.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 8
M204 S250
G1 X170.332 Y155.237 F60000
G1 F12000
M204 S5000
G3 X169.867 Y158.611 I-.334 J-.237 E.04751
G1 X169.957 Y158.592 E.00281
G3 X170.363 Y155.185 I.041 J.408 E.027
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.23 Y155.34 E-.07764
G1 X170.104 Y155.397 E-.05277
G1 X169.965 Y155.409 E-.05273
G1 X169.807 Y155.363 E-.06251
G1 X169.67 Y155.244 E-.06905
G1 X169.607 Y155.12 E-.05274
G1 X169.603 Y155.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.929 J-.786 P1  F60000
G1 X169.348 Y158.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y158.611 I-.35 J.214 E.0622
G1 X168.957 Y158.592 E.00281
G3 X169.313 Y158.737 I.041 J.408 E.0123
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.402 Y158.913 E-.07514
G1 X169.407 Y155.057 E-.05444
G1 X169.335 Y155.239 E-.07445
G1 X169.23 Y155.34 E-.05551
G1 X169.104 Y155.397 E-.05277
G1 X168.925 Y155.397 E-.06769
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.823 J.896 P1  F60000
G1 X169.348 Y155.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y155.611 I-.35 J.214 E.0622
G1 X168.957 Y155.592 E.00281
G3 X169.313 Y155.737 I.041 J.408 E.0123
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.402 Y155.913 E-.07514
G1 X169.407 Y160.057 E-.05444
G1 X169.335 Y160.239 E-.07445
G1 X169.23 Y160.34 E-.05551
G1 X169.104 Y160.397 E-.05277
G1 X168.925 Y160.397 E-.06769
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.826 J.894 P1  F60000
G1 X169.347 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y160.611 I-.349 J.211 E.06181
G1 X168.957 Y160.592 E.00281
G3 X169.312 Y160.737 I.041 J.406 E.01228
; COOLING_NODE: 47
M204 S250
G1 X168.359 Y160.809 F60000
G1 F12000
M204 S5000
G3 X167.867 Y160.611 I-.362 J.188 E.06101
G1 X167.957 Y160.592 E.00281
G3 X168.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 48
M204 S250
G1 X167.359 Y160.809 F60000
G1 F12000
M204 S5000
G3 X166.867 Y160.611 I-.362 J.188 E.06101
G1 X166.957 Y160.592 E.00281
G3 X167.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 49
M204 S250
G1 X167.359 Y155.809 F60000
G1 F12000
M204 S5000
G3 X166.867 Y155.611 I-.362 J.188 E.06101
G1 X166.957 Y155.592 E.00281
G3 X167.328 Y155.758 I.041 J.406 E.01308
; COOLING_NODE: 50
M204 S250
G1 X167.359 Y158.809 F60000
G1 F12000
M204 S5000
G3 X166.867 Y158.611 I-.362 J.188 E.06101
G1 X166.957 Y158.592 E.00281
G3 X167.328 Y158.758 I.041 J.406 E.01308
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.379 J.729 E.04762
G2 X166.37 Y160.505 I.646 J.5 E.0357
G2 X166.644 Y161.727 I.643 J.498 E.04745
G1 X166.59 Y161.898 E.00594
G1 X165.602 Y161.898 E.03278
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 43
; WIPE_START
G1 X166.495 Y158.374 E-.07736
G1 X166.396 Y158.469 E-.05182
G1 X166.303 Y158.595 E-.05979
G1 X166.226 Y158.778 E-.07527
G1 X166.196 Y158.953 E-.06764
G1 X166.201 Y155.08 E-.04813
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.089 J1.214 P1  F60000
G1 X168.332 Y155.237 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.867 Y158.611 I-.334 J-.237 E.04751
G1 X167.957 Y158.592 E.00281
G3 X168.363 Y155.185 I.041 J.408 E.027
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.23 Y155.34 E-.07764
G1 X168.104 Y155.397 E-.05277
G1 X167.965 Y155.409 E-.05273
G1 X167.807 Y155.363 E-.06252
G1 X167.67 Y155.244 E-.06903
G1 X167.607 Y155.12 E-.05275
G1 X167.603 Y155.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-1.028 J.652 P1  F60000
G1 X168.332 Y160.237 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.867 Y155.611 I-.334 J-.237 E.04751
G1 X167.957 Y155.592 E.00281
G3 X168.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X168.23 Y160.34 E-.07764
G1 X168.104 Y160.397 E-.05277
G1 X167.965 Y160.409 E-.05273
G1 X167.807 Y160.363 E-.06252
G1 X167.67 Y160.244 E-.06903
G1 X167.607 Y160.12 E-.05275
G1 X167.603 Y160.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.059 J1.216 P1  F60000
G1 X183.226 Y155.335 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.867 Y158.611 I-.229 J-.338 E.04278
G1 X182.957 Y158.592 E.00281
G3 X183.274 Y155.298 I.041 J.406 E.03132
; COOLING_NODE: 38
M204 S250
G1 X182.332 Y155.237 F60000
G1 F12000
M204 S5000
G3 X181.867 Y158.611 I-.334 J-.237 E.04751
G1 X181.957 Y158.592 E.00281
G3 X182.363 Y155.186 I.041 J.408 E.027
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.23 Y155.34 E-.07764
G1 X182.104 Y155.397 E-.05277
G1 X181.965 Y155.409 E-.05273
G1 X181.807 Y155.363 E-.06252
G1 X181.67 Y155.244 E-.06903
G1 X181.607 Y155.12 E-.05275
G1 X181.603 Y155.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.915 J-.802 P1  F60000
G1 X181.359 Y158.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.867 Y158.611 I-.362 J.188 E.06101
G1 X180.957 Y158.592 E.00281
G3 X181.328 Y158.758 I.041 J.406 E.01308
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X181.401 Y158.906 E-.06283
G1 X181.407 Y155.052 E-.05552
G1 X181.367 Y155.185 E-.0527
G1 X181.23 Y155.34 E-.0787
G1 X181.104 Y155.397 E-.05275
G1 X180.965 Y155.409 E-.05274
G1 X180.903 Y155.391 E-.02477
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.317 J-1.175 P1  F60000
G1 X180.332 Y155.237 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.867 Y158.611 I-.334 J-.237 E.04751
G1 X179.956 Y158.592 E.00281
G3 X180.363 Y155.185 I.041 J.408 E.027
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X180.23 Y155.34 E-.07764
G1 X180.104 Y155.397 E-.05277
G1 X179.965 Y155.409 E-.05275
G1 X179.807 Y155.363 E-.0625
G1 X179.67 Y155.244 E-.06903
G1 X179.607 Y155.12 E-.05274
G1 X179.603 Y155.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.588 J-1.066 P1  F60000
G1 X179.332 Y155.237 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.867 Y158.611 I-.334 J-.237 E.04751
G1 X178.957 Y158.592 E.00281
G3 X179.363 Y155.186 I.041 J.408 E.027
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X179.23 Y155.34 E-.07764
G1 X179.104 Y155.397 E-.05277
G1 X178.965 Y155.409 E-.05273
G1 X178.807 Y155.363 E-.06252
G1 X178.67 Y155.244 E-.06903
G1 X178.607 Y155.12 E-.05275
G1 X178.603 Y155.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-1.028 J.652 P1  F60000
G1 X179.332 Y160.237 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.867 Y155.611 I-.334 J-.237 E.04751
G1 X178.957 Y155.592 E.00281
G3 X179.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.23 Y160.34 E-.07764
G1 X179.104 Y160.397 E-.05277
G1 X178.965 Y160.409 E-.05273
G1 X178.807 Y160.363 E-.06252
G1 X178.67 Y160.244 E-.06903
G1 X178.607 Y160.12 E-.05275
G1 X178.603 Y160.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.929 J-.786 P1  F60000
G1 X178.348 Y155.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y155.611 I-.35 J.214 E.0622
G1 X177.957 Y155.592 E.00281
G3 X178.313 Y155.737 I.041 J.408 E.0123
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178.402 Y155.913 E-.07513
G1 X178.407 Y160.057 E-.05444
G1 X178.335 Y160.239 E-.07445
G1 X178.23 Y160.34 E-.05551
G1 X178.104 Y160.397 E-.05277
G1 X177.925 Y160.397 E-.0677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.826 J.894 P1  F60000
G1 X178.347 Y160.786 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y160.611 I-.349 J.211 E.06181
G1 X177.957 Y160.592 E.00281
G3 X178.312 Y160.737 I.041 J.406 E.01228
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.402 Y160.913 E-.07512
G1 X178.407 Y161.052 E-.05277
G1 X178.33 Y161.244 E-.07862
G1 X178.23 Y161.34 E-.05277
G1 X178.104 Y161.397 E-.05277
G1 X177.925 Y161.397 E-.06795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.462 J1.126 P1  F60000
G1 X179.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.867 Y160.611 I-.362 J.188 E.06101
G1 X178.957 Y160.592 E.00281
G3 X179.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.401 Y160.906 E-.06283
G1 X179.407 Y161.052 E-.05551
G1 X179.367 Y161.185 E-.05271
G1 X179.23 Y161.34 E-.07868
G1 X179.104 Y161.397 E-.05277
G1 X178.965 Y161.409 E-.05273
G1 X178.903 Y161.391 E-.02477
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.451 J1.13 P1  F60000
G1 X180.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.867 Y160.611 I-.362 J.188 E.06101
G1 X179.956 Y160.592 E.00281
G3 X180.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 25
M204 S250
G1 X180.332 Y160.237 F60000
G1 F12000
M204 S5000
G3 X179.867 Y155.611 I-.334 J-.237 E.04751
G1 X179.956 Y155.592 E.00281
G3 X180.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.23 Y160.34 E-.07764
G1 X180.104 Y160.397 E-.05277
G1 X179.965 Y160.409 E-.05275
G1 X179.807 Y160.363 E-.0625
G1 X179.67 Y160.244 E-.06903
G1 X179.607 Y160.12 E-.05274
G1 X179.603 Y160.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.191 J1.202 P1  F60000
G1 X181.359 Y155.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.867 Y155.611 I-.362 J.188 E.06101
G1 X180.957 Y155.592 E.00281
G3 X181.328 Y155.758 I.041 J.406 E.01308
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.401 Y155.906 E-.06283
G1 X181.407 Y160.052 E-.05552
G1 X181.367 Y160.185 E-.0527
G1 X181.23 Y160.34 E-.0787
G1 X181.104 Y160.397 E-.05275
G1 X180.965 Y160.409 E-.05274
G1 X180.903 Y160.391 E-.02477
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.822 J.897 P1  F60000
G1 X181.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.867 Y160.611 I-.362 J.188 E.06101
G1 X180.957 Y160.592 E.00281
G3 X181.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.401 Y160.906 E-.06283
G1 X181.407 Y161.052 E-.05551
G1 X181.367 Y161.185 E-.05272
G1 X181.23 Y161.34 E-.07869
G1 X181.104 Y161.397 E-.05275
G1 X180.965 Y161.409 E-.05274
G1 X180.903 Y161.391 E-.02477
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.451 J1.13 P1  F60000
G1 X182.359 Y160.809 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.867 Y160.611 I-.362 J.188 E.06101
G1 X181.957 Y160.592 E.00281
G3 X182.328 Y160.758 I.041 J.406 E.01308
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X182.401 Y160.906 E-.06283
G1 X182.407 Y161.052 E-.05551
G1 X182.367 Y161.185 E-.05271
G1 X182.23 Y161.34 E-.07868
G1 X182.104 Y161.397 E-.05277
G1 X181.965 Y161.409 E-.05273
G1 X181.903 Y161.391 E-.02477
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I.048 J1.216 P1  F60000
G1 X183.229 Y161.339 Z3.2
G1 Z2.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.867 Y160.611 I-.231 J-.339 E.04305
G1 X182.957 Y160.592 E.00281
G3 X183.276 Y161.301 I.041 J.408 E.03149
; COOLING_NODE: 36
M204 S250
G1 X183.226 Y160.335 F60000
G1 F12000
M204 S5000
G3 X182.867 Y155.611 I-.229 J-.338 E.04278
G1 X182.957 Y155.592 E.00281
G3 X183.274 Y160.298 I.041 J.406 E.03132
; COOLING_NODE: 37
M204 S250
G1 X182.332 Y160.237 F60000
G1 F12000
M204 S5000
G3 X181.867 Y155.611 I-.334 J-.237 E.04751
G1 X181.957 Y155.592 E.00281
G3 X182.363 Y160.185 I.041 J.408 E.027
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.23 Y160.34 E-.07764
G1 X182.104 Y160.397 E-.05277
G1 X181.965 Y160.409 E-.05273
G1 X181.807 Y160.363 E-.06252
G1 X181.67 Y160.244 E-.06903
G1 X181.607 Y160.12 E-.05275
G1 X181.603 Y160.087 E-.01257
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I-.662 J1.021 P1  F60000
G1 X184.398 Y161.898 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.635 Y160.511 I-.364 J-.715 E.04673
G2 X183.635 Y155.511 I-.662 J-.5 E.0356
G2 X183.358 Y158.275 I-.662 J-.501 E.04781
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.155 J.384 P1  F60000
G1 X184.059 Y161.425 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298156
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278652
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243524
G2 X184.09 Y160.774 I-2.429 J-.325 E.00894
; LINE_WIDTH: 0.266366
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294544
G1 X184.062 Y160.585 E.00177
; LINE_WIDTH: 0.311773
G1 X183.987 Y160.195 E.0087
M204 S10000
G1 X183.989 Y155.811 F60000
; LINE_WIDTH: 0.303397
G1 F15000
M204 S8000
G1 X184.067 Y155.393 E.00902
; LINE_WIDTH: 0.283578
G1 X184.081 Y155.281 E.0022
; LINE_WIDTH: 0.241635
G2 X184.088 Y158.756 I-2.317 J-.292 E.00852
; LINE_WIDTH: 0.268912
G1 X184.075 Y158.671 E.00159
; LINE_WIDTH: 0.307759
G2 X184.008 Y158.306 I-4.288 J.598 E.00801
M204 S10000
G1 X183.987 Y155.195 F60000
; LINE_WIDTH: 0.308692
G1 F15000
M204 S8000
G3 X184.075 Y155.671 I-5.508 J1.27 E.01048
; LINE_WIDTH: 0.268912
G1 X184.088 Y155.756 E.00159
; LINE_WIDTH: 0.241635
G3 X184.081 Y160.281 I-2.323 J.233 E.00852
; LINE_WIDTH: 0.283578
G1 X184.067 Y160.393 E.0022
; LINE_WIDTH: 0.303397
G1 X183.989 Y160.811 E.00902
M204 S10000
G1 X184.059 Y161.425 F60000
; LINE_WIDTH: 0.353236
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00286
G1 X183.752 Y161.694 E.00822
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609575
G1 F13235.58
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574636
G1 F14105.272
G3 X182.196 Y161.839 I-.349 J-1.727 E.00644
; LINE_WIDTH: 0.54152
G1 F15000
G3 X181.741 Y161.831 I-.193 J-1.898 E.01855
; LINE_WIDTH: 0.582292
G1 F13905.061
G1 X181.673 Y161.818 E.00302
; LINE_WIDTH: 0.608316
G1 F13265.043
G1 X181.606 Y161.805 E.00316
; LINE_WIDTH: 0.638629
G1 F12590.056
G1 X181.538 Y161.787 E.00341
; LINE_WIDTH: 0.66876
G1 F11983.908
G2 X181.494 Y161.779 I-.029 J.03 E.00241
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609575
G1 F13235.58
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574636
G1 F14105.272
G3 X168.196 Y161.839 I-.349 J-1.727 E.00644
; LINE_WIDTH: 0.54152
G1 F15000
G3 X167.741 Y161.831 I-.193 J-1.898 E.01855
; LINE_WIDTH: 0.582292
G1 F13905.061
G1 X167.673 Y161.818 E.00302
; LINE_WIDTH: 0.608316
G1 F13265.043
G1 X167.606 Y161.805 E.00316
; LINE_WIDTH: 0.638629
G1 F12590.056
G1 X167.538 Y161.787 E.00341
; LINE_WIDTH: 0.675477
G1 F11856.649
G1 X167.503 Y161.776 E.00191
G1 X166.773 Y161.972 E.03895
M204 S10000
G1 X166.25 Y161.694 F60000
; LINE_WIDTH: 0.353187
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00828
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298167
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278635
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.258311
G3 X166 Y160.13 I4.017 J-.334 E.021
M204 S10000
G1 X166.122 Y160.499 F60000
; LINE_WIDTH: 0.247959
G1 F15000
M204 S8000
G1 X166.049 Y160.501 E.00123
; LINE_WIDTH: 0.289269
G1 X165.976 Y160.504 E.00147
; LINE_WIDTH: 0.328811
G1 X165.957 Y160.504 E.00044
G1 X165.941 Y160.422 E.00194
; LINE_WIDTH: 0.29749
G1 X165.925 Y160.34 E.00173
; LINE_WIDTH: 0.278693
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.258314
G3 X166 Y155.13 I4.016 J-.334 E.02101
M204 S10000
G1 X166.122 Y155.499 F60000
; LINE_WIDTH: 0.247959
G1 F15000
M204 S8000
G1 X166.049 Y155.502 E.00123
; LINE_WIDTH: 0.289269
G1 X165.976 Y155.504 E.00147
; LINE_WIDTH: 0.328811
G1 X165.957 Y155.504 E.00044
G1 X165.941 Y155.422 E.00194
; LINE_WIDTH: 0.29749
G1 X165.925 Y155.34 E.00173
; LINE_WIDTH: 0.278693
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.255959
G3 X165.975 Y158.306 I2.915 J-.356 E.01772
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.899 Y158.924 E-.23693
G1 X165.921 Y155.3 E-.14307
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 15/25
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I-.063 J1.215 P1  F60000
G1 X175.348 Y155.786 Z3.2
G1 Z3
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.867 Y155.611 I-.35 J.214 E.06217
G1 X174.954 Y155.592 E.00274
G3 X175.313 Y155.737 I.045 J.408 E.0124
; COOLING_NODE: 15
M204 S250
G1 X174.347 Y155.786 F60000
G1 F12000
M204 S5000
G3 X173.867 Y155.611 I-.349 J.211 E.06177
G1 X173.954 Y155.592 E.00274
G3 X174.312 Y155.737 I.044 J.406 E.01238
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.402 Y155.913 E-.07503
G1 X174.407 Y160.052 E-.05281
G1 X174.367 Y160.185 E-.05274
G1 X174.284 Y160.297 E-.05275
G1 X174.104 Y160.397 E-.07866
G1 X173.965 Y160.409 E-.05279
G1 X173.926 Y160.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.194 J-1.201 P1  F60000
G1 X173.283 Y160.295 Z3.4
G1 Z3
G1 E.4 F1800
M73 P80 R4
G1 F12000
M204 S5000
G3 X172.867 Y155.611 I-.284 J-.296 E.04513
G1 X172.954 Y155.592 E.00274
G3 X173.323 Y160.25 I.045 J.408 E.02946
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.104 Y160.397 E-.10043
G1 X172.965 Y160.409 E-.05278
G1 X172.81 Y160.364 E-.06155
G1 X172.67 Y160.244 E-.07
G1 X172.607 Y160.12 E-.05272
G1 X172.596 Y160.009 E-.04252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-1.074 J.573 P1  F60000
G1 X173.283 Y161.295 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.867 Y160.611 I-.284 J-.296 E.04513
G1 X172.954 Y160.592 E.00274
G3 X173.323 Y161.25 I.045 J.408 E.02946
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.104 Y161.397 E-.10043
G1 X172.965 Y161.409 E-.05278
G1 X172.81 Y161.364 E-.06155
G1 X172.67 Y161.244 E-.06999
G1 X172.607 Y161.12 E-.05267
G1 X172.596 Y161.009 E-.04258
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.154 J1.207 P1  F60000
G1 X174.347 Y160.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.867 Y160.611 I-.349 J.211 E.06177
G1 X173.954 Y160.592 E.00274
G3 X174.312 Y160.737 I.044 J.406 E.01238
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.402 Y160.913 E-.07503
G1 X174.407 Y161.052 E-.0528
G1 X174.33 Y161.244 E-.07864
G1 X174.23 Y161.34 E-.05278
G1 X174.104 Y161.397 E-.05273
G1 X173.965 Y161.409 E-.05279
G1 X173.926 Y161.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M104 T0 S210 N0 ;Multi extruder pre heating
M204 S10000
G17
G3 Z3.4 I.482 J1.117 P1  F60000
G1 X175.348 Y160.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.867 Y160.611 I-.35 J.214 E.06217
G1 X174.954 Y160.592 E.00274
G3 X175.313 Y160.737 I.045 J.408 E.0124
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X175.402 Y160.913 E-.07506
G1 X175.407 Y161.052 E-.0528
G1 X175.33 Y161.244 E-.07864
G1 X175.23 Y161.34 E-.05278
G1 X175.104 Y161.397 E-.05273
G1 X174.965 Y161.409 E-.05279
G1 X174.926 Y161.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.482 J1.117 P1  F60000
G1 X176.348 Y160.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.867 Y160.611 I-.35 J.214 E.06217
G1 X175.954 Y160.592 E.00274
G3 X176.313 Y160.737 I.045 J.408 E.0124
; COOLING_NODE: 1
M204 S250
G1 X176.348 Y155.786 F60000
G1 F12000
M204 S5000
G3 X175.867 Y155.611 I-.35 J.214 E.06217
G1 X175.954 Y155.592 E.00274
G3 X176.313 Y155.737 I.045 J.408 E.0124
; COOLING_NODE: 20
M204 S250
G1 X176.348 Y158.786 F60000
G1 F12000
M204 S5000
G3 X175.867 Y158.611 I-.35 J.214 E.06217
G1 X175.954 Y158.592 E.00274
G3 X176.313 Y158.737 I.045 J.408 E.0124
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.402 Y158.913 E-.07505
G1 X176.407 Y155.052 E-.05281
G1 X176.367 Y155.185 E-.05271
G1 X176.284 Y155.297 E-.05277
G1 X176.104 Y155.397 E-.07866
G1 X175.965 Y155.409 E-.05279
G1 X175.926 Y155.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.482 J1.117 P1  F60000
G1 X177.347 Y158.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.867 Y158.611 I-.349 J.211 E.06177
G1 X176.954 Y158.592 E.00274
G3 X177.312 Y158.737 I.044 J.406 E.01238
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.402 Y158.913 E-.07503
G1 X177.407 Y155.052 E-.05281
G1 X177.367 Y155.185 E-.05271
G1 X177.284 Y155.297 E-.05277
G1 X177.104 Y155.397 E-.07866
G1 X176.965 Y155.409 E-.05279
G1 X176.926 Y155.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.482 J1.117 P1  F60000
G1 X178.347 Y158.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y158.611 I-.349 J.211 E.06177
G1 X177.954 Y158.592 E.00274
G3 X178.312 Y158.737 I.044 J.406 E.01238
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.402 Y158.913 E-.07503
G1 X178.407 Y155.052 E-.05281
G1 X178.367 Y155.185 E-.05271
G1 X178.284 Y155.297 E-.05277
G1 X178.104 Y155.397 E-.07866
G1 X177.965 Y155.409 E-.05279
G1 X177.926 Y155.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.182 J1.203 P1  F60000
G1 X179.362 Y155.182 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.867 Y158.611 I-.364 J-.185 E.04906
G1 X178.954 Y158.592 E.00274
G3 X179.385 Y155.127 I.044 J.406 E.02509
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X179.284 Y155.297 E-.075
G1 X179.104 Y155.397 E-.07866
G1 X178.965 Y155.409 E-.05278
G1 X178.81 Y155.364 E-.06155
G1 X178.67 Y155.244 E-.07
G1 X178.62 Y155.145 E-.04202
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.149 J1.208 P1  F60000
G1 X181.358 Y158.807 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.867 Y158.611 I-.361 J.191 E.06104
G1 X180.954 Y158.592 E.00274
G3 X181.327 Y158.756 I.044 J.405 E.0131
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X181.401 Y158.906 E-.06362
G1 X181.407 Y155.052 E-.05567
G1 X181.356 Y155.206 E-.06152
G1 X181.23 Y155.34 E-.07001
G1 X181.104 Y155.397 E-.05273
G1 X180.965 Y155.409 E-.05278
G1 X180.905 Y155.392 E-.02368
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.438 J-1.136 P1  F60000
G1 X180.362 Y155.182 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.867 Y158.611 I-.364 J-.185 E.04906
G1 X179.954 Y158.592 E.00274
G3 X180.385 Y155.127 I.044 J.406 E.0251
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.284 Y155.297 E-.07497
G1 X180.104 Y155.397 E-.07866
G1 X179.965 Y155.409 E-.05279
G1 X179.831 Y155.374 E-.05275
G1 X179.713 Y155.294 E-.05425
G1 X179.62 Y155.145 E-.06658
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.99 J.708 P1  F60000
G1 X180.362 Y160.182 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.867 Y155.611 I-.364 J-.185 E.04906
G1 X179.954 Y155.592 E.00274
G3 X180.385 Y160.127 I.044 J.406 E.0251
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.284 Y160.297 E-.07498
G1 X180.104 Y160.397 E-.07866
G1 X179.965 Y160.409 E-.05279
G1 X179.831 Y160.374 E-.05275
G1 X179.713 Y160.294 E-.05425
G1 X179.62 Y160.145 E-.06658
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.233 J1.194 P1  F60000
G1 X181.358 Y155.807 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.867 Y155.611 I-.361 J.191 E.06104
G1 X180.954 Y155.592 E.00274
G3 X181.327 Y155.756 I.044 J.405 E.0131
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X181.401 Y155.906 E-.06362
M73 P80 R3
G1 X181.407 Y160.052 E-.05567
G1 X181.356 Y160.206 E-.06152
G1 X181.23 Y160.34 E-.07001
G1 X181.104 Y160.397 E-.05273
G1 X180.965 Y160.409 E-.05278
G1 X180.905 Y160.392 E-.02368
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.172 J1.205 P1  F60000
G1 X182.365 Y160.184 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.867 Y155.611 I-.366 J-.184 E.04938
G1 X181.954 Y155.592 E.00274
G3 X182.388 Y160.128 I.045 J.408 E.02519
; COOLING_NODE: 36
M204 S250
G1 X183.28 Y160.292 F60000
G1 F12000
M204 S5000
G3 X182.867 Y155.611 I-.282 J-.295 E.04484
G1 X182.954 Y155.592 E.00274
G3 X183.32 Y160.247 I.044 J.406 E.02932
; COOLING_NODE: 41
M204 S250
G1 X183.28 Y155.292 F60000
G1 F12000
M204 S5000
G3 X182.867 Y158.611 I-.282 J-.295 E.04484
G1 X182.954 Y158.592 E.00274
G3 X183.32 Y155.247 I.044 J.406 E.02932
; COOLING_NODE: 38
M204 S250
G1 X182.365 Y155.184 F60000
G1 F12000
M204 S5000
G3 X181.867 Y158.611 I-.366 J-.184 E.04938
G1 X181.954 Y158.592 E.00274
G3 X182.388 Y155.128 I.045 J.408 E.02519
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X182.284 Y155.297 E-.07508
G1 X182.104 Y155.397 E-.07866
G1 X181.965 Y155.409 E-.05278
G1 X181.81 Y155.364 E-.06155
G1 X181.67 Y155.244 E-.07
G1 X181.62 Y155.146 E-.04193
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.857 J.865 P1  F60000
G1 X184.398 Y161.898 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.356 J-.713 E.04712
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.673 J-.496 E.04733
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 35
; WIPE_START
G1 X183.41 Y161.898 E-.37598
G1 X183.408 Y161.888 E-.00402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.157 J-.377 P1  F60000
G1 X183.229 Y161.339 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X182.867 Y160.611 I-.23 J-.339 E.04298
G1 X182.954 Y160.592 E.00274
G3 X183.276 Y161.301 I.045 J.408 E.03159
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.104 Y161.397 E-.07504
G1 X182.965 Y161.409 E-.05278
G1 X182.81 Y161.364 E-.06155
G1 X182.67 Y161.244 E-.06999
G1 X182.607 Y161.12 E-.05268
G1 X182.6 Y160.942 E-.06796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.6 J-1.059 P1  F60000
G1 X182.36 Y160.806 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.867 Y160.611 I-.362 J.194 E.06145
G1 X181.954 Y160.592 E.00274
G3 X182.328 Y160.755 I.045 J.408 E.01312
; COOLING_NODE: 33
M204 S250
G1 X181.36 Y160.806 F60000
G1 F12000
M204 S5000
G3 X180.867 Y160.611 I-.362 J.194 E.06145
G1 X180.954 Y160.592 E.00274
G3 X181.328 Y160.755 I.045 J.408 E.01312
; COOLING_NODE: 32
M204 S250
G1 X180.359 Y160.807 F60000
G1 F12000
M204 S5000
G3 X179.867 Y160.611 I-.361 J.191 E.06106
G1 X179.954 Y160.592 E.00274
G3 X180.327 Y160.756 I.044 J.406 E.0131
; COOLING_NODE: 31
M204 S250
G1 X179.359 Y160.807 F60000
G1 F12000
M204 S5000
G3 X178.867 Y160.611 I-.361 J.191 E.06106
G1 X178.954 Y160.592 E.00274
G3 X179.327 Y160.756 I.044 J.406 E.0131
; COOLING_NODE: 26
M204 S250
G1 X179.362 Y160.182 F60000
G1 F12000
M204 S5000
G3 X178.867 Y155.611 I-.364 J-.185 E.04906
G1 X178.954 Y155.592 E.00274
G3 X179.385 Y160.127 I.044 J.406 E.02509
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.284 Y160.297 E-.075
G1 X179.104 Y160.397 E-.07866
G1 X178.965 Y160.409 E-.05278
G1 X178.81 Y160.364 E-.06155
G1 X178.67 Y160.244 E-.07
G1 X178.62 Y160.145 E-.04201
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.969 J-.736 P1  F60000
G1 X178.347 Y155.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y155.611 I-.349 J.211 E.06177
G1 X177.954 Y155.592 E.00274
G3 X178.312 Y155.737 I.044 J.406 E.01238
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178.402 Y155.913 E-.07503
G1 X178.407 Y160.052 E-.05281
G1 X178.367 Y160.185 E-.05271
G1 X178.284 Y160.297 E-.05277
G1 X178.104 Y160.397 E-.07866
G1 X177.965 Y160.409 E-.05279
G1 X177.926 Y160.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.824 J.896 P1  F60000
G1 X178.347 Y160.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.867 Y160.611 I-.349 J.211 E.06177
G1 X177.954 Y160.592 E.00274
G3 X178.312 Y160.737 I.044 J.406 E.01238
; COOLING_NODE: 29
M204 S250
G1 X177.347 Y160.786 F60000
G1 F12000
M204 S5000
G3 X176.867 Y160.611 I-.349 J.211 E.06177
G1 X176.954 Y160.592 E.00274
G3 X177.312 Y160.737 I.044 J.406 E.01238
; COOLING_NODE: 28
M204 S250
G1 X177.347 Y155.786 F60000
G1 F12000
M204 S5000
G3 X176.867 Y155.611 I-.349 J.211 E.06177
G1 X176.954 Y155.592 E.00274
G3 X177.312 Y155.737 I.044 J.406 E.01238
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X177.402 Y155.913 E-.07503
G1 X177.407 Y160.052 E-.05281
G1 X177.367 Y160.185 E-.05271
G1 X177.284 Y160.297 E-.05277
G1 X177.104 Y160.397 E-.07866
G1 X176.965 Y160.409 E-.05279
G1 X176.926 Y160.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.87 J-.851 P1  F60000
G1 X175.348 Y158.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.867 Y158.611 I-.35 J.214 E.06217
G1 X174.954 Y158.592 E.00274
G3 X175.313 Y158.737 I.045 J.408 E.0124
; COOLING_NODE: 18
M204 S250
G1 X174.347 Y158.786 F60000
G1 F12000
M204 S5000
G3 X173.867 Y158.611 I-.349 J.211 E.06177
G1 X173.954 Y158.592 E.00274
G3 X174.312 Y158.737 I.044 J.406 E.01238
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.402 Y158.913 E-.07503
G1 X174.407 Y155.052 E-.05281
G1 X174.367 Y155.185 E-.05274
G1 X174.284 Y155.297 E-.05275
G1 X174.104 Y155.397 E-.07866
G1 X173.965 Y155.409 E-.05279
G1 X173.926 Y155.399 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.194 J-1.201 P1  F60000
G1 X173.283 Y155.295 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.867 Y158.611 I-.284 J-.296 E.04513
G1 X172.954 Y158.592 E.00274
G3 X173.323 Y155.25 I.045 J.408 E.02946
; COOLING_NODE: 4
M204 S250
G1 X172.362 Y155.182 F60000
G1 F12000
M204 S5000
G3 X171.867 Y158.611 I-.364 J-.185 E.04906
G1 X171.954 Y158.592 E.00274
G3 X172.385 Y155.127 I.044 J.406 E.02509
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.284 Y155.297 E-.075
G1 X172.104 Y155.397 E-.07866
G1 X171.965 Y155.409 E-.05278
G1 X171.81 Y155.364 E-.06155
G1 X171.67 Y155.244 E-.07
G1 X171.62 Y155.145 E-.04201
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.972 J-.733 P1  F60000
G1 X171.348 Y158.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.867 Y158.611 I-.35 J.214 E.06219
G1 X170.954 Y158.592 E.00274
G3 X171.313 Y158.737 I.045 J.408 E.0124
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.402 Y158.913 E-.07505
G1 X171.407 Y155.052 E-.05281
G1 X171.367 Y155.185 E-.05271
G1 X171.284 Y155.297 E-.05277
G1 X171.104 Y155.397 E-.07866
G1 X170.965 Y155.409 E-.05278
G1 X170.926 Y155.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.822 J.898 P1  F60000
G1 X171.348 Y155.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.867 Y155.611 I-.35 J.214 E.06219
G1 X170.954 Y155.592 E.00274
G3 X171.313 Y155.737 I.045 J.408 E.0124
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.402 Y155.913 E-.07505
G1 X171.407 Y160.052 E-.05281
G1 X171.367 Y160.185 E-.05271
G1 X171.284 Y160.297 E-.05277
G1 X171.104 Y160.397 E-.07866
G1 X170.965 Y160.409 E-.05278
G1 X170.926 Y160.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.182 J1.203 P1  F60000
G1 X172.362 Y160.182 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.867 Y155.611 I-.364 J-.185 E.04906
G1 X171.954 Y155.592 E.00274
G3 X172.385 Y160.127 I.044 J.406 E.02509
; COOLING_NODE: 12
M204 S250
G1 X172.359 Y160.807 F60000
G1 F12000
M204 S5000
G3 X171.867 Y160.611 I-.361 J.191 E.06106
G1 X171.954 Y160.592 E.00274
G3 X172.327 Y160.756 I.044 J.406 E.0131
; COOLING_NODE: 5
M204 S250
G1 X171.348 Y160.786 F60000
G1 F12000
M204 S5000
G3 X170.867 Y160.611 I-.35 J.214 E.06219
G1 X170.954 Y160.592 E.00274
G3 X171.313 Y160.737 I.045 J.408 E.0124
; COOLING_NODE: 6
M204 S250
G1 X170.359 Y160.807 F60000
G1 F12000
M204 S5000
G3 X169.867 Y160.611 I-.361 J.191 E.06106
G1 X169.954 Y160.592 E.00274
G3 X170.327 Y160.756 I.044 J.406 E.0131
; COOLING_NODE: 7
M204 S250
G1 X170.362 Y160.182 F60000
G1 F12000
M204 S5000
G3 X169.867 Y155.611 I-.364 J-.185 E.04906
G1 X169.954 Y155.592 E.00274
G3 X170.385 Y160.127 I.044 J.406 E.02509
; COOLING_NODE: 8
M204 S250
G1 X170.362 Y155.182 F60000
G1 F12000
M204 S5000
G3 X169.867 Y158.611 I-.364 J-.185 E.04906
G1 X169.954 Y158.592 E.00274
G3 X170.385 Y155.127 I.044 J.406 E.02509
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.284 Y155.297 E-.075
G1 X170.104 Y155.397 E-.07866
G1 X169.965 Y155.409 E-.05278
G1 X169.831 Y155.374 E-.05275
G1 X169.713 Y155.294 E-.05425
G1 X169.62 Y155.145 E-.06656
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.971 J-.733 P1  F60000
G1 X169.348 Y158.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y158.611 I-.35 J.214 E.06217
G1 X168.954 Y158.592 E.00274
G3 X169.313 Y158.737 I.045 J.408 E.0124
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.402 Y158.913 E-.07505
G1 X169.407 Y155.052 E-.05281
G1 X169.367 Y155.185 E-.05274
G1 X169.284 Y155.297 E-.05275
G1 X169.104 Y155.397 E-.07866
G1 X168.965 Y155.409 E-.05279
G1 X168.926 Y155.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.822 J.898 P1  F60000
G1 X169.348 Y155.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y155.611 I-.35 J.214 E.06217
G1 X168.954 Y155.592 E.00274
G3 X169.313 Y155.737 I.045 J.408 E.0124
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X169.402 Y155.913 E-.07505
G1 X169.407 Y160.052 E-.05281
G1 X169.367 Y160.185 E-.05274
G1 X169.284 Y160.297 E-.05275
G1 X169.104 Y160.397 E-.07866
G1 X168.965 Y160.409 E-.05279
G1 X168.926 Y160.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.436 J-1.136 P1  F60000
G1 X168.365 Y160.184 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.867 Y155.611 I-.366 J-.184 E.04938
G1 X167.954 Y155.592 E.00274
G3 X168.388 Y160.128 I.045 J.408 E.02519
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.284 Y160.297 E-.07509
G1 X168.104 Y160.397 E-.07866
G1 X167.965 Y160.409 E-.05278
G1 X167.81 Y160.364 E-.06155
G1 X167.67 Y160.244 E-.07
G1 X167.62 Y160.146 E-.04193
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.966 J-.74 P1  F60000
G1 X167.36 Y155.806 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.867 Y155.611 I-.362 J.194 E.06145
G1 X166.954 Y155.592 E.00274
G3 X167.328 Y155.755 I.045 J.408 E.01312
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.401 Y155.906 E-.06362
G1 X167.407 Y160.052 E-.05567
G1 X167.367 Y160.185 E-.05274
G1 X167.284 Y160.297 E-.05275
G1 X167.104 Y160.397 E-.07866
G1 X166.965 Y160.409 E-.05278
G1 X166.905 Y160.392 E-.02379
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.819 J.9 P1  F60000
G1 X167.36 Y160.806 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.867 Y160.611 I-.362 J.194 E.06145
G1 X166.954 Y160.592 E.00274
G3 X167.328 Y160.755 I.045 J.408 E.01312
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.401 Y160.906 E-.06362
G1 X167.407 Y161.052 E-.05566
G1 X167.367 Y161.185 E-.05275
G1 X167.284 Y161.297 E-.05274
G1 X167.104 Y161.397 E-.07866
G1 X166.965 Y161.409 E-.05278
G1 X166.905 Y161.392 E-.02379
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.455 J1.129 P1  F60000
G1 X168.36 Y160.806 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.867 Y160.611 I-.362 J.194 E.06145
G1 X167.954 Y160.592 E.00274
G3 X168.328 Y160.755 I.045 J.408 E.01312
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X168.401 Y160.906 E-.06362
G1 X168.407 Y161.052 E-.05567
G1 X168.367 Y161.185 E-.05272
G1 X168.284 Y161.297 E-.05277
G1 X168.104 Y161.397 E-.07866
G1 X167.965 Y161.409 E-.05278
G1 X167.905 Y161.392 E-.02379
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.471 J1.122 P1  F60000
G1 X169.348 Y160.786 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.867 Y160.611 I-.35 J.214 E.06217
G1 X168.954 Y160.592 E.00274
G3 X169.313 Y160.737 I.045 J.408 E.0124
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X169.402 Y160.913 E-.07506
G1 X169.407 Y161.052 E-.0528
G1 X169.33 Y161.244 E-.07864
G1 X169.23 Y161.34 E-.05278
G1 X169.104 Y161.397 E-.05273
G1 X168.965 Y161.409 E-.05279
G1 X168.926 Y161.399 E-.01521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.18 J-.299 P1  F60000
G1 X168.365 Y155.184 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.867 Y158.611 I-.366 J-.184 E.04938
G1 X167.954 Y158.592 E.00274
G3 X168.388 Y155.128 I.045 J.408 E.02519
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X168.284 Y155.297 E-.07508
G1 X168.104 Y155.397 E-.07866
G1 X167.965 Y155.409 E-.05278
G1 X167.81 Y155.364 E-.06155
G1 X167.67 Y155.244 E-.07
G1 X167.62 Y155.146 E-.04193
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I.966 J-.74 P1  F60000
G1 X167.36 Y158.806 Z3.4
G1 Z3
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.867 Y158.611 I-.362 J.194 E.06145
G1 X166.954 Y158.592 E.00274
G3 X167.328 Y158.755 I.045 J.408 E.01312
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.401 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.645 Y161.727 I.665 J.492 E.04713
G1 X166.591 Y161.898 E.00595
G1 X165.602 Y161.898 E.0328
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07742
G1 X166.396 Y158.469 E-.05176
G1 X166.254 Y158.7 E-.10325
G1 X166.214 Y158.831 E-.05198
G1 X166.203 Y155.082 E-.09559
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
M204 S10000
G1 X184.011 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.301287
G1 F15000
M204 S8000
G1 X184.068 Y161.388 E.00657
; LINE_WIDTH: 0.281981
G1 X184.082 Y161.277 E.00216
; LINE_WIDTH: 0.241466
G2 X184.088 Y160.756 I-2.321 J-.288 E.00845
; LINE_WIDTH: 0.268955
G1 X184.075 Y160.671 E.00159
; LINE_WIDTH: 0.308677
G2 X183.986 Y160.193 I-5.635 J.8 E.01052
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.250564
G1 F15000
M204 S8000
G1 X183.949 Y160.504 E.00125
; LINE_WIDTH: 0.288353
G1 X184.023 Y160.503 E.00148
; LINE_WIDTH: 0.328311
G1 X184.044 Y160.503 E.00048
G1 X184.059 Y160.421 E.00193
; LINE_WIDTH: 0.29742
G1 X184.075 Y160.34 E.00172
; LINE_WIDTH: 0.278688
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243527
G2 X184.09 Y155.774 I-2.427 J-.325 E.00895
; LINE_WIDTH: 0.266414
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294545
G1 X184.062 Y155.585 E.00177
; LINE_WIDTH: 0.311734
G1 X183.986 Y155.193 E.00875
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.250564
G1 F15000
M204 S8000
G1 X183.949 Y155.504 E.00125
; LINE_WIDTH: 0.288353
G1 X184.023 Y155.503 E.00148
; LINE_WIDTH: 0.328311
G1 X184.044 Y155.503 E.00048
G1 X184.059 Y155.421 E.00192
; LINE_WIDTH: 0.29742
G1 X184.075 Y155.34 E.00172
; LINE_WIDTH: 0.278688
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243527
G2 X184.09 Y158.774 I-2.427 J-.325 E.00895
; LINE_WIDTH: 0.266414
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294545
G1 X184.062 Y158.585 E.00177
; LINE_WIDTH: 0.311734
G1 X184.008 Y158.306 E.00624
; WIPE_START
G1 X184.062 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I-1.165 J-.351 P1  F60000
G1 X183.141 Y161.643 Z3.4
G1 Z3
G1 E.4 F1800
; LINE_WIDTH: 0.609641
G1 F13234.023
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.57467
G1 F14104.382
G3 X182.196 Y161.839 I-.349 J-1.728 E.00644
; LINE_WIDTH: 0.541394
G1 F15000
G3 X181.743 Y161.831 I-.193 J-1.899 E.01846
; LINE_WIDTH: 0.581261
G1 F13931.694
G1 X181.677 Y161.818 E.00296
; LINE_WIDTH: 0.606463
G1 F13308.664
G1 X181.611 Y161.806 E.00309
; LINE_WIDTH: 0.636354
G1 F12638.314
G1 X181.542 Y161.789 E.00342
; LINE_WIDTH: 0.667741
G1 F12003.441
G2 X181.494 Y161.779 I-.032 J.033 E.00263
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609641
G1 F13234.023
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.57467
G1 F14104.382
G3 X168.196 Y161.839 I-.349 J-1.728 E.00644
; LINE_WIDTH: 0.541394
G1 F15000
G3 X167.743 Y161.831 I-.193 J-1.899 E.01846
; LINE_WIDTH: 0.581261
G1 F13931.694
G1 X167.677 Y161.818 E.00296
; LINE_WIDTH: 0.606463
G1 F13308.664
G1 X167.611 Y161.806 E.00309
; LINE_WIDTH: 0.636348
G1 F12638.438
G1 X167.542 Y161.789 E.00342
; LINE_WIDTH: 0.67546
G1 F11856.959
G1 X167.503 Y161.776 E.00212
G1 X166.773 Y161.972 E.03892
M204 S10000
G1 X166.244 Y161.694 F60000
; LINE_WIDTH: 0.353185
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00813
G1 X165.942 Y161.426 E.00285
; LINE_WIDTH: 0.298331
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278859
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.24355
G3 X165.91 Y160.775 I2.426 J-.326 E.00894
; LINE_WIDTH: 0.266314
G1 X165.925 Y160.671 E.00191
; LINE_WIDTH: 0.294517
G1 X165.938 Y160.585 E.00178
; LINE_WIDTH: 0.311805
G1 X166.014 Y160.193 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.25143
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00126
; LINE_WIDTH: 0.289253
G1 X165.976 Y160.503 E.00149
; LINE_WIDTH: 0.328405
G1 X165.956 Y160.503 E.00047
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297429
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278701
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.24352
G3 X165.91 Y155.775 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266314
G1 X165.925 Y155.671 E.00191
; LINE_WIDTH: 0.294517
G1 X165.938 Y155.585 E.00178
; LINE_WIDTH: 0.311805
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.25143
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00126
; LINE_WIDTH: 0.289253
G1 X165.976 Y155.503 E.00149
; LINE_WIDTH: 0.328405
G1 X165.956 Y155.503 E.00047
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297429
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278701
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.24352
G3 X165.91 Y158.775 I2.428 J-.325 E.00894
; LINE_WIDTH: 0.266314
G1 X165.925 Y158.671 E.00191
; LINE_WIDTH: 0.294517
G1 X165.938 Y158.585 E.00178
; LINE_WIDTH: 0.311805
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z3.4 I-1.197 J.217 P1  F60000
G1 X185.963 Y268.881 Z3.4
G1 Z3
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y269.881  
M204 S8000
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
M73 P81 R3
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X188.398 Y255.349   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y257.357   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y259.273   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #15
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z3.4 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z3
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E6

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z6 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y256.381 F60000
G1 Z3

; filament start gcode
G17
G3 Z3.4 I0 J-1.217 P1
G1 X185.963 Y256.381 Z3.4
G1 Z3
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y256.881 
G1  X185.463 
G1  Y255.881 
G1  X186.963 
G1  Y257.381 
G1  X184.963 
G1  Y255.381 
G1  X182.963 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y258.631  E0.0285
M73 P82 R3
G1  X185.963  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y266.131  E0.0285
G1  X185.963  E0.7031
G1  Y266.881  E0.0285
G1  X167.463  E0.7031
G1  Y267.631  E0.0285
G1  X185.963  E0.7031
G1  Y268.381  E0.0285
G1  X167.463  E0.7031
G1  Y269.131  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X184.963 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z3
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2421
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 15 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z3.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z3.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer15 end: 112,152
M625
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z3.0
Z2.76
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X150 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X155 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X160 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X165 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X170 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X175 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X180 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X185 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X190 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X195 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X200 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X205 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X210 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X215 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X220 Y155 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z3.0
Z2.76
G1 E0.40 F150
G4 P400
G0 Z0.6 
G1 E-0.08 F800
G0 X145 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X150 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X155 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X160 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X165 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X170 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X175 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X180 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X185 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X190 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X195 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X200 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X205 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X210 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X215 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X220 Y160 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z3.0
Z2.76
G1 E0.40 F150
G4 P400
G0 Z0.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X150 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X155 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X160 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X165 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X170 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X175 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X180 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X185 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X190 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X195 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X200 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X205 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X210 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X215 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
G0 X220 Y165 Z3.0
Z2.76
G1 E0.40
G4 P400
G0 Z3.0
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 16/25
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z3.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2272
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 16 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z3.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z3.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer16 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #16
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z3.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S164 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E5

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P83 R3
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z6.2 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y265.141 F60000
G1 Z3.2
G17
G3 Z3.6 I-1.217 J0 P1
G1 X190.897 Y274.469 Z3.6
G1 X162.53 Y274.469
G1 X162.53 Y269.131

; filament start gcode
G1 X167.463 Y269.131
G1 Z3.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y269.631 
G1  X166.963 
G1  Y268.631 
G1  X168.463 
G1  Y270.131 
G1  X166.463 
G1  Y268.131 
G1  X170.463 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y259.381  E0.0285
G1  X167.463  E0.7031
G1  Y258.631  E0.0285
G1  X185.963  E0.7031
G1  Y257.881  E0.0285
G1  X167.463  E0.7031
G1  Y257.131  E0.0285
G1  X185.963  E0.7031
G1  Y256.381  E0.0285
M73 P84 R3
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X165.438 Y268.205  
M204 S8000
G3  X166.125 Y265.161   I1.763 J-1.201 E0.1330
G2  X166.963 Y262.738   I-3.144 J-2.444 E0.0992
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X167.122 Y270.055   E0.0670
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X167.795 Y270.794 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.384 Y155.846
G1 Z3.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.941 Y155.594 I-.379 J.151 E.0618
G1 X175 Y155.589 E.00181
G3 X175.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X175.41 Y155.983 E-.07511
G1 X175.393 Y160.12 E-.05274
G1 X175.33 Y160.244 E-.0528
G1 X175.169 Y160.374 E-.07865
G1 X175.035 Y160.409 E-.05274
G1 X174.896 Y160.397 E-.05277
G1 X174.86 Y160.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.808 J.91 P1  F60000
G1 X175.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.941 Y160.594 I-.379 J.151 E.0618
G1 X175 Y160.589 E.00181
G3 X175.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X175.41 Y160.983 E-.07512
G1 X175.393 Y161.12 E-.05278
G1 X175.33 Y161.244 E-.05277
G1 X175.169 Y161.374 E-.07865
G1 X175.035 Y161.409 E-.05274
G1 X174.896 Y161.397 E-.05277
G1 X174.86 Y161.381 E-.01517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.403 J1.148 P1  F60000
G1 X176.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.941 Y160.594 I-.379 J.151 E.0618
G1 X176 Y160.589 E.00181
G3 X176.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 29
M204 S250
G1 X177.348 Y160.786 F60000
G1 F12000
M204 S5000
G3 X176.866 Y160.611 I-.349 J.211 E.06175
G1 X176.951 Y160.592 E.00268
G3 X177.313 Y160.737 I.047 J.405 E.01247
; COOLING_NODE: 28
M204 S250
G1 X177.348 Y155.786 F60000
G1 F12000
M204 S5000
G3 X176.866 Y155.611 I-.349 J.211 E.06175
G1 X176.951 Y155.592 E.00268
G3 X177.313 Y155.737 I.047 J.405 E.01247
; COOLING_NODE: 1
M204 S250
G1 X176.384 Y155.846 F60000
G1 F12000
M204 S5000
G3 X175.941 Y155.594 I-.379 J.151 E.0618
G1 X176 Y155.589 E.00181
G3 X176.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 20
M204 S250
G1 X176.384 Y158.846 F60000
G1 F12000
M204 S5000
G3 X175.941 Y158.594 I-.379 J.151 E.0618
G1 X176 Y158.589 E.00181
G3 X176.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 21
M204 S250
G1 X177.348 Y158.786 F60000
G1 F12000
M204 S5000
G3 X176.866 Y158.611 I-.349 J.211 E.06175
G1 X176.951 Y158.592 E.00268
G3 X177.313 Y158.737 I.047 J.405 E.01247
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.402 Y158.913 E-.0751
G1 X177.407 Y155.052 E-.05282
G1 X177.33 Y155.244 E-.07865
G1 X177.23 Y155.34 E-.05272
G1 X177.103 Y155.397 E-.05277
G1 X176.965 Y155.409 E-.05278
G1 X176.926 Y155.399 E-.01516
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.432 J1.138 P1  F60000
G1 X178.384 Y158.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.941 Y158.594 I-.379 J.151 E.0618
G1 X178 Y158.589 E.00181
G3 X178.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.41 Y158.983 E-.07511
G1 X178.393 Y155.12 E-.05274
G1 X178.33 Y155.244 E-.0528
G1 X178.169 Y155.374 E-.07865
G1 X178.035 Y155.409 E-.05274
G1 X177.896 Y155.397 E-.05277
G1 X177.86 Y155.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.808 J.91 P1  F60000
G1 X178.384 Y155.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.941 Y155.594 I-.379 J.151 E.0618
G1 X178 Y155.589 E.00181
G3 X178.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178.41 Y155.983 E-.07511
G1 X178.393 Y160.12 E-.05274
G1 X178.33 Y160.244 E-.0528
G1 X178.169 Y160.374 E-.07865
G1 X178.035 Y160.409 E-.05274
G1 X177.896 Y160.397 E-.05277
G1 X177.86 Y160.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.808 J.91 P1  F60000
G1 X178.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.941 Y160.594 I-.379 J.151 E.0618
G1 X178 Y160.589 E.00181
G3 X178.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.41 Y160.983 E-.07512
G1 X178.393 Y161.12 E-.05278
G1 X178.33 Y161.244 E-.05277
G1 X178.169 Y161.374 E-.07865
G1 X178.035 Y161.409 E-.05274
G1 X177.896 Y161.397 E-.05277
G1 X177.86 Y161.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.403 J1.148 P1  F60000
G1 X179.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.941 Y160.594 I-.379 J.151 E.0618
G1 X179 Y160.589 E.00181
G3 X179.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.41 Y160.983 E-.07525
G1 X179.393 Y161.12 E-.05278
G1 X179.33 Y161.244 E-.05277
G1 X179.169 Y161.374 E-.07865
G1 X179.035 Y161.409 E-.05274
G1 X178.897 Y161.398 E-.05274
G1 X178.86 Y161.381 E-.01508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.403 J1.148 P1  F60000
G1 X180.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.941 Y160.594 I-.379 J.151 E.0618
G1 X180 Y160.589 E.00181
G3 X180.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 25
M204 S250
G1 X180.394 Y160.121 F60000
G1 F12000
M204 S5000
G3 X179.941 Y155.594 I-.388 J-.124 E.05319
G1 X180 Y155.589 E.00181
G3 X180.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.33 Y160.244 E-.07526
G1 X180.169 Y160.374 E-.07865
G1 X180.035 Y160.409 E-.05274
G1 X179.896 Y160.397 E-.05277
G1 X179.761 Y160.333 E-.05678
G1 X179.652 Y160.206 E-.0638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.384 J-1.155 P1  F60000
G1 X179.394 Y160.121 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.941 Y155.594 I-.388 J-.124 E.05319
G1 X179 Y155.589 E.00181
G3 X179.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 23
M204 S250
G1 X179.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X178.941 Y158.594 I-.388 J-.124 E.05319
G1 X179 Y158.589 E.00181
G3 X179.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 24
M204 S250
G1 X180.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X179.941 Y158.594 I-.388 J-.124 E.05319
G1 X180 Y158.589 E.00181
G3 X180.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 39
M204 S250
G1 X181.384 Y158.846 F60000
G1 F12000
M204 S5000
G3 X180.941 Y158.594 I-.379 J.151 E.0618
G1 X181 Y158.589 E.00181
G3 X181.358 Y158.792 I.005 J.408 E.01323
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.41 Y158.983 E-.07524
G1 X181.393 Y155.12 E-.05274
G1 X181.33 Y155.244 E-.0528
G1 X181.169 Y155.374 E-.07865
G1 X181.035 Y155.409 E-.05274
G1 X180.897 Y155.398 E-.05274
G1 X180.86 Y155.381 E-.01508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.808 J.91 P1  F60000
G1 X181.384 Y155.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.941 Y155.594 I-.379 J.151 E.0618
G1 X181 Y155.589 E.00181
G3 X181.358 Y155.792 I.005 J.408 E.01323
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X181.41 Y155.983 E-.07524
G1 X181.393 Y160.12 E-.05274
G1 X181.33 Y160.244 E-.0528
G1 X181.169 Y160.374 E-.07865
G1 X181.035 Y160.409 E-.05274
G1 X180.897 Y160.398 E-.05274
G1 X180.86 Y160.381 E-.01508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.204 J1.2 P1  F60000
G1 X182.394 Y160.121 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.941 Y155.594 I-.388 J-.124 E.05319
G1 X182 Y155.589 E.00181
G3 X182.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 38
M204 S250
G1 X182.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X181.941 Y158.594 I-.388 J-.124 E.05319
G1 X182 Y158.589 E.00181
G3 X182.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 41
M204 S250
G1 X183.33 Y155.244 F60000
G1 F12000
M204 S5000
G3 X182.941 Y158.594 I-.324 J-.247 E.04889
G1 X183 Y158.589 E.00181
G3 X183.362 Y155.193 I.005 J.408 E.02614
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.169 Y155.374 E-.10058
G1 X183.035 Y155.409 E-.05274
G1 X182.897 Y155.398 E-.05274
G1 X182.77 Y155.34 E-.05281
G1 X182.633 Y155.185 E-.07863
G1 X182.6 Y155.078 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-1.032 J.645 P1  F60000
G1 X183.33 Y160.244 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.941 Y155.594 I-.324 J-.247 E.04889
G1 X183 Y155.589 E.00181
G3 X183.362 Y160.193 I.005 J.408 E.02614
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X183.169 Y160.374 E-.10058
G1 X183.035 Y160.409 E-.05274
G1 X182.897 Y160.398 E-.05274
G1 X182.77 Y160.34 E-.05281
G1 X182.633 Y160.185 E-.07863
G1 X182.6 Y160.078 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-1.114 J.489 P1  F60000
G1 X183.168 Y161.371 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.941 Y160.594 I-.162 J-.374 E.0425
G1 X183 Y160.589 E.00181
G3 X183.221 Y161.343 I.005 J.408 E.03254
; COOLING_NODE: 34
M204 S250
G1 X182.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X181.941 Y160.594 I-.379 J.151 E.0618
G1 X182 Y160.589 E.00181
G3 X182.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 33
M204 S250
G1 X181.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X180.941 Y160.594 I-.379 J.151 E.0618
G1 X181 Y160.589 E.00181
G3 X181.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.41 Y160.983 E-.07525
G1 X181.393 Y161.12 E-.05278
G1 X181.33 Y161.244 E-.05277
G1 X181.169 Y161.374 E-.07865
G1 X181.035 Y161.409 E-.05274
G1 X180.897 Y161.398 E-.05274
G1 X180.86 Y161.381 E-.01508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.176 J1.204 P1  F60000
G1 X184.398 Y161.898 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.04699
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.673 J-.496 E.04732
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 14
; WIPE_START
G1 X183.41 Y161.898 E-.37599
G1 X183.408 Y161.888 E-.00401
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.14 J-1.209 P1  F60000
G1 X174.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X173.941 Y160.594 I-.379 J.151 E.0618
G1 X174 Y160.589 E.00181
G3 X174.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 15
M204 S250
G1 X174.384 Y155.846 F60000
G1 F12000
M204 S5000
G3 X173.941 Y155.594 I-.379 J.151 E.0618
G1 X174 Y155.589 E.00181
G3 X174.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.41 Y155.983 E-.07511
G1 X174.393 Y160.12 E-.05274
G1 X174.33 Y160.244 E-.0528
G1 X174.169 Y160.374 E-.07865
G1 X174.035 Y160.409 E-.05274
G1 X173.896 Y160.397 E-.05277
G1 X173.86 Y160.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.864 J.857 P1  F60000
G1 X175.384 Y158.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.941 Y158.594 I-.379 J.151 E.0618
G1 X175 Y158.589 E.00181
G3 X175.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 18
M204 S250
G1 X174.384 Y158.846 F60000
G1 F12000
M204 S5000
G3 X173.941 Y158.594 I-.379 J.151 E.0618
G1 X174 Y158.589 E.00181
G3 X174.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.41 Y158.983 E-.07512
G1 X174.393 Y155.12 E-.05274
G1 X174.33 Y155.244 E-.0528
G1 X174.169 Y155.374 E-.07865
G1 X174.035 Y155.409 E-.05274
G1 X173.896 Y155.397 E-.05277
G1 X173.86 Y155.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.305 J-1.178 P1  F60000
G1 X173.33 Y155.244 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.941 Y158.594 I-.324 J-.247 E.04889
G1 X173 Y158.589 E.00181
G3 X173.362 Y155.193 I.005 J.408 E.02614
; COOLING_NODE: 4
M204 S250
G1 X172.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X171.941 Y158.594 I-.388 J-.124 E.05319
G1 X172 Y158.589 E.00181
G3 X172.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.33 Y155.244 E-.07525
G1 X172.169 Y155.374 E-.07865
G1 X172.035 Y155.409 E-.05274
G1 X171.897 Y155.398 E-.05274
G1 X171.77 Y155.34 E-.05281
G1 X171.652 Y155.206 E-.0678
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.977 J-.726 P1  F60000
G1 X171.384 Y158.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.941 Y158.594 I-.379 J.151 E.06181
G1 X171 Y158.589 E.00181
G3 X171.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.41 Y158.983 E-.07512
G1 X171.393 Y155.12 E-.05274
G1 X171.33 Y155.244 E-.0528
G1 X171.169 Y155.374 E-.07865
G1 X171.035 Y155.409 E-.05274
G1 X170.897 Y155.398 E-.05273
G1 X170.86 Y155.38 E-.01522
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.809 J.91 P1  F60000
G1 X171.384 Y155.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.941 Y155.594 I-.379 J.151 E.06181
G1 X171 Y155.589 E.00181
G3 X171.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.41 Y155.983 E-.07512
G1 X171.393 Y160.12 E-.05274
G1 X171.33 Y160.244 E-.0528
G1 X171.169 Y160.374 E-.07865
G1 X171.035 Y160.409 E-.05274
G1 X170.897 Y160.398 E-.05273
G1 X170.86 Y160.38 E-.01522
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.203 J1.2 P1  F60000
G1 X172.394 Y160.121 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.941 Y155.594 I-.388 J-.124 E.05319
G1 X172 Y155.589 E.00181
G3 X172.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 16
M204 S250
G1 X173.33 Y160.244 F60000
G1 F12000
M204 S5000
G3 X172.941 Y155.594 I-.324 J-.247 E.04889
G1 X173 Y155.589 E.00181
G3 X173.362 Y160.193 I.005 J.408 E.02614
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X173.169 Y160.374 E-.10058
G1 X173.035 Y160.409 E-.05274
G1 X172.897 Y160.398 E-.05274
G1 X172.77 Y160.34 E-.05281
G1 X172.633 Y160.185 E-.07859
G1 X172.6 Y160.078 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-1.032 J.645 P1  F60000
G1 X173.33 Y161.244 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.941 Y160.594 I-.324 J-.247 E.04889
G1 X173 Y160.589 E.00181
G3 X173.362 Y161.193 I.005 J.408 E.02614
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.169 Y161.374 E-.10058
G1 X173.035 Y161.409 E-.05274
G1 X172.897 Y161.398 E-.05274
G1 X172.77 Y161.34 E-.05281
G1 X172.633 Y161.185 E-.07863
G1 X172.6 Y161.078 E-.04249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.89 J-.83 P1  F60000
G1 X172.384 Y160.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.941 Y160.594 I-.379 J.151 E.0618
G1 X172 Y160.589 E.00181
G3 X172.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 5
M204 S250
G1 X171.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X170.941 Y160.594 I-.379 J.151 E.06181
G1 X171 Y160.589 E.00181
G3 X171.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 6
M204 S250
G1 X170.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X169.941 Y160.594 I-.379 J.151 E.0618
G1 X170 Y160.589 E.00181
G3 X170.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 46
M204 S250
G1 X169.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X168.941 Y160.594 I-.379 J.151 E.0618
G1 X169 Y160.589 E.00181
G3 X169.358 Y160.792 I.005 J.408 E.01324
; COOLING_NODE: 47
M204 S250
G1 X168.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X167.941 Y160.594 I-.379 J.151 E.0618
G1 X168 Y160.589 E.00181
G3 X168.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 48
M204 S250
G1 X167.384 Y160.846 F60000
G1 F12000
M204 S5000
G3 X166.941 Y160.594 I-.379 J.151 E.0618
G1 X167 Y160.589 E.00181
G3 X167.358 Y160.792 I.005 J.408 E.01323
; COOLING_NODE: 49
M204 S250
G1 X167.384 Y155.846 F60000
G1 F12000
M204 S5000
G3 X166.941 Y155.594 I-.379 J.151 E.0618
G1 X167 Y155.589 E.00181
G3 X167.358 Y155.792 I.005 J.408 E.01323
; COOLING_NODE: 50
M204 S250
G1 X167.384 Y158.846 F60000
G1 F12000
M204 S5000
G3 X166.941 Y158.594 I-.379 J.151 E.0618
G1 X167 Y158.589 E.00181
G3 X167.358 Y158.792 I.005 J.408 E.01323
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.397 J.733 E.04737
G2 X166.37 Y160.505 I.64 J.5 E.03573
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 42
; WIPE_START
G1 X166.495 Y158.374 E-.07744
G1 X166.396 Y158.469 E-.05181
G1 X166.315 Y158.578 E-.05171
G1 X166.219 Y158.814 E-.09698
G1 X166.196 Y158.957 E-.05467
G1 X166.212 Y155.08 E-.0474
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.524 J1.099 P1  F60000
G1 X168.394 Y160.121 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.941 Y155.594 I-.388 J-.124 E.05319
G1 X168 Y155.589 E.00181
G3 X168.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 43
M204 S250
G1 X168.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X167.941 Y158.594 I-.388 J-.124 E.05319
G1 X168 Y158.589 E.00181
G3 X168.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 44
M204 S250
G1 X169.384 Y158.846 F60000
G1 F12000
M204 S5000
G3 X168.941 Y158.594 I-.379 J.151 E.0618
G1 X169 Y158.589 E.00181
G3 X169.358 Y158.792 I.005 J.408 E.01324
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.41 Y158.983 E-.07512
G1 X169.393 Y155.12 E-.05274
G1 X169.33 Y155.244 E-.0528
G1 X169.169 Y155.374 E-.07865
G1 X169.035 Y155.409 E-.05274
G1 X168.896 Y155.397 E-.05277
G1 X168.86 Y155.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.808 J.91 P1  F60000
G1 X169.384 Y155.846 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.941 Y155.594 I-.379 J.151 E.0618
G1 X169 Y155.589 E.00181
G3 X169.358 Y155.792 I.005 J.408 E.01324
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.41 Y155.983 E-.07511
G1 X169.393 Y160.12 E-.05274
G1 X169.33 Y160.244 E-.0528
G1 X169.169 Y160.374 E-.07865
G1 X169.035 Y160.409 E-.05274
G1 X168.896 Y160.397 E-.05277
G1 X168.86 Y160.381 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I.204 J1.2 P1  F60000
G1 X170.394 Y160.121 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.941 Y155.594 I-.388 J-.124 E.05319
G1 X170 Y155.589 E.00181
G3 X170.408 Y160.062 I.005 J.408 E.02185
; COOLING_NODE: 8
M204 S250
G1 X170.394 Y155.121 F60000
G1 F12000
M204 S5000
G3 X169.941 Y158.594 I-.388 J-.124 E.05319
G1 X170 Y158.589 E.00181
G3 X170.408 Y155.062 I.005 J.408 E.02185
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X170.33 Y155.244 E-.07525
G1 X170.169 Y155.374 E-.07865
G1 X170.035 Y155.409 E-.05274
G1 X169.897 Y155.398 E-.05273
G1 X169.761 Y155.333 E-.05684
G1 X169.652 Y155.206 E-.06379
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I-.243 J1.192 P1  F60000
G1 X184.79 Y162.29 Z3.6
G1 Z3.2
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
M73 P85 R3
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.155 J.384 P1  F60000
G1 X184.059 Y161.425 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29822
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278715
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243524
G2 X184.09 Y160.774 I-2.424 J-.325 E.00895
; LINE_WIDTH: 0.266444
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294593
G1 X184.062 Y160.585 E.00177
; LINE_WIDTH: 0.311819
G1 X183.986 Y160.193 E.00874
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.252482
G1 F15000
M204 S8000
G1 X183.95 Y160.504 E.00128
; LINE_WIDTH: 0.290922
G1 X184.025 Y160.504 E.00151
; LINE_WIDTH: 0.328577
G1 X184.044 Y160.503 E.00044
G1 X184.059 Y160.421 E.00193
; LINE_WIDTH: 0.297378
G1 X184.075 Y160.34 E.00172
; LINE_WIDTH: 0.278677
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243513
G2 X184.09 Y155.774 I-2.423 J-.325 E.00894
; LINE_WIDTH: 0.266444
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294593
G1 X184.062 Y155.585 E.00177
; LINE_WIDTH: 0.311819
G1 X183.986 Y155.193 E.00874
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.252482
G1 F15000
M204 S8000
G1 X183.95 Y155.504 E.00128
; LINE_WIDTH: 0.290922
G1 X184.025 Y155.504 E.00151
; LINE_WIDTH: 0.328577
G1 X184.044 Y155.503 E.00044
G1 X184.059 Y155.421 E.00193
; LINE_WIDTH: 0.297378
G1 X184.075 Y155.34 E.00172
; LINE_WIDTH: 0.278677
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243513
G2 X184.09 Y158.774 I-2.423 J-.325 E.00894
; LINE_WIDTH: 0.266444
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294593
G1 X184.062 Y158.585 E.00177
; LINE_WIDTH: 0.311819
G1 X184.008 Y158.306 E.00624
M204 S10000
G1 X184.059 Y161.425 F60000
; LINE_WIDTH: 0.353239
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00285
G1 X183.754 Y161.694 E.00819
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609515
G1 F13236.979
M204 S8000
G1 X182.343 Y161.816 E.03773
; LINE_WIDTH: 0.574612
G1 F14105.918
G3 X182.196 Y161.839 I-.349 J-1.732 E.00642
; LINE_WIDTH: 0.540433
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.905 E.01772
; LINE_WIDTH: 0.581567
G1 F13923.786
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609615
G1 F13234.638
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609515
G1 F13236.979
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.574612
G1 F14105.918
G3 X168.196 Y161.839 I-.349 J-1.732 E.00642
; LINE_WIDTH: 0.540433
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.905 E.01772
; LINE_WIDTH: 0.581567
G1 F13923.786
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609615
G1 F13234.638
G1 X166.859 Y161.643 E.03772
M204 S10000
G1 X166.244 Y161.694 F60000
; LINE_WIDTH: 0.353144
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00812
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298176
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278671
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.244091
G3 X165.913 Y160.751 I2.356 J-.32 E.00934
; LINE_WIDTH: 0.282542
G1 X165.938 Y160.585 E.00328
; LINE_WIDTH: 0.311815
G1 X166.014 Y160.193 E.00874
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.250537
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00125
; LINE_WIDTH: 0.288351
G1 X165.977 Y160.503 E.00148
; LINE_WIDTH: 0.328322
G1 X165.956 Y160.503 E.00048
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297448
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278701
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.244099
G3 X165.913 Y155.751 I2.355 J-.32 E.00934
; LINE_WIDTH: 0.28254
G1 X165.938 Y155.585 E.00328
; LINE_WIDTH: 0.31182
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.250519
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00125
; LINE_WIDTH: 0.288345
G1 X165.977 Y155.503 E.00148
; LINE_WIDTH: 0.328321
G1 X165.956 Y155.503 E.00048
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297448
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278701
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.244099
G3 X165.913 Y158.751 I2.355 J-.32 E.00934
; LINE_WIDTH: 0.28254
G1 X165.938 Y158.585 E.00328
; LINE_WIDTH: 0.311811
G1 X165.992 Y158.306 E.00624
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 17/25
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I-.154 J1.207 P1  F60000
G1 X175.353 Y155.786 Z3.6
G1 Z3.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.939 Y155.594 I-.349 J.211 E.06384
G1 X175 Y155.589 E.00187
G3 X175.318 Y155.737 I.004 J.408 E.01114
M104 T0 S210 N0 ;Multi extruder pre heating
; COOLING_NODE: 15
M204 S250
G1 X174.353 Y155.786 F60000
G1 F12000
M204 S5000
G3 X173.939 Y155.594 I-.349 J.211 E.06384
G1 X174 Y155.589 E.00187
G3 X174.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 18
M204 S250
G1 X174.351 Y158.784 F60000
G1 F12000
M204 S5000
G3 X173.939 Y158.594 I-.348 J.213 E.06392
G1 X174 Y158.589 E.00187
G3 X174.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.41 Y158.983 E-.10063
G1 X174.367 Y155.185 E-.07868
G1 X174.284 Y155.297 E-.05273
G1 X174.169 Y155.374 E-.05277
G1 X174.035 Y155.409 E-.05276
G1 X173.925 Y155.39 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.476 J1.12 P1  F60000
G1 X175.351 Y158.784 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.939 Y158.594 I-.348 J.213 E.06392
G1 X175 Y158.589 E.00187
G3 X175.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.41 Y158.983 E-.10064
G1 X175.367 Y155.185 E-.07868
G1 X175.284 Y155.297 E-.05273
G1 X175.169 Y155.374 E-.05277
G1 X175.035 Y155.409 E-.05276
G1 X174.925 Y155.39 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.476 J1.12 P1  F60000
G1 X176.351 Y158.784 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.939 Y158.594 I-.348 J.213 E.06392
G1 X176 Y158.589 E.00187
G3 X176.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.41 Y158.983 E-.10064
G1 X176.367 Y155.185 E-.07868
G1 X176.284 Y155.297 E-.05273
G1 X176.169 Y155.374 E-.05277
G1 X176.035 Y155.409 E-.05276
G1 X175.925 Y155.39 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.826 J.893 P1  F60000
G1 X176.353 Y155.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.939 Y155.594 I-.349 J.211 E.06384
G1 X176 Y155.589 E.00187
G3 X176.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.41 Y155.982 E-.09966
G1 X176.367 Y160.185 E-.07871
G1 X176.284 Y160.297 E-.05273
G1 X176.169 Y160.374 E-.05277
G1 X176.035 Y160.409 E-.05276
G1 X175.922 Y160.39 E-.04337
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.824 J.895 P1  F60000
G1 X176.353 Y160.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.939 Y160.594 I-.349 J.211 E.06384
G1 X176 Y160.589 E.00187
G3 X176.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 3
M204 S250
G1 X175.353 Y160.786 F60000
G1 F12000
M204 S5000
G3 X174.939 Y160.594 I-.349 J.211 E.06384
G1 X175 Y160.589 E.00187
G3 X175.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 14
M204 S250
G1 X174.353 Y160.786 F60000
G1 F12000
M204 S5000
G3 X173.939 Y160.594 I-.349 J.211 E.06384
G1 X174 Y160.589 E.00187
M73 P85 R2
G3 X174.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X174.41 Y160.982 E-.09966
G1 X174.392 Y161.123 E-.05382
G1 X174.284 Y161.297 E-.07767
G1 X174.169 Y161.374 E-.05277
G1 X174.035 Y161.409 E-.05276
G1 X173.922 Y161.39 E-.04332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.181 J-1.203 P1  F60000
G1 X173.282 Y161.294 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.939 Y160.594 I-.278 J-.297 E.04672
G1 X173 Y160.589 E.00187
G3 X173.322 Y161.25 I.004 J.407 E.02818
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X173.169 Y161.374 E-.07499
G1 X173.032 Y161.41 E-.05374
G1 X172.831 Y161.374 E-.07773
G1 X172.716 Y161.297 E-.05277
G1 X172.633 Y161.185 E-.05278
G1 X172.592 Y161.05 E-.05374
G1 X172.597 Y161.012 E-.01425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.131 J.45 P1  F60000
G1 X173.282 Y155.294 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.939 Y158.594 I-.278 J-.297 E.04672
G1 X173 Y158.589 E.00187
G3 X173.323 Y155.25 I.004 J.407 E.02817
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X173.169 Y155.374 E-.0751
G1 X173.032 Y155.41 E-.05374
G1 X172.831 Y155.374 E-.07773
G1 X172.716 Y155.297 E-.05277
G1 X172.633 Y155.185 E-.05278
G1 X172.592 Y155.05 E-.05367
G1 X172.597 Y155.013 E-.01421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.073 J.574 P1  F60000
G1 X173.282 Y160.294 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.939 Y155.594 I-.278 J-.297 E.04672
G1 X173 Y155.589 E.00187
G3 X173.323 Y160.25 I.004 J.407 E.02817
; COOLING_NODE: 11
M204 S250
G1 X172.365 Y160.184 F60000
G1 F12000
M204 S5000
G3 X171.939 Y155.594 I-.361 J-.188 E.05097
G1 X172 Y155.589 E.00187
G3 X172.389 Y160.129 I.004 J.407 E.02392
; COOLING_NODE: 12
M204 S250
G1 X172.382 Y160.846 F60000
G1 F12000
M204 S5000
G3 X171.939 Y160.594 I-.379 J.15 E.06169
G1 X172 Y160.589 E.00187
G3 X172.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X172.41 Y160.982 E-.07504
G1 X172.392 Y161.123 E-.05382
G1 X172.284 Y161.297 E-.07767
G1 X172.169 Y161.374 E-.05277
G1 X172.032 Y161.41 E-.05374
G1 X171.859 Y161.379 E-.06696
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.926 J-.79 P1  F60000
G1 X171.353 Y160.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.939 Y160.594 I-.349 J.211 E.06384
G1 X171 Y160.589 E.00187
G3 X171.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 10
M204 S250
G1 X171.353 Y155.786 F60000
G1 F12000
M204 S5000
G3 X170.939 Y155.594 I-.349 J.211 E.06384
G1 X171 Y155.589 E.00187
G3 X171.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 9
M204 S250
G1 X171.351 Y158.784 F60000
G1 F12000
M204 S5000
G3 X170.939 Y158.594 I-.348 J.213 E.06392
G1 X171 Y158.589 E.00187
G3 X171.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X171.41 Y158.983 E-.10063
G1 X171.367 Y155.185 E-.07868
G1 X171.284 Y155.297 E-.05273
G1 X171.169 Y155.374 E-.05277
G1 X171.035 Y155.409 E-.05276
G1 X170.925 Y155.39 E-.04242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.173 J1.205 P1  F60000
G1 X172.365 Y155.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.939 Y158.594 I-.361 J-.188 E.05097
G1 X172 Y158.589 E.00187
G3 X172.389 Y155.129 I.004 J.407 E.02392
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X172.284 Y155.297 E-.07497
G1 X172.169 Y155.374 E-.05277
G1 X172.032 Y155.41 E-.05374
G1 X171.831 Y155.374 E-.07773
G1 X171.716 Y155.297 E-.05277
G1 X171.633 Y155.185 E-.05278
G1 X171.622 Y155.146 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.037 J-1.216 P1  F60000
G1 X170.366 Y155.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.939 Y158.594 I-.362 J-.187 E.05105
G1 X170 Y158.589 E.00187
G3 X170.389 Y155.129 I.004 J.408 E.02395
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.284 Y155.297 E-.07498
G1 X170.169 Y155.374 E-.05277
G1 X170.035 Y155.409 E-.05279
G1 X169.831 Y155.374 E-.07858
G1 X169.716 Y155.296 E-.05285
G1 X169.633 Y155.185 E-.05274
G1 X169.621 Y155.146 E-.01528
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.975 J-.728 P1  F60000
G1 X169.353 Y158.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y158.594 I-.349 J.211 E.06384
G1 X169 Y158.589 E.00187
G3 X169.318 Y158.737 I.004 J.408 E.01114
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X169.41 Y158.983 E-.09966
G1 X169.367 Y155.185 E-.07869
G1 X169.284 Y155.297 E-.05273
G1 X169.169 Y155.374 E-.05277
G1 X169.035 Y155.409 E-.05276
G1 X168.922 Y155.39 E-.04339
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.422 J-1.142 P1  F60000
G1 X168.365 Y155.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.939 Y158.594 I-.361 J-.188 E.05097
G1 X168 Y158.589 E.00187
G3 X168.389 Y155.129 I.004 J.407 E.02392
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X168.284 Y155.297 E-.07497
G1 X168.169 Y155.374 E-.05277
G1 X168.032 Y155.41 E-.05374
G1 X167.831 Y155.374 E-.07773
G1 X167.716 Y155.297 E-.05277
G1 X167.633 Y155.185 E-.05278
G1 X167.622 Y155.146 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.809 J-.909 P1  F60000
G1 X166.642 Y158.275 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.399 J.733 E.04735
G2 X166.37 Y160.505 I.683 J.5 E.03549
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 50
M204 S250
G1 X167.382 Y158.846 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X166.939 Y158.594 I-.379 J.15 E.06168
G1 X167 Y158.589 E.00187
G3 X167.356 Y158.793 I.004 J.407 E.01321
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167.41 Y158.983 E-.07504
G1 X167.367 Y155.185 E-.07869
G1 X167.284 Y155.297 E-.05273
G1 X167.169 Y155.374 E-.05277
G1 X167.032 Y155.41 E-.05374
G1 X166.859 Y155.379 E-.06703
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.81 J.908 P1  F60000
G1 X167.382 Y155.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.939 Y155.594 I-.379 J.15 E.06169
G1 X167 Y155.589 E.00187
G3 X167.356 Y155.793 I.004 J.407 E.01321
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.41 Y155.983 E-.07507
G1 X167.367 Y160.185 E-.07867
G1 X167.284 Y160.297 E-.05273
G1 X167.169 Y160.374 E-.05277
G1 X167.032 Y160.41 E-.05374
G1 X166.859 Y160.379 E-.06701
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.81 J.908 P1  F60000
G1 X167.382 Y160.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.939 Y160.594 I-.379 J.15 E.06169
G1 X167 Y160.589 E.00187
G3 X167.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.41 Y160.983 E-.07507
G1 X167.392 Y161.123 E-.05379
G1 X167.284 Y161.297 E-.07767
G1 X167.169 Y161.374 E-.05277
G1 X167.032 Y161.41 E-.05374
G1 X166.859 Y161.379 E-.06696
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.402 J1.149 P1  F60000
G1 X168.382 Y160.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.939 Y160.594 I-.379 J.15 E.06169
G1 X168 Y160.589 E.00187
G3 X168.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 42
M204 S250
G1 X168.365 Y160.184 F60000
G1 F12000
M204 S5000
G3 X167.939 Y155.594 I-.361 J-.188 E.05097
G1 X168 Y155.589 E.00187
G3 X168.389 Y160.129 I.004 J.407 E.02392
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X168.284 Y160.297 E-.07497
G1 X168.169 Y160.374 E-.05277
G1 X168.032 Y160.41 E-.05374
G1 X167.831 Y160.374 E-.07773
G1 X167.716 Y160.297 E-.05277
G1 X167.633 Y160.185 E-.05278
G1 X167.622 Y160.146 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.248 J1.191 P1  F60000
G1 X169.353 Y155.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y155.594 I-.349 J.211 E.06384
G1 X169 Y155.589 E.00187
G3 X169.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.41 Y155.983 E-.09969
G1 X169.367 Y160.185 E-.07867
G1 X169.284 Y160.297 E-.05273
G1 X169.169 Y160.374 E-.05277
G1 X169.035 Y160.409 E-.05276
G1 X168.922 Y160.39 E-.04337
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.172 J1.205 P1  F60000
G1 X170.366 Y160.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.939 Y155.594 I-.362 J-.187 E.05105
G1 X170 Y155.589 E.00187
G3 X170.389 Y160.129 I.004 J.408 E.02395
; COOLING_NODE: 6
M204 S250
G1 X170.383 Y160.846 F60000
G1 F12000
M204 S5000
G3 X169.939 Y160.594 I-.379 J.151 E.06178
G1 X170 Y160.589 E.00187
G3 X170.356 Y160.793 I.004 J.408 E.01322
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X170.41 Y160.982 E-.07505
G1 X170.392 Y161.123 E-.05382
G1 X170.284 Y161.297 E-.07767
G1 X170.169 Y161.374 E-.05277
G1 X170.035 Y161.409 E-.05279
G1 X169.859 Y161.379 E-.0679
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.926 J-.79 P1  F60000
G1 X169.353 Y160.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.939 Y160.594 I-.349 J.211 E.06384
G1 X169 Y160.589 E.00187
G3 X169.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X169.41 Y160.983 E-.09969
G1 X169.392 Y161.123 E-.05379
G1 X169.284 Y161.297 E-.07767
G1 X169.169 Y161.374 E-.05277
G1 X169.035 Y161.409 E-.05276
G1 X168.922 Y161.39 E-.04332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.359 J1.163 P1  F60000
G1 X177.351 Y158.784 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.939 Y158.594 I-.348 J.213 E.06392
G1 X177 Y158.589 E.00187
G3 X177.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X177.41 Y158.983 E-.10064
G1 X177.367 Y155.185 E-.07868
G1 X177.284 Y155.297 E-.05273
G1 X177.169 Y155.374 E-.05277
G1 X177.035 Y155.409 E-.05276
G1 X176.925 Y155.39 E-.04243
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.826 J.893 P1  F60000
G1 X177.353 Y155.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.939 Y155.594 I-.349 J.211 E.06384
G1 X177 Y155.589 E.00187
G3 X177.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.41 Y155.982 E-.09966
G1 X177.367 Y160.185 E-.07871
G1 X177.284 Y160.297 E-.05273
G1 X177.169 Y160.374 E-.05277
G1 X177.035 Y160.409 E-.05276
G1 X176.922 Y160.39 E-.04337
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.824 J.895 P1  F60000
G1 X177.353 Y160.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.939 Y160.594 I-.349 J.211 E.06384
G1 X177 Y160.589 E.00187
G3 X177.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.41 Y160.982 E-.09966
G1 X177.392 Y161.123 E-.05382
G1 X177.284 Y161.297 E-.07767
G1 X177.169 Y161.374 E-.05277
G1 X177.035 Y161.409 E-.05276
G1 X176.922 Y161.39 E-.04332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.473 J1.121 P1  F60000
G1 X178.353 Y160.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.939 Y160.594 I-.349 J.211 E.06384
G1 X178 Y160.589 E.00187
G3 X178.318 Y160.737 I.004 J.408 E.01114
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.41 Y160.982 E-.09966
G1 X178.392 Y161.123 E-.05382
G1 X178.284 Y161.297 E-.07767
G1 X178.169 Y161.374 E-.05277
G1 X178.035 Y161.409 E-.05276
G1 X177.922 Y161.39 E-.04332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.425 J1.14 P1  F60000
G1 X179.382 Y160.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.939 Y160.594 I-.379 J.15 E.06169
G1 X179 Y160.589 E.00187
G3 X179.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 26
M204 S250
G1 X179.365 Y160.184 F60000
G1 F12000
M204 S5000
G3 X178.939 Y155.594 I-.361 J-.188 E.05097
G1 X179 Y155.589 E.00187
G3 X179.389 Y160.129 I.004 J.407 E.02392
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.284 Y160.297 E-.07497
G1 X179.169 Y160.374 E-.05277
G1 X179.032 Y160.41 E-.05374
G1 X178.831 Y160.374 E-.07773
G1 X178.716 Y160.297 E-.05277
G1 X178.633 Y160.185 E-.05278
G1 X178.622 Y160.146 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.975 J-.728 P1  F60000
G1 X178.353 Y155.786 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.939 Y155.594 I-.349 J.211 E.06384
G1 X178 Y155.589 E.00187
G3 X178.318 Y155.737 I.004 J.408 E.01114
; COOLING_NODE: 22
M204 S250
G1 X178.351 Y158.784 F60000
G1 F12000
M204 S5000
G3 X177.939 Y158.594 I-.348 J.213 E.06392
G1 X178 Y158.589 E.00187
G3 X178.316 Y158.735 I.004 J.408 E.01106
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.41 Y158.983 E-.10064
G1 X178.367 Y155.185 E-.07868
G1 X178.284 Y155.297 E-.05273
G1 X178.169 Y155.374 E-.05277
G1 X178.035 Y155.409 E-.05276
G1 X177.925 Y155.39 E-.04243
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.173 J1.205 P1  F60000
G1 X179.365 Y155.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.939 Y158.594 I-.361 J-.188 E.05097
G1 X179 Y158.589 E.00187
G3 X179.389 Y155.129 I.004 J.407 E.02392
; COOLING_NODE: 24
M204 S250
G1 X180.366 Y155.184 F60000
G1 F12000
M204 S5000
G3 X179.939 Y158.594 I-.362 J-.187 E.05105
G1 X180 Y158.589 E.00187
G3 X180.389 Y155.129 I.004 J.408 E.02394
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.284 Y155.297 E-.07498
G1 X180.169 Y155.374 E-.05277
G1 X180.035 Y155.409 E-.05276
G1 X179.831 Y155.374 E-.07862
G1 X179.716 Y155.296 E-.05284
G1 X179.633 Y155.185 E-.05274
G1 X179.621 Y155.146 E-.01529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.989 J.709 P1  F60000
G1 X180.366 Y160.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.939 Y155.594 I-.362 J-.187 E.05105
G1 X180 Y155.589 E.00187
G3 X180.389 Y160.129 I.004 J.408 E.02394
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X180.284 Y160.297 E-.07498
G1 X180.169 Y160.374 E-.05277
G1 X180.035 Y160.409 E-.05276
G1 X179.831 Y160.374 E-.07862
G1 X179.716 Y160.296 E-.05284
G1 X179.633 Y160.185 E-.05274
G1 X179.621 Y160.146 E-.01529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.204 J1.2 P1  F60000
G1 X181.382 Y155.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.939 Y155.594 I-.379 J.15 E.06169
G1 X181 Y155.589 E.00187
G3 X181.356 Y155.793 I.004 J.407 E.01321
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X181.41 Y155.983 E-.07507
G1 X181.367 Y160.185 E-.07867
G1 X181.284 Y160.297 E-.05273
G1 X181.169 Y160.374 E-.05277
G1 X181.032 Y160.41 E-.05377
G1 X180.859 Y160.379 E-.06698
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.156 J1.207 P1  F60000
G1 X182.365 Y160.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.939 Y155.594 I-.361 J-.188 E.05097
G1 X182 Y155.589 E.00187
G3 X182.389 Y160.129 I.004 J.407 E.02392
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.284 Y160.297 E-.07497
G1 X182.169 Y160.374 E-.05277
G1 X182.032 Y160.41 E-.05374
G1 X181.831 Y160.374 E-.07773
G1 X181.716 Y160.297 E-.05277
G1 X181.633 Y160.185 E-.05278
G1 X181.622 Y160.146 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.197 J-.22 P1  F60000
G1 X181.382 Y158.846 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.939 Y158.594 I-.379 J.15 E.06169
G1 X181 Y158.589 E.00187
G3 X181.356 Y158.793 I.004 J.407 E.01321
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X181.41 Y158.983 E-.07505
G1 X181.367 Y155.185 E-.07869
G1 X181.284 Y155.297 E-.05273
G1 X181.169 Y155.374 E-.05277
G1 X181.032 Y155.41 E-.05377
G1 X180.859 Y155.379 E-.067
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.156 J1.207 P1  F60000
G1 X182.365 Y155.184 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.939 Y158.594 I-.361 J-.188 E.05097
G1 X182 Y158.589 E.00187
G3 X182.389 Y155.129 I.004 J.407 E.02392
; COOLING_NODE: 41
M204 S250
G1 X183.282 Y155.294 F60000
G1 F12000
M204 S5000
G3 X182.939 Y158.594 I-.278 J-.297 E.04672
G1 X183 Y158.589 E.00187
G3 X183.323 Y155.25 I.004 J.407 E.02817
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.169 Y155.374 E-.0751
G1 X183.032 Y155.41 E-.05374
G1 X182.831 Y155.374 E-.07773
G1 X182.716 Y155.297 E-.05278
G1 X182.633 Y155.185 E-.05271
G1 X182.592 Y155.05 E-.05374
G1 X182.597 Y155.013 E-.0142
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.073 J.574 P1  F60000
G1 X183.282 Y160.294 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.939 Y155.594 I-.278 J-.297 E.04672
G1 X183 Y155.589 E.00187
G3 X183.323 Y160.25 I.004 J.407 E.02817
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X183.169 Y160.374 E-.0751
G1 X183.032 Y160.41 E-.05374
G1 X182.831 Y160.374 E-.07773
G1 X182.716 Y160.297 E-.05278
G1 X182.633 Y160.185 E-.05271
G1 X182.592 Y160.05 E-.05374
G1 X182.597 Y160.013 E-.01421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.122 J.471 P1  F60000
G1 X183.167 Y161.369 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.939 Y160.594 I-.163 J-.373 E.04248
G1 X183 Y160.589 E.00187
G3 X183.22 Y161.341 I.004 J.407 E.03241
; COOLING_NODE: 34
M204 S250
G1 X182.382 Y160.846 F60000
G1 F12000
M204 S5000
G3 X181.939 Y160.594 I-.379 J.15 E.06169
G1 X182 Y160.589 E.00187
G3 X182.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 33
M204 S250
G1 X181.382 Y160.846 F60000
G1 F12000
M204 S5000
G3 X180.939 Y160.594 I-.379 J.15 E.06169
G1 X181 Y160.589 E.00187
G3 X181.356 Y160.793 I.004 J.407 E.01321
; COOLING_NODE: 32
M204 S250
G1 X180.382 Y160.846 F60000
G1 F12000
M204 S5000
G3 X179.939 Y160.594 I-.379 J.151 E.06178
G1 X180 Y160.589 E.00187
G3 X180.356 Y160.793 I.004 J.408 E.01322
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X180.41 Y160.982 E-.07505
G1 X180.392 Y161.123 E-.05382
G1 X180.284 Y161.297 E-.07767
G1 X180.169 Y161.374 E-.05277
G1 X180.035 Y161.409 E-.05276
G1 X179.859 Y161.379 E-.06793
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.138 J1.209 P1  F60000
G1 X184.398 Y161.898 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.047
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.671 J-.497 E.04735
G1 X183.411 Y158.102 E.006
G1 X184.398 Y158.102 E.03275
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 51
M204 S250
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
M204 S10000
G1 X184.02 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.272896
G1 F15000
M204 S8000
G2 X184.097 Y161.133 I-6.088 J-1.125 E.01063
; LINE_WIDTH: 0.237921
G2 X184.088 Y160.756 I-3.127 J-.109 E.00599
; LINE_WIDTH: 0.279281
G1 X184.065 Y160.602 E.00301
; LINE_WIDTH: 0.305939
G1 X183.987 Y160.188 E.00901
M204 S10000
G1 X183.876 Y160.503 F60000
; LINE_WIDTH: 0.251874
G1 F15000
M204 S8000
G1 X183.951 Y160.504 E.00127
; LINE_WIDTH: 0.291593
M73 P86 R2
G1 X184.025 Y160.504 E.00151
; LINE_WIDTH: 0.328975
G1 X184.043 Y160.504 E.00043
G1 X184.059 Y160.422 E.00194
; LINE_WIDTH: 0.297488
G1 X184.075 Y160.34 E.00173
; LINE_WIDTH: 0.278664
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.243863
G2 X184.088 Y155.756 I-2.458 J-.324 E.00925
; LINE_WIDTH: 0.279281
G1 X184.065 Y155.602 E.00301
; LINE_WIDTH: 0.305939
G1 X183.987 Y155.188 E.00901
M204 S10000
G1 X183.876 Y155.503 F60000
; LINE_WIDTH: 0.251879
G1 F15000
M204 S8000
G1 X183.951 Y155.504 E.00127
; LINE_WIDTH: 0.291607
G1 X184.025 Y155.504 E.00151
; LINE_WIDTH: 0.328981
G1 X184.043 Y155.504 E.00043
G1 X184.059 Y155.422 E.00194
; LINE_WIDTH: 0.297503
G1 X184.075 Y155.34 E.00173
; LINE_WIDTH: 0.278702
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243534
G2 X184.09 Y158.774 I-2.422 J-.325 E.00895
; LINE_WIDTH: 0.276701
G2 X184.065 Y158.602 I-2.059 J.211 E.00331
; LINE_WIDTH: 0.305845
G1 X184.009 Y158.306 E.00646
M204 S10000
G1 X184.194 Y160.805 F60000
; LINE_WIDTH: 0.356653
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.01912
G1 X183.769 Y161.694 E.00793
M204 S10000
G1 X183.141 Y161.643 F60000
; LINE_WIDTH: 0.609618
G1 F13234.58
M204 S8000
G1 X182.343 Y161.816 E.03772
; LINE_WIDTH: 0.574624
G1 F14105.613
G3 X182.196 Y161.839 I-.348 J-1.719 E.00644
; LINE_WIDTH: 0.540554
G1 F15000
G3 X181.76 Y161.833 I-.193 J-1.922 E.01771
; LINE_WIDTH: 0.581541
G1 F13924.446
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609619
G1 F13234.548
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.609618
G1 F13234.58
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.574624
G1 F14105.613
G3 X168.196 Y161.839 I-.348 J-1.719 E.00644
; LINE_WIDTH: 0.540554
G1 F15000
G3 X167.76 Y161.833 I-.193 J-1.922 E.01771
; LINE_WIDTH: 0.581541
G1 F13924.446
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609619
G1 F13234.548
G1 X166.859 Y161.644 E.03772
M204 S10000
G1 X166.251 Y161.694 F60000
; LINE_WIDTH: 0.353358
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00829
G1 X165.941 Y161.425 E.00286
; LINE_WIDTH: 0.298137
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.248215
G3 X165.912 Y160.756 I2.42 J-.345 E.00978
G1 X165.925 Y160.671 E.00144
; LINE_WIDTH: 0.29442
G1 X165.938 Y160.586 E.00177
; LINE_WIDTH: 0.311599
G1 X166.014 Y160.193 E.00875
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.252011
G1 F15000
M204 S8000
G1 X166.05 Y160.504 E.00127
; LINE_WIDTH: 0.290095
G1 X165.976 Y160.503 E.0015
; LINE_WIDTH: 0.328486
G1 X165.956 Y160.503 E.00045
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297351
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.248216
G3 X165.912 Y155.756 I2.422 J-.345 E.00978
G1 X165.925 Y155.671 E.00144
; LINE_WIDTH: 0.29442
G1 X165.938 Y155.586 E.00177
; LINE_WIDTH: 0.311599
G1 X166.014 Y155.193 E.00875
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.252011
G1 F15000
M204 S8000
G1 X166.05 Y155.504 E.00127
; LINE_WIDTH: 0.290095
G1 X165.976 Y155.503 E.0015
; LINE_WIDTH: 0.328486
G1 X165.956 Y155.503 E.00045
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297351
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.248216
G3 X165.912 Y158.756 I2.422 J-.345 E.00978
G1 X165.925 Y158.671 E.00144
; LINE_WIDTH: 0.29442
G1 X165.938 Y158.586 E.00177
; LINE_WIDTH: 0.311603
G1 X165.992 Y158.306 E.00625
; WIPE_START
M204 S8000
G1 X165.938 Y158.586 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z3.8 I-1.217 J.017 P1  F60000
G1 X167.463 Y268.881 Z3.8
G1 Z3.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y269.881  
M204 S8000
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #17
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z3.8 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z3.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E4

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z6.4 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y264.706 F60000
G1 Z3.4
G17
G3 Z3.8 I1.217 J0 P1
G1 X190.897 Y247.542 Z3.8
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z3.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
M73 P87 R2
G1  Y255.381 
G1  X170.463 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y266.131  E0.0285
G1  X167.463  E0.7031
G1  Y266.881  E0.0285
G1  X185.963  E0.7031
G1  Y267.631  E0.0285
G1  X167.463  E0.7031
G1  Y268.381  E0.0285
G1  X185.963  E0.7031
G1  Y269.131  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X168.463 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z3.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2118
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 17 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z3.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z3.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer17 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 18/25
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z3.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1960
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 18 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer18 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #18
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z3.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S162 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E3

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P88 R2
G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z6.6 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y269.131 F60000
G1 Z3.6

; filament start gcode
G17
G3 Z4 I0 J-1.217 P1
G1 X185.963 Y269.131 Z4
G1 Z3.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y269.631 
G1  X185.463 
G1  Y268.631 
G1  X186.963 
G1  Y270.131 
G1  X184.963 
G1  Y268.131 
G1  X182.963 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y260.131  E0.0285
M73 P89 R2
G1  X167.463  E0.7031
G1  Y259.381  E0.0285
G1  X185.963  E0.7031
G1  Y258.631  E0.0285
G1  X167.463  E0.7031
G1  Y257.881  E0.0285
G1  X185.963  E0.7031
G1  Y257.131  E0.0285
G1  X167.463  E0.7031
G1  Y256.381  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y270.055  
M204 S8000
G3  X183.574 Y272.013   I-3.488 J-1.982 E0.1317
G3  X181.239 Y270.654   I1.125 J-4.619 E0.1041
G2  X178.521 Y269.881   I-2.725 J4.418 E0.1088
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X188.077 Y268.1 E-.05173
G1 X188.156 Y267.99 E-.05173
G1 X188.226 Y267.873 E-.05174
G1 X188.287 Y267.751 E-.05173
G1 X188.338 Y267.625 E-.05173
G1 X188.379 Y267.495 E-.05174
G1 X188.41 Y267.363 E-.05173
G1 X188.417 Y267.316 E-.01787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.379 Y155.848
G1 Z3.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.931 Y155.595 I-.379 J.149 E.06161
G1 X175 Y155.589 E.00214
G3 X175.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 15
M204 S250
G1 X174.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y155.595 I-.379 J.149 E.06161
G1 X174 Y155.589 E.00214
G3 X174.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.41 Y155.983 E-.07512
G1 X174.393 Y160.12 E-.05277
G1 X174.33 Y160.244 E-.05271
G1 X174.23 Y160.34 E-.05274
G1 X174.035 Y160.409 E-.07863
G1 X173.896 Y160.397 E-.05279
G1 X173.86 Y160.381 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.308 J-1.177 P1  F60000
G1 X173.326 Y160.241 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y155.595 I-.326 J-.244 E.04886
G1 X173 Y155.589 E.00214
G3 X173.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 11
M204 S250
G1 X172.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X171.931 Y155.595 I-.389 J-.122 E.0531
G1 X172 Y155.589 E.00214
G3 X172.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 4
M204 S250
G1 X172.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X171.931 Y158.595 I-.389 J-.122 E.0531
G1 X172 Y158.589 E.00214
G3 X172.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.33 Y155.244 E-.07501
G1 X172.23 Y155.34 E-.05274
G1 X172.035 Y155.409 E-.07863
G1 X171.896 Y155.397 E-.0528
G1 X171.77 Y155.34 E-.05279
G1 X171.67 Y155.244 E-.05276
G1 X171.655 Y155.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.984 J-.716 P1  F60000
G1 X171.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y158.595 I-.308 J.268 E.06588
G1 X171 Y158.589 E.00214
G3 X171.265 Y158.687 I0 J.408 E.00886
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.381 Y158.847 E-.07509
G1 X171.41 Y158.983 E-.05279
G1 X171.393 Y155.12 E-.05277
G1 X171.33 Y155.244 E-.05271
G1 X171.23 Y155.34 E-.05274
G1 X171.035 Y155.409 E-.07863
G1 X170.995 Y155.406 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.918 J.799 P1  F60000
G1 X171.379 Y155.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y155.595 I-.379 J.149 E.06161
G1 X171 Y155.589 E.00214
G3 X171.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X171.41 Y155.983 E-.07512
G1 X171.393 Y160.12 E-.05277
G1 X171.33 Y160.244 E-.05271
G1 X171.23 Y160.34 E-.05274
G1 X171.035 Y160.409 E-.07863
G1 X170.896 Y160.397 E-.0528
G1 X170.86 Y160.381 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.51 J1.105 P1  F60000
G1 X173.326 Y155.241 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y158.595 I-.326 J-.244 E.04886
G1 X173 Y158.589 E.00214
G3 X173.359 Y155.191 I0 J.408 E.02587
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.23 Y155.34 E-.07501
G1 X173.035 Y155.409 E-.07863
G1 X172.896 Y155.397 E-.0528
G1 X172.77 Y155.34 E-.05279
G1 X172.67 Y155.244 E-.05276
G1 X172.603 Y155.078 E-.06801
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.244 J1.192 P1  F60000
G1 X174.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y158.595 I-.308 J.268 E.06588
G1 X174 Y158.589 E.00214
G3 X174.265 Y158.687 I0 J.408 E.00886
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.381 Y158.847 E-.07509
G1 X174.41 Y158.983 E-.05279
G1 X174.393 Y155.12 E-.05277
G1 X174.33 Y155.244 E-.05271
G1 X174.23 Y155.34 E-.05274
G1 X174.035 Y155.409 E-.07863
G1 X173.995 Y155.406 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.557 J1.082 P1  F60000
G1 X175.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.931 Y158.595 I-.308 J.268 E.06588
G1 X175 Y158.589 E.00214
G3 X175.265 Y158.687 I0 J.408 E.00885
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.381 Y158.847 E-.07509
G1 X175.41 Y158.983 E-.05279
G1 X175.393 Y155.12 E-.05277
G1 X175.33 Y155.244 E-.05271
G1 X175.23 Y155.34 E-.05274
G1 X175.035 Y155.409 E-.07863
G1 X174.995 Y155.406 E-.01526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.557 J1.082 P1  F60000
G1 X176.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y158.595 I-.308 J.268 E.06588
G1 X176 Y158.589 E.00214
G3 X176.265 Y158.687 I0 J.408 E.00885
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.381 Y158.847 E-.07509
G1 X176.41 Y158.983 E-.05279
G1 X176.393 Y155.12 E-.05277
G1 X176.33 Y155.244 E-.05271
G1 X176.23 Y155.34 E-.05274
G1 X176.035 Y155.409 E-.07863
G1 X175.995 Y155.406 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.918 J.799 P1  F60000
G1 X176.379 Y155.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y155.595 I-.379 J.149 E.06161
G1 X176 Y155.589 E.00214
G3 X176.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X176.41 Y155.983 E-.07512
G1 X176.393 Y160.12 E-.05277
G1 X176.33 Y160.244 E-.05271
G1 X176.23 Y160.34 E-.05274
G1 X176.035 Y160.409 E-.07863
G1 X175.896 Y160.397 E-.05279
G1 X175.86 Y160.381 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.07 J1.215 P1  F60000
G1 X180.389 Y160.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y155.595 I-.389 J-.122 E.0531
G1 X180 Y155.589 E.00214
G3 X180.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.33 Y160.244 E-.07501
G1 X180.23 Y160.34 E-.05274
G1 X180.035 Y160.409 E-.07863
G1 X179.896 Y160.397 E-.05278
G1 X179.77 Y160.34 E-.05281
G1 X179.67 Y160.244 E-.05277
G1 X179.655 Y160.207 E-.01526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.381 J-1.156 P1  F60000
G1 X179.389 Y160.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y155.595 I-.389 J-.122 E.0531
G1 X179 Y155.589 E.00214
G3 X179.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.33 Y160.244 E-.07501
G1 X179.23 Y160.34 E-.05274
G1 X179.035 Y160.409 E-.07863
G1 X178.896 Y160.397 E-.0528
G1 X178.77 Y160.34 E-.05279
G1 X178.67 Y160.244 E-.05276
G1 X178.655 Y160.207 E-.01526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.966 J-.74 P1  F60000
G1 X178.379 Y155.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y155.595 I-.379 J.149 E.06161
G1 X178 Y155.589 E.00214
G3 X178.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 28
M204 S250
G1 X177.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y155.595 I-.379 J.149 E.06161
G1 X177 Y155.589 E.00214
G3 X177.353 Y155.794 I0 J.408 E.01312
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X177.41 Y155.983 E-.07512
G1 X177.393 Y160.12 E-.05277
G1 X177.33 Y160.244 E-.05271
G1 X177.23 Y160.34 E-.05274
G1 X177.035 Y160.409 E-.07863
G1 X176.896 Y160.397 E-.05279
G1 X176.86 Y160.381 E-.01524
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.175 J.318 P1  F60000
G1 X177.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y158.595 I-.308 J.268 E.06588
G1 X177 Y158.589 E.00214
G3 X177.265 Y158.687 I0 J.408 E.00886
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.381 Y158.847 E-.07509
G1 X177.41 Y158.983 E-.05279
G1 X177.393 Y155.12 E-.05277
G1 X177.33 Y155.244 E-.05271
G1 X177.23 Y155.34 E-.05274
G1 X177.035 Y155.409 E-.07863
G1 X176.995 Y155.406 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.557 J1.082 P1  F60000
G1 X178.308 Y158.73 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y158.595 I-.308 J.268 E.06588
G1 X178 Y158.589 E.00214
G3 X178.265 Y158.687 I0 J.408 E.00886
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.381 Y158.847 E-.07509
G1 X178.41 Y158.983 E-.05279
G1 X178.393 Y155.12 E-.05277
G1 X178.33 Y155.244 E-.05271
G1 X178.23 Y155.34 E-.05274
G1 X178.035 Y155.409 E-.07863
G1 X177.995 Y155.406 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.245 J1.192 P1  F60000
G1 X179.389 Y155.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y158.595 I-.389 J-.122 E.0531
G1 X179 Y158.589 E.00214
G3 X179.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 24
M204 S250
G1 X180.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X179.931 Y158.595 I-.389 J-.122 E.0531
G1 X180 Y158.589 E.00214
G3 X180.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 39
M204 S250
G1 X181.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X180.931 Y158.595 I-.379 J.149 E.06161
G1 X181 Y158.589 E.00214
G3 X181.353 Y158.794 I0 J.408 E.01314
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.41 Y158.983 E-.07498
G1 X181.393 Y155.12 E-.05277
G1 X181.33 Y155.244 E-.05271
G1 X181.23 Y155.34 E-.05274
G1 X181.035 Y155.409 E-.07863
G1 X180.896 Y155.397 E-.0528
G1 X180.86 Y155.381 E-.01536
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.813 J.905 P1  F60000
G1 X181.379 Y155.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y155.595 I-.379 J.149 E.06161
G1 X181 Y155.589 E.00214
G3 X181.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X181.41 Y155.983 E-.07509
G1 X181.393 Y160.12 E-.05277
G1 X181.33 Y160.244 E-.05271
G1 X181.23 Y160.34 E-.05274
G1 X181.035 Y160.409 E-.07863
G1 X180.896 Y160.397 E-.0528
G1 X180.86 Y160.381 E-.01525
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.205 J1.2 P1  F60000
G1 X182.389 Y160.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y155.595 I-.389 J-.122 E.0531
G1 X182 Y155.589 E.00214
G3 X182.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 36
M204 S250
G1 X183.326 Y160.241 F60000
G1 F12000
M204 S5000
G3 X182.931 Y155.595 I-.326 J-.244 E.04886
G1 X183 Y155.589 E.00214
G3 X183.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 41
M204 S250
G1 X183.326 Y155.241 F60000
G1 F12000
M204 S5000
G3 X182.931 Y158.595 I-.326 J-.244 E.04886
G1 X183 Y158.589 E.00214
G3 X183.359 Y155.191 I0 J.408 E.02587
; COOLING_NODE: 38
M204 S250
G1 X182.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X181.931 Y158.595 I-.389 J-.122 E.0531
G1 X182 Y158.589 E.00214
G3 X182.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X182.33 Y155.244 E-.07501
G1 X182.23 Y155.34 E-.05274
G1 X182.035 Y155.409 E-.07863
G1 X181.896 Y155.397 E-.0528
G1 X181.77 Y155.34 E-.05279
G1 X181.67 Y155.244 E-.05276
G1 X181.655 Y155.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.852 J.869 P1  F60000
G1 X184.398 Y161.898 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.04699
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.673 J-.496 E.04732
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 35
; WIPE_START
G1 X183.41 Y161.898 E-.37597
G1 X183.408 Y161.888 E-.00403
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.156 J-.379 P1  F60000
G1 X183.227 Y161.336 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X182.931 Y160.595 I-.227 J-.339 E.04462
G1 X183 Y160.589 E.00214
G3 X183.274 Y161.299 I0 J.408 E.03012
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X183.035 Y161.409 E-.10018
G1 X182.896 Y161.397 E-.0528
G1 X182.77 Y161.34 E-.05279
G1 X182.633 Y161.185 E-.07869
G1 X182.593 Y161.052 E-.05271
G1 X182.597 Y160.939 E-.04283
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.472 J-1.122 P1  F60000
G1 X182.379 Y160.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y160.595 I-.379 J.149 E.06161
G1 X182 Y160.589 E.00214
G3 X182.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 33
M204 S250
G1 X181.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X180.931 Y160.595 I-.379 J.149 E.06161
G1 X181 Y160.589 E.00214
G3 X181.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 32
M204 S250
G1 X180.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X179.931 Y160.595 I-.379 J.149 E.06161
G1 X180 Y160.589 E.00214
G3 X180.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 31
M204 S250
G1 X179.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X178.931 Y160.595 I-.379 J.149 E.06161
G1 X179 Y160.589 E.00214
G3 X179.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 30
M204 S250
G1 X178.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X177.931 Y160.595 I-.379 J.149 E.06161
G1 X178 Y160.589 E.00214
G3 X178.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 29
M204 S250
G1 X177.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y160.595 I-.379 J.149 E.06161
G1 X177 Y160.589 E.00214
G3 X177.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 2
M204 S250
G1 X176.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X175.931 Y160.595 I-.379 J.149 E.06161
G1 X176 Y160.589 E.00214
G3 X176.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 3
M204 S250
G1 X175.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X174.931 Y160.595 I-.379 J.149 E.06161
G1 X175 Y160.589 E.00214
G3 X175.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 14
M204 S250
G1 X174.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y160.595 I-.379 J.149 E.06161
G1 X174 Y160.589 E.00214
G3 X174.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X174.41 Y160.983 E-.07512
G1 X174.393 Y161.12 E-.05276
G1 X174.33 Y161.244 E-.05274
G1 X174.23 Y161.34 E-.05277
G1 X174.035 Y161.409 E-.07859
G1 X173.896 Y161.397 E-.05279
G1 X173.86 Y161.381 E-.01523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.308 J-1.177 P1  F60000
G1 X173.326 Y161.241 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y160.595 I-.326 J-.244 E.04885
G1 X173 Y160.589 E.00214
G3 X173.359 Y161.191 I0 J.408 E.02588
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X173.23 Y161.34 E-.07504
G1 X173.035 Y161.409 E-.07859
G1 X172.896 Y161.397 E-.0528
G1 X172.77 Y161.34 E-.05279
G1 X172.67 Y161.244 E-.05276
G1 X172.603 Y161.078 E-.06802
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.873 J-.848 P1  F60000
G1 X172.379 Y160.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y160.595 I-.379 J.149 E.06161
G1 X172 Y160.589 E.00214
G3 X172.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 5
M204 S250
G1 X171.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X170.931 Y160.595 I-.379 J.149 E.06161
G1 X171 Y160.589 E.00214
G3 X171.353 Y160.793 I0 J.408 E.01313
; COOLING_NODE: 6
M204 S250
G1 X170.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X169.931 Y160.595 I-.379 J.149 E.06161
G1 X170 Y160.589 E.00214
G3 X170.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 46
M204 S250
G1 X169.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X168.931 Y160.595 I-.379 J.149 E.06161
G1 X169 Y160.589 E.00214
G3 X169.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 47
M204 S250
G1 X168.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X167.931 Y160.595 I-.379 J.149 E.06161
G1 X168 Y160.589 E.00214
G3 X168.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 48
M204 S250
G1 X167.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y160.595 I-.379 J.149 E.06161
G1 X167 Y160.589 E.00214
G3 X167.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 49
M204 S250
G1 X167.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y155.595 I-.379 J.149 E.06161
G1 X167 Y155.589 E.00214
G3 X167.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 50
M204 S250
G1 X167.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y158.595 I-.379 J.149 E.06161
G1 X167 Y158.589 E.00214
G3 X167.353 Y158.794 I0 J.408 E.01314
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04732
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 43
; WIPE_START
G1 X166.495 Y158.374 E-.07722
G1 X166.397 Y158.468 E-.0518
G1 X166.315 Y158.578 E-.0518
G1 X166.214 Y158.83 E-.10334
G1 X166.197 Y158.966 E-.05189
G1 X166.211 Y155.08 E-.04395
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.022 J1.217 P1  F60000
G1 X168.389 Y155.119 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.931 Y158.595 I-.389 J-.122 E.0531
G1 X168 Y158.589 E.00214
G3 X168.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.33 Y155.244 E-.07501
M73 P90 R2
G1 X168.23 Y155.34 E-.05274
G1 X168.035 Y155.409 E-.07863
G1 X167.896 Y155.397 E-.0528
G1 X167.77 Y155.34 E-.05279
G1 X167.67 Y155.244 E-.05276
G1 X167.655 Y155.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.948 J.763 P1  F60000
G1 X168.389 Y160.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.931 Y155.595 I-.389 J-.122 E.0531
G1 X168 Y155.589 E.00214
G3 X168.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 45
M204 S250
G1 X169.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X168.931 Y155.595 I-.379 J.149 E.06161
G1 X169 Y155.589 E.00214
G3 X169.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X169.41 Y155.983 E-.07509
G1 X169.393 Y160.12 E-.05277
G1 X169.33 Y160.244 E-.05271
G1 X169.23 Y160.34 E-.05274
G1 X169.035 Y160.409 E-.07863
G1 X168.896 Y160.397 E-.05279
G1 X168.86 Y160.381 E-.01526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.205 J1.2 P1  F60000
G1 X170.389 Y160.119 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.931 Y155.595 I-.389 J-.122 E.0531
G1 X170 Y155.589 E.00214
G3 X170.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 8
M204 S250
G1 X170.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X169.931 Y158.595 I-.389 J-.122 E.0531
G1 X170 Y158.589 E.00214
G3 X170.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.33 Y155.244 E-.07501
G1 X170.23 Y155.34 E-.05274
G1 X170.035 Y155.409 E-.07863
G1 X169.896 Y155.397 E-.0528
G1 X169.77 Y155.34 E-.05278
G1 X169.67 Y155.244 E-.05277
G1 X169.655 Y155.207 E-.01526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I.966 J-.74 P1  F60000
G1 X169.379 Y158.848 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y158.595 I-.379 J.149 E.06161
G1 X169 Y158.589 E.00214
G3 X169.353 Y158.794 I0 J.408 E.01312
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X169.41 Y158.983 E-.07511
G1 X169.393 Y155.12 E-.05277
G1 X169.33 Y155.244 E-.05271
G1 X169.23 Y155.34 E-.05274
G1 X169.035 Y155.409 E-.07863
G1 X168.896 Y155.397 E-.05279
G1 X168.86 Y155.381 E-.01525
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-.219 J1.197 P1  F60000
G1 X184.79 Y162.29 Z4
G1 Z3.6
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.155 J.384 P1  F60000
G1 X184.058 Y161.426 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.353055
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00285
G1 X183.753 Y161.694 E.00819
M204 S10000
M73 P90 R1
G1 X184.058 Y161.426 F60000
; LINE_WIDTH: 0.298352
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278854
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243556
G2 X184.09 Y160.775 I-2.427 J-.326 E.00894
; LINE_WIDTH: 0.266213
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294345
G1 X184.062 Y160.586 E.00177
; LINE_WIDTH: 0.31155
G1 X183.986 Y160.193 E.00875
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.249818
G1 F15000
M204 S8000
G1 X183.949 Y160.504 E.00124
; LINE_WIDTH: 0.287525
G1 X184.023 Y160.503 E.00147
; LINE_WIDTH: 0.328258
G1 X184.044 Y160.503 E.00049
G1 X184.059 Y160.422 E.00192
; LINE_WIDTH: 0.297558
G1 X184.075 Y160.34 E.00171
; LINE_WIDTH: 0.278863
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.24356
G2 X184.09 Y155.775 I-2.428 J-.326 E.00894
; LINE_WIDTH: 0.266213
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294345
G1 X184.062 Y155.586 E.00177
; LINE_WIDTH: 0.31155
G1 X183.986 Y155.193 E.00875
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.249818
G1 F15000
M204 S8000
G1 X183.949 Y155.504 E.00124
; LINE_WIDTH: 0.287525
G1 X184.023 Y155.503 E.00147
; LINE_WIDTH: 0.328257
G1 X184.044 Y155.503 E.00049
G1 X184.059 Y155.422 E.00192
; LINE_WIDTH: 0.297558
G1 X184.075 Y155.34 E.00171
; LINE_WIDTH: 0.278863
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.243563
G2 X184.09 Y158.775 I-2.427 J-.326 E.00894
; LINE_WIDTH: 0.26621
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294342
G1 X184.062 Y158.586 E.00177
; LINE_WIDTH: 0.311561
G1 X184.008 Y158.306 E.00625
; WIPE_START
G1 X184.062 Y158.586 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I-1.165 J-.351 P1  F60000
G1 X183.142 Y161.644 Z4
G1 Z3.6
G1 E.4 F1800
; LINE_WIDTH: 0.609437
G1 F13238.811
M204 S8000
G1 X182.343 Y161.816 E.03773
; LINE_WIDTH: 0.574599
G1 F14106.266
G3 X182.196 Y161.839 I-.349 J-1.728 E.00642
; LINE_WIDTH: 0.540458
G1 F15000
G3 X181.76 Y161.833 I-.194 J-1.907 E.01773
; LINE_WIDTH: 0.581659
G1 F13921.404
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.609755
G1 F13231.371
G1 X181.609 Y161.805 E.00228
M204 S10000
G1 X168.391 Y161.806 F60000
; LINE_WIDTH: 0.609437
G1 F13238.811
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574599
G1 F14106.266
G3 X168.196 Y161.839 I-.349 J-1.728 E.00642
; LINE_WIDTH: 0.540458
G1 F15000
G3 X167.76 Y161.833 I-.194 J-1.907 E.01773
; LINE_WIDTH: 0.581659
G1 F13921.404
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609755
G1 F13231.371
G1 X166.859 Y161.643 E.03771
M204 S10000
G1 X166.004 Y161.694 F60000
; LINE_WIDTH: 0.350013
G1 F15000
M204 S8000
G3 X165.941 Y161.424 I2.785 J-.785 E.00694
; LINE_WIDTH: 0.297791
G1 X165.925 Y161.339 E.00181
; LINE_WIDTH: 0.278369
G1 X165.922 Y161.319 E.00039
; LINE_WIDTH: 0.243476
G3 X165.91 Y160.774 I2.427 J-.324 E.00893
; LINE_WIDTH: 0.266507
G1 X165.925 Y160.67 E.00191
; LINE_WIDTH: 0.294725
G1 X165.938 Y160.585 E.00178
; LINE_WIDTH: 0.311976
G1 X166.014 Y160.194 E.00873
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.256213
G1 F15000
M204 S8000
G1 X166.049 Y160.504 E.00132
; LINE_WIDTH: 0.295366
G1 X165.973 Y160.503 E.00156
; LINE_WIDTH: 0.328894
G1 X165.956 Y160.503 E.00038
G1 X165.941 Y160.421 E.00195
; LINE_WIDTH: 0.297105
G1 X165.925 Y160.339 E.00173
; LINE_WIDTH: 0.278317
G1 X165.922 Y160.319 E.00038
; LINE_WIDTH: 0.243467
G3 X165.91 Y155.774 I2.426 J-.324 E.00893
; LINE_WIDTH: 0.266521
G1 X165.925 Y155.67 E.00191
; LINE_WIDTH: 0.29473
G1 X165.938 Y155.585 E.00178
; LINE_WIDTH: 0.311986
G1 X166.014 Y155.193 E.00874
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.256209
G1 F15000
M204 S8000
G1 X166.049 Y155.504 E.00132
; LINE_WIDTH: 0.295372
G1 X165.973 Y155.503 E.00156
; LINE_WIDTH: 0.328894
G1 X165.956 Y155.503 E.00038
G1 X165.941 Y155.421 E.00195
; LINE_WIDTH: 0.2971
G1 X165.925 Y155.339 E.00173
; LINE_WIDTH: 0.278317
G1 X165.922 Y155.319 E.00038
; LINE_WIDTH: 0.243467
G3 X165.91 Y158.774 I2.426 J-.324 E.00893
; LINE_WIDTH: 0.266522
G1 X165.925 Y158.67 E.00191
; LINE_WIDTH: 0.29473
G1 X165.938 Y158.585 E.00178
; LINE_WIDTH: 0.311981
G1 X165.992 Y158.306 E.00623
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z3.6
Z3.36
G1 E0.40 F150
G4 P400
G0 Z3.6 F300
G1 E-0.08 F800
G0 X145 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X150 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X155 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X160 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X165 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X170 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X175 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X180 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X185 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X190 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X195 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X200 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X205 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X210 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X215 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X220 Y155 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z3.6
Z3.36
G1 E0.40 F150
G4 P400
G0 Z3.6 
G1 E-0.08 F800
G0 X145 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X150 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X155 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X160 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X165 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X170 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X175 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X180 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X185 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X190 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X195 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X200 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X205 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X210 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X215 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X220 Y160 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z3.6
Z3.36
G1 E0.40 F150
G4 P400
G0 Z3.6 F300
G1 E-0.08 F800
G0 X145 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X150 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X155 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X160 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X165 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X170 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X175 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X180 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X185 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X190 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X195 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X200 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X205 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X210 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X215 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
G0 X220 Y165 Z3.6
Z3.36
G1 E0.40
G4 P400
G0 Z3.6
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 19/25
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I-.161 J1.206 P1  F60000
G1 X175.379 Y155.848 Z4
G1 Z3.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.931 Y155.595 I-.379 J.149 E.06162
G1 X175 Y155.589 E.00214
G3 X175.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X175.41 Y155.982 E-.07497
G1 X175.393 Y160.12 E-.0528
G1 X175.33 Y160.244 E-.05276
G1 X175.169 Y160.374 E-.07862
G1 X175.035 Y160.409 E-.0528
G1 X174.897 Y160.398 E-.05271
G1 X174.86 Y160.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.403 J1.148 P1  F60000
G1 X176.379 Y155.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y155.595 I-.379 J.149 E.06162
G1 X176 Y155.589 E.00214
G3 X176.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X176.41 Y155.982 E-.07497
G1 X176.393 Y160.12 E-.0528
G1 X176.33 Y160.244 E-.05276
G1 X176.169 Y160.374 E-.07862
G1 X176.035 Y160.409 E-.0528
G1 X175.897 Y160.398 E-.05271
G1 X175.86 Y160.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.813 J.905 P1  F60000
G1 X176.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y160.595 I-.379 J.149 E.06162
G1 X176 Y160.589 E.00214
G3 X176.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 3
M204 S250
G1 X175.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X174.931 Y160.595 I-.379 J.149 E.06162
G1 X175 Y160.589 E.00214
G3 X175.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X175.41 Y160.982 E-.07497
G1 X175.393 Y161.12 E-.05281
G1 X175.33 Y161.244 E-.05276
G1 X175.169 Y161.374 E-.07862
G1 X175.035 Y161.409 E-.0528
G1 X174.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.822 J-.898 P1  F60000
G1 X172.389 Y155.119 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y158.595 I-.389 J-.122 E.05311
G1 X172 Y158.589 E.00214
G3 X172.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X172.33 Y155.244 E-.07505
M104 T0 S210 N0 ;Multi extruder pre heating
G1 X172.169 Y155.374 E-.07862
G1 X172.035 Y155.409 E-.0528
G1 X171.897 Y155.398 E-.05272
G1 X171.77 Y155.34 E-.0528
G1 X171.67 Y155.244 E-.05274
G1 X171.655 Y155.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-1.2 J-.202 P1  F60000
G1 X171.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y160.595 I-.379 J.149 E.06162
G1 X171 Y160.589 E.00214
G3 X171.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 6
M204 S250
G1 X170.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X169.931 Y160.595 I-.379 J.149 E.06162
G1 X170 Y160.589 E.00214
G3 X170.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 7
M204 S250
G1 X170.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X169.931 Y155.595 I-.389 J-.122 E.05311
G1 X170 Y155.589 E.00214
G3 X170.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 8
M204 S250
G1 X170.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X169.931 Y158.595 I-.389 J-.122 E.05311
G1 X170 Y158.589 E.00214
G3 X170.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 9
M204 S250
G1 X171.258 Y158.681 F60000
G1 F12000
M204 S5000
G3 X170.931 Y158.595 I-.258 J.316 E.06802
G1 X171 Y158.589 E.00214
G3 X171.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.381 Y158.847 E-.10048
G1 X171.41 Y158.982 E-.05275
G1 X171.393 Y155.12 E-.0528
G1 X171.33 Y155.244 E-.05276
G1 X171.169 Y155.374 E-.07862
G1 X171.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.99 J.708 P1  F60000
G1 X171.379 Y155.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y155.595 I-.379 J.149 E.06162
G1 X171 Y155.589 E.00214
G3 X171.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X171.41 Y155.982 E-.07497
G1 X171.393 Y160.12 E-.0528
G1 X171.33 Y160.244 E-.05276
G1 X171.169 Y160.374 E-.07862
G1 X171.035 Y160.409 E-.0528
G1 X170.897 Y160.398 E-.05272
G1 X170.86 Y160.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.205 J1.2 P1  F60000
G1 X172.389 Y160.119 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y155.595 I-.389 J-.122 E.05311
G1 X172 Y155.589 E.00214
G3 X172.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 12
M204 S250
G1 X172.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X171.931 Y160.595 I-.379 J.149 E.06162
G1 X172 Y160.589 E.00214
G3 X172.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X172.41 Y160.982 E-.07497
G1 X172.393 Y161.12 E-.05281
G1 X172.33 Y161.244 E-.05276
G1 X172.169 Y161.374 E-.07862
G1 X172.035 Y161.409 E-.0528
G1 X171.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.114 J1.212 P1  F60000
G1 X173.326 Y161.241 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y160.595 I-.327 J-.244 E.04887
G1 X173 Y160.589 E.00214
G3 X173.359 Y161.191 I0 J.408 E.02587
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X173.169 Y161.374 E-.10025
G1 X173.035 Y161.409 E-.0528
G1 X172.831 Y161.374 E-.07864
G1 X172.716 Y161.297 E-.05275
G1 X172.633 Y161.185 E-.05279
G1 X172.6 Y161.077 E-.04277
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.156 J1.207 P1  F60000
G1 X174.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y160.595 I-.379 J.149 E.06162
G1 X174 Y160.589 E.00214
G3 X174.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 15
M204 S250
G1 X174.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y155.595 I-.379 J.149 E.06162
G1 X174 Y155.589 E.00214
G3 X174.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X174.41 Y155.982 E-.07497
G1 X174.393 Y160.12 E-.0528
G1 X174.33 Y160.244 E-.05276
G1 X174.169 Y160.374 E-.07862
G1 X174.035 Y160.409 E-.0528
G1 X173.897 Y160.398 E-.05271
G1 X173.86 Y160.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.308 J-1.177 P1  F60000
G1 X173.326 Y160.241 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y155.595 I-.327 J-.244 E.04887
G1 X173 Y155.589 E.00214
G3 X173.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 17
M204 S250
G1 X173.326 Y155.241 F60000
G1 F12000
M204 S5000
G3 X172.931 Y158.595 I-.327 J-.244 E.04887
G1 X173 Y158.589 E.00214
G3 X173.359 Y155.191 I0 J.408 E.02587
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X173.169 Y155.374 E-.10025
G1 X173.035 Y155.409 E-.0528
G1 X172.897 Y155.398 E-.05272
G1 X172.77 Y155.34 E-.0528
G1 X172.67 Y155.244 E-.05274
G1 X172.602 Y155.077 E-.06869
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.283 J1.184 P1  F60000
G1 X174.258 Y158.681 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y158.595 I-.258 J.316 E.06802
G1 X174 Y158.589 E.00214
G3 X174.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X174.381 Y158.847 E-.10048
G1 X174.41 Y158.982 E-.05275
G1 X174.393 Y155.12 E-.0528
G1 X174.33 Y155.244 E-.05276
G1 X174.169 Y155.374 E-.07862
G1 X174.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.628 J1.042 P1  F60000
G1 X175.258 Y158.681 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.931 Y158.595 I-.258 J.316 E.06802
G1 X175 Y158.589 E.00214
G3 X175.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.381 Y158.847 E-.10048
G1 X175.41 Y158.982 E-.05275
G1 X175.393 Y155.12 E-.0528
G1 X175.33 Y155.244 E-.05276
G1 X175.169 Y155.374 E-.07862
G1 X175.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.628 J1.042 P1  F60000
G1 X176.258 Y158.681 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y158.595 I-.258 J.316 E.06802
G1 X176 Y158.589 E.00214
G3 X176.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X176.381 Y158.847 E-.10048
G1 X176.41 Y158.982 E-.05275
G1 X176.393 Y155.12 E-.0528
G1 X176.33 Y155.244 E-.05276
G1 X176.169 Y155.374 E-.07862
G1 X176.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.628 J1.042 P1  F60000
G1 X177.258 Y158.681 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y158.595 I-.258 J.316 E.06802
G1 X177 Y158.589 E.00214
G3 X177.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.381 Y158.847 E-.10048
G1 X177.41 Y158.982 E-.05275
G1 X177.393 Y155.12 E-.0528
G1 X177.33 Y155.244 E-.05276
G1 X177.169 Y155.374 E-.07862
G1 X177.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.628 J1.042 P1  F60000
G1 X178.258 Y158.681 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y158.595 I-.258 J.316 E.06802
G1 X178 Y158.589 E.00214
G3 X178.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.381 Y158.847 E-.10048
G1 X178.41 Y158.982 E-.05275
G1 X178.393 Y155.12 E-.0528
G1 X178.33 Y155.244 E-.05276
G1 X178.169 Y155.374 E-.07862
G1 X178.061 Y155.403 E-.04259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.254 J1.19 P1  F60000
G1 X179.389 Y155.119 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y158.595 I-.389 J-.122 E.05311
G1 X179 Y158.589 E.00214
G3 X179.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 24
M204 S250
G1 X180.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X179.931 Y158.595 I-.389 J-.122 E.05311
G1 X180 Y158.589 E.00214
G3 X180.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.33 Y155.244 E-.07501
G1 X180.169 Y155.374 E-.07863
G1 X180.035 Y155.409 E-.0528
G1 X179.831 Y155.374 E-.07857
G1 X179.716 Y155.297 E-.05284
G1 X179.65 Y155.207 E-.04215
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.945 J.766 P1  F60000
G1 X180.389 Y160.119 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y155.595 I-.389 J-.122 E.05311
G1 X180 Y155.589 E.00214
G3 X180.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X180.33 Y160.244 E-.07502
G1 X180.169 Y160.374 E-.07863
G1 X180.035 Y160.409 E-.0528
G1 X179.831 Y160.374 E-.07857
G1 X179.716 Y160.297 E-.05284
G1 X179.65 Y160.207 E-.04214
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.39 J-1.153 P1  F60000
G1 X179.389 Y160.119 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y155.595 I-.389 J-.122 E.05311
G1 X179 Y155.589 E.00214
G3 X179.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X179.33 Y160.244 E-.07505
G1 X179.169 Y160.374 E-.07862
G1 X179.035 Y160.409 E-.0528
G1 X178.897 Y160.398 E-.05272
G1 X178.77 Y160.34 E-.0528
G1 X178.67 Y160.244 E-.05274
G1 X178.655 Y160.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.966 J-.741 P1  F60000
G1 X178.379 Y155.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y155.595 I-.379 J.149 E.06162
G1 X178 Y155.589 E.00214
G3 X178.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 28
M204 S250
G1 X177.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y155.595 I-.379 J.149 E.06162
G1 X177 Y155.589 E.00214
G3 X177.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X177.41 Y155.982 E-.07497
G1 X177.393 Y160.12 E-.0528
G1 X177.33 Y160.244 E-.05276
G1 X177.169 Y160.374 E-.07862
G1 X177.035 Y160.409 E-.0528
G1 X176.858 Y160.379 E-.06805
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.814 J.905 P1  F60000
G1 X177.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y160.595 I-.379 J.149 E.06162
G1 X177 Y160.589 E.00214
G3 X177.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.41 Y160.982 E-.07497
G1 X177.393 Y161.12 E-.05281
G1 X177.33 Y161.244 E-.05276
G1 X177.169 Y161.374 E-.07862
G1 X177.035 Y161.409 E-.0528
G1 X176.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.401 J1.149 P1  F60000
G1 X178.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y160.595 I-.379 J.149 E.06162
G1 X178 Y160.589 E.00214
G3 X178.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X178.41 Y160.982 E-.07497
G1 X178.393 Y161.12 E-.05281
G1 X178.33 Y161.244 E-.05276
G1 X178.169 Y161.374 E-.07862
G1 X178.035 Y161.409 E-.0528
G1 X177.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.401 J1.149 P1  F60000
G1 X179.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y160.595 I-.379 J.149 E.06162
G1 X179 Y160.589 E.00214
G3 X179.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X179.41 Y160.982 E-.07497
G1 X179.393 Y161.12 E-.05281
G1 X179.33 Y161.244 E-.05276
G1 X179.169 Y161.374 E-.07862
G1 X179.035 Y161.409 E-.0528
G1 X178.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.401 J1.149 P1  F60000
G1 X180.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X179.931 Y160.595 I-.379 J.149 E.06162
G1 X180 Y160.589 E.00214
G3 X180.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X180.41 Y160.982 E-.07497
G1 X180.393 Y161.12 E-.05283
G1 X180.33 Y161.244 E-.05273
G1 X180.169 Y161.374 E-.07863
G1 X180.035 Y161.409 E-.0528
G1 X179.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.401 J1.149 P1  F60000
G1 X181.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y160.595 I-.379 J.149 E.06162
G1 X181 Y160.589 E.00214
G3 X181.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X181.41 Y160.982 E-.07497
G1 X181.393 Y161.12 E-.05281
G1 X181.33 Y161.244 E-.05276
G1 X181.169 Y161.374 E-.07862
G1 X181.035 Y161.409 E-.0528
G1 X180.858 Y161.379 E-.06804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.401 J1.149 P1  F60000
G1 X182.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y160.595 I-.379 J.149 E.06162
G1 X182 Y160.589 E.00214
G3 X182.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 35
M204 S250
G1 X183.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y160.595 I-.167 J-.372 E.04253
G1 X183 Y160.589 E.00214
G3 X183.22 Y161.34 I0 J.408 E.03222
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.035 Y161.409 E-.07494
G1 X182.831 Y161.374 E-.07864
G1 X182.716 Y161.297 E-.05276
G1 X182.633 Y161.185 E-.05275
G1 X182.593 Y161.052 E-.05276
G1 X182.598 Y160.913 E-.05278
G1 X182.617 Y160.877 E-.01535
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.812 J.906 P1  F60000
G1 X183.326 Y160.241 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.931 Y155.595 I-.327 J-.244 E.04887
G1 X183 Y155.589 E.00214
G3 X183.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 37
M204 S250
G1 X182.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X181.931 Y155.595 I-.389 J-.122 E.05311
G1 X182 Y155.589 E.00214
G3 X182.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 38
M204 S250
G1 X182.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X181.931 Y158.595 I-.389 J-.122 E.05311
G1 X182 Y158.589 E.00214
G3 X182.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X182.33 Y155.244 E-.07505
G1 X182.169 Y155.374 E-.07862
G1 X182.035 Y155.409 E-.0528
G1 X181.897 Y155.398 E-.05272
G1 X181.77 Y155.34 E-.0528
G1 X181.67 Y155.244 E-.05274
G1 X181.655 Y155.207 E-.01527
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.966 J-.741 P1  F60000
G1 X181.379 Y158.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y158.595 I-.379 J.149 E.06162
G1 X181 Y158.589 E.00214
G3 X181.353 Y158.794 I0 J.408 E.01313
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.41 Y158.982 E-.07497
G1 X181.393 Y155.12 E-.0528
G1 X181.33 Y155.244 E-.05276
G1 X181.169 Y155.374 E-.07862
G1 X181.035 Y155.409 E-.0528
G1 X180.897 Y155.398 E-.05272
G1 X180.86 Y155.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.813 J.905 P1  F60000
G1 X181.379 Y155.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y155.595 I-.379 J.149 E.06162
G1 X181 Y155.589 E.00214
G3 X181.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X181.41 Y155.982 E-.07497
G1 X181.393 Y160.12 E-.0528
G1 X181.33 Y160.244 E-.05276
G1 X181.169 Y160.374 E-.07862
G1 X181.035 Y160.409 E-.0528
G1 X180.897 Y160.398 E-.05272
G1 X180.86 Y160.381 E-.01533
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.51 J1.105 P1  F60000
G1 X183.326 Y155.241 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.931 Y158.595 I-.327 J-.244 E.04887
G1 X183 Y158.589 E.00214
G3 X183.359 Y155.191 I0 J.408 E.02587
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X183.169 Y155.374 E-.10025
G1 X183.035 Y155.409 E-.0528
G1 X182.897 Y155.398 E-.05272
G1 X182.77 Y155.34 E-.0528
G1 X182.633 Y155.185 E-.07866
G1 X182.6 Y155.077 E-.04278
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-1.026 J.654 P1  F60000
G1 X184.398 Y161.898 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G1 X183.41 Y161.898 E.03276
G1 X183.363 Y161.715 E.00626
G2 X183.63 Y160.505 I-.364 J-.715 E.047
G2 X183.63 Y155.505 I-.688 J-.5 E.03546
G2 X183.358 Y158.275 I-.673 J-.496 E.04732
G1 X183.411 Y158.102 E.00599
G1 X184.398 Y158.102 E.03274
G1 X184.398 Y161.838 E.12393
; COOLING_NODE: 42
; WIPE_START
G1 X183.41 Y161.898 E-.376
G1 X183.408 Y161.888 E-.004
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I.142 J-1.209 P1  F60000
G1 X168.389 Y160.119 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X167.931 Y155.595 I-.389 J-.122 E.05311
G1 X168 Y155.589 E.00214
G3 X168.403 Y160.06 I0 J.408 E.02163
; COOLING_NODE: 43
M204 S250
G1 X168.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X167.931 Y158.595 I-.389 J-.122 E.05311
G1 X168 Y158.589 E.00214
G3 X168.403 Y155.06 I0 J.408 E.02163
; COOLING_NODE: 44
M204 S250
G1 X169.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X168.931 Y158.595 I-.379 J.149 E.06162
G1 X169 Y158.589 E.00214
G3 X169.353 Y158.794 I0 J.408 E.01313
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.41 Y158.982 E-.07497
G1 X169.393 Y155.12 E-.05283
G1 X169.33 Y155.244 E-.05273
G1 X169.169 Y155.374 E-.07863
G1 X169.035 Y155.409 E-.0528
G1 X168.897 Y155.398 E-.05274
G1 X168.86 Y155.381 E-.01531
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.813 J.905 P1  F60000
G1 X169.379 Y155.848 Z4.2
G1 Z3.8
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y155.595 I-.379 J.149 E.06162
G1 X169 Y155.589 E.00214
G3 X169.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X169.41 Y155.982 E-.07497
G1 X169.393 Y160.12 E-.05283
G1 X169.33 Y160.244 E-.05273
G1 X169.169 Y160.374 E-.07863
G1 X169.035 Y160.409 E-.0528
G1 X168.897 Y160.398 E-.05274
G1 X168.86 Y160.381 E-.01531
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.813 J.905 P1  F60000
G1 X169.379 Y160.848 Z4.2
G1 Z3.8
G1 E.4 F1800
M73 P91 R1
G1 F12000
M204 S5000
G3 X168.931 Y160.595 I-.379 J.149 E.06162
G1 X169 Y160.589 E.00214
G3 X169.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 47
M204 S250
G1 X168.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X167.931 Y160.595 I-.379 J.149 E.06162
G1 X168 Y160.589 E.00214
G3 X168.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 48
M204 S250
G1 X167.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y160.595 I-.379 J.149 E.06162
G1 X167 Y160.589 E.00214
G3 X167.353 Y160.794 I0 J.408 E.01313
; COOLING_NODE: 49
M204 S250
G1 X167.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y155.595 I-.379 J.149 E.06162
G1 X167 Y155.589 E.00214
G3 X167.353 Y155.794 I0 J.408 E.01313
; COOLING_NODE: 50
M204 S250
G1 X167.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X166.931 Y158.595 I-.379 J.149 E.06162
G1 X167 Y158.589 E.00214
G3 X167.353 Y158.794 I0 J.408 E.01313
; COOLING_NODE: 50
M204 S10000
G1 X166.642 Y158.275 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S8000
G2 X166.37 Y155.505 I.4 J.734 E.04733
G2 X166.37 Y160.505 I.688 J.5 E.03546
G2 X166.637 Y161.715 I.632 J.495 E.04699
G1 X166.59 Y161.898 E.00626
G1 X165.602 Y161.898 E.03276
G1 X165.602 Y158.102 E.12592
G1 X166.589 Y158.102 E.03274
G1 X166.624 Y158.217 E.004
; COOLING_NODE: 51
; WIPE_START
G1 X166.495 Y158.374 E-.07733
G1 X166.396 Y158.468 E-.05177
G1 X166.315 Y158.578 E-.05194
G1 X166.214 Y158.83 E-.10324
G1 X166.203 Y155.082 E-.09572
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-.207 J1.199 P1  F60000
G1 X184.79 Y162.29 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X183.79 Y162.233 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.155 J.384 P1  F60000
G1 X184.058 Y161.426 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.353188
G1 F15000
M204 S8000
G1 X184.036 Y161.536 E.00285
G1 X183.753 Y161.694 E.00821
M204 S10000
G1 X184.058 Y161.426 F60000
; LINE_WIDTH: 0.298253
G1 F15000
M204 S8000
G1 X184.075 Y161.34 E.00181
; LINE_WIDTH: 0.278692
G1 X184.078 Y161.32 E.00039
; LINE_WIDTH: 0.243532
G2 X184.09 Y160.774 I-2.428 J-.325 E.00895
; LINE_WIDTH: 0.266431
G1 X184.075 Y160.671 E.0019
; LINE_WIDTH: 0.294604
G1 X184.062 Y160.585 E.00177
; LINE_WIDTH: 0.311842
G1 X183.986 Y160.194 E.00874
M204 S10000
G1 X183.875 Y160.504 F60000
; LINE_WIDTH: 0.251062
G1 F15000
M204 S8000
G1 X183.949 Y160.504 E.00126
; LINE_WIDTH: 0.288948
G1 X184.023 Y160.503 E.00148
; LINE_WIDTH: 0.328381
G1 X184.044 Y160.503 E.00047
G1 X184.059 Y160.421 E.00193
; LINE_WIDTH: 0.297446
G1 X184.075 Y160.34 E.00172
; LINE_WIDTH: 0.278723
G1 X184.078 Y160.32 E.00039
; LINE_WIDTH: 0.24355
G2 X184.09 Y155.774 I-2.429 J-.325 E.00895
; LINE_WIDTH: 0.266431
G1 X184.075 Y155.671 E.0019
; LINE_WIDTH: 0.294604
G1 X184.062 Y155.585 E.00177
; LINE_WIDTH: 0.311842
G1 X183.986 Y155.194 E.00874
M204 S10000
G1 X183.875 Y155.504 F60000
; LINE_WIDTH: 0.251062
G1 F15000
M204 S8000
G1 X183.949 Y155.504 E.00126
; LINE_WIDTH: 0.288948
G1 X184.023 Y155.503 E.00148
; LINE_WIDTH: 0.328381
G1 X184.044 Y155.503 E.00047
G1 X184.059 Y155.421 E.00193
; LINE_WIDTH: 0.297446
G1 X184.075 Y155.34 E.00172
; LINE_WIDTH: 0.278723
G1 X184.078 Y155.32 E.00039
; LINE_WIDTH: 0.24355
G2 X184.09 Y158.774 I-2.429 J-.325 E.00895
; LINE_WIDTH: 0.266431
G1 X184.075 Y158.671 E.0019
; LINE_WIDTH: 0.294604
G1 X184.062 Y158.585 E.00177
; LINE_WIDTH: 0.311842
G1 X184.008 Y158.306 E.00624
; WIPE_START
G1 X184.062 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I-1.165 J-.351 P1  F60000
G1 X183.141 Y161.643 Z4.2
G1 Z3.8
G1 E.4 F1800
; LINE_WIDTH: 0.60968
G1 F13233.128
M204 S8000
G1 X182.343 Y161.816 E.03771
; LINE_WIDTH: 0.574665
G1 F14104.521
G3 X182.196 Y161.839 I-.35 J-1.729 E.00645
; LINE_WIDTH: 0.540425
G1 F15000
G3 X181.76 Y161.834 I-.193 J-1.906 E.01771
; LINE_WIDTH: 0.581501
G1 F13925.479
G1 X181.657 Y161.816 E.00459
; LINE_WIDTH: 0.60957
G1 F13235.698
G1 X181.609 Y161.805 E.00227
M204 S10000
G1 X168.391 Y161.805 F60000
; LINE_WIDTH: 0.60968
G1 F13233.128
M204 S8000
G1 X168.343 Y161.816 E.00228
; LINE_WIDTH: 0.574665
G1 F14104.521
G3 X168.196 Y161.839 I-.35 J-1.729 E.00645
; LINE_WIDTH: 0.540425
G1 F15000
G3 X167.76 Y161.834 I-.193 J-1.906 E.01771
; LINE_WIDTH: 0.581501
G1 F13925.479
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.60957
G1 F13235.698
G1 X166.859 Y161.644 E.03772
M204 S10000
G1 X166.243 Y161.694 F60000
; LINE_WIDTH: 0.353218
G1 F15000
M204 S8000
G1 X165.964 Y161.536 E.00812
G1 X165.941 Y161.425 E.00285
; LINE_WIDTH: 0.298191
G1 X165.925 Y161.34 E.00181
; LINE_WIDTH: 0.278655
G1 X165.922 Y161.32 E.00039
; LINE_WIDTH: 0.243525
G3 X165.91 Y160.774 I2.429 J-.325 E.00894
; LINE_WIDTH: 0.266396
G1 X165.925 Y160.671 E.0019
; LINE_WIDTH: 0.294522
G1 X165.938 Y160.585 E.00177
; LINE_WIDTH: 0.311736
G1 X166.014 Y160.193 E.00875
M204 S10000
G1 X166.125 Y160.504 F60000
; LINE_WIDTH: 0.251059
G1 F15000
M204 S8000
G1 X166.051 Y160.504 E.00126
; LINE_WIDTH: 0.289015
G1 X165.977 Y160.503 E.00149
; LINE_WIDTH: 0.328366
G1 X165.956 Y160.503 E.00047
G1 X165.941 Y160.421 E.00193
; LINE_WIDTH: 0.297348
G1 X165.925 Y160.34 E.00172
; LINE_WIDTH: 0.278599
G1 X165.922 Y160.32 E.00039
; LINE_WIDTH: 0.243508
G3 X165.91 Y155.774 I2.43 J-.325 E.00894
; LINE_WIDTH: 0.266396
G1 X165.925 Y155.671 E.0019
; LINE_WIDTH: 0.294522
G1 X165.938 Y155.585 E.00177
; LINE_WIDTH: 0.311736
G1 X166.014 Y155.193 E.00875
M204 S10000
G1 X166.125 Y155.504 F60000
; LINE_WIDTH: 0.251059
G1 F15000
M204 S8000
G1 X166.051 Y155.504 E.00126
; LINE_WIDTH: 0.289015
G1 X165.977 Y155.503 E.00149
; LINE_WIDTH: 0.328366
G1 X165.956 Y155.503 E.00047
G1 X165.941 Y155.421 E.00193
; LINE_WIDTH: 0.297348
G1 X165.925 Y155.34 E.00172
; LINE_WIDTH: 0.278599
G1 X165.922 Y155.32 E.00039
; LINE_WIDTH: 0.243508
G3 X165.91 Y158.774 I2.43 J-.325 E.00894
; LINE_WIDTH: 0.266396
G1 X165.925 Y158.671 E.0019
; LINE_WIDTH: 0.294522
G1 X165.938 Y158.585 E.00177
; LINE_WIDTH: 0.311731
G1 X165.992 Y158.306 E.00624
; WIPE_START
M204 S8000
G1 X165.938 Y158.585 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
M204 S10000
G17
G3 Z4.2 I-1.197 J.217 P1  F60000
G1 X185.963 Y268.881 Z4.2
G1 Z3.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y269.881  
M204 S8000
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X188.398 Y255.349   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y257.357   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y259.273   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #19
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z4.2 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z3.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E2

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z6.8 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y256.381 F60000
G1 Z3.8

; filament start gcode
G17
G3 Z4.2 I0 J-1.217 P1
G1 X185.963 Y256.381 Z4.2
M73 P92 R1
G1 Z3.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y256.881 
G1  X185.463 
G1  Y255.881 
G1  X186.963 
G1  Y257.381 
G1  X184.963 
G1  Y255.381 
G1  X182.963 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y258.631  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y266.131  E0.0285
G1  X185.963  E0.7031
G1  Y266.881  E0.0285
G1  X167.463  E0.7031
G1  Y267.631  E0.0285
G1  X185.963  E0.7031
G1  Y268.381  E0.0285
G1  X167.463  E0.7031
G1  Y269.131  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X184.963 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z3.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 19 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z4.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z4.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer19 end: 112,152
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 20/25
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z4.4
G1 Z4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 20 start: 112,152
M624 AwAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z4.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z4.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer20 end: 112,152
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #20
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G1 X167.713 Y252.881
G1 Z4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S170 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
M73 P93 R1
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z7 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E1

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z7 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y265.141 F60000
G1 Z4
G17
G3 Z4.4 I-1.217 J0 P1
G1 X190.897 Y274.469 Z4.4
G1 X162.53 Y274.469
G1 X162.53 Y269.131

; filament start gcode
G1 X167.463 Y269.131
G1 Z4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y269.131  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y269.631 
G1  X166.963 
G1  Y268.631 
G1  X168.463 
G1  Y270.131 
G1  X166.463 
G1  Y268.131 
G1  X170.463 Y269.131   F1782
G1 E0.4000 F1800
M104 T1 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y268.381  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y267.631  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y266.881  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y266.131  E0.0285
G1  X185.963  E0.7031 F4775
M73 P94 R1
G1  Y265.381  E0.0285
G1  X167.463  E0.7031
G1  Y264.631  E0.0285
G1  X185.963  E0.7031
G1  Y263.881  E0.0285
G1  X167.463  E0.7031
G1  Y263.131  E0.0285
G1  X185.963  E0.7031
G1  Y262.381  E0.0285
G1  X167.463  E0.7031
G1  Y261.631  E0.0285
G1  X185.963  E0.7031
G1  Y260.881  E0.0285
G1  X167.463  E0.7031
G1  Y260.131  E0.0285
G1  X185.963  E0.7031
G1  Y259.381  E0.0285
G1  X167.463  E0.7031
G1  Y258.631  E0.0285
G1  X185.963  E0.7031
G1  Y257.881  E0.0285
G1  X167.463  E0.7031
G1  Y257.131  E0.0285
G1  X185.963  E0.7031
G1  Y256.381  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y268.881   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X165.438 Y268.205  
M204 S8000
G3  X166.125 Y265.161   I1.763 J-1.201 E0.1330
G2  X166.963 Y262.738   I-3.144 J-2.444 E0.0992
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X165.098 Y255.587   I-11.313 J5.667 E0.1171
G3  X165.438 Y253.807   I1.658 J-0.606 E0.0723
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X167.122 Y270.055   E0.0670
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X167.795 Y270.794 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
; OBJECT_ID: 112
; COOLING_NODE: 0
; start printing object, unique label id: 112
M624 AQAAAAAAAAA=
M204 S10000
G1 X175.379 Y155.848
G1 Z4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G3 X174.931 Y155.595 I-.379 J.149 E.06162
G1 X175 Y155.589 E.00214
G3 X175.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X175.41 Y155.982 E-.07494
G1 X175.393 Y160.12 E-.05282
G1 X175.33 Y160.244 E-.05272
G1 X175.169 Y160.374 E-.07867
G1 X175.035 Y160.409 E-.05277
G1 X174.897 Y160.398 E-.0527
G1 X174.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.185 J.277 P1  F60000
G1 X175.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X174.931 Y158.595 I-.258 J.316 E.06802
G1 X175 Y158.589 E.00214
G3 X175.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X175.381 Y158.847 E-.10055
G1 X175.41 Y158.982 E-.05271
G1 X175.393 Y155.12 E-.05282
G1 X175.33 Y155.244 E-.05272
G1 X175.169 Y155.374 E-.07867
G1 X175.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.628 J1.042 P1  F60000
G1 X176.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y158.595 I-.258 J.316 E.06802
G1 X176 Y158.589 E.00214
G3 X176.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X176.381 Y158.847 E-.10055
G1 X176.41 Y158.982 E-.05271
G1 X176.393 Y155.12 E-.05282
G1 X176.33 Y155.244 E-.05272
G1 X176.169 Y155.374 E-.07867
G1 X176.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.99 J.708 P1  F60000
G1 X176.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X175.931 Y155.595 I-.379 J.149 E.06162
G1 X176 Y155.589 E.00214
G3 X176.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X176.41 Y155.982 E-.07494
G1 X176.393 Y160.12 E-.05282
G1 X176.33 Y160.244 E-.05272
G1 X176.169 Y160.374 E-.07867
G1 X176.035 Y160.409 E-.05277
G1 X175.897 Y160.398 E-.0527
G1 X175.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.403 J1.148 P1  F60000
G1 X177.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y155.595 I-.379 J.149 E.06162
G1 X177 Y155.589 E.00214
G3 X177.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X177.41 Y155.982 E-.07494
G1 X177.393 Y160.12 E-.05282
G1 X177.33 Y160.244 E-.05272
G1 X177.169 Y160.374 E-.07867
G1 X177.035 Y160.409 E-.05277
G1 X176.897 Y160.398 E-.0527
G1 X176.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.185 J.277 P1  F60000
G1 X177.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X176.931 Y158.595 I-.258 J.316 E.06802
G1 X177 Y158.589 E.00214
G3 X177.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X177.381 Y158.847 E-.10055
G1 X177.41 Y158.982 E-.05271
G1 X177.393 Y155.12 E-.05282
G1 X177.33 Y155.244 E-.05272
G1 X177.169 Y155.374 E-.07867
G1 X177.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.628 J1.042 P1  F60000
G1 X178.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y158.595 I-.258 J.316 E.06802
G1 X178 Y158.589 E.00214
G3 X178.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X178.381 Y158.847 E-.10055
G1 X178.41 Y158.982 E-.05271
G1 X178.393 Y155.12 E-.05282
G1 X178.33 Y155.244 E-.05272
G1 X178.169 Y155.374 E-.07867
G1 X178.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.99 J.708 P1  F60000
G1 X178.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X177.931 Y155.595 I-.379 J.149 E.06162
G1 X178 Y155.589 E.00214
G3 X178.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X178.41 Y155.982 E-.07494
G1 X178.393 Y160.12 E-.05282
G1 X178.33 Y160.244 E-.05272
G1 X178.169 Y160.374 E-.07867
G1 X178.035 Y160.409 E-.05277
G1 X177.897 Y160.398 E-.0527
G1 X177.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.774 J.939 P1  F60000
G1 X179.389 Y155.119 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y158.595 I-.389 J-.122 E.05309
G1 X179 Y158.589 E.00214
G3 X179.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X179.33 Y155.244 E-.07502
G1 X179.169 Y155.374 E-.07867
G1 X179.035 Y155.409 E-.05277
G1 X178.831 Y155.374 E-.07862
G1 X178.716 Y155.297 E-.05276
G1 X178.65 Y155.207 E-.04215
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.945 J.766 P1  F60000
G1 X179.389 Y160.119 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X178.931 Y155.595 I-.389 J-.122 E.0531
G1 X179 Y155.589 E.00214
G3 X179.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 25
M204 S250
G1 X180.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X179.931 Y155.595 I-.389 J-.122 E.0531
G1 X180 Y155.589 E.00214
G3 X180.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 24
M204 S250
G1 X180.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X179.931 Y158.595 I-.389 J-.122 E.05309
G1 X180 Y158.589 E.00214
G3 X180.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 39
M204 S250
G1 X181.379 Y158.848 F60000
G1 F12000
M204 S5000
G3 X180.931 Y158.595 I-.379 J.149 E.06161
G1 X181 Y158.589 E.00214
G3 X181.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X181.41 Y158.982 E-.07507
G1 X181.393 Y155.12 E-.05282
G1 X181.33 Y155.244 E-.05272
G1 X181.169 Y155.374 E-.07867
G1 X181.035 Y155.409 E-.05277
G1 X180.859 Y155.379 E-.06795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.814 J.905 P1  F60000
G1 X181.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y155.595 I-.379 J.149 E.06162
G1 X181 Y155.589 E.00214
G3 X181.353 Y155.793 I0 J.408 E.01312
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X181.41 Y155.982 E-.07508
G1 X181.393 Y160.12 E-.05282
G1 X181.33 Y160.244 E-.05272
G1 X181.169 Y160.374 E-.07867
G1 X181.035 Y160.409 E-.05277
G1 X180.859 Y160.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.814 J.905 P1  F60000
G1 X181.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X180.931 Y160.595 I-.379 J.149 E.06162
G1 X181 Y160.589 E.00214
G3 X181.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 32
M204 S250
G1 X180.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X179.931 Y160.595 I-.379 J.149 E.06162
G1 X180 Y160.589 E.00214
G3 X180.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 31
M204 S250
G1 X179.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X178.931 Y160.595 I-.379 J.149 E.06162
G1 X179 Y160.589 E.00214
G3 X179.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 30
M204 S250
G1 X178.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X177.931 Y160.595 I-.379 J.149 E.06162
G1 X178 Y160.589 E.00214
G3 X178.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 29
M204 S250
G1 X177.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X176.931 Y160.595 I-.379 J.149 E.06162
G1 X177 Y160.589 E.00214
G3 X177.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 2
M204 S250
G1 X176.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X175.931 Y160.595 I-.379 J.149 E.06162
G1 X176 Y160.589 E.00214
G3 X176.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 3
M204 S250
G1 X175.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X174.931 Y160.595 I-.379 J.149 E.06162
G1 X175 Y160.589 E.00214
G3 X175.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 14
M204 S250
G1 X174.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y160.595 I-.379 J.149 E.06162
G1 X174 Y160.589 E.00214
G3 X174.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 15
M204 S250
G1 X174.379 Y155.848 F60000
G1 F12000
M204 S5000
G3 X173.931 Y155.595 I-.379 J.149 E.06162
G1 X174 Y155.589 E.00214
G3 X174.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X174.41 Y155.982 E-.07494
G1 X174.393 Y160.12 E-.05282
G1 X174.33 Y160.244 E-.05272
G1 X174.169 Y160.374 E-.07867
G1 X174.035 Y160.409 E-.05277
G1 X173.897 Y160.398 E-.0527
G1 X173.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.185 J.277 P1  F60000
G1 X174.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X173.931 Y158.595 I-.258 J.316 E.06802
G1 X174 Y158.589 E.00214
G3 X174.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X174.381 Y158.847 E-.10054
G1 X174.41 Y158.982 E-.05271
G1 X174.393 Y155.12 E-.05282
G1 X174.33 Y155.244 E-.05272
G1 X174.169 Y155.374 E-.07867
G1 X174.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.261 J-1.189 P1  F60000
G1 X173.326 Y155.241 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y158.595 I-.327 J-.244 E.04886
G1 X173 Y158.589 E.00214
G3 X173.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X173.169 Y155.374 E-.10031
G1 X173.035 Y155.409 E-.05277
G1 X172.831 Y155.374 E-.07862
G1 X172.716 Y155.297 E-.05276
G1 X172.633 Y155.185 E-.05276
G1 X172.6 Y155.077 E-.04278
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-1.033 J.644 P1  F60000
G1 X173.326 Y160.241 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y155.595 I-.327 J-.244 E.04887
G1 X173 Y155.589 E.00214
G3 X173.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 11
M204 S250
G1 X172.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X171.931 Y155.595 I-.389 J-.122 E.0531
G1 X172 Y155.589 E.00214
G3 X172.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 4
M204 S250
G1 X172.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X171.931 Y158.595 I-.389 J-.122 E.05309
G1 X172 Y158.589 E.00214
G3 X172.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X172.33 Y155.244 E-.07502
G1 X172.169 Y155.374 E-.07867
G1 X172.035 Y155.409 E-.05277
G1 X171.831 Y155.374 E-.07862
G1 X171.716 Y155.297 E-.05276
G1 X171.65 Y155.207 E-.04215
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.976 J-.727 P1  F60000
G1 X171.258 Y158.681 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y158.595 I-.258 J.316 E.06802
G1 X171 Y158.589 E.00214
G3 X171.208 Y158.647 I0 J.408 E.00672
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X171.381 Y158.847 E-.10054
G1 X171.41 Y158.982 E-.05271
G1 X171.393 Y155.12 E-.05282
G1 X171.33 Y155.244 E-.05272
G1 X171.169 Y155.374 E-.07867
G1 X171.061 Y155.402 E-.04253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.99 J.708 P1  F60000
G1 X171.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y155.595 I-.379 J.149 E.06162
G1 X171 Y155.589 E.00214
G3 X171.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.41 Y155.982 E-.07494
G1 X171.393 Y160.12 E-.05282
G1 X171.33 Y160.244 E-.05272
G1 X171.169 Y160.374 E-.07867
G1 X171.035 Y160.409 E-.05277
G1 X170.897 Y160.398 E-.05268
G1 X170.86 Y160.381 E-.0154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.813 J.905 P1  F60000
G1 X171.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X170.931 Y160.595 I-.379 J.149 E.06162
G1 X171 Y160.589 E.00214
G3 X171.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X171.41 Y160.982 E-.07494
G1 X171.393 Y161.12 E-.0528
G1 X171.33 Y161.244 E-.05276
G1 X171.169 Y161.374 E-.07866
G1 X171.035 Y161.409 E-.05277
G1 X170.897 Y161.398 E-.05268
G1 X170.86 Y161.381 E-.01539
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.403 J1.148 P1  F60000
G1 X172.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X171.931 Y160.595 I-.379 J.149 E.06162
G1 X172 Y160.589 E.00214
G3 X172.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X172.41 Y160.982 E-.07507
G1 X172.393 Y161.12 E-.0528
G1 X172.33 Y161.244 E-.05276
G1 X172.169 Y161.374 E-.07866
G1 X172.035 Y161.409 E-.05277
G1 X171.859 Y161.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.114 J1.212 P1  F60000
G1 X173.326 Y161.241 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X172.931 Y160.595 I-.327 J-.244 E.04887
G1 X173 Y160.589 E.00214
G3 X173.359 Y161.191 I0 J.408 E.02587
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X173.169 Y161.374 E-.1003
G1 X173.035 Y161.409 E-.05277
G1 X172.831 Y161.374 E-.07862
G1 X172.716 Y161.297 E-.05276
G1 X172.633 Y161.185 E-.05275
G1 X172.6 Y161.077 E-.0428
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.053 J-1.216 P1  F60000
G1 X167.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.931 Y160.595 I-.379 J.149 E.06162
G1 X167 Y160.589 E.00214
G3 X167.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.41 Y160.982 E-.07507
G1 X167.393 Y161.12 E-.0528
G1 X167.33 Y161.244 E-.05276
G1 X167.169 Y161.374 E-.07866
G1 X167.035 Y161.409 E-.05277
G1 X166.859 Y161.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.401 J1.149 P1  F60000
G1 X168.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.931 Y160.595 I-.379 J.149 E.06162
M73 P95 R1
G1 X168 Y160.589 E.00214
G3 X168.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X168.41 Y160.982 E-.07507
G1 X168.393 Y161.12 E-.0528
G1 X168.33 Y161.244 E-.05276
G1 X168.169 Y161.374 E-.07866
G1 X168.035 Y161.409 E-.05277
G1 X167.859 Y161.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.401 J1.149 P1  F60000
G1 X169.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y160.595 I-.379 J.149 E.06162
G1 X169 Y160.589 E.00214
G3 X169.353 Y160.794 I0 J.408 E.01314
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X169.41 Y160.982 E-.07494
G1 X169.393 Y161.12 E-.0528
G1 X169.33 Y161.244 E-.05276
G1 X169.169 Y161.374 E-.07866
G1 X169.035 Y161.409 E-.05277
G1 X168.858 Y161.379 E-.06808
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.401 J1.149 P1  F60000
G1 X170.379 Y160.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X169.931 Y160.595 I-.379 J.149 E.06162
G1 X170 Y160.589 E.00214
G3 X170.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 7
M204 S250
G1 X170.389 Y160.119 F60000
G1 F12000
M204 S5000
G3 X169.931 Y155.595 I-.389 J-.122 E.0531
G1 X170 Y155.589 E.00214
G3 X170.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 8
M204 S250
G1 X170.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X169.931 Y158.595 I-.389 J-.122 E.05309
G1 X170 Y158.589 E.00214
G3 X170.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.33 Y155.244 E-.07502
G1 X170.169 Y155.374 E-.07867
G1 X170.035 Y155.409 E-.05277
G1 X169.897 Y155.398 E-.05268
G1 X169.77 Y155.34 E-.05281
G1 X169.652 Y155.206 E-.06805
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.969 J-.736 P1  F60000
G1 X169.379 Y158.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X168.931 Y158.595 I-.379 J.149 E.06161
G1 X169 Y158.589 E.00214
G3 X169.353 Y158.794 I0 J.408 E.01314
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.41 Y158.982 E-.07494
G1 X169.393 Y155.12 E-.05282
G1 X169.33 Y155.244 E-.05272
G1 X169.169 Y155.374 E-.07867
G1 X169.035 Y155.409 E-.05277
G1 X168.897 Y155.398 E-.0527
G1 X168.86 Y155.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.813 J.905 P1  F60000
G1 X169.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
M73 P95 R0
G1 F12000
M204 S5000
G3 X168.931 Y155.595 I-.379 J.149 E.06162
G1 X169 Y155.589 E.00214
G3 X169.353 Y155.794 I0 J.408 E.01314
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X169.41 Y155.982 E-.07494
G1 X169.393 Y160.12 E-.05282
G1 X169.33 Y160.244 E-.05272
G1 X169.169 Y160.374 E-.07867
G1 X169.035 Y160.409 E-.05277
G1 X168.897 Y160.398 E-.0527
G1 X168.86 Y160.381 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.591 J-1.064 P1  F60000
G1 X168.389 Y160.119 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X167.931 Y155.595 I-.389 J-.122 E.0531
G1 X168 Y155.589 E.00214
G3 X168.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 43
M204 S250
G1 X168.389 Y155.119 F60000
G1 F12000
M204 S5000
G3 X167.931 Y158.595 I-.389 J-.122 E.05309
G1 X168 Y158.589 E.00214
G3 X168.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X168.33 Y155.244 E-.07502
G1 X168.169 Y155.374 E-.07867
G1 X168.035 Y155.409 E-.05277
G1 X167.831 Y155.374 E-.07862
G1 X167.716 Y155.297 E-.05276
G1 X167.65 Y155.207 E-.04215
; WIPE_END
G1 E-.02 F1800
M104 T0 S210 N0 ;Multi extruder pre heating
M204 S10000
G17
G3 Z4.4 I.973 J-.731 P1  F60000
G1 X167.379 Y158.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.931 Y158.595 I-.379 J.149 E.06161
G1 X167 Y158.589 E.00214
G3 X167.353 Y158.793 I0 J.408 E.01313
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167.41 Y158.982 E-.07507
G1 X167.393 Y155.12 E-.05282
G1 X167.33 Y155.244 E-.05272
G1 X167.169 Y155.374 E-.07867
G1 X167.035 Y155.409 E-.05277
G1 X166.859 Y155.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.814 J.905 P1  F60000
G1 X167.379 Y155.848 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X166.931 Y155.595 I-.379 J.149 E.06162
G1 X167 Y155.589 E.00214
G3 X167.353 Y155.793 I0 J.408 E.01312
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X167.41 Y155.982 E-.07507
G1 X167.393 Y160.12 E-.05282
G1 X167.33 Y160.244 E-.05272
G1 X167.169 Y160.374 E-.07867
G1 X167.035 Y160.409 E-.05277
G1 X166.859 Y160.379 E-.06794
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.098 J1.213 P1  F60000
G1 X182.389 Y155.119 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y158.595 I-.389 J-.122 E.05309
G1 X182 Y158.589 E.00214
G3 X182.403 Y155.061 I0 J.408 E.02164
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X182.33 Y155.244 E-.07502
G1 X182.169 Y155.374 E-.07867
G1 X182.035 Y155.409 E-.05277
G1 X181.831 Y155.374 E-.07862
G1 X181.716 Y155.297 E-.05276
G1 X181.65 Y155.207 E-.04215
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.945 J.766 P1  F60000
G1 X182.389 Y160.119 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X181.931 Y155.595 I-.389 J-.122 E.0531
G1 X182 Y155.589 E.00214
G3 X182.403 Y160.061 I0 J.408 E.02164
; COOLING_NODE: 34
M204 S250
G1 X182.379 Y160.848 F60000
G1 F12000
M204 S5000
G3 X181.931 Y160.595 I-.379 J.149 E.06162
G1 X182 Y160.589 E.00214
G3 X182.353 Y160.793 I0 J.408 E.01312
; COOLING_NODE: 35
M204 S250
G1 X183.167 Y161.369 F60000
G1 F12000
M204 S5000
G3 X182.931 Y160.595 I-.167 J-.372 E.04252
G1 X183 Y160.589 E.00214
G3 X183.22 Y161.341 I0 J.408 E.03223
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X183.035 Y161.409 E-.07491
G1 X182.831 Y161.374 E-.07862
G1 X182.716 Y161.297 E-.05276
G1 X182.633 Y161.185 E-.05275
G1 X182.593 Y161.052 E-.05278
G1 X182.598 Y160.914 E-.05272
G1 X182.614 Y160.876 E-.01545
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.809 J.909 P1  F60000
G1 X183.326 Y160.241 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X182.931 Y155.595 I-.327 J-.244 E.04887
G1 X183 Y155.589 E.00214
G3 X183.359 Y160.191 I0 J.408 E.02587
; COOLING_NODE: 41
M204 S250
G1 X183.326 Y155.241 F60000
G1 F12000
M204 S5000
G3 X182.931 Y158.595 I-.326 J-.244 E.04885
G1 X183 Y158.589 E.00214
G3 X183.359 Y155.191 I0 J.408 E.02588
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X183.169 Y155.374 E-.10031
G1 X183.035 Y155.409 E-.05277
G1 X182.831 Y155.374 E-.07862
G1 X182.716 Y155.297 E-.05276
G1 X182.633 Y155.185 E-.05277
G1 X182.6 Y155.077 E-.04277
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-1.006 J.685 P1  F60000
G1 X184.79 Y162.29 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X165.21 Y162.29 E.60164
G1 X165.21 Y157.71 E.14073
G1 X184.79 Y157.71 E.60164
G1 X184.79 Y162.23 E.13889
M204 S10000
G1 X183.849 Y162.083 F60000
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X184.583 Y161.349 E.03188
G1 X184.583 Y160.816
G1 X183.425 Y161.974 E.05032
G1 X183.509 Y161.357
G1 X184.583 Y160.283 E.04667
G1 X184.583 Y155.749
G1 X183.566 Y160.766 E.04419
G1 X183.571 Y160.228
G1 X184.583 Y155.216 E.04397
G1 X184.583 Y158.683
G1 X183.545 Y155.72 E.04508
G1 X183.598 Y155.134
G1 X184.583 Y158.15 E.04279
G1 X184.282 Y157.917
G1 X183.527 Y158.672 E.03279
G1 X183.235 Y158.43
G1 X183.748 Y157.917 E.02229
G1 X183.215 Y157.917
G1 X182.628 Y158.504 E.02551
G1 X182.184 Y158.416
G1 X182.682 Y157.917 E.02165
G1 X182.149 Y157.917
G1 X181.472 Y158.594 E.02941
G1 X181.134 Y158.398
G1 X181.615 Y157.917 E.02089
G1 X181.082 Y157.917
G1 X180.435 Y158.564 E.02811
G1 X180.078 Y158.388
G1 X180.549 Y157.917 E.02044
G1 X180.015 Y157.917
G1 X179.398 Y158.535 E.02682
G1 X179.012 Y158.388
G1 X179.482 Y157.917 E.02044
G1 X178.949 Y157.917
G1 X178.364 Y158.502 E.02541
G1 X177.945 Y158.388
G1 X178.416 Y157.917 E.02046
G1 X177.882 Y157.917
G1 X177.322 Y158.478 E.02438
G1 X176.873 Y158.394
G1 X177.349 Y157.917 E.0207
G1 X176.816 Y157.917
G1 X176.279 Y158.454 E.02334
G1 X175.752 Y158.449
G1 X176.283 Y157.917 E.02308
G1 X175.749 Y157.917
G1 X175.236 Y158.431 E.0223
G1 X174.63 Y158.503
G1 X175.216 Y157.917 E.02547
G1 X174.683 Y157.917
G1 X174.191 Y158.409 E.02137
G1 X173.465 Y158.602
G1 X174.15 Y157.917 E.02974
G1 X173.616 Y157.917
G1 X173.13 Y158.404 E.02115
G1 X172.436 Y158.565
G1 X173.083 Y157.917 E.02814
G1 X172.55 Y157.917
G1 X172.079 Y158.388 E.02044
G1 X171.403 Y158.531
G1 X172.017 Y157.917 E.02667
G1 X171.483 Y157.917
G1 X171.007 Y158.394 E.02069
G1 X170.362 Y158.505
G1 X170.95 Y157.917 E.02555
G1 X170.417 Y157.917
G1 X169.946 Y158.388 E.02044
G1 X169.322 Y158.479
G1 X169.884 Y157.917 E.02439
G1 X169.35 Y157.917
G1 X168.875 Y158.393 E.02066
G1 X168.284 Y158.451
G1 X168.817 Y157.917 E.02318
G1 X168.284 Y157.917
G1 X167.754 Y158.448 E.02304
G1 X167.234 Y158.434
G1 X167.751 Y157.917 E.02243
G1 X167.217 Y157.917
G1 X166.632 Y158.502 E.02542
; WIPE_START
M204 S8000
G1 X167.217 Y157.917 E-.31442
G1 X167.39 Y157.917 E-.06558
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-1.176 J-.315 P1  F60000
G1 X166.477 Y161.323 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S2000
G1 X165.718 Y162.083 E.03299
G1 X165.417 Y161.85
G1 X166.403 Y160.865 E.04282
G1 X166.449 Y160.285
G1 X165.417 Y161.317 E.04484
G1 X165.417 Y160.784
G1 X166.434 Y155.768 E.04416
G1 X166.432 Y155.236
G1 X165.417 Y160.251 E.04409
G1 X165.417 Y155.717
G1 X166.55 Y158.585 E.0492
; WIPE_START
M204 S8000
G1 X165.843 Y155.292 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.3 J-1.179 P1  F60000
G1 X165.417 Y155.184 Z4.4
G1 Z4
G1 E.4 F1800
G1 F12000
M204 S2000
G1 X166.684 Y157.917 E.05504
G1 X166.151 Y157.917
G1 X165.417 Y158.651 E.03187
; WIPE_START
M204 S8000
G1 X166.124 Y157.944 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-1.211 J.118 P1  F60000
G1 X166.45 Y161.269 Z4.4
G1 Z4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102524
G1 F15000
M204 S8000
G1 X166.393 Y161.19 E.00047
G1 X166.41 Y161.125 E.00033
; WIPE_START
G1 X166.393 Y161.19 E-.15644
G1 X166.45 Y161.269 E-.22356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.332 J1.171 P1  F60000
G1 X176.811 Y158.332 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.198677
G1 F15000
M204 S8000
G1 X176.708 Y158.403 E.00159
; LINE_WIDTH: 0.160126
G2 X176.46 Y158.625 I.431 J.731 E.00319
; WIPE_START
G1 X176.587 Y158.49 E-.2107
G1 X176.708 Y158.403 E-.1693
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.089 J1.214 P1  F60000
G1 X177.874 Y158.317 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.170343
G1 F15000
M204 S8000
G1 X177.744 Y158.407 E.00164
; LINE_WIDTH: 0.116729
G2 X177.476 Y158.642 I.433 J.764 E.00216
; WIPE_START
G1 X177.604 Y158.505 E-.19915
G1 X177.744 Y158.407 E-.18085
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.011 J1.217 P1  F60000
G1 X179.019 Y158.395 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.164791
G1 F15000
M204 S8000
G1 X178.865 Y158.352 E.00158
; LINE_WIDTH: 0.143794
G1 X178.771 Y158.417 E.00094
; LINE_WIDTH: 0.106706
G1 X178.677 Y158.483 E.0006
; WIPE_START
G1 X178.771 Y158.417 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.108 J1.212 P1  F60000
G1 X179.998 Y158.308 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.111452
G1 F15000
M204 S8000
G2 X179.798 Y158.428 I.449 J.977 E.00131
; WIPE_START
G1 X179.998 Y158.308 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.054 J1.216 P1  F60000
G1 X182.147 Y158.404 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.0982091
G1 F15000
M204 S8000
G2 X182.006 Y158.327 I-.508 J.766 E.00073
; WIPE_START
G1 X182.147 Y158.404 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-1.202 J-.19 P1  F60000
G1 X181.609 Y161.805 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.609569
G1 F13235.722
M204 S8000
G1 X181.657 Y161.816 E.00227
; LINE_WIDTH: 0.581515
G1 F13925.135
G1 X181.76 Y161.834 E.00459
; LINE_WIDTH: 0.54042
G1 F15000
G2 X182.196 Y161.839 I.242 J-1.9 E.0177
; LINE_WIDTH: 0.574634
G1 F14105.327
G2 X182.343 Y161.816 I-.203 J-1.752 E.00644
; LINE_WIDTH: 0.609571
G1 F13235.657
G1 X183.141 Y161.644 E.03772
; WIPE_START
G1 X182.343 Y161.816 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.189 J-1.202 P1  F60000
G1 X180.65 Y162.083 Z4.4
G1 Z4
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X181.135 Y161.598 E.02108
G1 X180.678 Y161.521
G1 X180.116 Y162.083 E.0244
G1 X179.583 Y162.083
G1 X180.045 Y161.621 E.02006
G1 X179.638 Y161.494
G1 X179.05 Y162.083 E.02556
G1 X178.517 Y162.083
G1 X178.988 Y161.612 E.02047
G1 X178.598 Y161.467
G1 X177.983 Y162.083 E.02673
G1 X177.45 Y162.083
G1 X177.931 Y161.602 E.02089
G1 X177.562 Y161.437
G1 X176.917 Y162.083 E.02804
G1 X176.383 Y162.083
G1 X176.874 Y161.592 E.02131
G1 X176.534 Y161.399
G1 X175.85 Y162.083 E.0297
G1 X175.317 Y162.083
G1 X175.817 Y161.582 E.02174
G1 X175.461 Y161.405
G1 X174.784 Y162.083 E.02945
G1 X174.25 Y162.083
G1 X174.76 Y161.573 E.02216
G1 X174.226 Y161.574
G1 X173.717 Y162.083 E.02211
G1 X173.184 Y162.083
G1 X173.718 Y161.548 E.02321
G1 X173.136 Y161.597
G1 X172.651 Y162.083 E.02109
G1 X172.117 Y162.083
G1 X172.678 Y161.522 E.02438
G1 X172.046 Y161.621
G1 X171.584 Y162.083 E.02008
G1 X171.051 Y162.083
G1 X171.639 Y161.495 E.02554
G1 X170.987 Y161.613
G1 X170.518 Y162.083 E.02039
G1 X169.984 Y162.083
G1 X170.603 Y161.464 E.02687
G1 X169.926 Y161.608
G1 X169.451 Y162.083 E.02062
G1 X168.918 Y162.083
G1 X169.572 Y161.429 E.02841
M204 S10000
G1 X168.677 Y161.498 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.234489
G1 F15000
M204 S8000
G1 X168.72 Y162.012 E.00805
G1 X168.935 Y162.101 E.00363
; WIPE_START
G1 X168.72 Y162.012 E-.11814
G1 X168.677 Y161.498 E-.26186
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.015 J1.217 P1  F60000
G1 X177.106 Y161.603 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.102268
G1 F15000
M204 S8000
G3 X177.036 Y161.641 I-.206 J-.296 E.00039
; LINE_WIDTH: 0.142496
G1 X177.007 Y161.65 E.00025
G1 X176.897 Y161.593 E.00101
; WIPE_START
G1 X177.007 Y161.65 E-.3049
G1 X177.036 Y161.641 E-.0751
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.024 J1.217 P1  F60000
G1 X179.183 Y161.682 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.0974117
G1 F15000
M204 S8000
G3 X179.011 Y161.612 I.227 J-.809 E.00083
M204 S10000
G1 X179.069 Y161.693 F60000
; LINE_WIDTH: 0.0890661
G1 F15000
M204 S8000
G1 X179.266 Y161.567 E.00088
G1 X179.27 Y161.537 E.00011
; WIPE_START
G1 X179.266 Y161.567 E-.04315
G1 X179.069 Y161.693 E-.33685
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I.269 J1.187 P1  F60000
G1 X180.53 Y161.362 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.126177
G1 F15000
M204 S8000
G3 X180.123 Y161.699 I-1.748 J-1.698 E.00359
; WIPE_START
G1 X180.285 Y161.582 E-.14349
G1 X180.53 Y161.362 E-.23651
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.841 J.879 P1  F60000
G1 X181.302 Y162.101 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.234409
G1 F15000
M204 S8000
G1 X181.342 Y161.657 E.00696
; LINE_WIDTH: 0.265142
G1 X181.325 Y161.632 E.00054
; LINE_WIDTH: 0.248858
G1 X181.233 Y161.618 E.00156
; LINE_WIDTH: 0.219554
G1 X181.141 Y161.604 E.00134
; WIPE_START
G1 X181.233 Y161.618 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I-.018 J-1.217 P1  F60000
G1 X168.391 Y161.805 Z4.4
G1 Z4
G1 E.4 F1800
; LINE_WIDTH: 0.609571
G1 F13235.657
M204 S8000
G1 X168.343 Y161.816 E.00227
; LINE_WIDTH: 0.574634
G1 F14105.327
G3 X168.196 Y161.839 I-.349 J-1.728 E.00644
; LINE_WIDTH: 0.54042
G1 F15000
G3 X167.76 Y161.834 I-.193 J-1.906 E.0177
; LINE_WIDTH: 0.581515
G1 F13925.135
G1 X167.657 Y161.816 E.00459
; LINE_WIDTH: 0.609569
G1 F13235.722
G1 X166.859 Y161.643 E.03772
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F13235.722
G1 X167.657 Y161.816 E-.38
; WIPE_END
G1 E-.02 F1800
; stop printing object, unique label id: 112
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 21/25
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

M204 S10000
G17
G3 Z4.4 I-1.217 J-.002 P1  F60000
G1 X167.463 Y268.881 Z4.4
G1 Z4.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y269.881  
M204 S8000
G3  X165.047 Y267.496   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y265.031   I2.797 J-0.179 E0.1084
G2  X166.963 Y262.738   I-3.200 J-2.298 E0.0931
G2  X166.798 Y258.147   I-15.731 J-1.732 E0.1752
G2  X166.462 Y257.357   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y255.349   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y253.807   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y250.437   I20.025 J15.314 E0.1743
G3  X171.870 Y251.146   I1.296 J2.093 E0.1430
G2  X174.905 Y252.131   I3.041 J-4.200 E0.1233
G2  X180.025 Y251.907   I1.808 J-17.319 E0.1955
G2  X182.960 Y250.117   I-5.648 J-12.557 E0.1310
G3  X183.732 Y250.000   I0.690 J1.965 E0.0298
G3  X185.117 Y250.652   I-0.130 J2.074 E0.0596
G1  X186.463 Y252.131   E0.0760
G3  X188.379 Y254.516   I-4.010 J5.182 E0.1173
G3  X187.203 Y256.981   I-2.797 J0.179 E0.1084
G2  X186.463 Y259.273   I3.199 J2.298 E0.0930
G2  X186.628 Y263.865   I15.729 J1.733 E0.1753
G2  X188.328 Y266.425   I11.313 J-5.667 E0.1171
G3  X187.988 Y268.205   I-1.658 J0.606 E0.0723
G1  X186.463 Y269.881   E0.0861
G3  X184.043 Y271.972   I-4.428 J-2.678 E0.1236
M73 P96 R0
G3  X181.399 Y270.757   I-0.104 J-3.256 E0.1146
G2  X178.521 Y269.881   I-2.903 J4.371 E0.1160
G2  X173.401 Y270.105   I-1.808 J17.316 E0.1955
G2  X170.466 Y271.895   I5.648 J12.556 E0.1310
G3  X168.309 Y271.360   I-0.676 J-1.891 E0.0895
G1  X166.963 Y269.881   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #21
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z4.6 I1.217 J0 P1  F60000
G1 X167.713 Y252.881
G1 Z4.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X185.713 Y252.881  E1.4325 F7836
G1  Y254.131  E0.0995
G1  X167.713  E1.4325
G1  Y255.381  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1
M104 T1 S0 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y255.381 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z7.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E0

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.897

G1 Y295
G1 Y265 F18000
G1 Z7.2 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S198.9
M106 P2 S191
G1 X190.897 Y264.706 F60000
G1 Z4.2
G17
G3 Z4.6 I1.217 J0 P1
G1 X190.897 Y247.542 Z4.6
G1 X162.53 Y247.542
G1 X162.53 Y256.381

; filament start gcode
G1 X167.463 Y256.381
G1 Z4.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y256.381  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y256.881 
G1  X166.963 
G1  Y255.881 
G1  X168.463 
G1  Y257.381 
G1  X166.463 
G1  Y255.381 
G1  X170.463 Y256.381   F1782
G1 E0.4000 F1800
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y257.131  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y257.881  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y258.631  E0.0285
M73 P97 R0
G1  X167.463  E0.7031 F4725
G1  Y259.381  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y260.131  E0.0285
G1  X167.463  E0.7031
G1  Y260.881  E0.0285
G1  X185.963  E0.7031
G1  Y261.631  E0.0285
G1  X167.463  E0.7031
G1  Y262.381  E0.0285
G1  X185.963  E0.7031
G1  Y263.131  E0.0285
G1  X167.463  E0.7031
G1  Y263.881  E0.0285
G1  X185.963  E0.7031
G1  Y264.631  E0.0285
G1  X167.463  E0.7031
G1  Y265.381  E0.0285
G1  X185.963  E0.7031
G1  Y266.131  E0.0285
G1  X167.463  E0.7031
G1  Y266.881  E0.0285
G1  X185.963  E0.7031
G1  Y267.631  E0.0285
G1  X167.463  E0.7031
G1  Y268.381  E0.0285
G1  X185.963  E0.7031
G1  Y269.131  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X168.463 Y269.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F60000
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
M204 S10000
G1 X192.683 Y161.22
G1 Z4.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1495
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z4.6
G1 Z4.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F15000
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F15000
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 21 start: 152
M624 AgAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z4.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z4.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer21 end: 152
M625
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z4.2
Z3.96
G1 E0.40 F150
G4 P400
G0 Z4.2 F300
G1 E-0.08 F800
G0 X145 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X150 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X155 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X160 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X165 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X170 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X175 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X180 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X185 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X190 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X195 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X200 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X205 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X210 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X215 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X220 Y155 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z4.2
Z3.96
G1 E0.40 F150
G4 P400
G0 Z4.2 
G1 E-0.08 F800
G0 X145 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X150 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X155 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X160 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X165 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X170 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X175 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X180 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X185 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X190 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X195 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X200 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X205 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X210 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X215 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X220 Y160 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z4.2
Z3.96
G1 E0.40 F150
G4 P400
G0 Z4.2 F300
G1 E-0.08 F800
G0 X145 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X150 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X155 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X160 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X165 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X170 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X175 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X180 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X185 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X190 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X195 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X200 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X205 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X210 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X215 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
G0 X220 Y165 Z4.2
Z3.96
G1 E0.40
G4 P400
G0 Z4.2
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 22/25
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

M106 S204
; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z4.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P98 R0
G1 F1200
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.8 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z4.8
G1 Z4.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F1200
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 F15000
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 22 start: 152
M624 AgAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z4.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z4.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer22 end: 152
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 23/25
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z4.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z5
G1 Z4.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F1200
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 F15000
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 23 start: 152
M624 AgAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z5 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z5 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer23 end: 152
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 24/25
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X192.683 Y161.22 F60000
G1 Z4.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X188.887 Y161.22 E.12592
G1 X188.887 Y157.424 E.12592
G1 X192.683 Y157.424 E.12592
G1 X192.683 Y161.16 E.12393
; COOLING_NODE: 0
M204 S250
G1 X193.075 Y161.612 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.2 I1.064 J-.59 P1  F60000
G1 X190.808 Y155.281 Z5.2
G1 Z4.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X190.739 Y155.322 E.00244
G1 X190.797 Y155.355 E.00204
M204 S10000
G1 X191.16 Y155.322 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X191.16 Y158.947 E.01151
G1 X190.41 Y158.947 E.02302
G1 X190.41 Y155.696 E.02302
G1 X191.16 Y155.696 E.02302
G1 X191.16 Y155.382 E.00967
M204 S10000
G1 X191.537 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.537 Y158.57 E.0231
G1 X190.033 Y158.57 E.0462
G1 X190.033 Y160.073 E.0462
G1 X191.537 Y160.073 E.0462
G1 X191.537 Y155.382 E.02125
M204 S10000
G1 X191.914 Y155.322 F60000
G1 F1200
M204 S8000
G1 X191.914 Y158.193 E.03468
G1 X189.656 Y158.193 E.06937
G1 X189.656 Y160.45 E.06937
G1 X191.914 Y160.45 E.06937
G1 X191.914 Y155.382 E.03284
M204 S10000
G1 X192.291 Y155.322 F60000
G1 F1200
M204 S8000
G1 X192.291 Y157.816 E.04627
G1 X189.279 Y157.816 E.09254
G1 X189.279 Y160.827 E.09254
G1 X192.291 Y160.827 E.09254
G1 X192.291 Y155.382 E.04443
; WIPE_START
G1 F15000
G1 X192.291 Y160.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 24 start: 152
M624 AgAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z5.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z5.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer24 end: 152
M625
;===== Z PIN ROUTINE START =====
M400
G91
G1 Z3 F1200
G90
; switch to PLA tool (AMS slot 0)
M620 S0A
M1002 gcode_claim_action : 4
M400
M628 S0
M629
M400
M621 S0A
M83
; ---- ROW 1 (Y=159) ----
G0 X140 Y155 Z4.8
Z4.56
G1 E0.40 F150
G4 P400
G0 Z4.8 F300
G1 E-0.08 F800
G0 X145 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X150 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X155 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X160 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X165 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X170 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X175 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X180 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X185 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X190 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X195 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X200 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X205 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X210 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X215 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X220 Y155 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X140 Y160 Z4.8
Z4.56
G1 E0.40 F150
G4 P400
G0 Z4.8 
G1 E-0.08 F800
G0 X145 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X150 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X155 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X160 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X165 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X170 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X175 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X180 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X185 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X190 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X195 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X200 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X205 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X210 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X215 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X220 Y160 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X140 Y165 Z4.8
Z4.56
G1 E0.40 F150
G4 P400
G0 Z4.8 F300
G1 E-0.08 F800
G0 X145 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X150 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X155 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X160 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X165 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X170 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X175 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X180 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X185 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X190 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X195 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X200 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X205 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X210 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X215 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
G0 X220 Y165 Z4.8
Z4.56
G1 E0.40
G4 P400
G0 Z4.8
G1 E-0.08
; retract to prevent blob
G1 E-3 F400
; ----- SWITCH TO TPU -----
M620 S1A
M1002 gcode_claim_action : 4
M400
M628 S1
M629
M400
M621 S1A
; purge TPU
M83
G1 E6 F300
G4 P500
G1 E4 F200
; return to print height
G91
G1 Z2 F1200
G90
;===== Z PIN ROUTINE END =====
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 25/25
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 152
; COOLING_NODE: 0
; start printing object, unique label id: 152
M624 AgAAAAAAAAA=
G1 X193.075 Y161.612 F60000
G1 Z5
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X188.495 Y161.612 E.14073
G1 X188.495 Y157.032 E.14073
G1 X193.075 Y157.032 E.14073
G1 X193.075 Y161.552 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X192.075 Y161.565 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J.026 P1  F60000
G1 X192.169 Y157.239 Z5.4
G1 Z5
G1 E.4 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X192.868 Y157.938 E.03038
G1 X192.868 Y158.471
G1 X191.635 Y157.239 E.05355
G1 X191.102 Y157.239
G1 X192.868 Y155.005 E.07673
G1 X192.868 Y155.538
G1 X190.569 Y157.239 E.0999
G1 X190.036 Y157.239
G1 X192.868 Y160.071 E.12307
G1 X192.868 Y160.604
M73 P99 R0
G1 X189.502 Y157.239 E.14624
G1 X188.969 Y157.239
G1 X192.868 Y161.138 E.16942
G1 X192.601 Y161.404
G1 X188.703 Y157.506 E.16941
G1 X188.703 Y158.039
G1 X192.068 Y161.404 E.14624
G1 X191.535 Y161.404
G1 X188.703 Y158.572 E.12307
G1 X188.703 Y155.105
G1 X191.001 Y161.404 E.09989
G1 X190.468 Y161.404
G1 X188.703 Y155.639 E.07672
G1 X188.703 Y160.172
G1 X189.935 Y161.404 E.05355
G1 X189.402 Y161.404
G1 X188.703 Y160.705 E.03038
; WIPE_START
G1 F12000
M204 S8000
G1 X189.402 Y161.404 E-.37565
G1 X189.413 Y161.404 E-.00435
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 152
M625
; object ids of layer 25 start: 152
M624 AgAAAAAAAAA=
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X261 Y160 Z5.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U261 V160 Z5.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer25 end: 152
M625
; close powerlost recovery
M1003 S0
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
;========== H2D end ==========
;===== date: 2025/12/26 =====

G392 S0 ;turn off nozzle clog detect
M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
M400
M211 Z1
G1 Z5.4 F900 ; lower z a little

M1002 judge_flag timelapse_record_flag
M622 J1
    G150.3
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S5 ;wait for last picture to be taken
M623  ;end of "timelapse_record_flag"

G90
G1 Z15 F900 ; lower z a little

G90
M141 S0 ; turn off chamber heating
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan
M106 P9 S0 ; turn off ext toodhead cooling fan
; pull back filament to AMS
M620 S65535
T65535
G150.2
M621 S65535

M620 S65279
T65279
G150.2
M621 S65279

G150.3

M104 S0 T0; turn off hotend
M104 S0 T1; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    
        G1 Z102.5 F600
        G1 Z100.5
    

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M1015.4 S0 K0 ;disable air printing detect

;=====printer finish air purification=========
M622.1 S0
M1002 judge_flag print_finish_air_filt_flag

M622 J1
M1002 gcode_claim_action : 66
M145 P1
M106 P6 S255
M400 S180
M106 P6 S0
M623

M622 J2
M1002 gcode_claim_action : 66
M145 P0
M106 P3 S127
M400 S180
M106 P3 S0
M623
;=====printer finish air purification=========


;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
M1006 W
;=====printer finish  sound=========
M400
M18

M73 P100 R0
; EXECUTABLE_BLOCK_END

