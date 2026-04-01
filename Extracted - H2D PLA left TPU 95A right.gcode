; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 28m 33s; total estimated time: 35m 46s
; total layer number: 25
; total filament length [mm] : 566.75,466.68
; total filament volume [cm^3] : 1363.19,1122.49
; total filament weight [g] : 1.66,1.41
; model label id: 224,265
; filament_density: 1.22,1.04,1.26,1.26
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 5.00
; filament: 1,4
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,1,0,0
; additional_cooling_fan_speed = 100,0,75,75
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
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
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50,50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,65,0,0
; change_filament_gcode = ;======== H2D ========\n;===== 20251031 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[current_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{else}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU"}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\nM620.10 R{retract_length_toolchange[filament_map[next_extruder]-1]}\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4 R{retract_length_toolchange[filament_map[next_extruder]-1]}\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,3,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 30,0,35,35
; cool_plate_temp_initial_layer = 30,0,35,35
; cooling_filter_enabled = 0
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.003,0.003
; counter_coef_3 = -0.041,-0.041,0.01,0.01
; counter_limit_max = 0.033,0.033,0.088,0.088
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
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 35,90,55,55
; eng_plate_temp_initial_layer = 35,90,55,55
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
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
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100,30,100,100
; fan_direction = left
; fan_max_speed = 100,60,80,80
; fan_min_speed = 100,10,60,60
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 600,200,100,100
; filament_change_length = 10,10,5,5
; filament_change_length_nc = 10,10,10,10
; filament_colour = #ffffff;#D32941;#161616;#FFFFFF
; filament_colour_type = 1;0;0;1
; filament_cooling_before_tower = 0,0,0,0
; filament_cost = 41.99,24.99,24.99,24.99
; filament_density = 1.22,1.04,1.26,1.26
; filament_deretraction_speed = 10,nil,nil,nil
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 1,0.95,0.98,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFU01;GFB00;GFA00;GFA00
; filament_is_support = 0,0,0,0
; filament_map = 2,1,1,1
; filament_map_2 = 1,0,0,0
; filament_map_mode = Manual
; filament_max_volumetric_speed = 3.6,20,25,25
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #000000;#D32941;#161616;#FFFFFF
; filament_notes = 
; filament_nozzle_map = 1,0,0,0
; filament_pre_cooling_temperature = 200,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0
; filament_prime_volume = 45,45,30,30
; filament_prime_volume_nc = 60,60,60,60
; filament_printable = 2,3,3,3
; filament_ramming_travel_time = 20,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0
; filament_ramming_volumetric_speed = 0.9,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14
; filament_retraction_length = 2,0.4,0.4,0.4
; filament_retraction_speed = 10,nil,nil,nil
; filament_scarf_gap = 0%,0%,0%,0%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,1,2,2,3,3,4,4
; filament_settings_id = "Bambu TPU 95A @BBL H2D";"Bambu ABS @BBL H2D";"Bambu PLA Basic @BBL H2D";"Bambu PLA Basic @BBL H2D"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n"
; filament_type = TPU;ABS;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0,0,0
; filament_wipe = nil,1,1,1
; filament_wipe_distance = nil,1,1,1
; filament_z_hop_types = nil,Spiral Lift,Spiral Lift,Spiral Lift
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1,1
; flush_volumes_matrix = 0,510,230,900,235,0,219,629,208,466,0,900,90,313,90,0,0,525,245,900,250,0,234,644,223,481,0,900,90,328,90,0
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
; hole_coef_3 = 0.23415,0.23415,0.18,0.18
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 35,90,55,55
; hot_plate_temp_initial_layer = 35,90,55,55
; hotend_cooling_rate = 2,2
; hotend_heating_rate = 3.6,3.6
; impact_strength_z = 88.7,7.4,13.8,13.8
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
; machine_end_gcode = ;===== date: 2025/05/16 =====================\n;===== H2D =====================\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of "timelapse_record_flag"\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 320}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z320 F600\n    G1 Z320\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
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
; machine_start_gcode = ;===== machine: H2D start ======\n;===== date: 20251022 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z27 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{else}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nM972 S41 P0 T5000 ; trash can anti-collision\n\nM1009 Q1 L1\nG90\nG1 X175 Y160 F30000\nG28 Z P0 T250\nM1009 Q1 L0\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n\n    T1001\n    G383.4 ; left-extruder load status detection\n    \n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-80} A ; rise temp in advance\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    M972 S19 P0 C0    ; heatbed presence detection\n    M972 S31 P0 T5000 ; toolhead camera dirty detection\n    M972 S34 P0 T5000 ; heatbed plate offset detection\nM623\n\n    M972 S14 P0 ; nozzle type detection\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M83\n    G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X175 Y160 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28\nM623\n\n;===== bed leveling end ================================\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\nM400\n;M73 P99\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\n    M500\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        G29.1 Z{-0.02} ; for Textured PEI Plate\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\n    G29.2 S1 ; ensure z comp turn on\n    G90\n    M83\n    G1 Z5 F1200\n    G1 X270 Y-0.5 F60000\n    G28.14\n    G29.2 S0\n    G91\n    G1 Z0.8 F1200\n    G90\n    G1 X250 F60000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    M83\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053*60}\n    G1 X290 E20 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053*60}\n    G91\n    G3 Z0.4 I1.217 J0 P1 F60000\n    G90\n    M83\n    G29.2 S1 ; ensure z comp turn on\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
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
; nozzle_temperature = 230,270,220,220
; nozzle_temperature_initial_layer = 230,260,220,220
; nozzle_temperature_range_high = 250,280,240,240
; nozzle_temperature_range_low = 200,240,190,190
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
; overhang_fan_speed = 100,80,100,100
; overhang_fan_threshold = 95%,25%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10,10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 1,0
; post_process = 
; pre_start_fan_time = 0,0,2,2
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
; retraction_distances_when_ec = 0,10,10,10
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
; slow_down_layer_time = 8,12,4,4
; slow_down_min_speed = 10,20,20,20
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
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 350,350
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 0,0,40,40
; supertack_plate_temp_initial_layer = 0,0,40,40
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 1
; support_cooling_filter = 0
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
; temperature_vitrification = 30,100,45,45
; template_custom_gcode = 
; textured_plate_temp = 35,90,55,55
; textured_plate_temp_initial_layer = 35,90,55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;======== H2D 20250818========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\nM622 J1\nM993 A2 B2 C2\nM993 A0 B0 C0\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        M83\n        G1 Z{max_layer_z + 0.4} F1200\n        M400\n    {endif}\n{endif}\n\n{if has_timelapse_safe_pos && timelapse_type == 0 && !spiral_mode}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n{else}\n    {if spiral_mode}\n        M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z} S11 C10 O0 T3000\n    {else}\n        M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n    {endif}\n{endif}\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        G90\n        G1 Z{max_layer_z + 3.0} F1200\n        G1 Y295 F30000\n        G1 Y265 F18000\n        M83\n    {endif}\n{endif}\nM993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000,2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200,200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000,10000
; travel_jerk = 9
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
M73 P0 R35
M201 X20000 Y20000 Z500 E5000
M203 X1000 Y1000 Z30 E50
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: H2D start ======
;===== date: 20251022 =====================

;M1002 set_flag extrude_cali_flag=1
;M1002 set_flag g29_before_print_flag=1
;M1002 set_flag auto_cali_toolhead_offset_flag=1
;M1002 set_flag build_plate_detect_flag=1

M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400
;M73 P99

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
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
G29.1 Z0 ; clear z-trim value first
M983.1 M1 
M901 D4
M481 S0 ; turn off cutter pos comp
;===== reset machine status =================

M620 M ;enable remap

;===== avoid end stop =================
G91
G380 S2 Z27 F1200
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
        
    

;==== set airduct mode ==== 

;===== start to heat heatbed & hotend==========

    M1002 set_filament_type:TPU

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


M972 S26 P0 C0

M972 S35 P0 C0

M972 S41 P0 T5000 ; trash can anti-collision

M1009 Q1 L1
G90
G1 X175 Y160 F30000
G28 Z P0 T250
M1009 Q1 L0

;===== first homing end =====

M400
;M73 P99

;===== detection start =====

    T1001
    G383.4 ; left-extruder load status detection
    
    M104 S150 A ; rise temp in advance

M1002 judge_flag build_plate_detect_flag
M622 S1
    M972 S19 P0 C0    ; heatbed presence detection
    M972 S31 P0 T5000 ; toolhead camera dirty detection
    M972 S34 P0 T5000 ; heatbed plate offset detection
M623

    M972 S14 P0 ; nozzle type detection

;===== detection end =====

M400
;M73 P99

;===== prepare print temperature and material ==========
M400
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on input shaping

G29.2 S0 ; avoid invalid abl data


M620.10 A0 F89.8017 H0.4 T250 P230 S1
M620.10 A1 F89.8017 H0.4 T250 P230 S1


M620.11 P0 I0 E0


M620.11 K1 I0 R0 F200


M628 S1

    M620.11 S0 L0 I0 E-10 F89.8017

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
M1002 set_filament_type:TPU
M621 S0A

M104 S230
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
    M983.3 F1.5 A0.4 ; cali dynamic extrusion compensation
M623

M622 J1
    M1002 set_filament_type:TPU
    M1002 gcode_claim_action : 8

    M109 S230

    G90
    M83
    M983.3 F1.5 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

M622 J2
    M1002 set_filament_type:TPU
    M1002 gcode_claim_action : 8

    M109 S230

    G90
    M83
    M983.3 F1.5 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

;===== auto extrude cali end =========================


    G150.2
    G150.1
    G150.2
    G150.1
    G150.2
    G150.1


G91
G1 Y-16 F12000 ; move away from the trash bin
G90

M400
;M73 P99

;===== wipe right nozzle start =====

M1002 gcode_claim_action : 14
    G150 T230
    
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
G1 Z5 F1200
G90
M73 P4 R34
G1 X175 Y160 F30000

M622 J1
    M1002 gcode_claim_action : 1
    G29.20 A3
    G29 A1 O X164.538 Y157.5 I37.9623 J125.621
    M400
    M500 ; save cali data
M623
    
M622 J2
    M1002 gcode_claim_action : 1
    
        G29.20 A3
        G29 A1 O X164.538 Y157.5 I37.9623 J125.621
    
    M400
    M500 ; save cali data
M623

M622 J0
    G28
M623

;===== bed leveling end ================================

;===== z ofst cali start =====

    M190 S55; ensure bed temp

    G383 O0 M2 T140
    M500

;===== z ofst cali end =====

G39.1 ; cali nozzle wrapped detection pos
M500

M400
;M73 P99

M141 S0
M104 S230 A

;===== mech mode sweep start =====
    M1002 gcode_claim_action : 3

    G90
M73 P17 R29
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

;===== xy ofst cali start =====

M1002 judge_flag auto_cali_toolhead_offset_flag

M622 J0
    M1012.5 N1 R1
    M500
M623

M622 J1
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S230 L0
    M620.17 T1 S220 L3
    G383 O1 T230 L0
    M500
    M141 S0
M623

M622 J2
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S230 L0
    M620.17 T1 S220 L3
    G383.3 T230 L0
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
M1002 set_filament_type:TPU
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

M104 S230 ; rise to print tmpr

M140 S55 
M190 S55 

    ;========turn off light and fans =============
    M960 S1 P0 ; turn off laser
    M960 S2 P0 ; turn off laser
    M106 S0 ; turn off fan
    M106 P2 S0 ; turn off big fan

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
G1 Z5 F1200
G1 Y295 F30000
G1 Y265 F18000

;===== nozzle load line ===============================
    G29.2 S1 ; ensure z comp turn on
    G90
    M83
    G1 Z5 F1200
    G1 X270 Y-0.5 F60000
    G28.14
    G29.2 S0
    G91
    G1 Z0.8 F1200
    G90
    G1 X250 F60000
    M109 S230
    M83
    G1 E5 F44.9008
    G1 X290 E20 F44.9008
    G91
    G3 Z0.4 I1.217 J0 P1 F60000
    G90
    M83
    G29.2 S1 ; ensure z comp turn on
;===== noozle load line end ===========================

M400
;M73 P99

M993 A1 B1 C1 ; nozzle cam detection allowed.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 K0 H0.4 ;disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect

M211 Z1
G29.99


; MACHINE_START_GCODE_END
M104 T1 S36 N0 ;Multi extruder pre cooling
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
; OBJECT_ID: 224
G1 E-2 F600
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M73 P20 R28
G1 X174.72 Y160.346 F60000
M204 S6000
G1 Z.6
G1 Z.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F2362.827
M204 S500
G3 X174.962 Y159.551 I.28 J-.35 E.04052
G1 X175.038 Y159.551 E.0029
G3 X174.77 Y160.381 I-.038 J.446 E.06119
; WIPE_START
G1 X174.616 Y160.236 E-.20029
G1 X174.582 Y160.168 E-.07265
G1 X174.55 Y160.019 E-.14465
G1 X174.569 Y159.868 E-.14473
G1 X174.638 Y159.732 E-.14502
G1 X174.747 Y159.626 E-.14461
G1 X174.814 Y159.589 E-.0728
G1 X174.962 Y159.551 E-.14468
G1 X175.038 Y159.551 E-.07261
G1 X175.186 Y159.589 E-.14482
G1 X175.312 Y159.674 E-.14472
G1 X175.363 Y159.732 E-.07274
G1 X175.431 Y159.868 E-.14468
G1 X175.45 Y160.019 E-.14496
G1 X175.427 Y160.128 E-.10604
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X173.72 Y160.346 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X173.962 Y159.551 I.28 J-.35 E.04052
G1 X174.038 Y159.551 E.0029
G3 X173.77 Y160.381 I-.038 J.446 E.06119
; WIPE_START
G1 X173.616 Y160.236 E-.20029
G1 X173.582 Y160.168 E-.07265
G1 X173.55 Y160.019 E-.14465
G1 X173.569 Y159.868 E-.14473
G1 X173.638 Y159.732 E-.14502
G1 X173.747 Y159.626 E-.14461
G1 X173.814 Y159.589 E-.0728
G1 X173.962 Y159.551 E-.14468
G1 X174.038 Y159.551 E-.07261
G1 X174.186 Y159.589 E-.14482
G1 X174.312 Y159.674 E-.14472
G1 X174.363 Y159.732 E-.07274
G1 X174.431 Y159.868 E-.14468
G1 X174.45 Y160.019 E-.14496
G1 X174.427 Y160.128 E-.10603
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X174.148 Y159.419 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X173.962 Y158.551 I-.148 J-.422 E.05774
G1 X174.038 Y158.551 E.0029
G3 X174.203 Y159.396 I-.038 J.446 E.04399
M204 S6000
G1 X175.148 Y159.419 F60000
G1 F2362.827
M204 S500
G3 X174.962 Y158.551 I-.148 J-.422 E.05774
G1 X175.038 Y158.551 E.0029
G3 X175.203 Y159.396 I-.038 J.446 E.04399
M204 S6000
G1 X176.148 Y159.419 F60000
G1 F2362.827
M204 S500
G3 X175.962 Y158.551 I-.148 J-.422 E.05774
G1 X176.038 Y158.551 E.0029
G3 X176.203 Y159.396 I-.038 J.446 E.04399
M204 S6000
G1 X175.553 Y160.019 F60000
G1 F2362.827
M204 S500
G3 X175.962 Y159.551 I.447 J-.022 E.02612
G1 X176.038 Y159.551 E.0029
G3 X175.56 Y160.079 I-.038 J.446 E.07559
; WIPE_START
G1 X175.569 Y159.868 E-.2003
G1 X175.638 Y159.732 E-.14502
G1 X175.747 Y159.626 E-.14461
G1 X175.814 Y159.589 E-.0728
G1 X175.962 Y159.551 E-.14468
G1 X176.038 Y159.551 E-.07261
G1 X176.186 Y159.589 E-.14482
G1 X176.312 Y159.674 E-.14472
G1 X176.363 Y159.732 E-.07274
G1 X176.431 Y159.868 E-.14468
G1 X176.45 Y160.019 E-.14496
G1 X176.418 Y160.168 E-.14467
G1 X176.384 Y160.236 E-.07277
G1 X176.283 Y160.351 E-.14465
G1 X176.186 Y160.405 E-.10596
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X176.586 Y160.166 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X176.962 Y159.551 I.414 J-.17 E.03188
G1 X177.038 Y159.551 E.0029
G3 X176.612 Y160.22 I-.038 J.446 E.06984
M204 S6000
G1 X177.148 Y159.419 F60000
G1 F2362.827
M204 S500
G3 X176.962 Y158.551 I-.148 J-.422 E.05774
G1 X177.038 Y158.551 E.0029
G3 X177.203 Y159.396 I-.038 J.446 E.04399
; WIPE_START
G1 X177 Y159.451 E-.1997
G1 X176.85 Y159.425 E-.14488
G1 X176.717 Y159.351 E-.14479
G1 X176.661 Y159.298 E-.07273
G1 X176.582 Y159.168 E-.14471
G1 X176.55 Y159.019 E-.14472
G1 X176.569 Y158.868 E-.14477
G1 X176.638 Y158.732 E-.14495
G1 X176.747 Y158.626 E-.14463
G1 X176.814 Y158.589 E-.0728
G1 X176.962 Y158.551 E-.14468
G1 X177.038 Y158.551 E-.07261
G1 X177.186 Y158.589 E-.14482
G1 X177.312 Y158.674 E-.14472
G1 X177.336 Y158.702 E-.03449
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X174.201 Y161.402 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X174 Y161.726 E.01448
G1 X173.799 Y161.402 E.01448
G3 X173.962 Y160.551 I.209 J-.401 E.04402
G3 X174.253 Y161.372 I.037 J.449 E.04494
M204 S6000
G1 X175.153 Y161.424 F60000
G1 F2362.827
M204 S500
G3 X174.847 Y161.424 I-.153 J-.249 E.01221
G3 X174.962 Y160.551 I.161 J-.423 E.04603
G3 X175.208 Y161.4 I.037 J.45 E.04697
M204 S6000
G1 X176.153 Y161.424 F60000
G1 F2362.827
M204 S500
G3 X175.847 Y161.424 I-.153 J-.249 E.01221
G3 X175.962 Y160.551 I.161 J-.423 E.04603
G3 X176.208 Y161.4 I.037 J.45 E.04697
M204 S6000
G1 X177.201 Y161.402 F60000
G1 F2362.827
M204 S500
G1 X177 Y161.726 E.01448
G1 X176.799 Y161.402 E.01448
G3 X176.962 Y160.551 I.209 J-.401 E.04402
G3 X177.253 Y161.372 I.037 J.449 E.04494
M204 S6000
G1 X178.201 Y161.402 F60000
G1 F2362.827
M204 S500
G1 X178 Y161.726 E.01448
G1 X177.799 Y161.402 E.01448
G3 X177.962 Y160.551 I.209 J-.401 E.04402
G3 X178.253 Y161.372 I.037 J.449 E.04494
M204 S6000
G1 X178.559 Y160.944 F60000
G1 F2362.827
M204 S500
G3 X178.962 Y160.551 I.449 J.057 E.02307
G3 X179.201 Y161.402 I.037 J.449 E.04723
G1 X179 Y161.726 E.01448
G1 X178.799 Y161.402 E.01448
G3 X178.556 Y161.004 I.209 J-.401 E.01867
; WIPE_START
G1 X178.597 Y160.797 E-.20022
G1 X178.688 Y160.674 E-.14478
G1 X178.814 Y160.589 E-.14481
G1 X178.962 Y160.551 E-.14468
G1 X179.114 Y160.564 E-.1448
G1 X179.253 Y160.626 E-.14485
G1 X179.363 Y160.732 E-.14476
G1 X179.431 Y160.868 E-.14468
G1 X179.45 Y161.019 E-.14496
G1 X179.418 Y161.168 E-.14468
G1 X179.338 Y161.298 E-.14499
G1 X179.201 Y161.402 E-.16397
G1 X179.152 Y161.481 E-.08782
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X179.429 Y159.869 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X178.962 Y159.551 I-.429 J.128 E.08366
G1 X179.038 Y159.551 E.00291
G3 X179.408 Y159.812 I-.038 J.446 E.01804
; WIPE_START
G1 X179.45 Y160.019 E-.20077
G1 X179.418 Y160.168 E-.14471
G1 X179.339 Y160.298 E-.14476
G1 X179.22 Y160.394 E-.14475
G1 X179.15 Y160.425 E-.07274
G1 X179 Y160.451 E-.14469
G1 X178.85 Y160.425 E-.14488
G1 X178.717 Y160.351 E-.14479
G1 X178.616 Y160.236 E-.14485
G1 X178.582 Y160.168 E-.07265
G1 X178.55 Y160.019 E-.14465
G1 X178.569 Y159.868 E-.14477
G1 X178.638 Y159.732 E-.14495
G1 X178.718 Y159.655 E-.10602
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X177.586 Y160.166 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X177.962 Y159.551 I.414 J-.17 E.03188
G1 X178.038 Y159.551 E.0029
G3 X177.612 Y160.22 I-.038 J.446 E.06984
M204 S6000
G1 X178.148 Y159.419 F60000
G1 F2362.827
M204 S500
G3 X177.962 Y158.551 I-.148 J-.422 E.05774
G1 X178.038 Y158.551 E.0029
G3 X178.203 Y159.396 I-.038 J.446 E.04399
; WIPE_START
G1 X178 Y159.451 E-.1997
G1 X177.85 Y159.425 E-.14488
G1 X177.717 Y159.351 E-.14479
G1 X177.661 Y159.298 E-.07273
G1 X177.582 Y159.168 E-.14471
G1 X177.55 Y159.019 E-.14472
G1 X177.569 Y158.868 E-.14477
G1 X177.638 Y158.732 E-.14495
G1 X177.747 Y158.626 E-.14463
G1 X177.814 Y158.589 E-.0728
G1 X177.962 Y158.551 E-.14468
G1 X178.038 Y158.551 E-.07261
G1 X178.186 Y158.589 E-.14482
G1 X178.312 Y158.674 E-.14472
G1 X178.336 Y158.702 E-.03449
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X179.334 Y159.294 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X178.962 Y158.551 I-.334 J-.298 E.06635
G1 X179.038 Y158.551 E.00291
G3 X179.371 Y159.247 I-.038 J.446 E.03536
M204 S6000
G1 X180.334 Y159.294 F60000
G1 F2362.827
M204 S500
G3 X179.962 Y158.551 I-.334 J-.298 E.06635
G1 X180.038 Y158.551 E.0029
G3 X180.371 Y159.247 I-.038 J.446 E.03536
M204 S6000
G1 X181.334 Y159.294 F60000
G1 F2362.827
M204 S500
G3 X180.962 Y158.551 I-.334 J-.298 E.06635
G1 X181.038 Y158.551 E.00291
G3 X181.371 Y159.247 I-.038 J.446 E.03536
M204 S6000
G1 X182.334 Y159.294 F60000
G1 F2362.827
M204 S500
G3 X181.962 Y158.551 I-.334 J-.298 E.06635
G1 X182.038 Y158.551 E.00291
G3 X182.371 Y159.247 I-.038 J.446 E.03536
; WIPE_START
G1 X182.22 Y159.394 E-.20014
G1 X182.15 Y159.425 E-.07274
G1 X182 Y159.451 E-.14469
G1 X181.85 Y159.425 E-.14488
G1 X181.717 Y159.351 E-.14479
G1 X181.661 Y159.298 E-.07273
G1 X181.582 Y159.168 E-.14471
G1 X181.55 Y159.019 E-.14472
G1 X181.569 Y158.868 E-.14477
G1 X181.638 Y158.732 E-.14495
G1 X181.748 Y158.626 E-.14467
G1 X181.814 Y158.589 E-.07271
G1 X181.962 Y158.551 E-.14468
G1 X182.038 Y158.551 E-.07266
G1 X182.146 Y158.579 E-.10616
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X183.417 Y159.161 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X183.337 Y159.297 E.006
G3 X182.834 Y158.582 I-.337 J-.297 E.0617
G1 X182.912 Y158.477 E.00498
G3 X183.207 Y158.542 I-.043 J.892 E.01152
G3 X183.526 Y159.065 I-.296 J.539 E.02438
G1 X183.46 Y159.119 E.00327
; WIPE_START
G1 X183.337 Y159.297 E-.2048
G1 X183.22 Y159.394 E-.14447
G1 X183.15 Y159.425 E-.07274
G1 X183 Y159.451 E-.14469
G1 X182.924 Y159.444 E-.07263
G1 X182.85 Y159.425 E-.07278
G1 X182.717 Y159.351 E-.14479
G1 X182.661 Y159.298 E-.07273
G1 X182.582 Y159.168 E-.14472
G1 X182.55 Y159.019 E-.14472
G1 X182.553 Y158.943 E-.07274
G1 X182.597 Y158.797 E-.14475
G1 X182.638 Y158.732 E-.07279
G1 X182.748 Y158.626 E-.14465
G1 X182.834 Y158.582 E-.09238
G1 X182.912 Y158.477 E-.12456
G1 X182.942 Y158.484 E-.02907
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X183 Y160.444 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X182.962 Y159.551 I0 J-.448 E.052
G1 X183.038 Y159.551 E.00291
G3 X183.06 Y160.44 I-.038 J.446 E.0497
M204 S6000
G1 X182.361 Y159.733 F60000
G1 F2362.827
M204 S500
G3 X181.962 Y159.551 I-.361 J.264 E.08946
G1 X182.038 Y159.551 E.00291
G3 X182.323 Y159.687 I-.038 J.446 E.01225
M204 S6000
G1 X181.361 Y159.733 F60000
G1 F2362.827
M204 S500
G3 X180.962 Y159.551 I-.361 J.264 E.08946
G1 X181.038 Y159.551 E.00291
G3 X181.323 Y159.687 I-.038 J.446 E.01225
M204 S6000
G1 X180.447 Y160.019 F60000
G1 F2362.827
M204 S500
G3 X179.962 Y159.551 I-.447 J-.022 E.07788
G1 X180.038 Y159.551 E.0029
G3 X180.446 Y159.959 I-.038 J.446 E.02383
; WIPE_START
G1 X180.418 Y160.168 E-.20045
G1 X180.339 Y160.298 E-.14476
G1 X180.22 Y160.394 E-.14475
G1 X180.15 Y160.425 E-.07274
G1 X180 Y160.451 E-.14469
G1 X179.85 Y160.425 E-.14488
G1 X179.717 Y160.351 E-.14479
G1 X179.616 Y160.236 E-.14486
G1 X179.582 Y160.168 E-.07265
G1 X179.55 Y160.019 E-.14465
G1 X179.569 Y159.868 E-.14477
G1 X179.638 Y159.732 E-.14492
G1 X179.748 Y159.626 E-.14476
G1 X179.814 Y159.589 E-.07275
G1 X179.849 Y159.58 E-.03357
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X180.312 Y161.318 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X180.201 Y161.402 E.00533
G1 X180 Y161.726 E.01448
G1 X179.799 Y161.402 E.01448
G3 X179.962 Y160.551 I.209 J-.401 E.04402
G3 X180.355 Y161.276 I.037 J.449 E.03959
M204 S6000
G1 X180.603 Y160.8 F60000
G1 F2362.827
M204 S500
G3 X180.962 Y160.551 I.405 J.201 E.01732
G3 X181.201 Y161.402 I.037 J.449 E.04723
G1 X181 Y161.726 E.01448
G1 X180.799 Y161.402 E.01448
G3 X180.58 Y160.855 I.209 J-.401 E.02441
; WIPE_START
G1 X180.688 Y160.674 E-.20017
G1 X180.814 Y160.589 E-.14481
G1 X180.962 Y160.551 E-.14468
G1 X181.114 Y160.564 E-.1448
G1 X181.253 Y160.626 E-.14485
G1 X181.363 Y160.732 E-.14476
G1 X181.431 Y160.868 E-.14468
G1 X181.45 Y161.019 E-.14496
G1 X181.418 Y161.168 E-.14468
G1 X181.338 Y161.298 E-.14499
G1 X181.201 Y161.402 E-.16397
G1 X181.072 Y161.61 E-.23265
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X182.252 Y160.627 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X182.201 Y161.402 I-.253 J.373 E.0356
G1 X182 Y161.726 E.01448
G1 X181.799 Y161.402 E.01448
G3 X181.962 Y160.551 I.209 J-.401 E.04402
G3 X182.2 Y160.597 I.037 J.449 E.00935
; WIPE_START
G1 X182.363 Y160.732 E-.20067
G1 X182.431 Y160.868 E-.14468
G1 X182.45 Y161.019 E-.14496
G1 X182.418 Y161.168 E-.14468
G1 X182.338 Y161.298 E-.14499
G1 X182.201 Y161.402 E-.16397
G1 X182 Y161.726 E-.36184
G1 X181.799 Y161.402 E-.36198
G1 X181.717 Y161.351 E-.09244
G1 X181.62 Y161.24 E-.13979
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X183.428 Y161.264 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X182.869 Y161.514 I-.498 J-.362 E.02438
G1 X182.799 Y161.402 E.00499
G3 X182.962 Y160.551 I.209 J-.401 E.04402
G3 X183.411 Y160.817 I.02 J.478 E.02097
G1 X183.519 Y160.891 E.00498
G3 X183.454 Y161.21 I-.76 J.012 E.01247
M204 S6000
G1 X183.831 Y161.479 F60000
; FEATURE: Inner wall
G1 F2362.827
M204 S500
G1 X183.932 Y161.279 E.00854
G1 X184.143 Y161.329 E.00823
G1 X184.143 Y161.643 E.01194
G1 X183.748 Y161.643 E.01499
G1 X183.804 Y161.533 E.00468
M204 S6000
G1 X184.143 Y160.763 F60000
G1 F2362.827
M204 S500
G1 X183.762 Y160.503 E.01755
G2 X183.909 Y160.126 I-1.023 J-.619 E.01546
G1 X184.143 Y160.161 E.00898
G1 X184.143 Y160.703 E.0206
M204 S6000
G1 X184.143 Y159.838 F60000
G1 F2362.827
M204 S500
G1 X183.898 Y159.864 E.00937
G2 X183.743 Y159.478 I-.962 J.162 E.01592
G1 X184.143 Y159.152 E.0196
G1 X184.143 Y159.778 E.02376
; WIPE_START
G1 X183.898 Y159.864 E-.27136
G1 X183.87 Y159.733 E-.13928
G1 X183.743 Y159.478 E-.2977
G1 X184.143 Y159.152 E-.53866
G1 X184.143 Y159.778 E-.65301
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X183.921 Y158.723 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G2 X183.729 Y158.357 I-1.166 J.379 E.01577
G1 X184.143 Y158.357 E.01573
G1 X184.143 Y158.68 E.01226
G1 X183.98 Y158.711 E.00632
; WIPE_START
G1 X183.858 Y158.567 E-.26747
G1 X183.729 Y158.357 E-.3505
G1 X184.143 Y158.357 E-.5878
G1 X184.143 Y158.68 E-.45817
G1 X183.98 Y158.711 E-.23606
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X176.375 Y159.361 Z.6 F60000
G1 X170.429 Y159.869 Z.6
G1 Z.2
G1 E2 F600
; FEATURE: Outer wall
G1 F2362.827
M204 S500
G3 X169.962 Y159.551 I-.429 J.128 E.08366
G1 X170.038 Y159.551 E.00291
G3 X170.408 Y159.812 I-.038 J.446 E.01804
; WIPE_START
G1 X170.45 Y160.019 E-.20077
G1 X170.418 Y160.168 E-.14471
G1 X170.339 Y160.298 E-.14476
G1 X170.22 Y160.394 E-.14475
G1 X170.15 Y160.425 E-.07274
G1 X170 Y160.451 E-.14471
G1 X169.85 Y160.425 E-.14486
G1 X169.717 Y160.351 E-.14479
G1 X169.616 Y160.236 E-.14485
G1 X169.582 Y160.168 E-.07265
G1 X169.55 Y160.019 E-.14465
G1 X169.569 Y159.868 E-.14477
G1 X169.638 Y159.732 E-.14492
G1 X169.718 Y159.655 E-.10605
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X168.586 Y160.166 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X168.962 Y159.551 I.414 J-.17 E.03188
G1 X169.038 Y159.551 E.0029
G3 X168.612 Y160.22 I-.038 J.446 E.06984
M204 S6000
G1 X169.148 Y159.419 F60000
G1 F2362.827
M204 S500
G3 X168.962 Y158.551 I-.148 J-.422 E.05774
G1 X169.038 Y158.551 E.0029
G3 X169.203 Y159.396 I-.038 J.446 E.04399
; WIPE_START
G1 X169 Y159.451 E-.19971
G1 X168.85 Y159.425 E-.14488
G1 X168.717 Y159.351 E-.14479
G1 X168.661 Y159.298 E-.07273
G1 X168.582 Y159.168 E-.14471
G1 X168.55 Y159.019 E-.14472
G1 X168.569 Y158.868 E-.14473
G1 X168.638 Y158.732 E-.14502
G1 X168.747 Y158.626 E-.14461
G1 X168.814 Y158.589 E-.0728
G1 X168.962 Y158.551 E-.14468
G1 X169.038 Y158.551 E-.07261
G1 X169.186 Y158.589 E-.14482
G1 X169.312 Y158.674 E-.14472
G1 X169.336 Y158.702 E-.03449
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X170.334 Y159.294 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X169.962 Y158.551 I-.334 J-.298 E.06635
G1 X170.038 Y158.551 E.00291
G3 X170.371 Y159.247 I-.038 J.446 E.03536
; WIPE_START
G1 X170.22 Y159.394 E-.20014
G1 X170.15 Y159.425 E-.07274
G1 X170 Y159.451 E-.14471
G1 X169.85 Y159.425 E-.14486
G1 X169.717 Y159.351 E-.14479
G1 X169.661 Y159.298 E-.07273
G1 X169.582 Y159.168 E-.14471
G1 X169.55 Y159.019 E-.14472
G1 X169.569 Y158.868 E-.14477
G1 X169.638 Y158.732 E-.14492
G1 X169.748 Y158.626 E-.14472
G1 X169.814 Y158.589 E-.07278
G1 X169.962 Y158.551 E-.1446
G1 X170.038 Y158.551 E-.07266
G1 X170.146 Y158.579 E-.10615
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X171.414 Y159.166 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X170.962 Y158.551 I-.414 J-.17 E.07211
G1 X171.038 Y158.551 E.00291
G3 X171.433 Y159.109 I-.038 J.446 E.0296
M204 S6000
G1 X171.429 Y159.869 F60000
G1 F2362.827
M204 S500
G3 X170.962 Y159.551 I-.429 J.128 E.08366
G1 X171.038 Y159.551 E.00291
G3 X171.408 Y159.812 I-.038 J.446 E.01804
; WIPE_START
G1 X171.45 Y160.019 E-.20077
G1 X171.418 Y160.168 E-.14467
G1 X171.384 Y160.236 E-.07277
G1 X171.283 Y160.351 E-.14465
G1 X171.15 Y160.425 E-.14487
G1 X171 Y160.451 E-.14469
G1 X170.85 Y160.425 E-.14488
G1 X170.717 Y160.351 E-.14479
G1 X170.616 Y160.236 E-.14485
G1 X170.582 Y160.168 E-.07265
G1 X170.55 Y160.019 E-.14465
G1 X170.569 Y159.868 E-.14477
G1 X170.638 Y159.732 E-.14492
G1 X170.718 Y159.655 E-.10605
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X172.429 Y159.869 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X171.962 Y159.551 I-.429 J.128 E.08366
G1 X172.038 Y159.551 E.00291
G3 X172.408 Y159.812 I-.038 J.446 E.01804
M204 S6000
G1 X172.334 Y159.294 F60000
G1 F2362.827
M204 S500
G3 X171.962 Y158.551 I-.334 J-.298 E.06635
G1 X172.038 Y158.551 E.00291
G3 X172.371 Y159.247 I-.038 J.446 E.03536
M204 S6000
G1 X173 Y159.444 F60000
G1 F2362.827
M204 S500
G3 X172.962 Y158.551 I0 J-.448 E.052
G1 X173.038 Y158.551 E.00291
G3 X173.06 Y159.44 I-.038 J.446 E.0497
M204 S6000
G1 X173.414 Y160.166 F60000
G1 F2362.827
M204 S500
G3 X172.962 Y159.551 I-.414 J-.17 E.07211
G1 X173.038 Y159.551 E.00291
G3 X173.433 Y160.109 I-.038 J.446 E.02959
; WIPE_START
G1 X173.384 Y160.236 E-.12958
G1 X173.283 Y160.351 E-.14465
G1 X173.15 Y160.425 E-.14487
G1 X173 Y160.451 E-.14469
G1 X172.85 Y160.425 E-.14488
G1 X172.717 Y160.351 E-.14479
G1 X172.616 Y160.236 E-.14485
G1 X172.582 Y160.168 E-.07265
G1 X172.55 Y160.019 E-.14465
G1 X172.569 Y159.868 E-.14477
G1 X172.638 Y159.732 E-.14495
G1 X172.748 Y159.626 E-.14467
G1 X172.814 Y159.589 E-.07271
G1 X172.962 Y159.551 E-.14468
G1 X172.996 Y159.551 E-.0326
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X172.808 Y161.416 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X172.799 Y161.402 E.0006
G3 X172.962 Y160.551 I.209 J-.401 E.04402
G3 X173.201 Y161.402 I.037 J.449 E.04723
G1 X173 Y161.726 E.01448
G1 X172.839 Y161.467 E.0116
M204 S6000
G1 X172.361 Y160.733 F60000
G1 F2362.827
M204 S500
G3 X172.201 Y161.402 I-.363 J.267 E.02979
G1 X172 Y161.726 E.01448
G1 X171.799 Y161.402 E.01448
G3 X171.962 Y160.551 I.209 J-.401 E.04402
G3 X172.323 Y160.687 I.037 J.449 E.01515
; WIPE_START
G1 X172.431 Y160.868 E-.20055
G1 X172.45 Y161.019 E-.14496
G1 X172.418 Y161.168 E-.14468
G1 X172.338 Y161.298 E-.14499
M73 P21 R28
G1 X172.201 Y161.402 E-.16397
G1 X172 Y161.726 E-.36184
G1 X171.799 Y161.402 E-.36198
G1 X171.717 Y161.351 E-.09244
G1 X171.616 Y161.236 E-.14487
G1 X171.561 Y161.1 E-.13973
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X171.416 Y161.172 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X171.337 Y161.297 E.00563
G3 X171.201 Y161.402 I-.339 J-.297 E.00659
G1 X171 Y161.726 E.01448
G1 X170.799 Y161.402 E.01448
G3 X170.962 Y160.551 I.209 J-.401 E.04402
G3 X171.434 Y161.114 I.037 J.449 E.03271
; WIPE_START
G1 X171.337 Y161.297 E-.19629
G1 X171.201 Y161.402 E-.16381
G1 X171 Y161.726 E-.36184
G1 X170.799 Y161.402 E-.36198
G1 X170.717 Y161.351 E-.09244
G1 X170.616 Y161.236 E-.14487
G1 X170.559 Y161.095 E-.14478
G1 X170.553 Y160.943 E-.14472
G1 X170.597 Y160.797 E-.14479
G1 X170.688 Y160.675 E-.14449
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X170.283 Y161.35 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X170.153 Y161.424 I-.285 J-.35 E.00572
G3 X169.847 Y161.424 I-.153 J-.249 E.01221
G3 X169.962 Y160.551 I.161 J-.423 E.04603
G3 X170.327 Y161.309 I.037 J.45 E.04126
; WIPE_START
G1 X170.153 Y161.424 E-.19812
G1 X170 Y161.467 E-.1506
G1 X169.847 Y161.424 E-.15065
G1 X169.717 Y161.351 E-.14234
G1 X169.616 Y161.236 E-.14487
G1 X169.559 Y161.095 E-.14478
G1 X169.553 Y160.943 E-.14472
G1 X169.597 Y160.797 E-.14479
G1 X169.688 Y160.674 E-.14472
G1 X169.814 Y160.589 E-.14495
G1 X169.962 Y160.551 E-.1446
G1 X170.114 Y160.564 E-.1448
G1 X170.21 Y160.607 E-.10006
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X169.201 Y161.402 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X169 Y161.726 E.01448
G1 X168.799 Y161.402 E.01448
G3 X168.962 Y160.551 I.209 J-.401 E.04402
G3 X169.253 Y161.372 I.037 J.449 E.04494
; WIPE_START
G1 X169 Y161.726 E-.4132
G1 X168.799 Y161.402 E-.36198
G1 X168.717 Y161.351 E-.09244
G1 X168.616 Y161.236 E-.14487
G1 X168.559 Y161.095 E-.14478
G1 X168.553 Y160.943 E-.14472
G1 X168.597 Y160.797 E-.14475
G1 X168.688 Y160.674 E-.14483
G1 X168.814 Y160.589 E-.14484
G1 X168.962 Y160.551 E-.14468
G1 X168.982 Y160.552 E-.01891
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X167.815 Y160.591 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X167.962 Y160.551 I.193 J.409 E.0058
G3 X168.201 Y161.402 I.037 J.449 E.04723
G1 X168 Y161.726 E.01448
G1 X167.799 Y161.402 E.01448
G3 X167.763 Y160.621 I.209 J-.401 E.03593
M204 S6000
G1 X167.321 Y161.311 F60000
G1 F2362.827
M204 S500
G1 X167.201 Y161.402 E.00575
G1 X167.132 Y161.514 E.00499
G3 X166.755 Y161.439 I-.045 J-.759 E.01476
G3 X166.481 Y160.89 I.34 J-.512 E.02438
G1 X166.59 Y160.817 E.00498
G3 X166.962 Y160.551 I.415 J.188 E.01821
G3 X167.362 Y161.267 I.037 J.449 E.03916
; WIPE_START
G1 X167.201 Y161.402 E-.19981
G1 X167.132 Y161.514 E-.12466
G1 X166.915 Y161.495 E-.20656
G1 X166.755 Y161.439 E-.16139
G1 X166.623 Y161.332 E-.16141
G1 X166.534 Y161.187 E-.16128
G1 X166.481 Y160.89 E-.28644
G1 X166.59 Y160.817 E-.12458
G1 X166.638 Y160.732 E-.09261
G1 X166.748 Y160.626 E-.14467
G1 X166.814 Y160.589 E-.07271
G1 X166.962 Y160.551 E-.14468
G1 X166.982 Y160.552 E-.01921
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X166.238 Y160.503 Z.6 F60000
G1 Z.2
G1 E2 F600
; FEATURE: Inner wall
G1 F2362.827
M204 S500
G1 X165.857 Y160.763 E.01754
G1 X165.857 Y160.161 E.02287
G1 X166.091 Y160.126 E.00898
G1 X166.156 Y160.339 E.00846
G1 X166.211 Y160.449 E.00469
M204 S6000
G1 X166.257 Y159.478 F60000
G1 F2362.827
M204 S500
G2 X166.102 Y159.864 I.807 J.548 E.01592
G1 X165.857 Y159.838 E.00937
G1 X165.857 Y159.153 E.02603
G1 X166.21 Y159.44 E.01731
; WIPE_START
G1 X166.188 Y159.59 E-.15802
G1 X166.13 Y159.734 E-.16064
G1 X166.102 Y159.864 E-.1384
G1 X165.857 Y159.838 E-.25647
G1 X165.857 Y159.153 E-.71252
G1 X166.21 Y159.44 E-.47394
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X167 Y160.444 Z.6 F60000
G1 Z.2
G1 E2 F600
; FEATURE: Outer wall
G1 F2362.827
M204 S500
G3 X166.962 Y159.551 I0 J-.448 E.052
G1 X167.038 Y159.551 E.00291
G3 X167.06 Y160.44 I-.038 J.446 E.0497
; WIPE_START
G1 X166.85 Y160.425 E-.20031
G1 X166.717 Y160.351 E-.14479
G1 X166.616 Y160.236 E-.14485
G1 X166.582 Y160.168 E-.07265
G1 X166.55 Y160.019 E-.14465
G1 X166.569 Y159.868 E-.14477
G1 X166.638 Y159.732 E-.14495
G1 X166.748 Y159.626 E-.14467
G1 X166.814 Y159.589 E-.07271
G1 X166.962 Y159.551 E-.14468
G1 X167.038 Y159.551 E-.07266
G1 X167.186 Y159.589 E-.14482
G1 X167.312 Y159.674 E-.14472
G1 X167.363 Y159.732 E-.07274
G1 X167.413 Y159.832 E-.10602
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X168.361 Y159.733 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X167.962 Y159.551 I-.361 J.264 E.08946
G1 X168.038 Y159.551 E.00291
G3 X168.323 Y159.687 I-.038 J.446 E.01225
M204 S6000
G1 X168.334 Y159.294 F60000
G1 F2362.827
M204 S500
G3 X167.962 Y158.551 I-.334 J-.298 E.06635
G1 X168.038 Y158.551 E.00291
G3 X168.371 Y159.247 I-.038 J.446 E.03536
; WIPE_START
G1 X168.22 Y159.394 E-.20014
G1 X168.15 Y159.425 E-.07274
G1 X168 Y159.451 E-.14469
G1 X167.85 Y159.425 E-.14488
G1 X167.717 Y159.351 E-.14479
G1 X167.661 Y159.298 E-.07273
G1 X167.582 Y159.168 E-.14471
G1 X167.55 Y159.019 E-.14472
G1 X167.569 Y158.868 E-.14477
G1 X167.638 Y158.732 E-.14495
G1 X167.748 Y158.626 E-.14467
G1 X167.814 Y158.589 E-.07271
G1 X167.962 Y158.551 E-.14468
G1 X168.038 Y158.551 E-.07266
G1 X168.146 Y158.579 E-.10617
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X167.337 Y159.297 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G3 X166.575 Y159.148 I-.337 J-.297 E.0356
G1 X166.474 Y159.065 E.00499
G1 X166.519 Y158.853 E.00825
G3 X166.874 Y158.514 I.524 J.193 E.01929
G1 X167.088 Y158.477 E.00825
G1 X167.166 Y158.582 E.00498
G3 X167.374 Y159.249 I-.166 J.418 E.03043
; WIPE_START
G1 X167.22 Y159.394 E-.20025
G1 X167.15 Y159.425 E-.07274
G1 X167 Y159.451 E-.14469
G1 X166.924 Y159.444 E-.07263
G1 X166.85 Y159.425 E-.07278
G1 X166.717 Y159.351 E-.14479
G1 X166.616 Y159.236 E-.14487
G1 X166.575 Y159.148 E-.09236
G1 X166.474 Y159.065 E-.12461
G1 X166.519 Y158.853 E-.20629
G1 X166.551 Y158.774 E-.08107
G1 X166.652 Y158.637 E-.16137
G1 X166.793 Y158.542 E-.1614
G1 X166.874 Y158.514 E-.08104
G1 X167.018 Y158.489 E-.13913
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X166.079 Y158.723 Z.6 F60000
G1 Z.2
G1 E2 F600
; FEATURE: Inner wall
G1 F2362.827
M204 S500
G1 X165.857 Y158.68 E.0086
G1 X165.857 Y158.357 E.01226
G1 X166.271 Y158.357 E.01574
G1 X166.142 Y158.567 E.00938
G1 X166.102 Y158.667 E.00409
; WIPE_START
G1 X165.857 Y158.68 E-.34831
G1 X165.857 Y158.357 E-.45891
G1 X166.271 Y158.357 E-.58885
G1 X166.142 Y158.567 E-.35103
G1 X166.102 Y158.667 E-.1529
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X166.252 Y161.643 Z.6 F60000
G1 Z.2
G1 E2 F600
G1 F2362.827
M204 S500
G1 X165.857 Y161.643 E.01499
G1 X165.857 Y161.329 E.01194
G1 X166.068 Y161.279 E.00823
G1 X166.225 Y161.589 E.01323
; WIPE_START
G1 X165.857 Y161.643 E-.56446
G1 X165.857 Y161.329 E-.4774
G1 X166.068 Y161.279 E-.32922
G1 X166.225 Y161.589 E-.52892
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X173.854 Y161.801 Z.6 F60000
G1 X184.6 Y162.1 Z.6
G1 Z.2
G1 E2 F600
; FEATURE: Outer wall
G1 F2362.827
M204 S500
G1 X165.4 Y162.1 E.72972
G1 X165.4 Y157.9 E.15963
G1 X184.6 Y157.9 E.72972
G1 X184.6 Y162.04 E.15735
; WIPE_START
G1 X182.6 Y162.046 E-1.90001
; WIPE_END
G1 E-.09999 F600
M204 S6000
G1 X184.141 Y161.068 Z.6 F60000
G1 Z.2
G1 E2 F600
; FEATURE: Gap infill
; LINE_WIDTH: 0.121615
G1 F3000
M204 S500
G1 X184.038 Y161.022 E.00074
; LINE_WIDTH: 0.158993
G1 X183.934 Y160.977 E.00109
; LINE_WIDTH: 0.196711
G1 X183.829 Y160.932 E.00146
; LINE_WIDTH: 0.188856
G1 X183.802 Y160.965 E.00051
; LINE_WIDTH: 0.14332
G1 X183.775 Y160.997 E.00035
; LINE_WIDTH: 0.11174
G1 X183.751 Y161.075 E.00047
M204 S6000
G1 X183.442 Y161.742 F60000
; LINE_WIDTH: 0.238671
G1 F3000
M204 S500
G3 X183.267 Y161.779 I-.525 J-2.044 E.00292
; LINE_WIDTH: 0.209809
G1 X183.13 Y161.796 E.00191
; LINE_WIDTH: 0.178387
G1 X182.753 Y161.812 E.00425
G1 X182.289 Y161.693 E.0054
M204 S6000
G1 X182.24 Y161.774 F60000
; LINE_WIDTH: 0.395676
G1 F3000
M204 S500
G1 X182.5 Y161.694 E.00799
G1 X183.079 Y161.871 E.01775
; WIPE_START
G1 X182.5 Y161.694 E-1.31032
G1 X182.24 Y161.774 E-.58968
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X182.726 Y158.345 Z.6 F60000
G1 Z.2
G1 E2 F600
; LINE_WIDTH: 0.301276
G1 F3000
M204 S500
G2 X182.208 Y158.238 I-1.499 J5.969 E.01136
; LINE_WIDTH: 0.24494
G1 X182.058 Y158.225 E.00253
G1 X181.792 Y158.238 E.00446
; LINE_WIDTH: 0.301821
G2 X181.216 Y158.357 I1.098 J6.759 E.01267
M204 S6000
G1 X180.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X180.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.244946
G1 X179.942 Y158.225 E.00447
G1 X179.792 Y158.238 E.00253
; LINE_WIDTH: 0.301765
G2 X179.216 Y158.357 I1.102 J6.779 E.01267
M204 S6000
G1 X178.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X178.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.244942
G1 X178.058 Y158.225 E.00253
G1 X177.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X177.216 Y158.357 I1.095 J6.747 E.01267
M204 S6000
G1 X176.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X176.208 Y158.238 I-1.675 J6.64 E.01267
; LINE_WIDTH: 0.244942
G1 X176.058 Y158.225 E.00253
G1 X175.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X175.216 Y158.357 I1.098 J6.76 E.01267
M204 S6000
G1 X174.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X174.208 Y158.238 I-1.675 J6.641 E.01267
; LINE_WIDTH: 0.244942
G1 X174.058 Y158.225 E.00253
G1 X173.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X173.216 Y158.357 I1.097 J6.759 E.01267
M204 S6000
G1 X172.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X172.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.24494
G1 X172.058 Y158.225 E.00253
G1 X171.792 Y158.238 E.00446
; LINE_WIDTH: 0.301821
G2 X171.216 Y158.357 I1.098 J6.759 E.01267
M204 S6000
G1 X170.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X170.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.244938
G1 X170.058 Y158.225 E.00253
G1 X169.792 Y158.238 E.00446
; LINE_WIDTH: 0.301736
G2 X169.216 Y158.357 I1.113 J6.841 E.01267
M204 S6000
G1 X168.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X168.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.24494
G1 X168.058 Y158.225 E.00253
G1 X167.792 Y158.238 E.00446
; LINE_WIDTH: 0.301271
G2 X167.274 Y158.345 I.982 J6.077 E.01137
; WIPE_START
G1 X167.792 Y158.238 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X165.858 Y161.068 Z.6 F60000
G1 Z.2
G1 E2 F600
; LINE_WIDTH: 0.121631
G1 F3000
M204 S500
G1 X165.962 Y161.023 E.00074
; LINE_WIDTH: 0.159075
G1 X166.065 Y160.977 E.00109
; LINE_WIDTH: 0.196519
G1 X166.169 Y160.931 E.00145
; LINE_WIDTH: 0.190235
G1 X166.198 Y160.965 E.00054
; LINE_WIDTH: 0.143364
G1 X166.225 Y160.997 E.00035
; LINE_WIDTH: 0.111751
G1 X166.249 Y161.076 E.00047
M204 S6000
G1 X166.558 Y161.742 F60000
; LINE_WIDTH: 0.239515
G1 F3000
M204 S500
G1 X166.717 Y161.777 E.00266
; LINE_WIDTH: 0.213518
G1 X166.857 Y161.795 E.00201
; LINE_WIDTH: 0.17863
G2 X167.247 Y161.812 I.398 J-4.587 E.00441
G1 X167.711 Y161.693 E.0054
M204 S6000
G1 X167.761 Y161.774 F60000
; LINE_WIDTH: 0.395725
G1 F3000
M204 S500
G1 X167.5 Y161.694 E.00801
G1 X166.919 Y161.871 E.01781
; WIPE_START
G1 X167.5 Y161.694 E-1.31063
G1 X167.761 Y161.774 E-.58937
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X169.835 Y161.871 Z.6 F60000
G1 Z.2
G1 E2 F600
; LINE_WIDTH: 0.340088
G1 F3000
M204 S500
G1 X170.684 Y161.65 E.02168
M204 S6000
G1 X170.7 Y161.676 F60000
; LINE_WIDTH: 0.282673
G1 F3000
M204 S500
G1 X170.263 Y161.753 E.00884
; LINE_WIDTH: 0.262866
G1 X170.143 Y161.77 E.00222
; LINE_WIDTH: 0.225006
G3 X169.977 Y161.786 I-.143 J-.592 E.00254
; LINE_WIDTH: 0.229589
G1 X169.857 Y161.77 E.00188
; LINE_WIDTH: 0.278406
G3 X169.3 Y161.676 I.976 J-7.496 E.01106
M204 S6000
G1 X169.316 Y161.65 F60000
; LINE_WIDTH: 0.340026
G1 F3000
M204 S500
G1 X170.165 Y161.871 E.02167
; WIPE_START
G1 X169.316 Y161.65 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X174.835 Y161.871 Z.6 F60000
G1 Z.2
G1 E2 F600
; LINE_WIDTH: 0.340096
G1 F3000
M204 S500
G1 X175.753 Y161.632 E.02344
M204 S6000
G1 X175.821 Y161.654 F60000
; LINE_WIDTH: 0.282683
G1 F3000
M204 S500
G1 X175.263 Y161.753 E.0113
; LINE_WIDTH: 0.262866
G1 X175.143 Y161.77 E.00222
; LINE_WIDTH: 0.225005
G3 X174.977 Y161.786 I-.143 J-.592 E.00254
; LINE_WIDTH: 0.229589
G1 X174.857 Y161.77 E.00188
; LINE_WIDTH: 0.278406
G3 X174.3 Y161.676 I.976 J-7.496 E.01106
M204 S6000
G1 X174.316 Y161.65 F60000
; LINE_WIDTH: 0.340026
G1 F3000
M204 S500
G1 X175.165 Y161.871 E.02167
M204 S6000
G1 X175.835 Y161.871 F60000
; LINE_WIDTH: 0.340096
G1 F3000
M204 S500
G1 X176.684 Y161.65 E.02168
M204 S6000
G1 X176.7 Y161.676 F60000
; LINE_WIDTH: 0.282683
G1 F3000
M204 S500
G1 X176.263 Y161.753 E.00884
; LINE_WIDTH: 0.262866
G1 X176.143 Y161.77 E.00222
; LINE_WIDTH: 0.225005
G3 X175.977 Y161.786 I-.143 J-.592 E.00254
; LINE_WIDTH: 0.229589
G1 X175.857 Y161.77 E.00188
; LINE_WIDTH: 0.279172
G3 X175.178 Y161.654 I1.204 J-9.143 E.01353
M204 S6000
G1 X175.247 Y161.632 F60000
; LINE_WIDTH: 0.340026
G1 F3000
M204 S500
G1 X176.165 Y161.871 E.02343
; WIPE_START
G1 X175.247 Y161.632 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S6000
G1 X177.784 Y158.357 Z.6 F60000
G1 Z.2
G1 E2 F600
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X177.208 Y158.238 I-1.675 J6.64 E.01267
; LINE_WIDTH: 0.244942
G1 X177.058 Y158.225 E.00253
G1 X176.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X176.216 Y158.357 I1.095 J6.747 E.01267
M204 S6000
G1 X175.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X175.208 Y158.238 I-1.675 J6.64 E.01267
; LINE_WIDTH: 0.244942
G1 X175.058 Y158.225 E.00253
G1 X174.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X174.216 Y158.357 I1.097 J6.759 E.01267
M204 S6000
G1 X173.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X173.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.24494
G1 X173.058 Y158.225 E.00253
G1 X172.792 Y158.238 E.00446
; LINE_WIDTH: 0.301821
G2 X172.216 Y158.357 I1.098 J6.759 E.01267
M204 S6000
G1 X171.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X171.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.244938
G1 X171.058 Y158.225 E.00253
G1 X170.792 Y158.238 E.00446
; LINE_WIDTH: 0.301736
G2 X170.216 Y158.357 I1.113 J6.841 E.01267
M204 S6000
G1 X169.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X169.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.244942
G1 X169.058 Y158.225 E.00253
G1 X168.792 Y158.238 E.00446
; LINE_WIDTH: 0.301763
G2 X168.216 Y158.357 I1.097 J6.759 E.01267
M204 S6000
G1 X167.901 Y158.329 F60000
; LINE_WIDTH: 0.155293
G1 F3000
M204 S500
G1 X167.179 Y158.179 E.0069
; LINE_WIDTH: 0.159147
G1 X166.99 Y158.195 E.00183
; LINE_WIDTH: 0.192479
G2 X166.788 Y158.212 I.109 J2.39 E.00253
; LINE_WIDTH: 0.220338
G1 X166.61 Y158.243 E.00266
M204 S6000
G1 X166.83 Y158.129 F60000
; LINE_WIDTH: 0.370601
G1 F3000
M204 S500
G3 X167.49 Y158.302 I-1.684 J7.763 E.01859
G1 X167.5 Y158.305 E.0003
G3 X168.075 Y158.129 I2.372 J6.69 E.01639
M204 S6000
G1 X167.925 Y158.129 F60000
; LINE_WIDTH: 0.380746
G1 F3000
M204 S500
G3 X168.5 Y158.305 I-1.837 J6.997 E.0169
G3 X169.075 Y158.129 I2.431 J6.879 E.01689
M204 S6000
G1 X168.925 Y158.129 F60000
; LINE_WIDTH: 0.380699
G1 F3000
M204 S500
G3 X169.5 Y158.305 I-1.855 J7.054 E.01689
G3 X170.075 Y158.129 I2.38 J6.714 E.01689
M204 S6000
G1 X169.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X170.5 Y158.305 I-1.855 J7.054 E.01689
G3 X171.075 Y158.129 I2.38 J6.714 E.01689
M204 S6000
G1 X170.925 Y158.129 F60000
; LINE_WIDTH: 0.380711
G1 F3000
M204 S500
G3 X171.5 Y158.305 I-1.802 J6.883 E.0169
G3 X172.075 Y158.129 I2.4 J6.781 E.0169
M204 S6000
G1 X171.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X172.5 Y158.305 I-1.802 J6.883 E.0169
G3 X173.075 Y158.129 I2.4 J6.781 E.0169
M204 S6000
G1 X172.925 Y158.129 F60000
; LINE_WIDTH: 0.380746
G1 F3000
M204 S500
G3 X173.5 Y158.305 I-1.837 J6.997 E.0169
G3 X174.075 Y158.129 I2.431 J6.879 E.01689
M204 S6000
G1 X173.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X174.5 Y158.305 I-1.837 J6.997 E.0169
G3 X175.075 Y158.129 I2.432 J6.881 E.01689
M204 S6000
G1 X174.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X175.5 Y158.305 I-1.837 J6.997 E.0169
G3 X176.075 Y158.129 I2.432 J6.881 E.01689
M204 S6000
G1 X175.925 Y158.129 F60000
; LINE_WIDTH: 0.380751
G1 F3000
M204 S500
G3 X176.5 Y158.305 I-1.801 J6.882 E.0169
G3 X177.074 Y158.129 I2.422 J6.845 E.01688
M204 S6000
G1 X176.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X177.5 Y158.305 I-1.801 J6.882 E.0169
G3 X178.074 Y158.129 I2.422 J6.845 E.01688
M204 S6000
G1 X177.925 Y158.129 F60000
; LINE_WIDTH: 0.380711
G1 F3000
M204 S500
G3 X178.5 Y158.305 I-1.801 J6.882 E.0169
G3 X179.075 Y158.129 I2.4 J6.782 E.0169
M204 S6000
G1 X178.925 Y158.129 F60000
; LINE_WIDTH: 0.38067
G1 F3000
M204 S500
G3 X179.5 Y158.305 I-1.806 J6.896 E.01689
G3 X180.075 Y158.129 I2.382 J6.719 E.01689
M204 S6000
G1 X179.925 Y158.129 F60000
; LINE_WIDTH: 0.380711
G1 F3000
M204 S500
G3 X180.5 Y158.305 I-1.801 J6.882 E.0169
G3 X181.075 Y158.129 I2.4 J6.782 E.0169
M204 S6000
G1 X180.925 Y158.129 F60000
G1 F3000
M204 S500
G3 X181.5 Y158.305 I-1.801 J6.882 E.0169
G3 X182.075 Y158.129 I2.4 J6.782 E.0169
M204 S6000
G1 X181.925 Y158.129 F60000
; LINE_WIDTH: 0.370644
G1 F3000
M204 S500
G1 X182.49 Y158.302 E.01609
G2 X183.17 Y158.129 I-.767 J-4.435 E.01914
M204 S6000
G1 X183.39 Y158.243 F60000
; LINE_WIDTH: 0.219568
G1 F3000
M204 S500
G2 X183.198 Y158.211 I-.482 J2.277 E.00286
; LINE_WIDTH: 0.191251
G1 X183.01 Y158.195 E.00233
; LINE_WIDTH: 0.156133
G1 X182.821 Y158.179 E.00178
G1 X182.099 Y158.329 E.00694
M204 S6000
G1 X181.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X181.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.24494
G1 X181.058 Y158.225 E.00253
G1 X180.792 Y158.238 E.00446
; LINE_WIDTH: 0.301821
G2 X180.216 Y158.357 I1.098 J6.759 E.01267
M204 S6000
G1 X179.784 Y158.357 F60000
; LINE_WIDTH: 0.301827
G1 F3000
M204 S500
G2 X179.208 Y158.238 I-1.675 J6.642 E.01267
; LINE_WIDTH: 0.24494
G1 X179.058 Y158.225 E.00253
G1 X178.792 Y158.238 E.00446
; LINE_WIDTH: 0.301821
G2 X178.216 Y158.357 I1.098 J6.759 E.01267
; WIPE_START
M204 S500
G1 X178.792 Y158.238 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S6000
G17
G3 Z.6 I-1.212 J-.113 P1  F60000
G1 X167.428 Y279.944 Z.6
G1 Z.2
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S6000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
G1  Y271.444  E0.0190
G1  X198.928  E1.1592
M73 P21 R27
G1  Y271.944  E0.0190
G1  X167.928  E1.1782
G1  Y272.444  E0.0190
G1  X198.928  E1.1782
G1  Y272.944  E0.0190
G1  X167.928  E1.1782
G1  Y273.444  E0.0190
G1  X198.928  E1.1782
G1  Y273.944  E0.0190
G1  X167.928  E1.1782
G1  Y274.444  E0.0190
M73 P22 R27
G1  X198.928  E1.1782
G1  Y274.944  E0.0190
G1  X167.928  E1.1782
G1  Y275.444  E0.0190
G1  X198.928  E1.1782
G1  Y275.944  E0.0190
G1  X167.928  E1.1782
G1  Y276.444  E0.0190
G1  X198.928  E1.1782
G1  Y276.944  E0.0190
G1  X167.928  E1.1782
G1  Y277.444  E0.0190
G1  X198.928  E1.1782
G1  Y277.944  E0.0190
G1  X167.928  E1.1782
G1  Y278.444  E0.0190
G1  X198.928  E1.1782
G1  Y278.944  E0.0190
G1  X167.928  E1.1782
G1  Y279.444  E0.0190
G1  X198.928  E1.1782
G1  Y279.944  E0.0190
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z.6 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z.2
G1 E2 F600
M104 T1 S220 N0 ;Multi extruder pre heating
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S500
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.194  E0.0796
G1  X167.678  E2.5068
G1  Y268.194  E0.0796
G1  X199.178  E2.5068
G1  Y269.194  E0.0796
M73 P23 R27
G1  X167.678  E2.5068
G1  Y270.194  E0.0796
G1  X199.178  E2.5068
M204 S6000
G1  Y270.694 
G1  X168.178  F458
G1  Y269.694 
M73 P24 R27
G1  X198.678 
G1  Y268.694 
G1  X168.178 
G1  Y267.694 
G1  X198.678 
G1  Y266.694 
M73 P24 R26
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3

G1 E-2 F600
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E20

;deretract


M73 P25 R26
;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

M73 P30 R24
G1 Y320 F30000
M73 P31 R24
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z3.2 F3000

M204 S500


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S0
M106 P2 S0
G1 E-.4 F1800
G1 X204.318 Y264.712 F60000
G1 Z.2
G17
G3 Z.6 I1.217 J0 P1
G1 X204.318 Y247.518 Z.6
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z.2
G1 E.4 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
; LINE_WIDTH: 0.500000
M204 S500
G1  X170.428 Y252.694  E0.1140 F990
G1 E-0.4000 F1800
M204 S6000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F990
G1 E0.4000 F1800
M204 S500
G1  X199.428  E1.1022 F990
G1  Y253.194  E0.0190
G1  X167.428  E1.2162 F1125
G1  Y253.694  E0.0190
G1  X199.428  E1.2162 F1374
G1  Y254.194  E0.0190
G1  X167.428  E1.2162 F2625
G1  Y254.694  E0.0190
G1  X199.428  E1.2162 F2675
G1  Y255.194  E0.0190
G1  X167.428  E1.2162
G1  Y255.694  E0.0190
G1  X199.428  E1.2162
G1  Y256.194  E0.0190
G1  X167.428  E1.2162
G1  Y256.694  E0.0190
G1  X199.428  E1.2162
G1  Y257.194  E0.0190
G1  X167.428  E1.2162
G1  Y257.694  E0.0190
G1  X199.428  E1.2162
G1  Y258.194  E0.0190
G1  X167.428  E1.2162
G1  Y258.694  E0.0190
G1  X199.428  E1.2162
G1  Y259.194  E0.0190
G1  X167.428  E1.2162
G1  Y259.694  E0.0190
G1  X199.428  E1.2162
G1  Y260.194  E0.0190
G1  X167.428  E1.2162
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  Y260.944  E0.1710 F3000
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S6000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
M73 P32 R24
G1  Y261.444  E0.0190
G1  X198.928  E1.1592
G1  Y261.944  E0.0190
G1  X167.928  E1.1782
G1  Y262.444  E0.0190
G1  X198.928  E1.1782
G1  Y262.944  E0.0190
G1  X167.928  E1.1782
G1  Y263.444  E0.0190
G1  X198.928  E1.1782
G1  Y263.944  E0.0190
G1  X167.928  E1.1782
G1  Y264.444  E0.0190
G1  X198.928  E1.1782
G1  Y264.944  E0.0190
G1  X167.928  E1.1782
G1  Y265.444  E0.0190
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X166.928 Y280.444  
M204 S500
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146 F3000
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S6000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S500
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F3000
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
M204 S6000
G1  X167.887 Y282.267  
M204 S500
G3  X164.847 Y278.677   I17.967 J-18.296 E0.1791
G3  X165.847 Y275.408   I2.339 J-1.072 E0.1421
G2  X166.471 Y273.543   I-2.475 J-1.865 E0.0761
G2  X166.468 Y258.957   I-337.342 J-7.224 E0.5544
G2  X164.844 Y256.143   I-4.139 J0.513 E0.1268
G3  X165.034 Y253.704   I1.815 J-1.086 E0.0992
G3  X168.154 Y250.105   I21.141 J15.177 E0.1813
G3  X172.131 Y250.765   I1.662 J2.301 E0.1704
G2  X175.083 Y251.737   I2.968 J-4.042 E0.1201
G2  X191.952 Y251.734   I8.345 J-475.874 E0.6412
G2  X195.990 Y249.787   I-0.773 J-6.762 E0.1736
G3  X197.298 Y249.525   I1.128 J2.239 E0.0513
G3  X198.969 Y250.371   I-0.237 J2.541 E0.0729
G3  X202.009 Y253.961   I-17.961 J18.291 E0.1791
G3  X201.009 Y257.230   I-2.339 J1.072 E0.1421
G2  X200.385 Y259.094   I2.475 J1.865 E0.0760
G2  X200.388 Y273.681   I337.358 J7.225 E0.5544
G2  X202.012 Y276.495   I4.139 J-0.513 E0.1268
G3  X201.822 Y278.934   I-1.815 J1.086 E0.0992
G3  X198.702 Y282.533   I-21.141 J-15.177 E0.1813
G3  X194.725 Y281.873   I-1.662 J-2.301 E0.1704
G2  X191.773 Y280.901   I-2.968 J4.042 E0.1201
G2  X174.904 Y280.904   I-8.345 J475.847 E0.6412
G2  X170.866 Y282.851   I0.773 J6.763 E0.1736
G3  X167.887 Y282.267   I-1.116 J-2.196 E0.1243
; WIPE_TOWER_END

; WIPE_START
M204 S500
G1 X168.012 Y282.403 E-.06991
G1 X168.154 Y282.534 E-.07333
G1 X168.306 Y282.653 E-.07331
G1 X168.466 Y282.76 E-.07333
G1 X168.635 Y282.854 E-.07332
G1 X168.675 Y282.872 E-.0168
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S6000
G1 X201.643 Y161.643
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X198.357 Y161.643 E.12239
G1 X198.357 Y158.357 E.12239
G1 X201.643 Y158.357 E.12239
G1 X201.643 Y161.583 E.12015
M204 S6000
G1 X202.1 Y162.1 F60000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X197.9 Y162.1 E.15643
G1 X197.9 Y157.9 E.15643
G1 X202.1 Y157.9 E.15643
G1 X202.1 Y162.04 E.1542
; WIPE_START
G1 X201.1 Y162.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.201 J-.199 P1  F60000
G1 X200.517 Y158.54 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50896
G1 F6300
M204 S500
G1 X201.254 Y159.277 E.0396
G1 X201.254 Y159.936 E.02503
G1 X200.064 Y158.746 E.06395
G1 X199.405 Y158.746 E.02503
G1 X201.254 Y160.595 E.09935
G1 X201.254 Y161.254 E.02503
G1 X198.746 Y158.746 E.13474
G1 X198.746 Y159.405 E.02503
G1 X200.595 Y161.254 E.09934
G1 X199.936 Y161.254 E.02503
G1 X198.746 Y160.064 E.06395
G1 X198.746 Y160.723 E.02503
G1 X199.483 Y161.46 E.0396
; WIPE_START
G1 X198.776 Y160.753 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 1 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z0.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer1 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 2/25
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S183.6
M106 P2 S191
; open powerlost recovery
M1003 S1
; OBJECT_ID: 265
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898 F60000
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 2 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z0.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer2 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146 F5400
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.112 Y276.190   I3.543 J-0.156 E0.1075
G1 E-0.4000 F1800
M204 S10000
G1  X201.640 Y278.401   F600
G1 E0.4000 F1800
M204 S8000
G3  X197.871 Y282.511   I-16.869 J-11.684 E0.2126 F5400
G3  X194.841 Y281.395   I-0.631 J-2.959 E0.1295
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X199.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
M73 P32 R23
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #3
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
M73 P33 R23
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z.8 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S78 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


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



M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E19

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z3.4 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y277.194 F60000
G1 Z.4

; filament start gcode
G1 X199.428 Y277.194 Z.8
G1 Z.4
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X200.928 
G1  X199.428  F240
G1  X199.928  F600
G1  Y277.694 
G1  X198.928 
G1  Y276.694 
G1  X200.428 
G1  Y278.194 
G1  X198.428 
G1  Y276.194 
G1  X196.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X167.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X199.428  E1.2162
G1  Y274.194  E0.0285
G1  X167.428  E1.2162
G1  Y273.444  E0.0285
G1  X199.428  E1.2162
G1  Y272.694  E0.0285
G1  X167.428  E1.2162
G1  Y271.944  E0.0285
G1  X199.428  E1.2162
G1  Y271.194  E0.0285
G1  X167.428  E1.2162
G1  Y270.444  E0.0285
G1  X199.428  E1.2162
G1  Y269.694  E0.0285
G1  X167.428  E1.2162
G1  Y268.944  E0.0285
G1  X199.428  E1.2162
G1  Y268.194  E0.0285
G1  X167.428  E1.2162
G1  Y267.444  E0.0285
M73 P34 R23
G1  X199.428  E1.2162
G1  Y266.694  E0.0285
G1  X167.428  E1.2162
G1  Y265.944  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162 F2363
G1  Y277.944  E0.0760
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #3
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.695 Y160.268
G1 Z.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.305 J-.271 E.02829
G1 X175.035 Y159.591 E.00218
G3 X174.738 Y160.31 I-.035 J.406 E.04798
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.18735
G1 X174.59 Y160.017 E-.13182
G1 X174.607 Y159.88 E-.13185
G1 X174.67 Y159.756 E-.13206
G1 X174.831 Y159.626 E-.1967
G1 X174.965 Y159.591 E-.1318
G1 X175.035 Y159.591 E-.06615
G1 X175.169 Y159.626 E-.13196
G1 X175.33 Y159.756 E-.19658
G1 X175.393 Y159.88 E-.1319
G1 X175.41 Y160.018 E-.13201
G1 X175.381 Y160.153 E-.13187
G1 X175.258 Y160.32 E-.1965
G1 X175.257 Y160.32 E-.00145
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.695 Y160.268 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.305 J-.271 E.02829
G1 X174.035 Y159.591 E.00218
G3 X173.738 Y160.31 I-.035 J.406 E.04798
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00218
G3 X173.369 Y159.824 I-.035 J.406 E.01339
M204 S10000
G1 X173 Y159.405 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I0 J-.408 E.03908
G1 X173.035 Y158.591 E.00218
G3 X173.06 Y159.4 I-.035 J.406 E.03719
M204 S10000
G1 X172.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.255 J-.318 E.04771
G1 X172.035 Y158.591 E.00218
G3 X172.299 Y159.275 I-.035 J.406 E.02856
M204 S10000
G1 X172.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00218
G3 X172.369 Y159.824 I-.035 J.406 E.01339
M204 S10000
G1 X171.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06287
G1 X171.035 Y159.591 E.00218
G3 X171.369 Y159.824 I-.035 J.406 E.01339
M204 S10000
G1 X171.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.377 J-.155 E.05419
G1 X171.035 Y158.591 E.00218
G3 X171.396 Y159.094 I-.035 J.406 E.02208
; WIPE_START
M204 S8000
G1 X171.258 Y159.32 E-.2508
G1 X171.137 Y159.387 E-.13193
G1 X171 Y159.411 E-.13191
G1 X170.863 Y159.387 E-.13181
G1 X170.692 Y159.271 E-.19658
G1 X170.619 Y159.153 E-.13203
G1 X170.59 Y159.017 E-.13182
G1 X170.607 Y158.88 E-.13191
G1 X170.67 Y158.756 E-.13194
G1 X170.831 Y158.626 E-.19668
G1 X170.965 Y158.591 E-.13189
G1 X171.035 Y158.591 E-.06615
G1 X171.169 Y158.626 E-.13196
G1 X171.171 Y158.627 E-.00259
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X174.135 Y159.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.135 J-.385 E.04339
G1 X174.035 Y158.591 E.00218
G3 X174.19 Y159.358 I-.035 J.406 E.03288
M204 S10000
G1 X175.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.135 J-.385 E.04339
G1 X175.035 Y158.591 E.00218
G3 X175.19 Y159.358 I-.035 J.406 E.03288
M204 S10000
G1 X176.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.135 J-.385 E.04339
G1 X176.035 Y158.591 E.00218
G3 X176.19 Y159.358 I-.035 J.406 E.03288
M204 S10000
G1 X177.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.135 J-.385 E.04339
G1 X177.035 Y158.591 E.00218
G3 X177.19 Y159.358 I-.035 J.406 E.03288
M204 S10000
G1 X176.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.155 E.02396
G1 X177.035 Y159.591 E.00218
G3 X176.649 Y160.205 I-.035 J.406 E.0523
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.18737
G1 X176.607 Y159.88 E-.13191
G1 X176.67 Y159.756 E-.13196
G1 X176.831 Y159.626 E-.19676
G1 X176.965 Y159.591 E-.1318
G1 X177.035 Y159.591 E-.06615
G1 X177.169 Y159.626 E-.13196
G1 X177.33 Y159.756 E-.19658
G1 X177.393 Y159.88 E-.1319
G1 X177.41 Y160.018 E-.13201
G1 X177.381 Y160.153 E-.13187
G1 X177.258 Y160.32 E-.1965
G1 X177.137 Y160.387 E-.132
G1 X177.136 Y160.388 E-.00124
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.593 Y160.017 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00218
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18746
G1 X175.67 Y159.756 E-.13206
G1 X175.831 Y159.626 E-.1967
G1 X175.965 Y159.591 E-.1318
G1 X176.035 Y159.591 E-.06615
G1 X176.169 Y159.626 E-.13196
G1 X176.33 Y159.756 E-.19658
G1 X176.393 Y159.88 E-.1319
G1 X176.41 Y160.018 E-.13201
G1 X176.381 Y160.153 E-.13187
G1 X176.258 Y160.32 E-.1965
G1 X176.137 Y160.387 E-.132
G1 X176 Y160.411 E-.13191
G1 X175.999 Y160.411 E-.00111
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.623 Y160.152 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.155 E.02396
G1 X178.035 Y159.591 E.00218
G3 X177.649 Y160.205 I-.035 J.406 E.0523
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18737
G1 X177.607 Y159.88 E-.13191
G1 X177.67 Y159.756 E-.13196
G1 X177.831 Y159.626 E-.19676
G1 X177.965 Y159.591 E-.1318
G1 X178.035 Y159.591 E-.06615
G1 X178.169 Y159.626 E-.13196
G1 X178.33 Y159.756 E-.19658
G1 X178.393 Y159.88 E-.1319
G1 X178.41 Y160.018 E-.13201
G1 X178.381 Y160.153 E-.13187
G1 X178.258 Y160.32 E-.1965
G1 X178.137 Y160.387 E-.132
G1 X178.136 Y160.388 E-.00124
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.391 Y159.88 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00218
G3 X179.369 Y159.824 I-.035 J.406 E.01339
M204 S10000
G1 X179.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.255 J-.318 E.04771
G1 X179.035 Y158.591 E.00218
G3 X179.299 Y159.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X179.137 Y159.387 E-.18753
G1 X179 Y159.411 E-.13191
G1 X178.863 Y159.387 E-.13181
G1 X178.692 Y159.271 E-.19658
G1 X178.619 Y159.153 E-.13203
G1 X178.59 Y159.017 E-.13182
G1 X178.607 Y158.88 E-.13191
G1 X178.67 Y158.756 E-.13196
G1 X178.831 Y158.626 E-.19665
G1 X178.965 Y158.591 E-.13192
G1 X179.035 Y158.591 E-.06615
G1 X179.169 Y158.626 E-.13196
G1 X179.33 Y158.756 E-.19658
G1 X179.331 Y158.757 E-.00121
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X178.135 Y159.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.135 J-.385 E.04339
G1 X178.035 Y158.591 E.00218
G3 X178.19 Y159.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.18745
G1 X177.863 Y159.387 E-.13181
G1 X177.692 Y159.271 E-.19658
G1 X177.619 Y159.153 E-.13203
G1 X177.59 Y159.017 E-.13182
G1 X177.607 Y158.88 E-.13191
G1 X177.67 Y158.756 E-.13196
G1 X177.831 Y158.626 E-.19667
G1 X177.965 Y158.591 E-.13189
G1 X178.035 Y158.591 E-.06615
G1 X178.169 Y158.626 E-.13196
G1 X178.33 Y158.756 E-.19658
G1 X178.393 Y158.88 E-.1319
G1 X178.393 Y158.881 E-.00128
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.255 Y159.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.255 J-.318 E.04771
G1 X180.035 Y158.591 E.00218
G3 X180.299 Y159.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X180.137 Y159.387 E-.18753
G1 X180 Y159.411 E-.13191
G1 X179.863 Y159.387 E-.13181
G1 X179.692 Y159.271 E-.19658
G1 X179.619 Y159.153 E-.13203
G1 X179.59 Y159.017 E-.13182
G1 X179.607 Y158.88 E-.13191
G1 X179.67 Y158.756 E-.13194
G1 X179.831 Y158.626 E-.19671
G1 X179.965 Y158.591 E-.13186
G1 X180.035 Y158.591 E-.06615
G1 X180.169 Y158.626 E-.13196
G1 X180.33 Y158.756 E-.1966
G1 X180.331 Y158.757 E-.0012
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X180.135 Y160.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04339
G1 X180.035 Y159.591 E.00218
G3 X180.19 Y160.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X180 Y160.411 E-.18745
G1 X179.863 Y160.387 E-.13181
G1 X179.692 Y160.271 E-.1966
G1 X179.619 Y160.153 E-.13201
G1 X179.59 Y160.017 E-.13182
G1 X179.607 Y159.88 E-.13191
G1 X179.716 Y159.703 E-.19669
G1 X179.831 Y159.626 E-.13208
G1 X179.965 Y159.591 E-.13174
G1 X180.035 Y159.591 E-.06615
G1 X180.169 Y159.626 E-.13196
G1 X180.33 Y159.756 E-.1966
G1 X180.393 Y159.88 E-.13182
G1 X180.393 Y159.881 E-.00137
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.329 Y159.756 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.329 J.241 E.06723
G1 X181.035 Y159.591 E.00218
G3 X181.291 Y159.711 I-.035 J.406 E.00905
M204 S10000
G1 X181.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.255 J-.318 E.04771
G1 X181.035 Y158.591 E.00218
G3 X181.299 Y159.275 I-.035 J.406 E.02856
M204 S10000
G1 X182.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.255 J-.318 E.04771
G1 X182.035 Y158.591 E.00218
G3 X182.299 Y159.275 I-.035 J.406 E.02856
M204 S10000
G1 X182.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.329 J.241 E.06723
G1 X182.035 Y159.591 E.00218
G3 X182.291 Y159.711 I-.035 J.406 E.00905
M204 S10000
G1 X182.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.407 J-.02 E.01963
G1 X183.035 Y159.591 E.00218
G3 X182.6 Y160.077 I-.035 J.406 E.05664
; WIPE_START
M204 S8000
G1 X182.607 Y159.88 E-.18746
G1 X182.67 Y159.756 E-.13206
G1 X182.77 Y159.66 E-.13182
G1 X182.965 Y159.591 E-.19668
G1 X183.035 Y159.591 E-.06615
G1 X183.169 Y159.626 E-.13196
G1 X183.33 Y159.756 E-.1966
G1 X183.393 Y159.88 E-.13182
G1 X183.41 Y160.018 E-.13208
G1 X183.381 Y160.153 E-.13187
G1 X183.258 Y160.32 E-.1965
G1 X183.137 Y160.387 E-.132
G1 X183 Y160.411 E-.13191
G1 X182.999 Y160.411 E-.00111
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X183.377 Y159.152 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.377 J-.155 E.05419
G1 X183.035 Y158.591 E.00218
G3 X183.396 Y159.094 I-.035 J.406 E.02208
; WIPE_START
M204 S8000
G1 X183.258 Y159.32 E-.25079
G1 X183.137 Y159.387 E-.13193
G1 X183 Y159.411 E-.13191
G1 X182.863 Y159.387 E-.13182
G1 X182.692 Y159.271 E-.19658
G1 X182.619 Y159.153 E-.13203
G1 X182.59 Y159.017 E-.13182
G1 X182.633 Y158.815 E-.19671
G1 X182.716 Y158.703 E-.13193
G1 X182.831 Y158.626 E-.13189
G1 X182.965 Y158.591 E-.13192
G1 X183.035 Y158.591 E-.06615
G1 X183.169 Y158.626 E-.13196
G1 X183.171 Y158.627 E-.00258
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z.8 F60000
G1 Z.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; WIPE_START
G1 X183.411 Y161.898 E-.93939
G1 X183.358 Y161.725 E-.17159
G1 X183.505 Y161.626 E-.16889
G1 X183.604 Y161.531 E-.12952
G1 X183.746 Y161.3 E-.2581
G1 X183.786 Y161.17 E-.12959
G1 X183.791 Y161.061 E-.10292
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.377 Y161.152 Z.8 F60000
G1 Z.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.377 J-.155 E.05419
G1 X183.035 Y160.591 E.00218
G3 X183.396 Y161.094 I-.035 J.406 E.02208
; WIPE_START
M204 S8000
G1 X183.258 Y161.32 E-.2508
G1 X183.137 Y161.387 E-.13193
G1 X183 Y161.411 E-.13191
G1 X182.863 Y161.387 E-.13182
G1 X182.692 Y161.271 E-.19658
G1 X182.619 Y161.153 E-.13203
G1 X182.59 Y161.017 E-.13182
G1 X182.607 Y160.88 E-.13185
G1 X182.67 Y160.756 E-.13206
G1 X182.77 Y160.66 E-.13182
G1 X182.965 Y160.591 E-.19667
G1 X183.035 Y160.591 E-.06615
G1 X183.169 Y160.626 E-.13196
G1 X183.171 Y160.627 E-.0026
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.255 J-.318 E.0477
G1 X182.035 Y160.591 E.00218
G3 X182.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X182.137 Y161.387 E-.18754
G1 X182 Y161.411 E-.13191
G1 X181.863 Y161.387 E-.13182
G1 X181.692 Y161.271 E-.19658
G1 X181.619 Y161.153 E-.13203
G1 X181.59 Y161.017 E-.13182
G1 X181.607 Y160.88 E-.13191
G1 X181.67 Y160.756 E-.13196
G1 X181.77 Y160.66 E-.13189
G1 X181.965 Y160.591 E-.19666
G1 X182.035 Y160.591 E-.06615
G1 X182.169 Y160.626 E-.13195
G1 X182.33 Y160.756 E-.19658
G1 X182.331 Y160.757 E-.0012
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.255 J-.318 E.0477
G1 X181.035 Y160.591 E.00218
G3 X181.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X181.137 Y161.387 E-.18754
G1 X181 Y161.411 E-.13191
G1 X180.863 Y161.387 E-.13182
G1 X180.692 Y161.271 E-.19658
G1 X180.619 Y161.153 E-.13203
G1 X180.59 Y161.017 E-.13182
G1 X180.607 Y160.88 E-.13191
G1 X180.67 Y160.756 E-.13196
G1 X180.77 Y160.66 E-.13189
G1 X180.965 Y160.591 E-.19666
G1 X181.035 Y160.591 E-.06615
G1 X181.169 Y160.626 E-.13195
G1 X181.33 Y160.756 E-.19658
G1 X181.331 Y160.757 E-.0012
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.255 J-.318 E.0477
G1 X180.035 Y160.591 E.00218
G3 X180.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X180.137 Y161.387 E-.18754
G1 X180 Y161.411 E-.13191
G1 X179.863 Y161.387 E-.13182
G1 X179.692 Y161.271 E-.19658
G1 X179.619 Y161.153 E-.13203
G1 X179.59 Y161.017 E-.13182
G1 X179.607 Y160.88 E-.13191
G1 X179.716 Y160.703 E-.19669
G1 X179.831 Y160.626 E-.13208
G1 X179.965 Y160.591 E-.13174
G1 X180.035 Y160.591 E-.06615
G1 X180.169 Y160.626 E-.13195
G1 X180.33 Y160.756 E-.1966
G1 X180.331 Y160.757 E-.00118
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.255 J-.318 E.0477
G1 X179.035 Y160.591 E.00218
G3 X179.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X179.137 Y161.387 E-.18754
G1 X179 Y161.411 E-.13191
G1 X178.863 Y161.387 E-.13182
G1 X178.692 Y161.271 E-.19658
G1 X178.619 Y161.153 E-.13203
G1 X178.59 Y161.017 E-.13182
G1 X178.607 Y160.88 E-.13191
G1 X178.67 Y160.756 E-.13196
G1 X178.77 Y160.66 E-.13189
G1 X178.965 Y160.591 E-.19666
G1 X179.035 Y160.591 E-.06615
G1 X179.169 Y160.626 E-.13195
G1 X179.33 Y160.756 E-.19658
G1 X179.331 Y160.757 E-.0012
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.135 J-.385 E.04339
G1 X178.035 Y160.591 E.00218
G3 X178.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.18745
G1 X177.863 Y161.387 E-.13182
G1 X177.692 Y161.271 E-.19658
G1 X177.619 Y161.153 E-.13203
G1 X177.59 Y161.017 E-.13182
G1 X177.607 Y160.88 E-.13191
G1 X177.67 Y160.756 E-.13196
G1 X177.831 Y160.626 E-.19676
G1 X177.965 Y160.591 E-.1318
G1 X178.035 Y160.591 E-.06615
G1 X178.169 Y160.626 E-.13195
G1 X178.33 Y160.756 E-.19658
G1 X178.393 Y160.88 E-.13191
G1 X178.393 Y160.881 E-.00129
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.135 J-.385 E.04339
G1 X177.035 Y160.591 E.00218
G3 X177.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X177 Y161.411 E-.18746
G1 X176.863 Y161.387 E-.13181
G1 X176.692 Y161.271 E-.19658
G1 X176.619 Y161.153 E-.13203
G1 X176.59 Y161.017 E-.13182
G1 X176.607 Y160.88 E-.13191
G1 X176.67 Y160.756 E-.13196
G1 X176.831 Y160.626 E-.19676
G1 X176.965 Y160.591 E-.1318
G1 X177.035 Y160.591 E-.06615
G1 X177.169 Y160.626 E-.13195
G1 X177.33 Y160.756 E-.19658
G1 X177.393 Y160.88 E-.13191
G1 X177.393 Y160.881 E-.00129
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.135 J-.385 E.04339
G1 X176.035 Y160.591 E.00218
G3 X176.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X176 Y161.411 E-.18745
G1 X175.863 Y161.387 E-.13182
G1 X175.692 Y161.271 E-.19658
G1 X175.619 Y161.153 E-.13203
G1 X175.59 Y161.017 E-.13182
G1 X175.607 Y160.88 E-.13185
G1 X175.67 Y160.756 E-.13206
G1 X175.831 Y160.626 E-.1967
G1 X175.965 Y160.591 E-.1318
G1 X176.035 Y160.591 E-.06615
G1 X176.169 Y160.626 E-.13195
G1 X176.33 Y160.756 E-.19659
G1 X176.393 Y160.88 E-.13191
G1 X176.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.135 J-.385 E.04339
G1 X175.035 Y160.591 E.00218
G3 X175.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X175 Y161.411 E-.18745
G1 X174.863 Y161.387 E-.13182
G1 X174.692 Y161.271 E-.19658
G1 X174.619 Y161.153 E-.13203
G1 X174.59 Y161.017 E-.13182
G1 X174.607 Y160.88 E-.13185
G1 X174.67 Y160.756 E-.13206
G1 X174.831 Y160.626 E-.1967
G1 X174.965 Y160.591 E-.1318
G1 X175.035 Y160.591 E-.06615
G1 X175.169 Y160.626 E-.13195
G1 X175.33 Y160.756 E-.19659
G1 X175.393 Y160.88 E-.13191
G1 X175.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.135 J-.385 E.04339
G1 X174.035 Y160.591 E.00218
G3 X174.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X174 Y161.411 E-.18746
G1 X173.863 Y161.387 E-.13182
G1 X173.692 Y161.271 E-.19658
G1 X173.619 Y161.153 E-.13203
G1 X173.59 Y161.017 E-.13182
G1 X173.607 Y160.88 E-.13185
G1 X173.67 Y160.756 E-.13206
G1 X173.831 Y160.626 E-.1967
G1 X173.965 Y160.591 E-.1318
G1 X174.035 Y160.591 E-.06615
G1 X174.169 Y160.626 E-.13195
G1 X174.33 Y160.756 E-.19658
G1 X174.393 Y160.88 E-.13191
G1 X174.393 Y160.881 E-.00129
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173 Y161.405 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I0 J-.408 E.03908
G1 X173.035 Y160.591 E.00218
G3 X173.06 Y161.4 I-.035 J.406 E.03719
M204 S10000
G1 X172.255 Y161.315 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.255 J-.318 E.0477
G1 X172.035 Y160.591 E.00218
G3 X172.299 Y161.275 I-.035 J.406 E.02856
M204 S10000
G1 X171.377 Y161.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.377 J-.155 E.05419
G1 X171.035 Y160.591 E.00218
G3 X171.396 Y161.094 I-.035 J.406 E.02208
; WIPE_START
M204 S8000
G1 X171.258 Y161.32 E-.25081
G1 X171.137 Y161.387 E-.13193
G1 X171 Y161.411 E-.13191
G1 X170.863 Y161.387 E-.13181
G1 X170.692 Y161.271 E-.19658
G1 X170.619 Y161.153 E-.13203
G1 X170.59 Y161.017 E-.13182
G1 X170.607 Y160.88 E-.13191
G1 X170.716 Y160.703 E-.19669
G1 X170.831 Y160.626 E-.13207
G1 X170.965 Y160.591 E-.13175
G1 X171.035 Y160.591 E-.06615
G1 X171.169 Y160.626 E-.13195
G1 X171.171 Y160.627 E-.00259
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.255 J-.318 E.0477
G1 X170.035 Y160.591 E.00218
G3 X170.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X170.137 Y161.387 E-.18754
G1 X170 Y161.411 E-.13191
G1 X169.863 Y161.387 E-.13182
G1 X169.692 Y161.271 E-.19658
G1 X169.619 Y161.153 E-.13203
G1 X169.59 Y161.017 E-.13182
G1 X169.607 Y160.88 E-.13191
G1 X169.716 Y160.703 E-.19669
G1 X169.831 Y160.626 E-.13207
G1 X169.965 Y160.591 E-.13175
G1 X170.035 Y160.591 E-.06615
G1 X170.169 Y160.626 E-.13195
G1 X170.33 Y160.756 E-.19658
G1 X170.331 Y160.757 E-.00119
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.135 Y161.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.135 J-.385 E.04339
G1 X169.035 Y160.591 E.00218
G3 X169.19 Y161.358 I-.035 J.406 E.03288
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.18746
G1 X168.863 Y161.387 E-.13182
G1 X168.692 Y161.271 E-.19658
G1 X168.619 Y161.153 E-.13203
G1 X168.59 Y161.017 E-.13182
G1 X168.607 Y160.88 E-.13185
G1 X168.67 Y160.756 E-.13206
G1 X168.831 Y160.626 E-.19666
G1 X168.965 Y160.591 E-.13186
G1 X169.035 Y160.591 E-.06612
G1 X169.169 Y160.626 E-.13195
G1 X169.33 Y160.756 E-.1966
G1 X169.393 Y160.88 E-.13182
G1 X169.393 Y160.881 E-.00137
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.623 Y160.152 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.377 J-.155 E.02396
G1 X169.035 Y159.591 E.00218
G3 X168.649 Y160.205 I-.035 J.406 E.0523
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18736
G1 X168.607 Y159.88 E-.13185
G1 X168.67 Y159.756 E-.13206
G1 X168.77 Y159.66 E-.13182
G1 X168.965 Y159.591 E-.1967
G1 X169.035 Y159.591 E-.06612
G1 X169.169 Y159.626 E-.13196
G1 X169.33 Y159.756 E-.1966
G1 X169.393 Y159.88 E-.13182
G1 X169.41 Y160.018 E-.13208
G1 X169.381 Y160.153 E-.13187
G1 X169.258 Y160.32 E-.1965
G1 X169.137 Y160.387 E-.13201
G1 X169.136 Y160.388 E-.00125
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.391 Y159.88 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06287
G1 X170.035 Y159.591 E.00218
G3 X170.369 Y159.824 I-.035 J.406 E.01339
M204 S10000
G1 X170.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.255 J-.318 E.04771
G1 X170.035 Y158.591 E.00218
G3 X170.299 Y159.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X170.137 Y159.387 E-.18753
G1 X170 Y159.411 E-.13191
G1 X169.863 Y159.387 E-.13181
G1 X169.692 Y159.271 E-.19658
G1 X169.619 Y159.153 E-.13203
G1 X169.59 Y159.017 E-.13182
G1 X169.607 Y158.88 E-.13191
G1 X169.67 Y158.756 E-.13194
G1 X169.831 Y158.626 E-.19668
G1 X169.965 Y158.591 E-.13189
G1 X170.035 Y158.591 E-.06615
G1 X170.169 Y158.626 E-.13196
G1 X170.33 Y158.756 E-.19658
G1 X170.331 Y158.757 E-.0012
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.135 Y159.382 Z.8 F60000
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.135 J-.385 E.04339
G1 X169.035 Y158.591 E.00218
G3 X169.19 Y159.358 I-.035 J.406 E.03288
M204 S10000
G1 X168.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.255 J-.318 E.04771
M73 P35 R23
G1 X168.035 Y158.591 E.00218
G3 X168.299 Y159.275 I-.035 J.406 E.02856
M204 S10000
G1 X168.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.329 J.241 E.06723
G1 X168.035 Y159.591 E.00218
G3 X168.291 Y159.711 I-.035 J.406 E.00905
M204 S10000
G1 X167.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.329 J.241 E.06723
G1 X167.035 Y159.591 E.00218
G3 X167.291 Y159.711 I-.035 J.406 E.00905
M204 S10000
G1 X167.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.255 J-.318 E.04771
G1 X167.035 Y158.591 E.00218
G3 X167.299 Y159.275 I-.035 J.406 E.02856
M204 S10000
G1 X166.37 Y159.495 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.688 J.5 E.03618
G2 X166.642 Y161.725 I.673 J.496 E.04829
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04592
; WIPE_START
G1 X166.282 Y159.638 E-.18831
G1 X166.231 Y159.765 E-.12967
G1 X166.196 Y160.034 E-.25827
G1 X166.254 Y160.3 E-.25812
G1 X166.37 Y160.495 E-.21592
G1 X166.282 Y160.638 E-.15905
G1 X166.231 Y160.765 E-.12968
G1 X166.202 Y160.898 E-.12957
G1 X166.214 Y161.17 E-.25828
G1 X166.282 Y161.339 E-.17314
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.255 Y161.315 Z.8 F60000
G1 Z.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.255 J-.318 E.0477
G1 X167.035 Y160.591 E.00218
G3 X167.299 Y161.275 I-.035 J.406 E.02856
M204 S10000
G1 X168.255 Y161.315 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.255 J-.318 E.0477
G1 X168.035 Y160.591 E.00218
G3 X168.299 Y161.275 I-.035 J.406 E.02856
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.18754
G1 X168 Y161.411 E-.13191
G1 X167.863 Y161.387 E-.13182
G1 X167.692 Y161.271 E-.19658
G1 X167.619 Y161.153 E-.13203
G1 X167.59 Y161.017 E-.13182
G1 X167.607 Y160.88 E-.13191
G1 X167.67 Y160.756 E-.13196
G1 X167.77 Y160.66 E-.13189
G1 X167.965 Y160.591 E-.19666
G1 X168.035 Y160.591 E-.06615
G1 X168.169 Y160.626 E-.13195
G1 X168.33 Y160.756 E-.19659
G1 X168.331 Y160.757 E-.00119
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.93 Y161.465 Z.8 F60000
G1 X184.79 Y162.29 Z.8
G1 Z.4
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311825
G1 F4016.289
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294593
G1 F4291.291
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266429
G1 F4832.021
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243549
G1 F5383.083
G2 X184.078 Y160.68 I-2.44 J-.221 E.00913
; LINE_WIDTH: 0.278717
G1 F4580.224
G1 X184.075 Y160.66 E.0004
; LINE_WIDTH: 0.297449
G1 F4243.141
G1 X184.059 Y160.579 E.00175
; LINE_WIDTH: 0.328379
G1 F3783.379
G1 X184.044 Y160.497 E.00196
G1 X184.023 Y160.497 E.00048
; LINE_WIDTH: 0.288948
G1 F4389.744
G1 X183.949 Y160.496 E.00152
; LINE_WIDTH: 0.251059
G1 F5188.855
G1 X183.875 Y160.496 E.00128
M204 S10000
G1 X183.986 Y160.806 F60000
; LINE_WIDTH: 0.31184
G1 F4016.072
M204 S8000
G1 X184.062 Y160.415 E.00892
; LINE_WIDTH: 0.294593
G1 F4291.291
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.26643
G1 F4832.011
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243549
G1 F5383.083
G2 X184.078 Y159.68 I-2.44 J-.221 E.00913
; LINE_WIDTH: 0.278717
G1 F4580.224
G1 X184.075 Y159.66 E.0004
; LINE_WIDTH: 0.297449
G1 F4243.141
G1 X184.059 Y159.579 E.00175
; LINE_WIDTH: 0.328382
G1 F3783.347
G1 X184.044 Y159.497 E.00196
G1 X184.023 Y159.497 E.00048
; LINE_WIDTH: 0.288968
G1 F4389.401
G1 X183.949 Y159.496 E.00152
; LINE_WIDTH: 0.251079
G1 F5188.341
G1 X183.875 Y159.496 E.00128
M204 S10000
G1 X183.986 Y159.806 F60000
; LINE_WIDTH: 0.31183
G1 F4016.222
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294593
G1 F4291.291
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.26643
G1 F4832.017
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243549
G1 F5383.083
G2 X184.078 Y158.68 I-2.44 J-.221 E.00913
; LINE_WIDTH: 0.278717
G1 F4580.224
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298259
G1 F4229.68
G1 X184.058 Y158.574 E.00185
; LINE_WIDTH: 0.353125
G1 F3481.573
G1 X184.036 Y158.464 E.00291
G1 X183.758 Y158.306 E.00826
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609606
G1 F1905.819
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574661
G1 F2031.064
G2 X182.196 Y158.161 I-.351 J1.738 E.00657
; LINE_WIDTH: 0.540431
G1 F2170.807
G2 X181.76 Y158.166 I-.194 J1.906 E.01807
; LINE_WIDTH: 0.581517
G1 F2005.211
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609594
G1 F1905.858
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609606
G1 F1905.819
M204 S8000
G1 X168.343 Y158.184 E.00233
; LINE_WIDTH: 0.574661
G1 F2031.064
G2 X168.196 Y158.161 I-.351 J1.738 E.00657
; LINE_WIDTH: 0.540431
G1 F2170.807
G2 X167.76 Y158.166 I-.194 J1.906 E.01807
; LINE_WIDTH: 0.581517
G1 F2005.211
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609594
G1 F1905.858
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.25 Y158.306 F60000
; LINE_WIDTH: 0.358613
G1 F3421.047
M204 S8000
G1 X165.964 Y158.464 E.00859
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331272
G1 F3745.43
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.29447
G1 F4293.392
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.24386
G1 F5374.747
G2 X165.912 Y159.244 I2.461 J.324 E.00944
; LINE_WIDTH: 0.26896
G1 F4777.933
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308702
G1 F4063.491
G2 X166.014 Y159.807 I5.636 J-.8 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.25115
G1 F5186.586
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.2891
G1 F4387.035
G1 X165.976 Y159.496 E.00152
; LINE_WIDTH: 0.314546
G1 F3976.063
G1 X165.956 Y159.497 E.00045
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.257911
G1 F5023.466
G2 X165.903 Y159.868 I6.885 J.844 E.00373
; LINE_WIDTH: 0.237933
G1 F5538.093
G2 X165.912 Y160.244 I3.139 J.108 E.0061
; LINE_WIDTH: 0.268945
G1 F4778.238
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.308669
G1 F4063.992
G2 X166.014 Y160.807 I5.64 J-.801 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251062
G1 F5188.777
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.289015
G1 F4388.561
G1 X165.977 Y160.497 E.00152
; LINE_WIDTH: 0.314546
G1 F3976.06
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.257911
G1 F5023.466
G2 X165.903 Y160.868 I6.88 J.843 E.00373
; LINE_WIDTH: 0.237934
G1 F5538.081
G2 X165.912 Y161.244 I3.14 J.108 E.0061
; LINE_WIDTH: 0.26896
G1 F4777.933
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.307759
G1 F4077.953
G2 X165.992 Y161.694 I4.302 J-.601 E.00818
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
G0 X167 Y159 Z0.4
Z0.36
G1 E0.40 F150
G4 P400
G1 Z0.6 F300
G1 E-0.08 F800
G0 X168 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X169 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X170 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X171 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X172 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X173 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X174 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X175 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X176 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X177 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X178 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X179 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X180 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X181 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X182 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X183 Y159 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
; ---- ROW 2 (Y=160) ----
G0 X167 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X168 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X169 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X170 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X171 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X172 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X173 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X174 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
; CENTER PIN
G0 X175 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X176 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X177 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X178 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X179 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X180 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X181 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X182 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X183 Y160 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
; ---- ROW 3 (Y=167) ----
G0 X167 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X168 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X169 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X170 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X171 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X172 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X173 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X174 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X175 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X176 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X177 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X178 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X179 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X180 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X181 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X182 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
G1 E-0.08
G0 X183 Y161 Z0.4
Z0.36
G1 E0.40
G4 P400
G1 Z0.6
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
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4077.953
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 3/25
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I.146 J1.208 P1  F60000
G1 X174.695 Y160.268 Z.8
G1 Z.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.305 J-.271 E.02829
G1 X175.035 Y159.591 E.00219
G3 X174.739 Y160.31 I-.035 J.406 E.04797
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.18749
G1 X174.59 Y160.017 E-.13192
G1 X174.607 Y159.88 E-.13174
G1 X174.67 Y159.756 E-.13205
G1 X174.77 Y159.66 E-.13187
G1 X174.965 Y159.591 E-.19665
G1 X175.035 Y159.591 E-.06622
G1 X175.169 Y159.626 E-.13201
G1 X175.33 Y159.756 E-.19649
G1 X175.393 Y159.88 E-.13191
G1 X175.41 Y160.017 E-.13192
G1 X175.381 Y160.153 E-.13186
G1 X175.308 Y160.271 E-.13176
G1 X175.254 Y160.315 E-.06609
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.695 Y160.268 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.305 J-.271 E.02829
G1 X174.035 Y159.591 E.00219
G3 X173.739 Y160.31 I-.035 J.406 E.04797
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00219
G3 X173.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 3
M204 S10000
G1 X173 Y159.405 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I0 J-.408 E.03908
G1 X173.035 Y158.591 E.00219
G3 X173.06 Y159.4 I-.035 J.406 E.03719
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X172.8 Y159.359 E-.25044
G1 X172.692 Y159.271 E-.13201
G1 X172.619 Y159.153 E-.13179
G1 X172.59 Y159.017 E-.13198
G1 X172.607 Y158.88 E-.13175
G1 X172.67 Y158.756 E-.13203
G1 X172.77 Y158.66 E-.13189
G1 X172.965 Y158.591 E-.19666
G1 X173.035 Y158.591 E-.06622
G1 X173.169 Y158.626 E-.13196
G1 X173.33 Y158.756 E-.19652
G1 X173.393 Y158.88 E-.13193
G1 X173.41 Y159.017 E-.13192
G1 X173.41 Y159.02 E-.00291
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y159.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.135 J-.385 E.04339
G1 X174.035 Y158.591 E.00219
G3 X174.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 9
M204 S10000
G1 X175.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.135 J-.385 E.04339
G1 X175.035 Y158.591 E.00219
G3 X175.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 10
M204 S10000
G1 X176.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.135 J-.385 E.04339
G1 X176.035 Y158.591 E.00219
G3 X176.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01962
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18736
G1 X175.67 Y159.756 E-.13205
G1 X175.77 Y159.66 E-.13187
G1 X175.965 Y159.591 E-.19665
G1 X176.035 Y159.591 E-.06622
G1 X176.169 Y159.626 E-.13201
G1 X176.33 Y159.756 E-.19649
G1 X176.393 Y159.88 E-.13191
G1 X176.41 Y160.017 E-.13192
G1 X176.381 Y160.153 E-.13186
G1 X176.308 Y160.271 E-.13176
G1 X176.2 Y160.359 E-.13197
G1 X176 Y160.411 E-.1967
G1 X175.999 Y160.41 E-.00122
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.623 Y160.152 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.155 E.02396
G1 X177.035 Y159.591 E.00219
G3 X176.649 Y160.205 I-.035 J.406 E.0523
; COOLING_NODE: 11
M204 S10000
G1 X177.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.135 J-.385 E.04339
G1 X177.035 Y158.591 E.00219
G3 X177.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 17
M204 S10000
G1 X178.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.135 J-.385 E.04339
G1 X178.035 Y158.591 E.00219
G3 X178.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 14
M204 S10000
G1 X177.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.155 E.02396
G1 X178.035 Y159.591 E.00219
G3 X177.649 Y160.205 I-.035 J.406 E.0523
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18746
G1 X177.607 Y159.88 E-.13175
G1 X177.67 Y159.756 E-.13203
G1 X177.77 Y159.66 E-.13189
G1 X177.965 Y159.591 E-.19665
G1 X178.035 Y159.591 E-.06622
G1 X178.169 Y159.626 E-.13201
G1 X178.33 Y159.756 E-.19649
G1 X178.393 Y159.88 E-.13191
G1 X178.41 Y160.017 E-.13192
G1 X178.381 Y160.153 E-.13186
G1 X178.308 Y160.271 E-.13176
G1 X178.2 Y160.359 E-.13197
G1 X178.133 Y160.376 E-.06607
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.135 J-.385 E.04338
G1 X178.035 Y160.591 E.00219
G3 X178.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.18735
G1 X177.8 Y161.359 E-.19662
G1 X177.692 Y161.271 E-.13201
G1 X177.619 Y161.153 E-.13179
G1 X177.59 Y161.017 E-.13198
G1 X177.607 Y160.88 E-.13175
G1 X177.67 Y160.756 E-.13203
G1 X177.77 Y160.66 E-.13189
G1 X177.965 Y160.591 E-.19665
G1 X178.035 Y160.591 E-.06622
G1 X178.169 Y160.626 E-.132
G1 X178.33 Y160.756 E-.19649
G1 X178.393 Y160.88 E-.13191
G1 X178.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.135 J-.385 E.04338
G1 X177.035 Y160.591 E.00219
G3 X177.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177 Y161.411 E-.18735
G1 X176.8 Y161.359 E-.19662
G1 X176.692 Y161.271 E-.13201
G1 X176.619 Y161.153 E-.13179
G1 X176.59 Y161.017 E-.13198
G1 X176.607 Y160.88 E-.13175
G1 X176.67 Y160.756 E-.13203
G1 X176.77 Y160.66 E-.13189
G1 X176.965 Y160.591 E-.19665
G1 X177.035 Y160.591 E-.06622
G1 X177.169 Y160.626 E-.132
G1 X177.33 Y160.756 E-.19649
G1 X177.393 Y160.88 E-.13191
G1 X177.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.135 J-.385 E.04338
G1 X176.035 Y160.591 E.00219
G3 X176.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176 Y161.411 E-.18735
G1 X175.8 Y161.359 E-.19662
G1 X175.692 Y161.271 E-.13201
G1 X175.619 Y161.153 E-.13179
G1 X175.59 Y161.017 E-.13198
G1 X175.607 Y160.88 E-.13174
G1 X175.67 Y160.756 E-.13205
G1 X175.77 Y160.66 E-.13188
G1 X175.965 Y160.591 E-.19665
G1 X176.035 Y160.591 E-.06622
G1 X176.169 Y160.626 E-.132
G1 X176.33 Y160.756 E-.19649
G1 X176.393 Y160.88 E-.13191
G1 X176.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.135 J-.385 E.04338
G1 X175.035 Y160.591 E.00219
G3 X175.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175 Y161.411 E-.18735
G1 X174.8 Y161.359 E-.19662
G1 X174.692 Y161.271 E-.13201
G1 X174.619 Y161.153 E-.13179
G1 X174.59 Y161.017 E-.13198
G1 X174.607 Y160.88 E-.13174
G1 X174.67 Y160.756 E-.13205
G1 X174.77 Y160.66 E-.13188
G1 X174.965 Y160.591 E-.19665
G1 X175.035 Y160.591 E-.06622
G1 X175.169 Y160.626 E-.132
G1 X175.33 Y160.756 E-.19649
G1 X175.393 Y160.88 E-.13191
G1 X175.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.135 J-.385 E.04338
G1 X174.035 Y160.591 E.00219
G3 X174.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174 Y161.411 E-.18735
G1 X173.8 Y161.359 E-.19662
G1 X173.692 Y161.271 E-.13201
G1 X173.619 Y161.153 E-.13179
G1 X173.59 Y161.017 E-.13198
G1 X173.607 Y160.88 E-.13174
G1 X173.67 Y160.756 E-.13205
G1 X173.77 Y160.66 E-.13187
G1 X173.965 Y160.591 E-.19665
G1 X174.035 Y160.591 E-.06622
G1 X174.169 Y160.626 E-.132
G1 X174.33 Y160.756 E-.19649
G1 X174.393 Y160.88 E-.13191
G1 X174.393 Y160.881 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173 Y161.405 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I0 J-.408 E.03908
G1 X173.035 Y160.591 E.00219
G3 X173.06 Y161.4 I-.035 J.406 E.03719
; COOLING_NODE: 37
M204 S10000
G1 X172.198 Y161.354 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.198 J-.357 E.04554
G1 X172.035 Y160.591 E.00219
G3 X172.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 38
M204 S10000
G1 X171.377 Y161.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.377 J-.155 E.05419
G1 X171.035 Y160.591 E.00219
G3 X171.396 Y161.094 I-.035 J.406 E.02207
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.258 Y161.32 E-.2508
G1 X171.137 Y161.387 E-.13208
G1 X171 Y161.411 E-.1318
G1 X170.8 Y161.359 E-.19661
G1 X170.692 Y161.271 E-.13201
G1 X170.619 Y161.153 E-.13179
G1 X170.59 Y161.017 E-.13198
G1 X170.607 Y160.88 E-.13175
G1 X170.67 Y160.756 E-.13203
G1 X170.831 Y160.626 E-.19663
G1 X170.965 Y160.591 E-.13191
G1 X171.035 Y160.591 E-.06622
G1 X171.169 Y160.626 E-.132
G1 X171.171 Y160.627 E-.0024
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.198 Y161.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.198 J-.357 E.04554
G1 X170.035 Y160.591 E.00219
G3 X170.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.25061
G1 X169.8 Y161.359 E-.19661
G1 X169.692 Y161.271 E-.13196
G1 X169.619 Y161.153 E-.13189
G1 X169.59 Y161.017 E-.13192
G1 X169.607 Y160.88 E-.13175
G1 X169.67 Y160.756 E-.13203
G1 X169.831 Y160.626 E-.19663
G1 X169.965 Y160.591 E-.13191
G1 X170.035 Y160.591 E-.06622
G1 X170.169 Y160.626 E-.132
G1 X170.33 Y160.756 E-.19649
G1 X170.363 Y160.822 E-.06997
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.135 Y161.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.135 J-.385 E.04338
G1 X169.035 Y160.591 E.00219
G3 X169.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 50
M204 S10000
G1 X168.198 Y161.354 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.198 J-.357 E.04554
G1 X168.035 Y160.591 E.00219
G3 X168.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.25061
G1 X167.863 Y161.387 E-.13197
G1 X167.692 Y161.271 E-.19663
G1 X167.619 Y161.153 E-.13186
G1 X167.59 Y161.017 E-.13192
G1 X167.607 Y160.88 E-.13175
G1 X167.67 Y160.756 E-.13203
G1 X167.77 Y160.66 E-.13189
G1 X167.965 Y160.591 E-.19666
G1 X168.035 Y160.591 E-.06622
G1 X168.169 Y160.626 E-.132
G1 X168.33 Y160.756 E-.19649
G1 X168.363 Y160.822 E-.06997
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.198 Y161.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.198 J-.357 E.04554
G1 X167.035 Y160.591 E.00219
G3 X167.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.25062
G1 X166.863 Y161.387 E-.13196
G1 X166.692 Y161.271 E-.19663
G1 X166.619 Y161.153 E-.13186
G1 X166.59 Y161.017 E-.13192
G1 X166.607 Y160.88 E-.13175
G1 X166.67 Y160.756 E-.13203
G1 X166.77 Y160.66 E-.13189
G1 X166.965 Y160.591 E-.19666
G1 X167.035 Y160.591 E-.06622
G1 X167.169 Y160.626 E-.132
G1 X167.33 Y160.756 E-.19649
G1 X167.363 Y160.822 E-.06997
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.37 Y159.495 Z1 F60000
G1 Z.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.688 J.5 E.03618
G2 X166.642 Y161.725 I.673 J.496 E.04829
G1 X166.589 Y161.898 E.00612
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04592
; COOLING_NODE: 48
M204 S10000
G1 X167.198 Y159.354 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.198 J-.357 E.04555
G1 X167.035 Y158.591 E.00219
G3 X167.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 47
M204 S10000
G1 X167.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.329 J.241 E.06723
G1 X167.035 Y159.591 E.00219
G3 X167.291 Y159.711 I-.035 J.406 E.00905
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.393 Y159.88 E-.1875
G1 X167.41 Y160.017 E-.13192
G1 X167.35 Y160.215 E-.19655
G1 X167.258 Y160.319 E-.13183
G1 X167.137 Y160.387 E-.13211
G1 X167 Y160.411 E-.13181
G1 X166.863 Y160.387 E-.13195
G1 X166.692 Y160.271 E-.19655
G1 X166.619 Y160.153 E-.13193
G1 X166.59 Y160.017 E-.13194
G1 X166.607 Y159.88 E-.13175
G1 X166.67 Y159.756 E-.13203
G1 X166.77 Y159.66 E-.13189
G1 X166.77 Y159.66 E-.00024
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.329 Y159.756 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.329 J.241 E.06723
G1 X168.035 Y159.591 E.00219
G3 X168.291 Y159.711 I-.035 J.406 E.00905
; COOLING_NODE: 41
M204 S10000
G1 X168.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.377 J-.155 E.02396
G1 X169.035 Y159.591 E.00219
G3 X168.65 Y160.205 I-.035 J.406 E.0523
; COOLING_NODE: 44
M204 S10000
G1 X169.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.135 J-.385 E.04338
G1 X169.035 Y158.591 E.00219
G3 X169.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 45
M204 S10000
G1 X168.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.198 J-.357 E.04555
G1 X168.035 Y158.591 E.00219
G3 X168.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168 Y159.411 E-.25062
G1 X167.863 Y159.387 E-.13196
G1 X167.742 Y159.32 E-.13177
G1 X167.619 Y159.153 E-.19668
G1 X167.59 Y159.017 E-.13198
G1 X167.607 Y158.88 E-.13175
G1 X167.67 Y158.756 E-.13203
G1 X167.77 Y158.66 E-.13189
G1 X167.965 Y158.591 E-.19666
G1 X168.035 Y158.591 E-.06622
G1 X168.169 Y158.626 E-.13196
G1 X168.33 Y158.756 E-.19652
G1 X168.363 Y158.822 E-.06998
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.391 Y159.88 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06287
G1 X170.035 Y159.591 E.00219
G3 X170.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 43
M204 S10000
G1 X170.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.198 J-.357 E.04555
G1 X170.035 Y158.591 E.00219
G3 X170.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X170 Y159.411 E-.25062
G1 X169.8 Y159.359 E-.19661
G1 X169.692 Y159.271 E-.13201
G1 X169.619 Y159.153 E-.13179
G1 X169.59 Y159.017 E-.13198
G1 X169.607 Y158.88 E-.13175
G1 X169.67 Y158.756 E-.13203
G1 X169.831 Y158.626 E-.19663
G1 X169.965 Y158.591 E-.13191
G1 X170.035 Y158.591 E-.06622
G1 X170.169 Y158.626 E-.13196
G1 X170.33 Y158.756 E-.19652
G1 X170.363 Y158.822 E-.06998
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.377 Y159.152 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.377 J-.155 E.05419
G1 X171.035 Y158.591 E.00219
G3 X171.396 Y159.094 I-.035 J.406 E.02207
; COOLING_NODE: 6
M204 S10000
G1 X171.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06287
G1 X171.035 Y159.591 E.00219
G3 X171.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.41 Y160.017 E-.18777
G1 X171.381 Y160.153 E-.13186
G1 X171.308 Y160.271 E-.13176
G1 X171.2 Y160.359 E-.13197
G1 X171 Y160.411 E-.1967
G1 X170.8 Y160.359 E-.19663
G1 X170.692 Y160.271 E-.13185
G1 X170.619 Y160.153 E-.13199
G1 X170.59 Y160.017 E-.13192
G1 X170.607 Y159.88 E-.13175
G1 X170.67 Y159.756 E-.13203
G1 X170.831 Y159.626 E-.19663
G1 X170.899 Y159.608 E-.06714
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.391 Y159.88 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00219
G3 X172.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 4
M204 S10000
G1 X172.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.198 J-.357 E.04555
G1 X172.035 Y158.591 E.00219
G3 X172.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X172 Y159.411 E-.25062
G1 X171.8 Y159.359 E-.19661
G1 X171.692 Y159.271 E-.13201
G1 X171.619 Y159.153 E-.13179
G1 X171.59 Y159.017 E-.13198
G1 X171.607 Y158.88 E-.13175
G1 X171.67 Y158.756 E-.13203
G1 X171.77 Y158.66 E-.13189
G1 X171.965 Y158.591 E-.19666
G1 X172.035 Y158.591 E-.06622
G1 X172.169 Y158.626 E-.13196
G1 X172.33 Y158.756 E-.19652
G1 X172.363 Y158.822 E-.06998
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X179.198 Y159.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.198 J-.357 E.04555
G1 X179.035 Y158.591 E.00219
G3 X179.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 18
M204 S10000
G1 X180.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.198 J-.357 E.04555
G1 X180.035 Y158.591 E.00219
G3 X180.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X180 Y159.411 E-.25061
G1 X179.8 Y159.359 E-.19661
G1 X179.692 Y159.271 E-.13201
G1 X179.619 Y159.153 E-.13179
G1 X179.59 Y159.017 E-.13198
G1 X179.607 Y158.88 E-.13175
G1 X179.67 Y158.756 E-.13203
G1 X179.831 Y158.626 E-.19663
G1 X179.965 Y158.591 E-.1319
G1 X180.035 Y158.591 E-.06622
G1 X180.169 Y158.626 E-.13196
G1 X180.33 Y158.756 E-.19652
G1 X180.363 Y158.822 E-.06999
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.135 Y160.382 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04338
G1 X180.035 Y159.591 E.00219
G3 X180.19 Y160.358 I-.035 J.406 E.03288
; COOLING_NODE: 15
M204 S10000
G1 X179.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00219
G3 X179.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.18778
G1 X179.35 Y160.215 E-.19655
G1 X179.258 Y160.319 E-.13183
G1 X179.137 Y160.387 E-.13211
G1 X179 Y160.411 E-.1318
G1 X178.8 Y160.359 E-.19663
G1 X178.692 Y160.271 E-.13186
G1 X178.619 Y160.153 E-.13196
G1 X178.59 Y160.017 E-.13194
G1 X178.607 Y159.88 E-.13175
G1 X178.67 Y159.756 E-.13203
G1 X178.77 Y159.66 E-.13189
G1 X178.901 Y159.613 E-.13187
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.198 Y161.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.198 J-.357 E.04554
G1 X179.035 Y160.591 E.00219
G3 X179.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.2506
G1 X178.8 Y161.359 E-.19661
G1 X178.692 Y161.271 E-.13196
G1 X178.619 Y161.153 E-.13189
G1 X178.59 Y161.017 E-.13192
G1 X178.607 Y160.88 E-.13175
G1 X178.67 Y160.756 E-.13203
G1 X178.77 Y160.66 E-.13189
G1 X178.965 Y160.591 E-.19666
G1 X179.035 Y160.591 E-.06622
G1 X179.169 Y160.626 E-.132
G1 X179.33 Y160.756 E-.19649
G1 X179.363 Y160.822 E-.06998
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y161.268 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.305 J-.271 E.04986
G1 X180.035 Y160.591 E.00219
G3 X180.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.2 Y161.359 E-.18753
G1 X180 Y161.411 E-.19667
G1 X179.8 Y161.359 E-.19662
G1 X179.692 Y161.271 E-.13196
G1 X179.619 Y161.153 E-.13189
G1 X179.59 Y161.017 E-.13192
G1 X179.607 Y160.88 E-.13175
G1 X179.67 Y160.756 E-.13203
G1 X179.831 Y160.626 E-.19664
G1 X179.965 Y160.591 E-.1319
G1 X180.035 Y160.591 E-.06622
G1 X180.169 Y160.626 E-.132
G1 X180.278 Y160.714 E-.13287
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.346 Y159.213 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.346 J-.216 E.05203
G1 X183.035 Y158.591 E.00219
G3 X183.374 Y159.16 I-.035 J.406 E.02424
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.258 Y159.32 E-.18734
G1 X183.137 Y159.387 E-.13208
G1 X183 Y159.411 E-.1318
G1 X182.863 Y159.387 E-.13197
G1 X182.742 Y159.32 E-.13177
G1 X182.619 Y159.153 E-.19668
G1 X182.59 Y159.017 E-.13198
G1 X182.607 Y158.88 E-.13174
G1 X182.67 Y158.756 E-.13205
G1 X182.77 Y158.66 E-.13187
G1 X182.965 Y158.591 E-.19666
G1 X183.035 Y158.591 E-.06622
G1 X183.169 Y158.626 E-.13196
G1 X183.223 Y158.669 E-.06589
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.593 Y160.017 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.407 J-.02 E.01962
G1 X183.035 Y159.591 E.00219
G3 X182.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 23
M204 S10000
G1 X182.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.329 J.241 E.06723
G1 X182.035 Y159.591 E.00219
G3 X182.291 Y159.711 I-.035 J.406 E.00905
; COOLING_NODE: 22
M204 S10000
G1 X182.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.198 J-.357 E.04555
G1 X182.035 Y158.591 E.00219
G3 X182.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X182 Y159.411 E-.25061
G1 X181.863 Y159.387 E-.13196
G1 X181.742 Y159.32 E-.13177
G1 X181.619 Y159.153 E-.19668
G1 X181.59 Y159.017 E-.13198
G1 X181.607 Y158.88 E-.13175
G1 X181.67 Y158.756 E-.13203
G1 X181.77 Y158.66 E-.13189
G1 X181.965 Y158.591 E-.19666
G1 X182.035 Y158.591 E-.06622
G1 X182.169 Y158.626 E-.13196
G1 X182.33 Y158.756 E-.19652
G1 X182.363 Y158.822 E-.06999
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X181.198 Y159.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.198 J-.357 E.04555
G1 X181.035 Y158.591 E.00219
G3 X181.248 Y159.321 I-.035 J.406 E.03072
; COOLING_NODE: 20
M204 S10000
G1 X181.329 Y159.756 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.329 J.241 E.06723
G1 X181.035 Y159.591 E.00219
G3 X181.291 Y159.711 I-.035 J.406 E.00905
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X181.393 Y159.88 E-.18751
G1 X181.41 Y160.017 E-.13192
G1 X181.35 Y160.215 E-.19655
G1 X181.258 Y160.319 E-.13183
G1 X181.137 Y160.387 E-.13211
G1 X181 Y160.411 E-.1318
G1 X180.863 Y160.387 E-.13197
G1 X180.692 Y160.271 E-.19654
G1 X180.619 Y160.153 E-.13194
G1 X180.59 Y160.017 E-.13194
G1 X180.607 Y159.88 E-.13175
G1 X180.67 Y159.756 E-.13203
G1 X180.77 Y159.66 E-.13189
G1 X180.77 Y159.66 E-.00022
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.198 Y161.354 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.198 J-.357 E.04554
G1 X181.035 Y160.591 E.00219
M73 P35 R22
G3 X181.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 27
M204 S10000
G1 X182.198 Y161.354 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.198 J-.357 E.04554
G1 X182.035 Y160.591 E.00219
G3 X182.248 Y161.321 I-.035 J.406 E.03072
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.2506
G1 X181.863 Y161.387 E-.13197
G1 X181.692 Y161.271 E-.19663
G1 X181.619 Y161.153 E-.13186
G1 X181.59 Y161.017 E-.13192
G1 X181.607 Y160.88 E-.13175
G1 X181.67 Y160.756 E-.13203
G1 X181.77 Y160.66 E-.13189
G1 X181.965 Y160.591 E-.19666
G1 X182.035 Y160.591 E-.06622
G1 X182.169 Y160.626 E-.132
G1 X182.33 Y160.756 E-.19649
G1 X182.363 Y160.822 E-.06998
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.346 Y161.213 Z1 F60000
G1 Z.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.346 J-.216 E.05203
G1 X183.035 Y160.591 E.00219
G3 X183.374 Y161.16 I-.035 J.406 E.02425
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.258 Y161.32 E-.18728
G1 X183.137 Y161.387 E-.13208
G1 X183 Y161.411 E-.1318
G1 X182.863 Y161.387 E-.13197
G1 X182.692 Y161.271 E-.19663
G1 X182.619 Y161.153 E-.13186
G1 X182.59 Y161.017 E-.13192
G1 X182.607 Y160.88 E-.13174
G1 X182.67 Y160.756 E-.13205
G1 X182.77 Y160.66 E-.13188
G1 X182.965 Y160.591 E-.19666
G1 X183.035 Y160.591 E-.06622
G1 X183.169 Y160.626 E-.132
G1 X183.223 Y160.669 E-.06591
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z1 F60000
G1 Z.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311717
G1 F4017.909
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294518
G1 F4292.569
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266412
G1 F4832.399
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243517
G1 F5383.927
G2 X184.078 Y160.68 I-2.436 J-.221 E.00912
; LINE_WIDTH: 0.278644
G1 F4581.643
G1 X184.075 Y160.66 E.00039
; LINE_WIDTH: 0.297371
G1 F4244.436
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.328613
G1 F3780.284
G1 X184.044 Y160.497 E.00197
G1 X184.025 Y160.496 E.00044
; LINE_WIDTH: 0.291215
G1 F4349.673
G1 X183.95 Y160.496 E.00154
; LINE_WIDTH: 0.252682
G1 F5148.706
G1 X183.875 Y160.496 E.0013
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311666
G1 F4018.663
M204 S8000
G1 X184.062 Y160.414 E.00893
; LINE_WIDTH: 0.294488
G1 F4293.079
G1 X184.075 Y160.329 E.0018
; LINE_WIDTH: 0.266395
G1 F4832.763
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243521
G1 F5383.838
G2 X184.078 Y159.68 I-2.438 J-.221 E.00912
; LINE_WIDTH: 0.278666
G1 F4581.218
G1 X184.075 Y159.66 E.00039
; LINE_WIDTH: 0.297371
G1 F4244.436
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328602
G1 F3780.429
G1 X184.044 Y159.497 E.00197
G1 X184.025 Y159.496 E.00045
; LINE_WIDTH: 0.29109
G1 F4351.86
G1 X183.95 Y159.496 E.00154
; LINE_WIDTH: 0.252575
G1 F5151.331
G1 X183.875 Y159.496 E.0013
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311727
G1 F4017.76
M204 S8000
G1 X184.062 Y159.415 E.00893
; LINE_WIDTH: 0.294536
G1 F4292.269
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.26641
G1 F4832.433
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243525
G1 F5383.719
G2 X184.078 Y158.68 I-2.437 J-.221 E.00913
; LINE_WIDTH: 0.278666
G1 F4581.218
G1 X184.075 Y158.66 E.00039
; LINE_WIDTH: 0.29812
G1 F4231.98
G1 X184.059 Y158.575 E.00184
; LINE_WIDTH: 0.353202
G1 F3480.714
G1 X184.036 Y158.464 E.00292
G1 X183.759 Y158.306 E.00824
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609666
G1 F1905.615
M204 S8000
G1 X182.343 Y158.184 E.03848
; LINE_WIDTH: 0.574721
G1 F2030.835
G2 X182.196 Y158.161 I-.348 J1.721 E.00657
; LINE_WIDTH: 0.540442
G1 F2170.759
G2 X181.76 Y158.166 I-.194 J1.905 E.01809
; LINE_WIDTH: 0.581554
G1 F2005.075
G1 X181.657 Y158.184 E.00468
; LINE_WIDTH: 0.609584
G1 F1905.892
G1 X181.609 Y158.195 E.00231
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609666
G1 F1905.615
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574721
G1 F2030.835
G2 X168.196 Y158.161 I-.348 J1.721 E.00657
; LINE_WIDTH: 0.540442
G1 F2170.759
G2 X167.76 Y158.166 I-.194 J1.905 E.01809
; LINE_WIDTH: 0.581554
G1 F2005.075
G1 X167.657 Y158.184 E.00468
; LINE_WIDTH: 0.609584
G1 F1905.892
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.243 Y158.306 F60000
; LINE_WIDTH: 0.358714
G1 F3419.952
M204 S8000
G1 X165.964 Y158.464 E.00841
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331168
G1 F3746.777
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.294381
G1 F4294.914
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.243839
G1 F5375.303
G2 X165.912 Y159.243 I2.464 J.324 E.00943
; LINE_WIDTH: 0.268885
G1 F4779.505
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308724
G1 F4063.146
G2 X166.014 Y159.807 I5.629 J-.798 E.01074
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.252097
G1 F5163.1
M204 S8000
G1 X166.05 Y159.496 E.00129
; LINE_WIDTH: 0.290194
G1 F4367.63
G1 X165.976 Y159.497 E.00153
; LINE_WIDTH: 0.314511
G1 F3976.567
G1 X165.956 Y159.497 E.00044
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.257876
G1 F5024.297
G2 X165.903 Y159.868 I6.903 J.845 E.00373
; LINE_WIDTH: 0.237916
G1 F5538.582
G2 X165.912 Y160.243 I3.14 J.108 E.00609
; LINE_WIDTH: 0.268884
G1 F4779.53
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.308715
G1 F4063.285
G2 X166.014 Y160.807 I5.655 J-.803 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251657
G1 F5173.993
M204 S8000
G1 X166.05 Y160.496 E.00129
; LINE_WIDTH: 0.28979
G1 F4374.778
G1 X165.976 Y160.496 E.00153
; LINE_WIDTH: 0.314506
G1 F3976.643
G1 X165.956 Y160.497 E.00044
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.257876
G1 F5024.297
G2 X165.903 Y160.868 I6.894 J.844 E.00373
; LINE_WIDTH: 0.237916
G1 F5538.594
G2 X165.912 Y161.243 I3.14 J.108 E.00609
; LINE_WIDTH: 0.26887
G1 F4779.835
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307737
G1 F4078.29
G2 X165.992 Y161.694 I4.302 J-.6 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z1 I-1.217 J.015 P1  F60000
G1 X167.428 Y279.944 Z1
G1 Z.6
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #4
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
M73 P36 R22
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z1 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z.6
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
M73 P37 R22
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S176 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
M73 P38 R22
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E18

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

M73 P38 R21
G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z3.6 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y252.694 F60000
G1 Z.6

; filament start gcode
G17
G3 Z1 I0 J-1.217 P1
G1 X199.428 Y252.694 Z1
G1 Z.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X200.928  F600
G1  X199.428  F240
G1  X199.928  F600
G1  Y253.194 
G1  X198.928 
G1  Y252.194 
G1  X200.428 
G1  Y253.694 
G1  X198.428 
G1  Y251.694 
G1  X196.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X167.428  E1.2162 F2473
G1  Y254.944  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X167.428  E1.2162 F4775
G1  Y256.444  E0.0285
M73 P39 R21
G1  X199.428  E1.2162
G1  Y257.194  E0.0285
G1  X167.428  E1.2162
G1  Y257.944  E0.0285
G1  X199.428  E1.2162
G1  Y258.694  E0.0285
G1  X167.428  E1.2162
G1  Y259.444  E0.0285
G1  X199.428  E1.2162
G1  Y260.194  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #4
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.543 Y251.744   E0.0535
G1 E-0.4000 F1800
M204 S10000
G1  X201.169 Y253.644   F600
G1 E0.4000 F1800
M204 S8000
G3  X200.739 Y256.835   I-1.385 J1.438 E0.1423 F5400
G2  X199.928 Y259.090   I2.785 J2.275 E0.0929
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END

; WIPE_START
G1 F4078.29
M204 S8000
G1 X166.928 Y280.444 E-.00001
G1 X167.578 Y281.204 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3580
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 3 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z1 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer3 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 4/25
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3529
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 4 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z1.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer4 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.216 Y278.401   I8.989 J-9.270 E0.1015 F5400
G1 E-0.4000 F1800
M204 S10000
G1  X165.744 Y276.190   F600
G1 E0.4000 F1800
M204 S8000
G2  X166.928 Y273.548   I-2.389 J-2.656 E0.1133 F5400
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G3  X168.451 Y250.453   I20.946 J15.027 E0.1782
G3  X171.859 Y251.132   I1.345 J2.142 E0.1456
G2  X175.079 Y252.194   I3.241 J-4.414 E0.1310
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X167.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #5
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.2 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S74 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E17

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z3.8 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y265.285 F60000
G1 Z.8
M73 P40 R21
G1 X204.318 Y272.917 Z1.2
G1 X204.318 Y285.121 Z1.2
G1 X162.538 Y285.121
G1 X162.538 Y277.194

; filament start gcode
G1 X167.428 Y277.194
G1 Z.8
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X165.928 
G1  X167.428  F240
G1  X167.928  F600
G1  Y277.694 
G1  X166.928 
G1  Y276.694 
G1  X168.428 
G1  Y278.194 
G1  X166.428 
G1  Y276.194 
G1  X170.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X199.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X167.428  E1.2162
G1  Y274.194  E0.0285
G1  X199.428  E1.2162
G1  Y273.444  E0.0285
G1  X167.428  E1.2162
G1  Y272.694  E0.0285
G1  X199.428  E1.2162
G1  Y271.944  E0.0285
G1  X167.428  E1.2162
G1  Y271.194  E0.0285
G1  X199.428  E1.2162
G1  Y270.444  E0.0285
G1  X167.428  E1.2162
G1  Y269.694  E0.0285
G1  X199.428  E1.2162
G1  Y268.944  E0.0285
G1  X167.428  E1.2162
G1  Y268.194  E0.0285
G1  X199.428  E1.2162
G1  Y267.444  E0.0285
G1  X167.428  E1.2162
G1  Y266.694  E0.0285
G1  X199.428  E1.2162
G1  Y265.944  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y277.944  E0.0760 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #5
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.745 Y160.316
G1 Z.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.319 E.03046
G1 X175.035 Y159.591 E.00219
G3 X174.795 Y160.35 I-.035 J.407 E.04584
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X174.65 Y160.215 E-.18737
G1 X174.591 Y160.026 E-.18877
G1 X174.607 Y159.88 E-.13976
G1 X174.67 Y159.756 E-.13189
G1 X174.831 Y159.626 E-.19658
G1 X174.965 Y159.591 E-.13186
G1 X175.035 Y159.591 E-.06622
G1 X175.169 Y159.626 E-.13187
G1 X175.284 Y159.704 E-.13199
G1 X175.393 Y159.88 E-.19649
G1 X175.41 Y160.018 E-.13206
G1 X175.35 Y160.215 E-.19647
G1 X175.302 Y160.27 E-.06866
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.135 J-.385 E.04341
G1 X175.035 Y158.591 E.00219
G3 X175.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.026 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.028 E.01989
G1 X176.035 Y159.591 E.00219
G3 X175.602 Y160.085 I-.035 J.406 E.05641
; COOLING_NODE: 10
M204 S10000
G1 X176.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.135 J-.385 E.04341
G1 X176.035 Y158.591 E.00219
G3 X176.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 11
M204 S10000
G1 X177.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.135 J-.385 E.04341
G1 X177.035 Y158.591 E.00219
G3 X177.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 17
M204 S10000
G1 X178.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.135 J-.385 E.04341
G1 X178.035 Y158.591 E.00219
G3 X178.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.18749
G1 X177.866 Y159.388 E-.12927
G1 X177.742 Y159.32 E-.13438
G1 X177.65 Y159.215 E-.13202
G1 X177.591 Y159.026 E-.18872
G1 X177.607 Y158.88 E-.13976
G1 X177.67 Y158.756 E-.13173
G1 X177.831 Y158.626 E-.19674
G1 X177.965 Y158.591 E-.13186
G1 X178.035 Y158.591 E-.06622
G1 X178.169 Y158.626 E-.13187
M73 P41 R21
G1 X178.284 Y158.704 E-.13199
G1 X178.393 Y158.88 E-.19649
G1 X178.393 Y158.881 E-.00146
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.654 Y160.213 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.346 J-.216 E.02613
G1 X178.035 Y159.591 E.00219
G3 X177.689 Y160.262 I-.035 J.406 E.05016
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.591 Y160.026 E-.24289
G1 X177.607 Y159.88 E-.13976
G1 X177.67 Y159.756 E-.13173
G1 X177.831 Y159.626 E-.19674
G1 X177.965 Y159.591 E-.13186
G1 X178.035 Y159.591 E-.06622
G1 X178.169 Y159.626 E-.13187
G1 X178.284 Y159.704 E-.13199
G1 X178.393 Y159.88 E-.19649
G1 X178.41 Y160.018 E-.13206
G1 X178.35 Y160.215 E-.19647
G1 X178.258 Y160.32 E-.13207
G1 X178.194 Y160.356 E-.06984
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.654 Y160.213 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.346 J-.216 E.02613
G1 X177.035 Y159.591 E.00219
G3 X176.689 Y160.262 I-.035 J.406 E.05016
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X176.591 Y160.026 E-.24289
G1 X176.607 Y159.88 E-.13976
G1 X176.67 Y159.756 E-.13173
G1 X176.831 Y159.626 E-.19674
G1 X176.965 Y159.591 E-.13186
G1 X177.035 Y159.591 E-.06622
G1 X177.169 Y159.626 E-.13187
G1 X177.284 Y159.704 E-.13199
G1 X177.393 Y159.88 E-.19649
G1 X177.41 Y160.018 E-.13206
G1 X177.35 Y160.215 E-.19647
G1 X177.258 Y160.32 E-.13207
G1 X177.194 Y160.356 E-.06984
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.135 J-.385 E.04341
G1 X178.035 Y160.591 E.00219
G3 X178.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.1875
G1 X177.866 Y161.388 E-.12927
G1 X177.742 Y161.32 E-.13438
G1 X177.65 Y161.215 E-.13202
G1 X177.591 Y161.026 E-.18872
G1 X177.607 Y160.88 E-.13976
G1 X177.67 Y160.756 E-.13173
G1 X177.831 Y160.626 E-.19675
G1 X177.965 Y160.591 E-.13186
G1 X178.035 Y160.591 E-.06622
G1 X178.169 Y160.626 E-.13187
G1 X178.284 Y160.704 E-.13199
G1 X178.367 Y160.815 E-.13179
G1 X178.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.135 J-.385 E.04341
G1 X177.035 Y160.591 E.00219
G3 X177.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177 Y161.411 E-.1875
G1 X176.866 Y161.388 E-.12927
G1 X176.742 Y161.32 E-.13438
G1 X176.65 Y161.215 E-.13202
G1 X176.591 Y161.026 E-.18872
G1 X176.607 Y160.88 E-.13976
G1 X176.67 Y160.756 E-.13173
G1 X176.831 Y160.626 E-.19675
G1 X176.965 Y160.591 E-.13186
G1 X177.035 Y160.591 E-.06622
G1 X177.169 Y160.626 E-.13187
G1 X177.284 Y160.704 E-.13199
G1 X177.367 Y160.815 E-.13179
G1 X177.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.135 J-.385 E.04341
G1 X176.035 Y160.591 E.00219
G3 X176.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176 Y161.411 E-.1875
G1 X175.866 Y161.388 E-.12927
G1 X175.742 Y161.32 E-.13438
G1 X175.65 Y161.215 E-.13202
G1 X175.591 Y161.026 E-.18872
G1 X175.607 Y160.88 E-.13976
G1 X175.67 Y160.756 E-.13189
G1 X175.831 Y160.626 E-.19658
G1 X175.965 Y160.591 E-.13186
G1 X176.035 Y160.591 E-.06622
G1 X176.169 Y160.626 E-.13187
G1 X176.284 Y160.704 E-.13199
G1 X176.367 Y160.815 E-.13179
G1 X176.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.135 J-.385 E.04341
G1 X175.035 Y160.591 E.00219
G3 X175.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175 Y161.411 E-.18761
G1 X174.866 Y161.388 E-.12927
G1 X174.742 Y161.32 E-.13438
G1 X174.65 Y161.215 E-.13202
G1 X174.591 Y161.026 E-.18872
G1 X174.607 Y160.88 E-.13977
G1 X174.67 Y160.756 E-.13189
G1 X174.831 Y160.626 E-.19658
G1 X174.965 Y160.591 E-.13186
G1 X175.035 Y160.591 E-.06622
G1 X175.169 Y160.626 E-.13187
G1 X175.284 Y160.704 E-.13199
G1 X175.367 Y160.815 E-.13179
G1 X175.381 Y160.883 E-.06603
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.135 J-.385 E.04341
G1 X174.035 Y160.591 E.00219
G3 X174.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174 Y161.411 E-.18762
G1 X173.866 Y161.388 E-.12927
G1 X173.742 Y161.32 E-.13438
G1 X173.65 Y161.215 E-.13202
G1 X173.591 Y161.026 E-.18872
G1 X173.607 Y160.88 E-.13976
G1 X173.67 Y160.756 E-.13189
G1 X173.831 Y160.626 E-.19658
G1 X173.965 Y160.591 E-.13186
G1 X174.035 Y160.591 E-.06622
G1 X174.169 Y160.626 E-.13187
G1 X174.284 Y160.704 E-.13199
G1 X174.367 Y160.815 E-.13179
G1 X174.381 Y160.883 E-.06603
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173 Y161.405 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I0 J-.408 E.03907
G1 X173.035 Y160.591 E.00218
G3 X173.06 Y161.4 I-.035 J.406 E.03719
; COOLING_NODE: 37
M204 S10000
G1 X172.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.135 J-.385 E.04341
G1 X172.035 Y160.591 E.00218
G3 X172.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 38
M204 S10000
G1 X171.378 Y161.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.378 J-.154 E.05422
G1 X171.035 Y160.591 E.00218
G3 X171.396 Y161.094 I-.035 J.407 E.02208
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.258 Y161.32 E-.25102
G1 X171.137 Y161.387 E-.1319
G1 X171 Y161.411 E-.13193
G1 X170.866 Y161.388 E-.12927
G1 X170.742 Y161.32 E-.13438
G1 X170.65 Y161.215 E-.13202
G1 X170.591 Y161.026 E-.18872
G1 X170.607 Y160.88 E-.13976
G1 X170.67 Y160.756 E-.13173
G1 X170.77 Y160.66 E-.13197
G1 X170.965 Y160.591 E-.1967
G1 X171.035 Y160.591 E-.06615
G1 X171.169 Y160.626 E-.13187
G1 X171.171 Y160.627 E-.00259
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.135 J-.385 E.04341
G1 X170.035 Y160.591 E.00218
G3 X170.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.1875
G1 X169.866 Y161.388 E-.12927
G1 X169.742 Y161.32 E-.13438
G1 X169.65 Y161.215 E-.13202
G1 X169.591 Y161.026 E-.18872
G1 X169.607 Y160.88 E-.13976
G1 X169.67 Y160.756 E-.13173
G1 X169.77 Y160.66 E-.13197
G1 X169.965 Y160.591 E-.19671
G1 X170.035 Y160.591 E-.06606
G1 X170.169 Y160.626 E-.13195
G1 X170.284 Y160.704 E-.13199
G1 X170.367 Y160.815 E-.13179
G1 X170.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.391 Y159.88 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06291
G1 X170.035 Y159.591 E.00218
G3 X170.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.41 Y160.018 E-.18761
G1 X170.381 Y160.153 E-.13181
G1 X170.258 Y160.32 E-.19655
G1 X170.145 Y160.384 E-.12394
G1 X170 Y160.411 E-.13988
G1 X169.866 Y160.388 E-.12927
G1 X169.742 Y160.32 E-.13452
G1 X169.65 Y160.215 E-.13183
G1 X169.591 Y160.026 E-.18877
G1 X169.607 Y159.88 E-.13976
G1 X169.67 Y159.756 E-.13173
G1 X169.77 Y159.66 E-.13197
G1 X169.901 Y159.613 E-.13238
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.391 Y159.88 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06291
G1 X171.035 Y159.591 E.00218
G3 X171.37 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.41 Y160.018 E-.18761
G1 X171.35 Y160.215 E-.19647
G1 X171.258 Y160.32 E-.13207
G1 X171.145 Y160.384 E-.12376
G1 X171 Y160.411 E-.13988
G1 X170.866 Y160.388 E-.12927
G1 X170.742 Y160.32 E-.13452
G1 X170.65 Y160.215 E-.13183
G1 X170.591 Y160.026 E-.18877
G1 X170.607 Y159.88 E-.13976
G1 X170.67 Y159.756 E-.13173
G1 X170.77 Y159.66 E-.13197
G1 X170.901 Y159.613 E-.13238
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X172.391 Y159.88 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06291
G1 X172.035 Y159.591 E.00218
G3 X172.37 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 4
M204 S10000
G1 X172.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.135 J-.385 E.04341
G1 X172.035 Y158.591 E.00218
G3 X172.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 7
M204 S10000
G1 X171.348 Y159.211 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.348 J-.214 E.05214
G1 X171.035 Y158.591 E.00218
G3 X171.375 Y159.158 I-.035 J.407 E.02417
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X171.258 Y159.32 E-.18988
G1 X171.137 Y159.387 E-.1319
G1 X171 Y159.411 E-.13193
G1 X170.866 Y159.388 E-.12927
G1 X170.742 Y159.32 E-.13438
G1 X170.65 Y159.215 E-.13202
G1 X170.591 Y159.026 E-.18872
G1 X170.607 Y158.88 E-.13976
G1 X170.67 Y158.756 E-.13173
G1 X170.77 Y158.66 E-.13197
G1 X170.965 Y158.591 E-.19671
G1 X171.035 Y158.591 E-.06615
G1 X171.169 Y158.626 E-.13187
G1 X171.225 Y158.663 E-.06373
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.135 J-.385 E.04341
G1 X170.035 Y158.591 E.00218
G3 X170.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170 Y159.411 E-.1875
G1 X169.866 Y159.388 E-.12927
G1 X169.742 Y159.32 E-.13438
G1 X169.65 Y159.215 E-.13202
G1 X169.591 Y159.026 E-.18872
G1 X169.607 Y158.88 E-.13976
G1 X169.67 Y158.756 E-.13173
G1 X169.77 Y158.66 E-.13197
G1 X169.965 Y158.591 E-.19671
G1 X170.035 Y158.591 E-.06606
G1 X170.169 Y158.626 E-.13195
G1 X170.284 Y158.704 E-.13199
G1 X170.393 Y158.88 E-.19649
G1 X170.393 Y158.881 E-.00145
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X169.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.135 J-.385 E.04341
G1 X169.035 Y160.591 E.00219
G3 X169.19 Y161.358 I-.035 J.407 E.03289
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.1875
G1 X168.866 Y161.388 E-.12927
G1 X168.742 Y161.32 E-.13438
G1 X168.65 Y161.215 E-.13202
G1 X168.591 Y161.026 E-.18872
G1 X168.607 Y160.88 E-.13976
G1 X168.67 Y160.756 E-.13189
G1 X168.831 Y160.626 E-.19658
G1 X168.965 Y160.591 E-.13186
G1 X169.035 Y160.591 E-.06622
G1 X169.169 Y160.626 E-.13187
G1 X169.284 Y160.704 E-.13199
G1 X169.367 Y160.815 E-.13179
G1 X169.381 Y160.883 E-.06614
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.135 J-.385 E.04341
G1 X168.035 Y160.591 E.00218
G3 X168.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.18751
G1 X167.866 Y161.388 E-.12927
G1 X167.742 Y161.32 E-.13438
G1 X167.65 Y161.215 E-.13202
G1 X167.591 Y161.026 E-.18872
G1 X167.607 Y160.88 E-.13976
G1 X167.67 Y160.756 E-.13173
G1 X167.831 Y160.626 E-.19676
G1 X167.965 Y160.591 E-.13191
G1 X168.035 Y160.591 E-.06615
G1 X168.169 Y160.626 E-.13187
G1 X168.284 Y160.704 E-.13199
G1 X168.367 Y160.815 E-.13179
G1 X168.381 Y160.883 E-.06614
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.135 J-.385 E.04341
G1 X167.035 Y160.591 E.00218
G3 X167.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.18751
G1 X166.866 Y161.388 E-.12927
G1 X166.742 Y161.32 E-.13438
G1 X166.65 Y161.215 E-.13202
G1 X166.591 Y161.026 E-.18872
G1 X166.607 Y160.88 E-.13976
G1 X166.67 Y160.756 E-.13173
G1 X166.831 Y160.626 E-.19676
G1 X166.965 Y160.591 E-.13191
G1 X167.035 Y160.591 E-.06615
G1 X167.169 Y160.626 E-.13187
G1 X167.284 Y160.704 E-.13199
G1 X167.367 Y160.815 E-.13179
G1 X167.381 Y160.883 E-.06614
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.365 Y159.816 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
M73 P41 R20
G3 X166.965 Y159.591 I-.365 J.181 E.06508
G1 X167.035 Y159.591 E.00218
G3 X167.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.25131
G1 X167.381 Y160.153 E-.13188
G1 X167.258 Y160.32 E-.19653
G1 X167.145 Y160.384 E-.12394
G1 X167 Y160.411 E-.13988
G1 X166.866 Y160.388 E-.12927
G1 X166.742 Y160.32 E-.13452
G1 X166.65 Y160.215 E-.13183
G1 X166.591 Y160.026 E-.18877
G1 X166.607 Y159.88 E-.13976
G1 X166.67 Y159.756 E-.13173
G1 X166.831 Y159.626 E-.19676
G1 X166.835 Y159.625 E-.00384
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.365 Y159.816 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.365 J.181 E.06508
G1 X168.035 Y159.591 E.00218
G3 X168.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 41
M204 S10000
G1 X168.654 Y160.213 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.346 J-.216 E.02613
G1 X169.035 Y159.591 E.00219
G3 X168.689 Y160.262 I-.035 J.406 E.05016
; COOLING_NODE: 44
M204 S10000
G1 X169.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.135 J-.385 E.04341
G1 X169.035 Y158.591 E.00219
G3 X169.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.1875
G1 X168.866 Y159.388 E-.12927
G1 X168.742 Y159.32 E-.13438
G1 X168.65 Y159.215 E-.13202
G1 X168.591 Y159.026 E-.18872
G1 X168.607 Y158.88 E-.13976
G1 X168.67 Y158.756 E-.13189
G1 X168.831 Y158.626 E-.19658
G1 X168.965 Y158.591 E-.13186
G1 X169.035 Y158.591 E-.06622
G1 X169.169 Y158.626 E-.13187
G1 X169.284 Y158.704 E-.13199
G1 X169.367 Y158.815 E-.13179
G1 X169.381 Y158.883 E-.06615
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.135 J-.385 E.04341
G1 X168.035 Y158.591 E.00218
G3 X168.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X168 Y159.411 E-.1875
G1 X167.866 Y159.388 E-.12927
G1 X167.742 Y159.32 E-.13438
G1 X167.65 Y159.215 E-.13202
G1 X167.591 Y159.026 E-.18872
G1 X167.607 Y158.88 E-.13976
G1 X167.67 Y158.756 E-.13173
G1 X167.831 Y158.626 E-.19676
G1 X167.965 Y158.591 E-.13191
G1 X168.035 Y158.591 E-.06615
G1 X168.169 Y158.626 E-.13187
G1 X168.284 Y158.704 E-.13199
G1 X168.367 Y158.815 E-.13179
G1 X168.381 Y158.883 E-.06616
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X167.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.135 J-.385 E.04341
G1 X167.035 Y158.591 E.00218
G3 X167.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 48
M204 S10000
G1 X166.37 Y159.495 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.683 J.5 E.03621
G2 X166.642 Y161.725 I.671 J.497 E.04831
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04592
; COOLING_NODE: 3
; WIPE_START
G1 X166.282 Y159.638 E-.18858
G1 X166.231 Y159.764 E-.12923
G1 X166.201 Y159.905 E-.13672
G1 X166.198 Y160.047 E-.13524
G1 X166.254 Y160.3 E-.24531
G1 X166.37 Y160.495 E-.21615
G1 X166.282 Y160.638 E-.15934
G1 X166.231 Y160.764 E-.12922
G1 X166.201 Y160.905 E-.13672
G1 X166.214 Y161.169 E-.25144
G1 X166.281 Y161.337 E-.17204
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173 Y159.405 Z1.2 F60000
G1 Z.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I0 J-.408 E.03908
G1 X173.035 Y158.591 E.00218
G3 X173.06 Y159.4 I-.035 J.406 E.03719
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X172.863 Y159.387 E-.18729
G1 X172.742 Y159.32 E-.13183
G1 X172.65 Y159.215 E-.13202
G1 X172.591 Y159.026 E-.18872
G1 X172.607 Y158.88 E-.13976
G1 X172.67 Y158.756 E-.13173
G1 X172.831 Y158.626 E-.19676
G1 X172.965 Y158.591 E-.13191
G1 X173.035 Y158.591 E-.06615
G1 X173.169 Y158.626 E-.13187
G1 X173.284 Y158.704 E-.13199
G1 X173.393 Y158.88 E-.19649
G1 X173.41 Y159.018 E-.13206
G1 X173.41 Y159.019 E-.00142
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.135 J-.385 E.04341
G1 X174.035 Y158.591 E.00219
G3 X174.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174 Y159.411 E-.18762
G1 X173.866 Y159.388 E-.12927
G1 X173.742 Y159.32 E-.13438
G1 X173.65 Y159.215 E-.13202
G1 X173.591 Y159.026 E-.18872
G1 X173.607 Y158.88 E-.13976
G1 X173.67 Y158.756 E-.13189
G1 X173.831 Y158.626 E-.19658
G1 X173.965 Y158.591 E-.13186
G1 X174.035 Y158.591 E-.06622
G1 X174.169 Y158.626 E-.13187
G1 X174.284 Y158.704 E-.13199
G1 X174.393 Y158.88 E-.19649
G1 X174.393 Y158.881 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.745 Y160.316 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.319 E.03046
G1 X174.035 Y159.591 E.00219
G3 X173.795 Y160.35 I-.035 J.407 E.04584
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00218
G3 X173.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X173.41 Y160.018 E-.1876
G1 X173.35 Y160.215 E-.19647
G1 X173.258 Y160.32 E-.13207
G1 X173.145 Y160.384 E-.12376
G1 X173 Y160.411 E-.13986
G1 X172.863 Y160.387 E-.13177
G1 X172.742 Y160.32 E-.13196
G1 X172.65 Y160.215 E-.13183
G1 X172.591 Y160.026 E-.18877
G1 X172.607 Y159.88 E-.13976
G1 X172.67 Y159.756 E-.13173
G1 X172.831 Y159.626 E-.19676
G1 X172.9 Y159.608 E-.06767
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.257 Y161.314 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.257 J-.317 E.04781
G1 X180.035 Y160.591 E.00219
G3 X180.301 Y161.273 I-.035 J.407 E.0285
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X180.137 Y161.387 E-.18965
G1 X180 Y161.411 E-.13205
G1 X179.866 Y161.388 E-.12927
G1 X179.742 Y161.32 E-.13438
G1 X179.65 Y161.215 E-.13202
G1 X179.591 Y161.026 E-.18872
G1 X179.607 Y160.88 E-.13976
G1 X179.67 Y160.756 E-.13173
G1 X179.77 Y160.66 E-.13199
G1 X179.965 Y160.591 E-.19661
G1 X180.035 Y160.591 E-.06622
G1 X180.169 Y160.626 E-.13187
G1 X180.284 Y160.704 E-.13199
G1 X180.324 Y160.757 E-.06373
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.135 J-.385 E.04341
G1 X179.035 Y160.591 E.00218
G3 X179.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.1875
G1 X178.866 Y161.388 E-.12927
G1 X178.742 Y161.32 E-.13438
G1 X178.65 Y161.215 E-.13202
G1 X178.591 Y161.026 E-.18872
G1 X178.607 Y160.88 E-.13976
G1 X178.67 Y160.756 E-.13173
G1 X178.831 Y160.626 E-.19676
G1 X178.965 Y160.591 E-.13191
G1 X179.035 Y160.591 E-.06615
G1 X179.169 Y160.626 E-.13187
G1 X179.284 Y160.704 E-.13199
G1 X179.367 Y160.815 E-.13179
G1 X179.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.391 Y159.88 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06291
G1 X179.035 Y159.591 E.00218
G3 X179.37 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 19
M204 S10000
G1 X180.135 Y160.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04341
G1 X180.035 Y159.591 E.00219
G3 X180.19 Y160.358 I-.035 J.407 E.03289
; COOLING_NODE: 18
M204 S10000
G1 X180.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.135 J-.385 E.04341
G1 X180.035 Y158.591 E.00219
G3 X180.19 Y159.358 I-.035 J.407 E.03289
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X180 Y159.411 E-.18762
G1 X179.866 Y159.388 E-.12927
G1 X179.742 Y159.32 E-.13438
G1 X179.65 Y159.215 E-.13202
G1 X179.591 Y159.026 E-.18872
G1 X179.607 Y158.88 E-.13976
G1 X179.67 Y158.756 E-.13173
G1 X179.77 Y158.66 E-.13199
G1 X179.965 Y158.591 E-.19661
G1 X180.035 Y158.591 E-.06622
G1 X180.169 Y158.626 E-.13187
G1 X180.284 Y158.704 E-.13199
G1 X180.393 Y158.88 E-.19649
G1 X180.393 Y158.881 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.135 J-.385 E.04341
G1 X179.035 Y158.591 E.00218
G3 X179.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X179 Y159.411 E-.18749
G1 X178.866 Y159.388 E-.12927
G1 X178.742 Y159.32 E-.13438
G1 X178.65 Y159.215 E-.13202
G1 X178.591 Y159.026 E-.18872
G1 X178.607 Y158.88 E-.13976
G1 X178.67 Y158.756 E-.13173
G1 X178.831 Y158.626 E-.19676
G1 X178.965 Y158.591 E-.13191
G1 X179.035 Y158.591 E-.06615
G1 X179.169 Y158.626 E-.13187
G1 X179.284 Y158.704 E-.13199
G1 X179.393 Y158.88 E-.19649
G1 X179.393 Y158.881 E-.00146
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.135 Y159.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.135 J-.385 E.04341
G1 X181.035 Y158.591 E.00218
G3 X181.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 22
M204 S10000
G1 X182.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.135 J-.385 E.04341
G1 X182.035 Y158.591 E.00218
G3 X182.19 Y159.358 I-.035 J.407 E.0329
; COOLING_NODE: 23
M204 S10000
G1 X182.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.365 J.181 E.06508
G1 X182.035 Y159.591 E.00218
G3 X182.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 20
M204 S10000
G1 X181.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.365 J.181 E.06508
G1 X181.035 Y159.591 E.00218
G3 X181.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.25132
G1 X181.381 Y160.153 E-.13188
G1 X181.258 Y160.32 E-.19653
G1 X181.145 Y160.384 E-.12394
G1 X181 Y160.411 E-.13988
G1 X180.866 Y160.388 E-.12927
G1 X180.742 Y160.32 E-.13452
G1 X180.65 Y160.215 E-.13188
G1 X180.591 Y160.026 E-.18872
G1 X180.607 Y159.88 E-.13976
G1 X180.67 Y159.756 E-.13173
G1 X180.831 Y159.626 E-.19676
G1 X180.835 Y159.625 E-.00383
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.135 Y161.382 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.135 J-.385 E.04341
G1 X181.035 Y160.591 E.00218
G3 X181.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 27
M204 S10000
G1 X182.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.135 J-.385 E.04341
G1 X182.035 Y160.591 E.00218
G3 X182.19 Y161.358 I-.035 J.407 E.0329
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.1875
G1 X181.866 Y161.388 E-.12927
G1 X181.742 Y161.32 E-.13438
G1 X181.65 Y161.215 E-.13202
G1 X181.591 Y161.026 E-.18872
G1 X181.607 Y160.88 E-.13976
G1 X181.67 Y160.756 E-.13173
G1 X181.831 Y160.626 E-.19676
G1 X181.965 Y160.591 E-.13191
G1 X182.035 Y160.591 E-.06615
G1 X182.169 Y160.626 E-.13187
G1 X182.284 Y160.704 E-.13199
G1 X182.367 Y160.815 E-.13179
G1 X182.381 Y160.883 E-.06615
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.378 Y161.152 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.378 J-.154 E.05422
G1 X183.035 Y160.591 E.00218
G3 X183.396 Y161.094 I-.035 J.407 E.02208
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.258 Y161.32 E-.25102
G1 X183.137 Y161.387 E-.13178
G1 X183 Y161.411 E-.13205
G1 X182.866 Y161.388 E-.12927
G1 X182.742 Y161.32 E-.13438
G1 X182.65 Y161.215 E-.13202
G1 X182.591 Y161.026 E-.18872
G1 X182.607 Y160.88 E-.13976
G1 X182.67 Y160.756 E-.13189
G1 X182.831 Y160.626 E-.19659
G1 X182.965 Y160.591 E-.13191
G1 X183.035 Y160.591 E-.06615
G1 X183.169 Y160.626 E-.13187
G1 X183.171 Y160.627 E-.00258
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.593 Y160.026 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.407 J-.028 E.01989
G1 X183.035 Y159.591 E.00218
G3 X182.602 Y160.085 I-.035 J.407 E.05642
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182.607 Y159.88 E-.19519
G1 X182.67 Y159.756 E-.13189
G1 X182.831 Y159.626 E-.19659
G1 X182.965 Y159.591 E-.13191
G1 X183.035 Y159.591 E-.06615
G1 X183.169 Y159.626 E-.13187
G1 X183.284 Y159.704 E-.13199
G1 X183.367 Y159.815 E-.13179
G1 X183.41 Y160.017 E-.19672
G1 X183.35 Y160.215 E-.19653
G1 X183.258 Y160.32 E-.13206
G1 X183.137 Y160.387 E-.1318
G1 X183.007 Y160.41 E-.12551
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.378 Y159.152 Z1.2 F60000
G1 Z.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.378 J-.154 E.05423
G1 X183.035 Y158.591 E.00218
G3 X183.396 Y159.095 I-.035 J.407 E.02208
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X183.258 Y159.32 E-.25098
G1 X183.137 Y159.387 E-.13178
G1 X183 Y159.411 E-.13205
G1 X182.866 Y159.388 E-.12927
G1 X182.742 Y159.32 E-.13438
G1 X182.65 Y159.215 E-.13202
G1 X182.591 Y159.026 E-.18872
G1 X182.607 Y158.88 E-.13976
G1 X182.67 Y158.756 E-.13189
G1 X182.831 Y158.626 E-.19659
G1 X182.965 Y158.591 E-.13191
G1 X183.035 Y158.591 E-.06615
G1 X183.169 Y158.626 E-.13187
G1 X183.171 Y158.627 E-.00261
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z1.2 F60000
G1 Z.8
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00612
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04796
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311773
G1 F4017.071
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294543
G1 F4292.134
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266456
G1 F4831.434
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243531
G1 F5383.561
G2 X184.078 Y160.68 I-2.435 J-.221 E.00913
; LINE_WIDTH: 0.278705
G1 F4580.444
G1 X184.075 Y160.66 E.0004
; LINE_WIDTH: 0.297432
G1 F4243.42
G1 X184.059 Y160.579 E.00175
; LINE_WIDTH: 0.328374
G1 F3783.446
G1 X184.044 Y160.497 E.00197
G1 X184.023 Y160.496 E.00048
; LINE_WIDTH: 0.288889
G1 F4390.799
G1 X183.949 Y160.496 E.00151
; LINE_WIDTH: 0.250889
G1 F5193.088
G1 X183.875 Y160.496 E.00128
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311623
G1 F4019.31
M204 S8000
G1 X184.062 Y160.414 E.00892
; LINE_WIDTH: 0.294457
G1 F4293.603
G1 X184.075 Y160.329 E.0018
; LINE_WIDTH: 0.266426
G1 F4832.083
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243528
G1 F5383.647
G2 X184.078 Y159.68 I-2.436 J-.221 E.00913
; LINE_WIDTH: 0.278705
G1 F4580.444
G1 X184.075 Y159.66 E.0004
; LINE_WIDTH: 0.297432
G1 F4243.42
G1 X184.059 Y159.579 E.00175
; LINE_WIDTH: 0.328359
G1 F3783.655
G1 X184.044 Y159.497 E.00197
G1 X184.023 Y159.496 E.00048
; LINE_WIDTH: 0.288779
G1 F4392.772
G1 X183.949 Y159.496 E.00151
; LINE_WIDTH: 0.25081
G1 F5195.059
G1 X183.875 Y159.496 E.00128
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311801
G1 F4016.653
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294567
G1 F4291.74
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266461
G1 F4831.329
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243528
G1 F5383.651
G2 X184.078 Y158.68 I-2.436 J-.221 E.00913
; LINE_WIDTH: 0.278705
G1 F4580.444
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298231
G1 F4230.134
G1 X184.058 Y158.575 E.00185
; LINE_WIDTH: 0.353079
G1 F3482.091
G1 X184.036 Y158.464 E.00291
G1 X183.754 Y158.306 E.00834
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609589
G1 F1905.874
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574621
G1 F2031.22
G2 X182.196 Y158.161 I-.349 J1.725 E.00657
; LINE_WIDTH: 0.540413
G1 F2170.888
G2 X181.76 Y158.166 I-.193 J1.907 E.01806
; LINE_WIDTH: 0.581491
G1 F2005.308
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609578
G1 F1905.912
G1 X181.609 Y158.195 E.00233
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609589
G1 F1905.874
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574621
G1 F2031.22
G2 X168.196 Y158.161 I-.349 J1.725 E.00657
; LINE_WIDTH: 0.540413
G1 F2170.888
G2 X167.76 Y158.166 I-.193 J1.907 E.01806
; LINE_WIDTH: 0.581491
G1 F2005.308
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609578
G1 F1905.912
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.248 Y158.306 F60000
; LINE_WIDTH: 0.358804
G1 F3418.979
M204 S8000
G1 X165.964 Y158.464 E.00854
G1 X165.958 Y158.489 E.00069
; LINE_WIDTH: 0.331152
G1 F3746.99
G1 X165.941 Y158.575 E.00208
; LINE_WIDTH: 0.294522
G1 F4292.494
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.243976
G1 F5371.641
G2 X165.912 Y159.244 I2.482 J.325 E.00944
; LINE_WIDTH: 0.268893
G1 F4779.35
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308533
G1 F4066.07
G2 X166.014 Y159.807 I5.632 J-.798 E.01074
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.252498
G1 F5153.223
M204 S8000
G1 X166.05 Y159.496 E.0013
; LINE_WIDTH: 0.29082
G1 F4356.597
G1 X165.975 Y159.496 E.00154
; LINE_WIDTH: 0.31461
G1 F3975.121
G1 X165.956 Y159.497 E.00043
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.245172
G1 F5339.875
G2 X165.912 Y160.244 I2.419 J.345 E.00984
; LINE_WIDTH: 0.268893
G1 F4779.338
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.308532
G1 F4066.083
G2 X166.014 Y160.807 I5.575 J-.789 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.252443
G1 F5154.568
M204 S8000
G1 X166.05 Y160.496 E.0013
; LINE_WIDTH: 0.290664
G1 F4359.343
G1 X165.976 Y160.497 E.00154
; LINE_WIDTH: 0.31461
G1 F3975.119
G1 X165.956 Y160.497 E.00043
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.24517
G1 F5339.944
G2 X165.912 Y161.244 I2.419 J.345 E.00984
; LINE_WIDTH: 0.268888
G1 F4779.442
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.307607
G1 F4080.293
G2 X165.992 Y161.694 I4.274 J-.595 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4080.293
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 5/25
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I.139 J1.209 P1  F60000
G1 X174.745 Y160.315 Z1.2
G1 Z1
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03045
G1 X175.035 Y159.591 E.00219
G3 X174.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 13
M204 S10000
G1 X175.592 Y160.038 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.408 J-.039 E.02032
G1 X176.035 Y159.591 E.00219
G3 X175.602 Y160.097 I-.035 J.409 E.05638
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.20684
G1 X175.67 Y159.756 E-.13185
G1 X175.831 Y159.626 E-.19662
G1 X175.965 Y159.591 E-.13187
G1 X176.035 Y159.591 E-.06622
G1 X176.169 Y159.626 E-.13192
G1 X176.33 Y159.756 E-.19662
G1 X176.393 Y159.88 E-.13198
G1 X176.41 Y160.017 E-.13187
G1 X176.381 Y160.153 E-.13191
G1 X176.266 Y160.312 E-.1864
G1 X176.137 Y160.387 E-.14202
G1 X176.019 Y160.408 E-.11387
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.651 Y160.215 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.349 J-.216 E.02622
G1 X177.035 Y159.591 E.00219
G3 X176.686 Y160.264 I-.035 J.409 E.05048
; COOLING_NODE: 11
M204 S10000
G1 X177.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.136 J-.387 E.04365
G1 X177.035 Y158.591 E.00219
G3 X177.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X177 Y159.411 E-.18774
G1 X176.874 Y159.39 E-.12142
G1 X176.742 Y159.32 E-.14198
G1 X176.65 Y159.215 E-.13188
G1 X176.591 Y159.038 E-.17741
G1 X176.607 Y158.88 E-.15153
G1 X176.67 Y158.756 E-.13181
G1 X176.831 Y158.626 E-.19664
G1 X176.965 Y158.591 E-.13187
G1 X177.035 Y158.591 E-.06622
G1 X177.169 Y158.626 E-.13192
G1 X177.33 Y158.756 E-.19662
G1 X177.393 Y158.88 E-.1319
G1 X177.393 Y158.881 E-.00105
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.136 J-.387 E.04365
G1 X176.035 Y158.591 E.00219
G3 X176.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X176 Y159.411 E-.18774
G1 X175.874 Y159.39 E-.12142
G1 X175.742 Y159.32 E-.14198
G1 X175.65 Y159.215 E-.13188
G1 X175.591 Y159.038 E-.17741
G1 X175.607 Y158.88 E-.1515
G1 X175.67 Y158.756 E-.13185
G1 X175.831 Y158.626 E-.19662
G1 X175.965 Y158.591 E-.13187
G1 X176.035 Y158.591 E-.06622
G1 X176.169 Y158.626 E-.13192
G1 X176.33 Y158.756 E-.19662
G1 X176.393 Y158.88 E-.1319
G1 X176.393 Y158.881 E-.00105
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.136 J-.387 E.04365
G1 X175.035 Y158.591 E.00219
G3 X175.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X174.992 Y159.411 E-.19472
G1 X174.802 Y159.36 E-.18664
G1 X174.692 Y159.271 E-.13506
G1 X174.619 Y159.153 E-.13198
G1 X174.59 Y159.017 E-.13181
G1 X174.633 Y158.815 E-.19666
G1 X174.716 Y158.703 E-.13185
G1 X174.831 Y158.626 E-.1319
G1 X174.965 Y158.591 E-.13187
G1 X175.035 Y158.591 E-.06622
G1 X175.169 Y158.626 E-.13192
G1 X175.284 Y158.703 E-.13182
G1 X175.367 Y158.815 E-.132
G1 X175.382 Y158.882 E-.06555
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X172.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.136 J-.387 E.04365
G1 X172.035 Y158.591 E.00218
G3 X172.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 3
M204 S10000
G1 X173 Y159.409 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I0 J-.41 E.03929
G1 X173.035 Y158.591 E.00218
G3 X173.06 Y159.405 I-.035 J.409 E.03741
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X172.874 Y159.39 E-.17739
G1 X172.742 Y159.32 E-.14198
G1 X172.65 Y159.215 E-.13188
G1 X172.591 Y159.038 E-.17741
G1 X172.607 Y158.88 E-.15153
G1 X172.67 Y158.756 E-.13181
G1 X172.77 Y158.66 E-.13183
G1 X172.965 Y158.591 E-.19677
G1 X173.035 Y158.591 E-.06611
G1 X173.166 Y158.624 E-.12892
G1 X173.23 Y158.66 E-.06931
G1 X173.33 Y158.756 E-.13185
G1 X173.393 Y158.88 E-.1319
G1 X173.41 Y159.017 E-.13131
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X174.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.136 J-.387 E.04365
G1 X174.035 Y158.591 E.00219
G3 X174.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X173.992 Y159.411 E-.19473
G1 X173.802 Y159.36 E-.18664
G1 X173.692 Y159.271 E-.13506
G1 X173.619 Y159.153 E-.13198
G1 X173.59 Y159.017 E-.13181
G1 X173.633 Y158.815 E-.19666
G1 X173.716 Y158.703 E-.13185
G1 X173.831 Y158.626 E-.1319
G1 X173.965 Y158.591 E-.13187
G1 X174.035 Y158.591 E-.06622
G1 X174.169 Y158.626 E-.13192
G1 X174.284 Y158.703 E-.13182
G1 X174.367 Y158.815 E-.132
G1 X174.382 Y158.882 E-.06554
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.745 Y160.315 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03045
G1 X174.035 Y159.591 E.00219
G3 X173.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 2
M204 S10000
G1 X173.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.392 J.119 E.06329
G1 X173.035 Y159.591 E.00218
G3 X173.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 5
M204 S10000
G1 X172.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.392 J.119 E.06329
G1 X172.035 Y159.591 E.00218
G3 X172.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X172.41 Y160.017 E-.1878
G1 X172.381 Y160.153 E-.13188
G1 X172.308 Y160.271 E-.1319
G1 X172.137 Y160.387 E-.19671
G1 X172 Y160.411 E-.13194
G1 X171.874 Y160.39 E-.12142
G1 X171.742 Y160.32 E-.14206
G1 X171.65 Y160.215 E-.13177
G1 X171.591 Y160.038 E-.17744
G1 X171.607 Y159.88 E-.15153
G1 X171.67 Y159.756 E-.13181
G1 X171.77 Y159.66 E-.13183
G1 X171.901 Y159.613 E-.13192
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.136 J-.387 E.04365
G1 X169.035 Y160.591 E.00219
G3 X169.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.18776
G1 X168.874 Y161.39 E-.12142
G1 X168.742 Y161.32 E-.14198
G1 X168.65 Y161.215 E-.13188
G1 X168.591 Y161.038 E-.17741
G1 X168.607 Y160.88 E-.1515
G1 X168.67 Y160.756 E-.13185
G1 X168.831 Y160.626 E-.19662
G1 X168.965 Y160.591 E-.13187
G1 X169.035 Y160.591 E-.06622
G1 X169.169 Y160.626 E-.13192
G1 X169.33 Y160.756 E-.19662
G1 X169.393 Y160.88 E-.13198
G1 X169.393 Y160.881 E-.00096
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.136 J-.387 E.04365
G1 X168.035 Y160.591 E.00218
G3 X168.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.18749
G1 X167.874 Y161.39 E-.12142
G1 X167.742 Y161.32 E-.14198
G1 X167.65 Y161.215 E-.13188
G1 X167.591 Y161.038 E-.17741
G1 X167.607 Y160.88 E-.15153
G1 X167.67 Y160.756 E-.13181
G1 X167.831 Y160.626 E-.19665
G1 X167.965 Y160.591 E-.13195
G1 X168.035 Y160.591 E-.06611
G1 X168.166 Y160.624 E-.12891
G1 X168.23 Y160.66 E-.06931
G1 X168.33 Y160.756 E-.13185
G1 X168.393 Y160.879 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.136 J-.387 E.04365
G1 X167.035 Y160.591 E.00218
M73 P42 R20
G3 X167.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.18749
G1 X166.874 Y161.39 E-.12142
G1 X166.742 Y161.32 E-.14198
G1 X166.65 Y161.215 E-.13188
G1 X166.591 Y161.038 E-.17741
G1 X166.607 Y160.88 E-.15153
G1 X166.67 Y160.756 E-.13181
G1 X166.831 Y160.626 E-.19665
G1 X166.965 Y160.591 E-.13195
G1 X167.035 Y160.591 E-.06611
G1 X167.166 Y160.624 E-.12891
G1 X167.23 Y160.66 E-.06931
G1 X167.33 Y160.756 E-.13185
G1 X167.393 Y160.879 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.37 Y159.495 Z1.4 F60000
G1 Z1
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.648 J.5 E.03641
G2 X166.642 Y161.725 I.654 J.5 E.04855
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.356 J.714 E.04605
; COOLING_NODE: 48
M204 S10000
G1 X167.136 Y159.386 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.136 J-.387 E.04365
G1 X167.035 Y158.591 E.00218
G3 X167.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 47
M204 S10000
G1 X167.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.392 J.119 E.06329
G1 X167.035 Y159.591 E.00218
G3 X167.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.1878
G1 X167.381 Y160.153 E-.13188
G1 X167.308 Y160.271 E-.1319
G1 X167.137 Y160.387 E-.19671
G1 X167 Y160.411 E-.13194
G1 X166.874 Y160.39 E-.12142
G1 X166.742 Y160.32 E-.14206
G1 X166.65 Y160.215 E-.13177
G1 X166.591 Y160.038 E-.17744
G1 X166.607 Y159.88 E-.15153
G1 X166.67 Y159.756 E-.13181
G1 X166.77 Y159.66 E-.13183
G1 X166.901 Y159.613 E-.13192
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.392 Y159.88 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.392 J.119 E.06329
G1 X168.035 Y159.591 E.00218
G3 X168.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 41
M204 S10000
G1 X168.651 Y160.215 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.349 J-.216 E.02622
G1 X169.035 Y159.591 E.00219
G3 X168.686 Y160.264 I-.035 J.409 E.05048
; COOLING_NODE: 44
M204 S10000
G1 X169.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.136 J-.387 E.04365
G1 X169.035 Y158.591 E.00219
G3 X169.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.18775
G1 X168.874 Y159.39 E-.12142
G1 X168.742 Y159.32 E-.14198
G1 X168.65 Y159.215 E-.13188
G1 X168.591 Y159.038 E-.17741
G1 X168.607 Y158.88 E-.1515
G1 X168.67 Y158.756 E-.13185
G1 X168.831 Y158.626 E-.19662
G1 X168.965 Y158.591 E-.13187
G1 X169.035 Y158.591 E-.06622
G1 X169.169 Y158.626 E-.13192
G1 X169.33 Y158.756 E-.19662
G1 X169.393 Y158.88 E-.1319
G1 X169.393 Y158.881 E-.00104
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.136 J-.387 E.04365
G1 X168.035 Y158.591 E.00218
G3 X168.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X168 Y159.411 E-.18749
G1 X167.874 Y159.39 E-.12142
G1 X167.742 Y159.32 E-.14198
G1 X167.65 Y159.215 E-.13188
G1 X167.591 Y159.038 E-.17741
G1 X167.607 Y158.88 E-.15153
G1 X167.67 Y158.756 E-.13181
G1 X167.77 Y158.66 E-.13183
G1 X167.965 Y158.591 E-.19677
G1 X168.035 Y158.591 E-.06611
G1 X168.166 Y158.624 E-.12892
G1 X168.23 Y158.66 E-.06931
G1 X168.33 Y158.756 E-.13185
G1 X168.393 Y158.879 E-.13169
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.136 J-.387 E.04365
G1 X170.035 Y158.591 E.00218
G3 X170.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X170 Y159.411 E-.18749
G1 X169.874 Y159.39 E-.12142
G1 X169.742 Y159.32 E-.14198
G1 X169.65 Y159.215 E-.13188
G1 X169.591 Y159.038 E-.17741
G1 X169.607 Y158.88 E-.15153
G1 X169.67 Y158.756 E-.13183
G1 X169.831 Y158.626 E-.19659
G1 X169.965 Y158.591 E-.13199
G1 X170.035 Y158.591 E-.06612
G1 X170.166 Y158.624 E-.12892
G1 X170.23 Y158.66 E-.06931
G1 X170.33 Y158.756 E-.13185
G1 X170.393 Y158.879 E-.13168
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.38 Y159.153 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.38 J-.153 E.05456
G1 X171.035 Y158.591 E.00218
G3 X171.399 Y159.095 I-.035 J.409 E.02215
; COOLING_NODE: 6
M204 S10000
G1 X171.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.392 J.119 E.06328
G1 X171.035 Y159.591 E.00218
G3 X171.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 42
M204 S10000
G1 X170.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.392 J.119 E.06328
G1 X170.035 Y159.591 E.00218
G3 X170.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X170.41 Y160.017 E-.1878
G1 X170.381 Y160.153 E-.13188
G1 X170.308 Y160.271 E-.1319
G1 X170.137 Y160.387 E-.19671
G1 X170 Y160.411 E-.13194
G1 X169.874 Y160.39 E-.12142
G1 X169.742 Y160.32 E-.14206
G1 X169.65 Y160.215 E-.13177
G1 X169.591 Y160.038 E-.17744
G1 X169.607 Y159.88 E-.15153
G1 X169.67 Y159.756 E-.13183
G1 X169.831 Y159.626 E-.19659
G1 X169.899 Y159.608 E-.06714
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.136 J-.387 E.04365
G1 X170.035 Y160.591 E.00218
G3 X170.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.18749
G1 X169.874 Y161.39 E-.12142
G1 X169.742 Y161.32 E-.14198
G1 X169.65 Y161.215 E-.13188
G1 X169.591 Y161.038 E-.17741
G1 X169.607 Y160.88 E-.15153
G1 X169.67 Y160.756 E-.13183
G1 X169.831 Y160.626 E-.19659
G1 X169.965 Y160.591 E-.13199
G1 X170.035 Y160.591 E-.06612
G1 X170.166 Y160.624 E-.12891
G1 X170.23 Y160.66 E-.06931
G1 X170.33 Y160.756 E-.13186
G1 X170.393 Y160.879 E-.13168
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.38 Y161.153 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.38 J-.153 E.05455
G1 X171.035 Y160.591 E.00218
G3 X171.399 Y161.095 I-.035 J.409 E.02215
; COOLING_NODE: 37
M204 S10000
G1 X172.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.136 J-.387 E.04365
G1 X172.035 Y160.591 E.00218
G3 X172.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 36
M204 S10000
G1 X173 Y161.409 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I0 J-.41 E.03929
G1 X173.035 Y160.591 E.00218
G3 X173.06 Y161.405 I-.035 J.409 E.03741
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X172.874 Y161.39 E-.17739
G1 X172.742 Y161.32 E-.14198
G1 X172.65 Y161.215 E-.13188
G1 X172.591 Y161.038 E-.17741
G1 X172.607 Y160.88 E-.15153
G1 X172.67 Y160.756 E-.13181
G1 X172.831 Y160.626 E-.19665
G1 X172.965 Y160.591 E-.13195
G1 X173.035 Y160.591 E-.06611
G1 X173.166 Y160.624 E-.12891
G1 X173.23 Y160.66 E-.06931
G1 X173.33 Y160.756 E-.13186
G1 X173.393 Y160.88 E-.13198
G1 X173.41 Y161.017 E-.13123
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.136 J-.387 E.04365
G1 X174.035 Y160.591 E.00219
G3 X174.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 34
M204 S10000
G1 X175.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.136 J-.387 E.04365
G1 X175.035 Y160.591 E.00219
G3 X175.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 33
M204 S10000
G1 X176.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.136 J-.387 E.04365
G1 X176.035 Y160.591 E.00219
G3 X176.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 32
M204 S10000
G1 X177.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.136 J-.387 E.04365
G1 X177.035 Y160.591 E.00219
G3 X177.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 31
M204 S10000
G1 X178.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.136 J-.387 E.04365
G1 X178.035 Y160.591 E.00219
G3 X178.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.18775
G1 X177.874 Y161.39 E-.12142
G1 X177.742 Y161.32 E-.14198
G1 X177.65 Y161.215 E-.13188
G1 X177.591 Y161.038 E-.17741
G1 X177.607 Y160.88 E-.15153
G1 X177.67 Y160.756 E-.13181
G1 X177.831 Y160.626 E-.19664
G1 X177.965 Y160.591 E-.13187
G1 X178.035 Y160.591 E-.06622
G1 X178.169 Y160.626 E-.13192
G1 X178.33 Y160.756 E-.19662
G1 X178.393 Y160.88 E-.13198
G1 X178.393 Y160.881 E-.00097
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.651 Y160.215 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.349 J-.216 E.02622
G1 X178.035 Y159.591 E.00219
G3 X177.686 Y160.264 I-.035 J.409 E.05048
; COOLING_NODE: 17
M204 S10000
G1 X178.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.136 J-.387 E.04365
G1 X178.035 Y158.591 E.00219
G3 X178.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 16
M204 S10000
G1 X179.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.136 J-.387 E.04365
G1 X179.035 Y158.591 E.00218
G3 X179.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 18
M204 S10000
G1 X180.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.136 J-.387 E.04365
G1 X180.035 Y158.591 E.00219
G3 X180.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 19
M204 S10000
G1 X180.198 Y160.354 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.198 J-.357 E.04555
G1 X180.035 Y159.591 E.00219
G3 X180.248 Y160.321 I-.035 J.406 E.03072
; COOLING_NODE: 15
M204 S10000
G1 X179.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.392 J.119 E.06329
G1 X179.035 Y159.591 E.00218
G3 X179.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.1878
G1 X179.381 Y160.153 E-.13188
G1 X179.308 Y160.271 E-.1319
G1 X179.137 Y160.387 E-.19671
G1 X179 Y160.411 E-.13194
G1 X178.874 Y160.39 E-.12142
G1 X178.742 Y160.32 E-.14206
G1 X178.65 Y160.215 E-.13177
G1 X178.591 Y160.038 E-.17744
G1 X178.607 Y159.88 E-.15153
G1 X178.67 Y159.756 E-.13181
G1 X178.77 Y159.66 E-.13183
G1 X178.901 Y159.613 E-.13191
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.136 Y161.386 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.136 J-.387 E.04365
G1 X179.035 Y160.591 E.00218
G3 X179.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.18748
G1 X178.874 Y161.39 E-.12142
G1 X178.742 Y161.32 E-.14198
G1 X178.65 Y161.215 E-.13188
G1 X178.591 Y161.038 E-.17741
G1 X178.607 Y160.88 E-.15153
G1 X178.67 Y160.756 E-.13181
G1 X178.831 Y160.626 E-.19665
G1 X178.965 Y160.591 E-.13195
G1 X179.035 Y160.591 E-.06611
G1 X179.166 Y160.624 E-.12891
G1 X179.23 Y160.66 E-.06931
G1 X179.33 Y160.756 E-.13186
G1 X179.393 Y160.88 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.307 Y161.271 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.307 J-.271 E.05019
G1 X180.035 Y160.591 E.00219
G3 X180.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 28
M204 S10000
G1 X181.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.136 J-.387 E.04365
G1 X181.035 Y160.591 E.00218
G3 X181.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 27
M204 S10000
G1 X182.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.136 J-.387 E.04365
G1 X182.035 Y160.591 E.00218
G3 X182.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.18748
G1 X181.874 Y161.39 E-.12142
G1 X181.742 Y161.32 E-.14198
G1 X181.65 Y161.215 E-.13188
G1 X181.591 Y161.038 E-.17741
G1 X181.607 Y160.88 E-.15153
G1 X181.67 Y160.756 E-.13181
G1 X181.831 Y160.626 E-.19665
G1 X181.965 Y160.591 E-.13195
G1 X182.035 Y160.591 E-.06611
G1 X182.166 Y160.624 E-.12891
G1 X182.23 Y160.66 E-.06931
G1 X182.33 Y160.756 E-.13186
G1 X182.393 Y160.88 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.38 Y161.153 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.38 J-.153 E.05456
G1 X183.035 Y160.591 E.00218
G3 X183.399 Y161.095 I-.035 J.409 E.02215
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.266 Y161.312 E-.24124
G1 X183.137 Y161.387 E-.14202
G1 X183 Y161.411 E-.13194
G1 X182.874 Y161.39 E-.12142
G1 X182.742 Y161.32 E-.14198
G1 X182.65 Y161.215 E-.13188
G1 X182.591 Y161.038 E-.17741
G1 X182.607 Y160.88 E-.1515
G1 X182.67 Y160.756 E-.13185
G1 X182.831 Y160.626 E-.19664
G1 X182.965 Y160.591 E-.13195
G1 X183.035 Y160.591 E-.06611
G1 X183.166 Y160.624 E-.12891
G1 X183.171 Y160.627 E-.00515
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z1.4 F60000
G1 Z1
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.413 Y161.898 E.03334
G1 X183.358 Y161.729 E.00601
G2 X183.63 Y160.495 I-.406 J-.736 E.04837
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 22
; WIPE_START
G1 X183.413 Y161.898 E-.93733
G1 X183.358 Y161.729 E-.16881
G1 X183.604 Y161.531 E-.29911
G1 X183.685 Y161.422 E-.12963
G1 X183.786 Y161.169 E-.25839
G1 X183.791 Y161.057 E-.10673
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X182.136 Y159.386 Z1.4 F60000
G1 Z1
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.136 J-.387 E.04365
G1 X182.035 Y158.591 E.00218
G3 X182.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182 Y159.411 E-.18748
G1 X181.874 Y159.39 E-.12142
G1 X181.742 Y159.32 E-.14198
G1 X181.65 Y159.215 E-.13188
G1 X181.591 Y159.038 E-.17741
G1 X181.607 Y158.88 E-.15153
G1 X181.67 Y158.756 E-.13181
G1 X181.77 Y158.66 E-.13183
G1 X181.965 Y158.591 E-.19677
G1 X182.035 Y158.591 E-.06611
G1 X182.166 Y158.624 E-.12892
G1 X182.23 Y158.66 E-.06931
G1 X182.33 Y158.756 E-.13185
G1 X182.393 Y158.879 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.38 Y159.153 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.38 J-.153 E.05456
G1 X183.035 Y158.591 E.00218
G3 X183.399 Y159.095 I-.035 J.409 E.02215
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.266 Y159.312 E-.24124
G1 X183.137 Y159.387 E-.14202
G1 X183 Y159.411 E-.13194
G1 X182.874 Y159.39 E-.12142
G1 X182.742 Y159.32 E-.14198
G1 X182.65 Y159.215 E-.13188
G1 X182.591 Y159.038 E-.17741
G1 X182.607 Y158.88 E-.1515
G1 X182.67 Y158.756 E-.13185
G1 X182.77 Y158.66 E-.13182
G1 X182.965 Y158.591 E-.19677
G1 X183.035 Y158.591 E-.06611
G1 X183.166 Y158.624 E-.12892
G1 X183.171 Y158.627 E-.00515
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.592 Y160.038 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.408 J-.039 E.02033
G1 X183.035 Y159.591 E.00218
G3 X182.602 Y160.097 I-.035 J.409 E.05638
; COOLING_NODE: 23
M204 S10000
G1 X182.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.392 J.119 E.06329
G1 X182.035 Y159.591 E.00218
G3 X182.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 20
M204 S10000
G1 X181.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.392 J.119 E.06329
G1 X181.035 Y159.591 E.00218
G3 X181.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 21
M204 S10000
G1 X181.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.136 J-.387 E.04365
G1 X181.035 Y158.591 E.00218
G3 X181.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X181 Y159.411 E-.18748
G1 X180.874 Y159.39 E-.12142
G1 X180.742 Y159.32 E-.14198
G1 X180.65 Y159.215 E-.13188
G1 X180.591 Y159.038 E-.17741
G1 X180.607 Y158.88 E-.15153
G1 X180.67 Y158.756 E-.13181
G1 X180.77 Y158.66 E-.13183
G1 X180.965 Y158.591 E-.19677
G1 X181.035 Y158.591 E-.06611
G1 X181.166 Y158.624 E-.12892
G1 X181.23 Y158.66 E-.06931
G1 X181.33 Y158.756 E-.13186
G1 X181.393 Y158.879 E-.1317
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.79 Y162.29 Z1.4 F60000
G1 Z1
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311718
G1 F4017.894
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294497
G1 F4292.93
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266345
G1 F4833.842
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243521
G1 F5383.843
G2 X184.078 Y160.68 I-2.437 J-.22 E.00912
; LINE_WIDTH: 0.278704
G1 F4580.475
G1 X184.075 Y160.66 E.00039
; LINE_WIDTH: 0.29741
G1 F4243.785
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.3286
G1 F3780.46
G1 X184.044 Y160.497 E.00197
G1 X184.025 Y160.496 E.00045
; LINE_WIDTH: 0.291009
G1 F4353.285
G1 X183.95 Y160.496 E.00154
; LINE_WIDTH: 0.252569
G1 F5151.48
G1 X183.875 Y160.496 E.0013
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311812
G1 F4016.493
M204 S8000
G1 X184.062 Y160.415 E.00893
; LINE_WIDTH: 0.294554
G1 F4291.951
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.26636
G1 F4833.517
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.24352
G1 F5383.845
G2 X184.078 Y159.68 I-2.438 J-.22 E.00912
; LINE_WIDTH: 0.278704
G1 F4580.475
G1 X184.075 Y159.66 E.00039
; LINE_WIDTH: 0.29741
G1 F4243.785
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328607
G1 F3780.366
G1 X184.044 Y159.497 E.00197
G1 X184.025 Y159.496 E.00045
; LINE_WIDTH: 0.291055
G1 F4352.469
G1 X183.95 Y159.496 E.00154
; LINE_WIDTH: 0.252582
G1 F5151.156
G1 X183.875 Y159.496 E.0013
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311722
G1 F4017.828
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294511
G1 F4292.685
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266347
G1 F4833.791
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243525
G1 F5383.715
G2 X184.078 Y158.68 I-2.44 J-.221 E.00912
; LINE_WIDTH: 0.278713
G1 F4580.296
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298225
G1 F4230.235
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353184
G1 F3480.905
G1 X184.036 Y158.464 E.00291
G1 X183.754 Y158.306 E.00835
M204 S10000
G1 X183.143 Y158.351 F60000
; LINE_WIDTH: 0.604932
G1 F1921.668
M204 S8000
G1 X182.328 Y158.181 E.03888
; LINE_WIDTH: 0.570768
G1 F2046.045
G2 X182.182 Y158.16 I-.386 J2.118 E.00649
; LINE_WIDTH: 0.540062
G1 F2172.419
G2 X181.76 Y158.166 I-.18 J1.893 E.01747
; LINE_WIDTH: 0.58154
G1 F2005.126
G1 X181.657 Y158.184 E.00468
; LINE_WIDTH: 0.6096
G1 F1905.838
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.385 Y158.193 F60000
; LINE_WIDTH: 0.604932
G1 F1921.668
M204 S8000
G1 X168.328 Y158.181 E.0027
; LINE_WIDTH: 0.570768
G1 F2046.045
G2 X168.182 Y158.16 I-.386 J2.118 E.00649
; LINE_WIDTH: 0.540062
G1 F2172.419
G2 X167.76 Y158.166 I-.18 J1.893 E.01747
; LINE_WIDTH: 0.58154
G1 F2005.126
G1 X167.657 Y158.184 E.00468
; LINE_WIDTH: 0.6096
G1 F1905.838
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.248 Y158.306 F60000
; LINE_WIDTH: 0.358665
G1 F3420.491
M204 S8000
G1 X165.964 Y158.464 E.00853
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331222
G1 F3746.077
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.29452
G1 F4292.539
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.242766
G1 F5404.159
G2 X165.901 Y159.123 I3.21 J.372 E.00737
; LINE_WIDTH: 0.248394
G1 F5256.15
G1 X165.915 Y159.25 E.00218
; LINE_WIDTH: 0.29215
G1 F4333.35
G2 X166.009 Y159.829 I4.71 J-.463 E.01217
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.251585
G1 F5175.778
M204 S8000
G1 X166.05 Y159.496 E.00129
; LINE_WIDTH: 0.289718
G1 F4376.05
G1 X165.976 Y159.496 E.00152
; LINE_WIDTH: 0.314582
G1 F3975.538
G1 X165.956 Y159.497 E.00044
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.244328
G1 F5362.27
G2 X165.901 Y160.123 I2.173 J.343 E.00777
; LINE_WIDTH: 0.248412
G1 F5255.681
G1 X165.915 Y160.25 E.00218
; LINE_WIDTH: 0.292188
G1 F4332.698
G2 X166.009 Y160.829 I4.753 J-.468 E.01218
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251435
G1 F5179.486
M204 S8000
G1 X166.05 Y160.496 E.00129
; LINE_WIDTH: 0.289537
G1 F4379.258
G1 X165.976 Y160.496 E.00152
; LINE_WIDTH: 0.31458
G1 F3975.57
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.244328
G1 F5362.264
G2 X165.901 Y161.123 I2.173 J.343 E.00777
; LINE_WIDTH: 0.248394
G1 F5256.15
G1 X165.915 Y161.25 E.00218
; LINE_WIDTH: 0.290855
G1 F4355.982
G2 X165.985 Y161.694 I3.618 J-.34 E.00929
; WIPE_START
M204 S8000
G1 X165.915 Y161.25 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z1.4 I-1.171 J.331 P1  F60000
G1 X199.428 Y279.944 Z1.4
G1 Z1
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y279.944  E1.2162 F2363
G1  Y270.944  E0.3421
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #6
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z1.4 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z1
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M73 P43 R20
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
G1  X198.678  F366
G1  Y269.319 
M73 P44 R20
G1  X168.178 
G1  Y268.069 
M73 P44 R19
G1  X198.678 
G1  Y266.819 
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S176 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E16

;deretract


M73 P45 R19
;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z4 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y264.712 F60000
G1 Z1
G17
G3 Z1.4 I1.217 J0 P1
G1 X204.318 Y247.518 Z1.4
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z1
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y254.194  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F2473
G1  Y254.944  E0.0285
G1  X167.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X199.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X167.428  E1.2162
G1  Y257.194  E0.0285
G1  X199.428  E1.2162
G1  Y257.944  E0.0285
G1  X167.428  E1.2162
G1  Y258.694  E0.0285
G1  X199.428  E1.2162
G1  Y259.444  E0.0285
G1  X167.428  E1.2162
G1  Y260.194  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #6
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X199.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X199.928 Y280.444  
M204 S8000
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S10000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S8000
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F5400
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
; WIPE_TOWER_END

; WIPE_START
G1 F4355.982
M204 S8000
M73 P46 R19
G1 X199.928 Y280.444 E0
G1 X199.928 Y280.444 E0
G1 X200.578 Y279.685 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3481
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 5 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z1.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer5 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 6/25
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3421
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 6 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z1.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer6 end: 224,265
M625
M204 S10000
G1 X199.428 Y279.944
G1 Z1.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X201.640 Y278.401  
M204 S8000
G3  X197.871 Y282.511   I-16.869 J-11.684 E0.2126 F5400
G3  X194.841 Y281.395   I-0.631 J-2.959 E0.1295
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.112 Y276.190   I3.543 J-0.156 E0.1075
; WIPE_TOWER_END
G1  X199.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #7
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.6 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z1.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S80 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E15

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z4.2 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y277.194 F60000
G1 Z1.2

; filament start gcode
G1 X199.428 Y277.194 Z1.6
G1 Z1.2
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X200.928 
G1  X199.428  F240
G1  X199.928  F600
G1  Y277.694 
G1  X198.928 
G1  Y276.694 
G1  X200.428 
G1  Y278.194 
G1  X198.428 
G1  Y276.194 
G1  X196.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X167.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X199.428  E1.2162
G1  Y274.194  E0.0285
M73 P46 R18
G1  X167.428  E1.2162
G1  Y273.444  E0.0285
G1  X199.428  E1.2162
G1  Y272.694  E0.0285
M73 P47 R18
G1  X167.428  E1.2162
G1  Y271.944  E0.0285
G1  X199.428  E1.2162
G1  Y271.194  E0.0285
G1  X167.428  E1.2162
G1  Y270.444  E0.0285
G1  X199.428  E1.2162
G1  Y269.694  E0.0285
G1  X167.428  E1.2162
G1  Y268.944  E0.0285
G1  X199.428  E1.2162
G1  Y268.194  E0.0285
G1  X167.428  E1.2162
G1  Y267.444  E0.0285
G1  X199.428  E1.2162
G1  Y266.694  E0.0285
G1  X167.428  E1.2162
G1  Y265.944  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162 F2363
G1  Y277.944  E0.0760
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #7
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.737 Y160.314
G1 Z1.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.263 J-.315 E.03034
G1 X175.035 Y159.591 E.00219
G3 X174.786 Y160.349 I-.035 J.409 E.04636
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 10
M204 S10000
G1 X176.138 Y159.381 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.138 J-.384 E.04351
G1 X176.035 Y158.591 E.00219
G3 X176.193 Y159.356 I-.035 J.406 E.03276
; COOLING_NODE: 11
M204 S10000
G1 X177.138 Y159.381 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.138 J-.384 E.04351
G1 X177.035 Y158.591 E.00219
G3 X177.193 Y159.356 I-.035 J.406 E.03276
; COOLING_NODE: 12
M204 S10000
G1 X176.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.155 E.02396
G1 X177.035 Y159.591 E.00219
G3 X176.649 Y160.205 I-.035 J.406 E.0523
; COOLING_NODE: 14
M204 S10000
G1 X177.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.155 E.02396
G1 X178.035 Y159.591 E.00219
G3 X177.649 Y160.205 I-.035 J.406 E.0523
; COOLING_NODE: 17
M204 S10000
G1 X178.138 Y159.381 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.138 J-.384 E.04351
G1 X178.035 Y158.591 E.00219
G3 X178.193 Y159.356 I-.035 J.406 E.03276
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.1908
G1 X177.863 Y159.387 E-.13191
G1 X177.692 Y159.271 E-.1966
G1 X177.619 Y159.153 E-.13198
G1 X177.59 Y159.017 E-.13188
G1 X177.607 Y158.88 E-.13193
G1 X177.67 Y158.756 E-.13185
G1 X177.81 Y158.636 E-.17495
G1 X177.965 Y158.591 E-.15387
G1 X178.035 Y158.591 E-.06622
G1 X178.169 Y158.626 E-.13194
G1 X178.33 Y158.756 E-.1966
G1 X178.392 Y158.877 E-.12947
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.14 Y159.385 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.14 J-.385 E.04377
G1 X175.035 Y158.591 E.00219
G3 X175.195 Y159.36 I-.035 J.409 E.03293
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X175 Y159.411 E-.19102
G1 X174.863 Y159.387 E-.13191
G1 X174.692 Y159.271 E-.1966
G1 X174.619 Y159.153 E-.13198
G1 X174.59 Y159.017 E-.13186
G1 X174.607 Y158.88 E-.13188
G1 X174.699 Y158.72 E-.17499
G1 X174.831 Y158.626 E-.15391
G1 X174.965 Y158.591 E-.13184
G1 X175.035 Y158.591 E-.06622
G1 X175.23 Y158.66 E-.19668
G1 X175.335 Y158.761 E-.13905
G1 X175.385 Y158.857 E-.10283
G1 X175.388 Y158.877 E-.01924
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X174.14 Y159.385 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.14 J-.385 E.04377
G1 X174.035 Y158.591 E.00219
G3 X174.195 Y159.36 I-.035 J.409 E.03293
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174 Y159.411 E-.19103
G1 X173.863 Y159.387 E-.13191
G1 X173.692 Y159.271 E-.1966
G1 X173.619 Y159.153 E-.13198
G1 X173.59 Y159.017 E-.13188
G1 X173.607 Y158.88 E-.13186
G1 X173.699 Y158.72 E-.17499
G1 X173.831 Y158.626 E-.15391
G1 X173.965 Y158.591 E-.13184
G1 X174.035 Y158.591 E-.06622
G1 X174.23 Y158.66 E-.19668
G1 X174.335 Y158.761 E-.13905
G1 X174.385 Y158.857 E-.10283
G1 X174.388 Y158.877 E-.01923
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173 Y159.405 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I0 J-.408 E.03908
G1 X173.035 Y158.591 E.00219
G3 X173.06 Y159.4 I-.035 J.406 E.03719
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00219
G3 X173.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 1
M204 S10000
G1 X173.709 Y160.288 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.291 J-.288 E.02913
G1 X174.035 Y159.591 E.00219
G3 X173.754 Y160.327 I-.035 J.409 E.04757
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.20914
G1 X173.59 Y160.017 E-.13191
G1 X173.607 Y159.88 E-.13186
G1 X173.699 Y159.72 E-.17498
G1 X173.831 Y159.626 E-.15391
G1 X173.965 Y159.591 E-.13184
G1 X174.035 Y159.591 E-.06622
G1 X174.23 Y159.66 E-.19668
G1 X174.335 Y159.761 E-.13905
G1 X174.385 Y159.857 E-.10283
G1 X174.41 Y160.017 E-.15384
G1 X174.381 Y160.153 E-.13189
G1 X174.308 Y160.271 E-.13199
G1 X174.27 Y160.297 E-.04386
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.136 Y159.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.136 J-.387 E.04365
G1 X172.035 Y158.591 E.00219
G3 X172.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 5
M204 S10000
G1 X172.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00219
G3 X172.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 6
M204 S10000
G1 X171.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06287
G1 X171.035 Y159.591 E.00219
G3 X171.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 7
M204 S10000
G1 X171.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.377 J-.155 E.05419
G1 X171.035 Y158.591 E.00219
G3 X171.396 Y159.094 I-.035 J.406 E.02207
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X171.304 Y159.277 E-.19464
G1 X171.141 Y159.386 E-.1865
G1 X171 Y159.411 E-.13549
G1 X170.863 Y159.387 E-.13191
G1 X170.692 Y159.271 E-.1966
G1 X170.619 Y159.153 E-.13198
G1 X170.59 Y159.017 E-.13188
G1 X170.607 Y158.88 E-.13193
G1 X170.67 Y158.756 E-.13185
G1 X170.81 Y158.636 E-.17493
G1 X170.965 Y158.591 E-.15391
G1 X171.035 Y158.591 E-.06621
G1 X171.169 Y158.626 E-.13194
G1 X171.169 Y158.626 E-.00024
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.136 Y159.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.136 J-.387 E.04365
G1 X170.035 Y158.591 E.00219
G3 X170.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 42
M204 S10000
G1 X170.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06287
G1 X170.035 Y159.591 E.00219
G3 X170.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X170.41 Y160.017 E-.18764
G1 X170.381 Y160.153 E-.13195
G1 X170.308 Y160.271 E-.13179
G1 X170.137 Y160.387 E-.19676
G1 X170 Y160.411 E-.13185
G1 X169.863 Y160.387 E-.13191
G1 X169.708 Y160.289 E-.17501
G1 X169.619 Y160.153 E-.15384
G1 X169.59 Y160.017 E-.13191
G1 X169.607 Y159.88 E-.13194
G1 X169.67 Y159.756 E-.13183
G1 X169.81 Y159.636 E-.17493
G1 X169.899 Y159.61 E-.08865
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.136 Y161.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.136 J-.387 E.04365
G1 X170.035 Y160.591 E.00219
G3 X170.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.18741
G1 X169.863 Y161.387 E-.13191
G1 X169.692 Y161.271 E-.1966
G1 X169.619 Y161.153 E-.13198
G1 X169.59 Y161.017 E-.13188
G1 X169.607 Y160.88 E-.13194
G1 X169.67 Y160.756 E-.13183
G1 X169.81 Y160.636 E-.17493
G1 X169.965 Y160.591 E-.1539
G1 X170.035 Y160.591 E-.06621
G1 X170.169 Y160.626 E-.13194
G1 X170.284 Y160.703 E-.13189
G1 X170.367 Y160.815 E-.13189
G1 X170.381 Y160.883 E-.06569
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.377 Y161.152 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.377 J-.155 E.05419
G1 X171.035 Y160.591 E.00219
G3 X171.396 Y161.094 I-.035 J.406 E.02207
; COOLING_NODE: 37
M204 S10000
G1 X172.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.136 J-.387 E.04365
G1 X172.035 Y160.591 E.00219
G3 X172.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 36
M204 S10000
G1 X173 Y161.405 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I0 J-.408 E.03908
G1 X173.035 Y160.591 E.00219
G3 X173.06 Y161.4 I-.035 J.406 E.03719
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X172.863 Y161.387 E-.18741
G1 X172.692 Y161.271 E-.1966
G1 X172.619 Y161.153 E-.13198
G1 X172.59 Y161.017 E-.13188
G1 X172.633 Y160.815 E-.19666
G1 X172.721 Y160.698 E-.13905
G1 X172.81 Y160.636 E-.10279
G1 X172.965 Y160.591 E-.15389
G1 X173.035 Y160.591 E-.06621
G1 X173.169 Y160.626 E-.13194
G1 X173.284 Y160.703 E-.13189
G1 X173.367 Y160.815 E-.13189
G1 X173.41 Y161.017 E-.19659
G1 X173.41 Y161.019 E-.00122
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.14 Y161.385 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.14 J-.385 E.04377
G1 X174.035 Y160.591 E.00219
G3 X174.195 Y161.36 I-.035 J.409 E.03293
; COOLING_NODE: 34
M204 S10000
G1 X175.14 Y161.385 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.14 J-.385 E.04377
G1 X175.035 Y160.591 E.00219
G3 X175.195 Y161.36 I-.035 J.409 E.03293
; COOLING_NODE: 33
M204 S10000
G1 X176.138 Y161.381 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.138 J-.384 E.04351
G1 X176.035 Y160.591 E.00219
G3 X176.193 Y161.356 I-.035 J.406 E.03276
; COOLING_NODE: 32
M204 S10000
G1 X177.138 Y161.381 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.138 J-.384 E.04351
G1 X177.035 Y160.591 E.00219
G3 X177.193 Y161.356 I-.035 J.406 E.03276
; COOLING_NODE: 31
M204 S10000
G1 X178.138 Y161.381 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.138 J-.384 E.04351
G1 X178.035 Y160.591 E.00219
G3 X178.193 Y161.356 I-.035 J.406 E.03276
; COOLING_NODE: 30
M204 S10000
G1 X179.136 Y161.386 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.136 J-.387 E.04365
G1 X179.035 Y160.591 E.00219
G3 X179.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.18741
G1 X178.863 Y161.387 E-.13191
G1 X178.692 Y161.271 E-.1966
G1 X178.619 Y161.153 E-.13198
G1 X178.59 Y161.017 E-.13188
G1 X178.633 Y160.815 E-.19666
G1 X178.721 Y160.698 E-.13905
G1 X178.81 Y160.636 E-.10279
G1 X178.965 Y160.591 E-.15389
G1 X179.035 Y160.591 E-.06621
G1 X179.169 Y160.626 E-.13194
G1 X179.284 Y160.703 E-.1319
G1 X179.367 Y160.815 E-.13189
G1 X179.381 Y160.883 E-.0659
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.307 Y161.271 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.307 J-.271 E.05019
G1 X180.035 Y160.591 E.00219
G3 X180.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 19
M204 S10000
G1 X180.135 Y160.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04339
G1 X180.035 Y159.591 E.00219
G3 X180.19 Y160.358 I-.035 J.406 E.03288
; COOLING_NODE: 15
M204 S10000
G1 X179.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00219
G3 X179.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 16
M204 S10000
G1 X179.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.136 J-.387 E.04365
G1 X179.035 Y158.591 E.00219
G3 X179.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 18
M204 S10000
G1 X180.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.136 J-.387 E.04365
G1 X180.035 Y158.591 E.00219
G3 X180.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 21
M204 S10000
G1 X181.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.135 J-.385 E.04339
G1 X181.035 Y158.591 E.00219
G3 X181.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 20
M204 S10000
G1 X181.385 Y159.858 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.385 J.142 E.06402
G1 X181.035 Y159.591 E.00219
G3 X181.36 Y159.803 I-.035 J.409 E.01268
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.20935
G1 X181.381 Y160.153 E-.13195
G1 X181.308 Y160.271 E-.13179
G1 X181.137 Y160.387 E-.19677
G1 X181 Y160.411 E-.13185
G1 X180.863 Y160.387 E-.13191
G1 X180.736 Y160.315 E-.13907
G1 X180.62 Y160.157 E-.18642
G1 X180.59 Y160.017 E-.13554
G1 X180.607 Y159.88 E-.13196
G1 X180.67 Y159.756 E-.13183
G1 X180.81 Y159.636 E-.17495
G1 X180.877 Y159.616 E-.06661
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.391 Y159.88 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.391 J.117 E.06287
G1 X182.035 Y159.591 E.00219
G3 X182.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 22
M204 S10000
G1 X182.136 Y159.386 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.136 J-.387 E.04365
G1 X182.035 Y158.591 E.00219
G3 X182.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182 Y159.411 E-.1874
G1 X181.863 Y159.387 E-.13191
G1 X181.692 Y159.271 E-.1966
G1 X181.619 Y159.153 E-.13198
G1 X181.59 Y159.017 E-.13186
G1 X181.607 Y158.88 E-.13195
G1 X181.67 Y158.756 E-.13185
G1 X181.81 Y158.636 E-.17494
G1 X181.965 Y158.591 E-.15389
G1 X182.035 Y158.591 E-.06621
G1 X182.169 Y158.626 E-.13194
G1 X182.33 Y158.756 E-.1966
G1 X182.393 Y158.88 E-.13198
G1 X182.393 Y158.881 E-.0009
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.38 Y159.153 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.38 J-.154 E.05455
G1 X183.035 Y158.591 E.00219
G3 X183.399 Y159.096 I-.035 J.409 E.02215
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.304 Y159.277 E-.19481
G1 X183.141 Y159.386 E-.1865
G1 X183 Y159.411 E-.1355
G1 X182.863 Y159.387 E-.13191
G1 X182.692 Y159.271 E-.1966
G1 X182.619 Y159.153 E-.13198
G1 X182.59 Y159.017 E-.13186
G1 X182.607 Y158.88 E-.13188
G1 X182.699 Y158.72 E-.17499
G1 X182.831 Y158.626 E-.1539
G1 X182.965 Y158.591 E-.13187
G1 X183.035 Y158.591 E-.06621
G1 X183.166 Y158.637 E-.13199
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.59 Y160.017 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.41 J-.018 E.01967
G1 X183.035 Y159.591 E.00219
G3 X182.597 Y160.077 I-.035 J.409 E.05703
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182.607 Y159.88 E-.18775
G1 X182.699 Y159.72 E-.17498
G1 X182.831 Y159.626 E-.1539
G1 X182.965 Y159.591 E-.13187
G1 X183.035 Y159.591 E-.06621
G1 X183.23 Y159.66 E-.19668
G1 X183.335 Y159.761 E-.13905
G1 X183.385 Y159.857 E-.10281
G1 X183.41 Y160.017 E-.15385
G1 X183.381 Y160.153 E-.13189
G1 X183.308 Y160.271 E-.13199
G1 X183.137 Y160.387 E-.19662
G1 X183 Y160.411 E-.13185
G1 X182.999 Y160.411 E-.00057
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X183.38 Y161.153 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.38 J-.154 E.05455
M73 P48 R18
G1 X183.035 Y160.591 E.00219
G3 X183.399 Y161.095 I-.035 J.409 E.02215
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X183.304 Y161.277 E-.19483
G1 X183.141 Y161.386 E-.1865
G1 X183 Y161.411 E-.1355
G1 X182.863 Y161.387 E-.13191
G1 X182.692 Y161.271 E-.1966
G1 X182.619 Y161.153 E-.13198
G1 X182.59 Y161.017 E-.13186
G1 X182.607 Y160.88 E-.13188
G1 X182.699 Y160.72 E-.17498
G1 X182.831 Y160.626 E-.1539
G1 X182.965 Y160.591 E-.13187
G1 X183.035 Y160.591 E-.06621
G1 X183.166 Y160.637 E-.13199
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.136 Y161.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.136 J-.387 E.04365
G1 X182.035 Y160.591 E.00219
G3 X182.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.18741
G1 X181.863 Y161.387 E-.13191
G1 X181.692 Y161.271 E-.1966
G1 X181.619 Y161.153 E-.13198
G1 X181.59 Y161.017 E-.13186
G1 X181.607 Y160.88 E-.13196
G1 X181.67 Y160.756 E-.13183
G1 X181.81 Y160.636 E-.17495
G1 X181.965 Y160.591 E-.15389
G1 X182.035 Y160.591 E-.06621
G1 X182.169 Y160.626 E-.13194
G1 X182.284 Y160.703 E-.13189
G1 X182.367 Y160.815 E-.13189
G1 X182.381 Y160.883 E-.06568
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.135 Y161.382 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.135 J-.385 E.04339
G1 X181.035 Y160.591 E.00219
G3 X181.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X181 Y161.411 E-.18719
G1 X180.863 Y161.387 E-.13191
G1 X180.692 Y161.271 E-.1966
G1 X180.619 Y161.153 E-.13198
G1 X180.59 Y161.017 E-.13186
G1 X180.607 Y160.88 E-.13196
G1 X180.67 Y160.756 E-.13183
G1 X180.81 Y160.636 E-.17495
G1 X180.965 Y160.591 E-.15389
G1 X181.035 Y160.591 E-.06621
G1 X181.23 Y160.66 E-.19668
G1 X181.335 Y160.761 E-.13902
G1 X181.385 Y160.857 E-.10289
G1 X181.389 Y160.881 E-.02304
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z1.6 F60000
G1 Z1.2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.17 Y161.898 E.04156
G1 X183.591 Y161.549 E.01851
G2 X183.635 Y160.489 I-.63 J-.557 E.03886
G2 X183.635 Y159.489 I-.663 J-.5 E.03632
G2 X183.363 Y158.285 I-.628 J-.491 E.0478
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 40
; WIPE_START
G1 X183.17 Y161.898 E-1.16774
G1 X183.591 Y161.549 E-.51947
G1 X183.685 Y161.422 E-.15005
G1 X183.715 Y161.363 E-.06274
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.082 Y161.374 Z1.6 F60000
G1 X169.14 Y161.385 Z1.6
G1 Z1.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.14 J-.385 E.04377
G1 X169.035 Y160.591 E.00219
G3 X169.195 Y161.36 I-.035 J.409 E.03293
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.19103
G1 X168.863 Y161.387 E-.13191
G1 X168.692 Y161.271 E-.1966
G1 X168.619 Y161.153 E-.13198
G1 X168.59 Y161.017 E-.13186
G1 X168.607 Y160.88 E-.13188
G1 X168.699 Y160.72 E-.17498
G1 X168.831 Y160.626 E-.15391
G1 X168.965 Y160.591 E-.13184
G1 X169.035 Y160.591 E-.06622
G1 X169.23 Y160.66 E-.19668
G1 X169.335 Y160.761 E-.13905
G1 X169.385 Y160.857 E-.10283
G1 X169.388 Y160.877 E-.01923
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.136 Y161.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.136 J-.387 E.04365
G1 X168.035 Y160.591 E.00219
G3 X168.191 Y161.362 I-.035 J.409 E.03306
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.18741
G1 X167.863 Y161.387 E-.13191
G1 X167.692 Y161.271 E-.1966
G1 X167.619 Y161.153 E-.13198
G1 X167.59 Y161.017 E-.13186
G1 X167.607 Y160.88 E-.13196
G1 X167.67 Y160.756 E-.13183
G1 X167.81 Y160.636 E-.17495
G1 X167.965 Y160.591 E-.15389
G1 X168.035 Y160.591 E-.06621
G1 X168.169 Y160.626 E-.13194
G1 X168.284 Y160.703 E-.13189
G1 X168.367 Y160.815 E-.13189
G1 X168.381 Y160.883 E-.06569
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.135 Y161.382 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.135 J-.385 E.04339
G1 X167.035 Y160.591 E.00219
G3 X167.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.18721
G1 X166.863 Y161.387 E-.13188
G1 X166.692 Y161.271 E-.19659
G1 X166.619 Y161.153 E-.13202
G1 X166.59 Y161.017 E-.13186
G1 X166.607 Y160.88 E-.13196
G1 X166.67 Y160.756 E-.13183
G1 X166.81 Y160.636 E-.17495
G1 X166.965 Y160.591 E-.15389
G1 X167.035 Y160.591 E-.06621
G1 X167.23 Y160.66 E-.19668
G1 X167.335 Y160.761 E-.13905
G1 X167.385 Y160.857 E-.10283
G1 X167.389 Y160.881 E-.02306
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.385 Y159.858 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.385 J.142 E.06402
G1 X167.035 Y159.591 E.00219
G3 X167.36 Y159.803 I-.035 J.409 E.01268
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.20938
G1 X167.381 Y160.153 E-.13195
G1 X167.308 Y160.271 E-.13179
G1 X167.137 Y160.387 E-.19676
G1 X167 Y160.411 E-.13185
G1 X166.863 Y160.387 E-.13188
G1 X166.708 Y160.289 E-.17504
G1 X166.619 Y160.153 E-.15384
G1 X166.59 Y160.017 E-.13188
G1 X166.607 Y159.88 E-.13196
G1 X166.67 Y159.756 E-.13183
G1 X166.81 Y159.636 E-.17495
G1 X166.877 Y159.616 E-.06689
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.391 Y159.88 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.391 J.117 E.06287
G1 X168.035 Y159.591 E.00219
G3 X168.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 41
M204 S10000
G1 X168.621 Y160.156 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.379 J-.157 E.02416
G1 X169.035 Y159.591 E.00219
G3 X168.648 Y160.21 I-.035 J.409 E.05255
; COOLING_NODE: 44
M204 S10000
G1 X169.14 Y159.385 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.14 J-.385 E.04377
G1 X169.035 Y158.591 E.00219
G3 X169.195 Y159.36 I-.035 J.409 E.03293
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.19103
G1 X168.863 Y159.387 E-.13191
G1 X168.692 Y159.271 E-.1966
G1 X168.619 Y159.153 E-.13198
G1 X168.59 Y159.017 E-.13186
G1 X168.607 Y158.88 E-.13188
G1 X168.699 Y158.72 E-.17499
G1 X168.831 Y158.626 E-.15391
G1 X168.965 Y158.591 E-.13184
G1 X169.035 Y158.591 E-.06622
G1 X169.23 Y158.66 E-.19668
G1 X169.335 Y158.761 E-.13905
G1 X169.385 Y158.857 E-.10283
G1 X169.388 Y158.877 E-.01923
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.136 Y159.386 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.136 J-.387 E.04365
G1 X168.035 Y158.591 E.00219
G3 X168.191 Y159.362 I-.035 J.409 E.03306
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X168 Y159.411 E-.18741
G1 X167.863 Y159.387 E-.13191
G1 X167.692 Y159.271 E-.1966
G1 X167.619 Y159.153 E-.13198
G1 X167.59 Y159.017 E-.13186
G1 X167.607 Y158.88 E-.13195
G1 X167.67 Y158.756 E-.13185
G1 X167.81 Y158.636 E-.17494
G1 X167.965 Y158.591 E-.15389
G1 X168.035 Y158.591 E-.06621
G1 X168.169 Y158.626 E-.13194
G1 X168.33 Y158.756 E-.1966
G1 X168.393 Y158.88 E-.13198
G1 X168.393 Y158.881 E-.00089
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X167.135 Y159.382 Z1.6 F60000
G1 Z1.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.135 J-.385 E.04339
G1 X167.035 Y158.591 E.00219
G3 X167.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 48
M204 S10000
G1 X166.37 Y159.495 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.494 I.685 J.499 E.03617
G2 X166.642 Y161.725 I.672 J.497 E.04833
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.591 Y158.102 E.03347
G1 X166.645 Y158.273 E.00607
G2 X166.336 Y159.446 I.39 J.73 E.04606
; COOLING_NODE: 51
; WIPE_START
G1 X166.282 Y159.638 E-.18953
G1 X166.231 Y159.764 E-.12944
G1 X166.197 Y160.034 E-.25844
G1 X166.254 Y160.3 E-.25826
G1 X166.37 Y160.494 E-.21535
G1 X166.282 Y160.638 E-.1601
G1 X166.231 Y160.764 E-.12944
G1 X166.202 Y160.898 E-.12988
G1 X166.214 Y161.169 E-.25796
G1 X166.281 Y161.337 E-.1716
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.903 Y161.729 Z1.6 F60000
G1 X184.79 Y162.29 Z1.6
G1 Z1.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.31175
G1 F4017.42
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294519
G1 F4292.559
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266406
G1 F4832.52
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.237216
G1 F5558.534
G2 X184.096 Y160.833 I-3.232 J-.245 E.00636
; LINE_WIDTH: 0.254426
G1 F5106.251
G1 X184.082 Y160.723 E.00195
; LINE_WIDTH: 0.297312
G1 F4245.421
G2 X183.989 Y160.186 I-4.611 J.52 E.01152
M204 S10000
G1 X183.987 Y159.805 F60000
; LINE_WIDTH: 0.311759
G1 F4017.286
M204 S8000
G1 X184.062 Y159.415 E.00889
; LINE_WIDTH: 0.294519
G1 F4292.559
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266406
G1 F4832.52
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.237216
G1 F5558.534
G2 X184.096 Y158.833 I-3.232 J-.245 E.00636
; LINE_WIDTH: 0.254426
G1 F5106.251
G1 X184.082 Y158.723 E.00195
; LINE_WIDTH: 0.296186
G1 F4264.304
G2 X184.011 Y158.306 I-3.586 J.392 E.00891
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609638
G1 F1905.711
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574675
G1 F2031.011
G2 X182.196 Y158.161 I-.349 J1.728 E.00657
; LINE_WIDTH: 0.541393
G1 F2166.62
G2 X181.743 Y158.169 I-.193 J1.899 E.01884
; LINE_WIDTH: 0.581269
G1 F2006.134
G1 X181.677 Y158.181 E.00302
; LINE_WIDTH: 0.606477
G1 F1916.401
G1 X181.61 Y158.194 E.00316
; LINE_WIDTH: 0.636369
G1 F1819.872
G1 X181.542 Y158.211 E.00349
; LINE_WIDTH: 0.667736
G1 F1728.511
G3 X181.494 Y158.221 I-.032 J-.033 E.00268
; WIPE_START
G1 X181.542 Y158.211 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.989 Y159.186 Z1.6 F60000
G1 Z1.2
G1 E2 F600
; LINE_WIDTH: 0.297313
G1 F4245.411
M204 S8000
G3 X184.082 Y159.723 I-4.524 J1.057 E.01152
; LINE_WIDTH: 0.254426
G1 F5106.251
G1 X184.096 Y159.833 E.00195
; LINE_WIDTH: 0.237215
G1 F5558.555
G3 X184.09 Y160.226 I-3.239 J.149 E.00635
; LINE_WIDTH: 0.266398
G1 F4832.708
G1 X184.075 Y160.329 E.00194
; LINE_WIDTH: 0.294504
G1 F4292.804
G1 X184.062 Y160.415 E.00181
; LINE_WIDTH: 0.311702
G1 F4018.124
G1 X183.987 Y160.805 E.00889
; WIPE_START
G1 X184.062 Y160.415 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.505 Y159.344 Z1.6 F60000
G1 X168.391 Y158.195 Z1.6
G1 Z1.2
G1 E2 F600
; LINE_WIDTH: 0.609638
G1 F1905.711
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574675
G1 F2031.011
G2 X168.196 Y158.161 I-.349 J1.728 E.00657
; LINE_WIDTH: 0.541393
G1 F2166.62
G2 X167.743 Y158.169 I-.193 J1.899 E.01884
; LINE_WIDTH: 0.581269
G1 F2006.134
G1 X167.677 Y158.181 E.00302
; LINE_WIDTH: 0.606477
G1 F1916.401
G1 X167.61 Y158.194 E.00316
; LINE_WIDTH: 0.636369
G1 F1819.872
G1 X167.542 Y158.211 E.00349
; LINE_WIDTH: 0.675475
G1 F1707.361
G1 X167.503 Y158.224 E.00217
G1 X166.773 Y158.029 E.0397
M204 S10000
G1 X166.248 Y158.306 F60000
; LINE_WIDTH: 0.358638
G1 F3420.781
M204 S8000
G1 X165.964 Y158.464 E.00854
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331322
G1 F3744.78
G1 X165.942 Y158.575 E.00209
; LINE_WIDTH: 0.294556
G1 F4291.927
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.243866
G1 F5374.589
G2 X165.912 Y159.243 I2.46 J.325 E.00944
; LINE_WIDTH: 0.26886
G1 F4780.033
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308669
G1 F4063.989
G2 X166.014 Y159.806 I5.592 J-.793 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.25085
G1 F5194.066
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.288688
G1 F4394.393
G1 X165.977 Y159.497 E.00151
; LINE_WIDTH: 0.314599
G1 F3975.28
G1 X165.956 Y159.497 E.00046
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.257929
G1 F5023.054
G2 X165.903 Y159.868 I6.924 J.849 E.00374
; LINE_WIDTH: 0.237905
G1 F5538.908
G2 X165.912 Y160.243 I3.145 J.108 E.00609
; LINE_WIDTH: 0.26887
G1 F4779.822
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.308708
G1 F4063.402
G2 X166.014 Y160.807 I5.622 J-.798 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.2508
G1 F5195.325
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.288626
G1 F4395.503
G1 X165.977 Y160.497 E.00151
; LINE_WIDTH: 0.314594
G1 F3975.365
G1 X165.956 Y160.497 E.00046
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.257929
G1 F5023.054
G2 X165.903 Y160.868 I6.915 J.848 E.00374
; LINE_WIDTH: 0.237905
G1 F5538.908
G2 X165.912 Y161.243 I3.145 J.108 E.00609
; LINE_WIDTH: 0.268865
G1 F4779.928
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307727
G1 F4078.447
G2 X165.992 Y161.694 I4.326 J-.604 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4078.447
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 7/25
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I.139 J1.209 P1  F60000
G1 X174.745 Y160.315 Z1.6
G1 Z1.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03045
G1 X175.035 Y159.591 E.00218
G3 X174.795 Y160.349 I-.035 J.406 E.04581
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.65 Y160.215 E-.18744
G1 X174.592 Y160.043 E-.17253
G1 X174.607 Y159.88 E-.15626
G1 X174.67 Y159.756 E-.13197
G1 X174.807 Y159.637 E-.17241
G1 X174.965 Y159.591 E-.15633
G1 X175.035 Y159.591 E-.06613
G1 X175.169 Y159.626 E-.13193
G1 X175.33 Y159.756 E-.19662
G1 X175.393 Y159.88 E-.13195
G1 X175.41 Y160.017 E-.13188
G1 X175.35 Y160.215 E-.19671
G1 X175.303 Y160.269 E-.06787
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.745 Y160.315 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03045
G1 X174.035 Y159.591 E.00218
G3 X173.795 Y160.349 I-.035 J.406 E.04581
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.65 Y160.215 E-.18742
G1 X173.592 Y160.043 E-.17253
G1 X173.607 Y159.88 E-.15626
G1 X173.67 Y159.756 E-.13197
G1 X173.807 Y159.637 E-.17245
G1 X173.965 Y159.591 E-.15628
G1 X174.035 Y159.591 E-.06613
G1 X174.169 Y159.626 E-.13193
G1 X174.33 Y159.756 E-.19662
G1 X174.393 Y159.88 E-.13195
G1 X174.41 Y160.017 E-.13188
G1 X174.35 Y160.215 E-.19671
G1 X174.303 Y160.269 E-.06789
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y159.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.135 J-.385 E.04339
G1 X174.035 Y158.591 E.00218
G3 X174.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 9
M204 S10000
G1 X175.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.135 J-.385 E.04339
G1 X175.035 Y158.591 E.00218
G3 X175.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 10
M204 S10000
G1 X176.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.135 J-.385 E.04339
G1 X176.035 Y158.591 E.00218
G3 X176.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 13
M204 S10000
G1 X175.595 Y160.043 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.405 J-.046 E.02044
G1 X176.035 Y159.591 E.00218
G3 X175.606 Y160.102 I-.035 J.406 E.05583
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.21127
G1 X175.67 Y159.756 E-.13197
G1 X175.807 Y159.637 E-.17241
G1 X175.965 Y159.591 E-.15633
G1 X176.035 Y159.591 E-.06613
G1 X176.169 Y159.626 E-.13193
G1 X176.33 Y159.756 E-.19662
G1 X176.393 Y159.88 E-.13195
G1 X176.41 Y160.017 E-.13188
G1 X176.35 Y160.215 E-.19671
G1 X176.258 Y160.32 E-.13179
G1 X176.137 Y160.387 E-.13197
G1 X176.024 Y160.407 E-.10906
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X174.135 Y161.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.135 J-.385 E.04339
G1 X174.035 Y160.591 E.00218
G3 X174.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 34
M204 S10000
G1 X175.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.135 J-.385 E.04339
G1 X175.035 Y160.591 E.00218
G3 X175.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 33
M204 S10000
G1 X176.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.135 J-.385 E.04338
G1 X176.035 Y160.591 E.00218
G3 X176.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 32
M204 S10000
G1 X177.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.135 J-.385 E.04338
G1 X177.035 Y160.591 E.00218
G3 X177.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 31
M204 S10000
G1 X178.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.135 J-.385 E.04338
G1 X178.035 Y160.591 E.00218
G3 X178.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 30
M204 S10000
G1 X179.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.135 J-.385 E.04339
G1 X179.035 Y160.591 E.00218
G3 X179.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.18729
G1 X178.863 Y161.387 E-.13187
G1 X178.742 Y161.32 E-.13183
G1 X178.65 Y161.215 E-.13192
G1 X178.592 Y161.043 E-.1726
G1 X178.607 Y160.88 E-.15629
G1 X178.67 Y160.756 E-.13187
G1 X178.807 Y160.637 E-.17256
G1 X178.965 Y160.591 E-.15624
G1 X179.035 Y160.591 E-.06613
G1 X179.169 Y160.626 E-.13193
G1 X179.33 Y160.756 E-.19661
G1 X179.393 Y160.88 E-.13195
G1 X179.393 Y160.881 E-.00092
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y161.268 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.305 J-.271 E.04986
G1 X180.035 Y160.591 E.00218
G3 X180.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 28
M204 S10000
G1 X181.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.135 J-.385 E.04338
G1 X181.035 Y160.591 E.00218
G3 X181.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 27
M204 S10000
G1 X182.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.135 J-.385 E.04338
G1 X182.035 Y160.591 E.00218
G3 X182.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.18729
G1 X181.863 Y161.387 E-.13187
G1 X181.742 Y161.32 E-.13184
G1 X181.65 Y161.215 E-.13192
G1 X181.592 Y161.043 E-.17259
G1 X181.607 Y160.88 E-.15629
G1 X181.67 Y160.756 E-.13187
G1 X181.807 Y160.637 E-.17256
G1 X181.965 Y160.591 E-.15624
G1 X182.035 Y160.591 E-.06613
G1 X182.169 Y160.626 E-.13193
G1 X182.33 Y160.756 E-.19661
G1 X182.393 Y160.88 E-.13195
G1 X182.393 Y160.881 E-.00092
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.377 Y161.152 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.377 J-.155 E.05419
G1 X183.035 Y160.591 E.00218
G3 X183.396 Y161.094 I-.035 J.406 E.02208
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.308 Y161.271 E-.18761
G1 X183.137 Y161.387 E-.19665
G1 X183 Y161.411 E-.13193
G1 X182.863 Y161.387 E-.13187
G1 X182.742 Y161.32 E-.13184
G1 X182.65 Y161.215 E-.13192
G1 X182.592 Y161.043 E-.17259
G1 X182.607 Y160.88 E-.15626
G1 X182.67 Y160.756 E-.13197
G1 X182.807 Y160.637 E-.17245
G1 X182.965 Y160.591 E-.15628
G1 X183.035 Y160.591 E-.06613
G1 X183.169 Y160.626 E-.13193
G1 X183.17 Y160.626 E-.00057
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.595 Y160.043 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.405 J-.046 E.02044
G1 X183.035 Y159.591 E.00218
G3 X182.606 Y160.102 I-.035 J.406 E.05583
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182.607 Y159.88 E-.21127
G1 X182.67 Y159.756 E-.13197
G1 X182.807 Y159.637 E-.17245
G1 X182.965 Y159.591 E-.15628
G1 X183.035 Y159.591 E-.06613
G1 X183.169 Y159.626 E-.13194
G1 X183.33 Y159.756 E-.19661
G1 X183.393 Y159.88 E-.13195
G1 X183.41 Y160.017 E-.13188
G1 X183.35 Y160.215 E-.19671
G1 X183.258 Y160.32 E-.13179
G1 X183.137 Y160.387 E-.13197
G1 X183.024 Y160.407 E-.10906
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X183.377 Y159.152 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.377 J-.155 E.05419
G1 X183.035 Y158.591 E.00218
G3 X183.396 Y159.094 I-.035 J.406 E.02208
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X183.308 Y159.271 E-.1876
G1 X183.137 Y159.387 E-.19665
G1 X183 Y159.411 E-.13193
G1 X182.863 Y159.387 E-.13187
G1 X182.742 Y159.32 E-.13184
G1 X182.65 Y159.215 E-.13192
G1 X182.592 Y159.043 E-.17259
G1 X182.607 Y158.88 E-.15626
G1 X182.67 Y158.756 E-.13197
G1 X182.807 Y158.637 E-.17245
G1 X182.965 Y158.591 E-.15628
G1 X183.035 Y158.591 E-.06613
G1 X183.169 Y158.626 E-.13194
G1 X183.17 Y158.626 E-.00058
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.135 Y159.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.135 J-.385 E.04339
G1 X182.035 Y158.591 E.00218
G3 X182.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 23
M204 S10000
G1 X182.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.391 J.117 E.06287
G1 X182.035 Y159.591 E.00218
G3 X182.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 20
M204 S10000
G1 X181.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.391 J.117 E.06287
G1 X181.035 Y159.591 E.00218
G3 X181.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.18772
G1 X181.381 Y160.153 E-.13196
G1 X181.258 Y160.32 E-.19656
G1 X181.137 Y160.387 E-.13195
G1 X181 Y160.411 E-.13193
G1 X180.863 Y160.387 E-.13187
G1 X180.742 Y160.32 E-.13186
G1 X180.65 Y160.215 E-.13195
G1 X180.592 Y160.043 E-.17253
G1 X180.607 Y159.88 E-.15629
G1 X180.67 Y159.756 E-.13187
G1 X180.807 Y159.637 E-.17256
G1 X180.899 Y159.61 E-.09094
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.135 Y160.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04339
G1 X180.035 Y159.591 E.00218
G3 X180.19 Y160.358 I-.035 J.406 E.03287
; COOLING_NODE: 15
M204 S10000
G1 X179.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00218
G3 X179.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.18773
G1 X179.381 Y160.153 E-.13196
G1 X179.258 Y160.32 E-.19656
G1 X179.137 Y160.387 E-.13195
G1 X179 Y160.411 E-.13193
G1 X178.863 Y160.387 E-.13187
G1 X178.742 Y160.32 E-.13187
G1 X178.65 Y160.215 E-.13194
G1 X178.592 Y160.043 E-.17253
G1 X178.607 Y159.88 E-.15629
G1 X178.67 Y159.756 E-.13187
G1 X178.807 Y159.637 E-.17256
G1 X178.899 Y159.61 E-.09094
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.654 Y160.213 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.346 J-.216 E.02612
G1 X178.035 Y159.591 E.00218
G3 X177.69 Y160.261 I-.035 J.406 E.05014
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.592 Y160.043 E-.22708
G1 X177.607 Y159.88 E-.15629
G1 X177.67 Y159.756 E-.13187
G1 X177.807 Y159.637 E-.17252
G1 X177.965 Y159.591 E-.15628
G1 X178.035 Y159.591 E-.06613
G1 X178.169 Y159.626 E-.13194
G1 X178.33 Y159.756 E-.19661
G1 X178.393 Y159.88 E-.13195
G1 X178.41 Y160.017 E-.13188
G1 X178.35 Y160.215 E-.19671
G1 X178.258 Y160.32 E-.13179
G1 X178.195 Y160.355 E-.06897
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.654 Y160.213 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.346 J-.216 E.02612
G1 X177.035 Y159.591 E.00218
G3 X176.69 Y160.261 I-.035 J.406 E.05014
; COOLING_NODE: 11
M204 S10000
G1 X177.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.135 J-.385 E.04339
G1 X177.035 Y158.591 E.00218
G3 X177.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 17
M204 S10000
G1 X178.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.135 J-.385 E.04339
G1 X178.035 Y158.591 E.00218
G3 X178.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 16
M204 S10000
G1 X179.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.135 J-.385 E.04339
G1 X179.035 Y158.591 E.00218
G3 X179.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 18
M204 S10000
G1 X180.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.135 J-.385 E.04339
G1 X180.035 Y158.591 E.00218
G3 X180.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 21
M204 S10000
G1 X181.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.135 J-.385 E.04339
G1 X181.035 Y158.591 E.00218
G3 X181.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X181 Y159.411 E-.18728
G1 X180.863 Y159.387 E-.13187
G1 X180.742 Y159.32 E-.13184
G1 X180.65 Y159.215 E-.13192
G1 X180.592 Y159.043 E-.17259
G1 X180.607 Y158.88 E-.15629
G1 X180.67 Y158.756 E-.13187
G1 X180.807 Y158.637 E-.17256
G1 X180.965 Y158.591 E-.15624
G1 X181.035 Y158.591 E-.06613
G1 X181.169 Y158.626 E-.13193
G1 X181.33 Y158.756 E-.19662
G1 X181.393 Y158.88 E-.13196
G1 X181.393 Y158.881 E-.00093
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X184.398 Y161.898 Z1.8 F60000
G1 Z1.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.401 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 3
; WIPE_START
G1 X183.411 Y161.898 E-.93939
G1 X183.358 Y161.725 E-.17157
G1 X183.505 Y161.626 E-.16878
G1 X183.604 Y161.531 E-.12952
G1 X183.685 Y161.422 E-.12974
G1 X183.786 Y161.169 E-.25823
G1 X183.791 Y161.061 E-.10277
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.248 Y159.895 Z1.8 F60000
G1 X173.069 Y159.404 Z1.8
G1 Z1.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X172.897 Y158.602 I-.066 J-.405 E.0391
G1 X172.972 Y158.589 E.00241
G3 X173.128 Y159.39 I.031 J.409 E.03743
; COOLING_NODE: 4
M204 S10000
G1 X172.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.135 J-.385 E.04339
G1 X172.035 Y158.591 E.00218
G3 X172.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 7
M204 S10000
G1 X171.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.377 J-.155 E.05419
G1 X171.035 Y158.591 E.00218
G3 X171.396 Y159.094 I-.035 J.406 E.02208
; COOLING_NODE: 6
M204 S10000
G1 X171.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06287
G1 X171.035 Y159.591 E.00218
G3 X171.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.41 Y160.017 E-.18773
G1 X171.35 Y160.215 E-.19671
G1 X171.258 Y160.32 E-.13179
G1 X171.137 Y160.387 E-.13197
G1 X171 Y160.411 E-.13193
G1 X170.863 Y160.387 E-.13187
G1 X170.742 Y160.32 E-.13186
G1 X170.65 Y160.215 E-.13195
G1 X170.592 Y160.043 E-.17253
G1 X170.607 Y159.88 E-.15629
G1 X170.67 Y159.756 E-.13187
G1 X170.807 Y159.637 E-.17257
G1 X170.899 Y159.61 E-.09093
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.391 Y159.88 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00218
G3 X172.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 2
M204 S10000
G1 X173.368 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X172.897 Y159.602 I-.365 J.182 E.06281
G1 X172.972 Y159.589 E.00241
G3 X173.337 Y159.763 I.031 J.407 E.01326
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X173.411 Y159.991 E-.22798
G1 X173.381 Y160.153 E-.15632
G1 X173.308 Y160.271 E-.13191
G1 X173.2 Y160.359 E-.13183
G1 X173.069 Y160.405 E-.13195
G1 X172.931 Y160.405 E-.13179
G1 X172.763 Y160.335 E-.17263
G1 X172.65 Y160.215 E-.15628
G1 X172.598 Y160.086 E-.13187
G1 X172.593 Y159.948 E-.1319
G1 X172.636 Y159.808 E-.13872
G1 X172.766 Y159.662 E-.18621
G1 X172.834 Y159.631 E-.0706
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.069 Y161.404 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.897 Y160.602 I-.066 J-.405 E.0391
G1 X172.972 Y160.589 E.00241
G3 X173.128 Y161.39 I.031 J.409 E.03743
; COOLING_NODE: 37
M204 S10000
G1 X172.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.135 J-.385 E.04338
G1 X172.035 Y160.591 E.00218
G3 X172.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 38
M204 S10000
G1 X171.377 Y161.152 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.377 J-.155 E.05419
G1 X171.035 Y160.591 E.00218
G3 X171.396 Y161.094 I-.035 J.406 E.02207
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.308 Y161.271 E-.18761
G1 X171.137 Y161.387 E-.19665
G1 X171 Y161.411 E-.13193
G1 X170.863 Y161.387 E-.13187
G1 X170.742 Y161.32 E-.13184
G1 X170.65 Y161.215 E-.13192
G1 X170.592 Y161.043 E-.17259
G1 X170.607 Y160.88 E-.15629
G1 X170.67 Y160.756 E-.13187
G1 X170.807 Y160.637 E-.17257
G1 X170.965 Y160.591 E-.15624
G1 X171.035 Y160.591 E-.06613
G1 X171.169 Y160.626 E-.13193
G1 X171.17 Y160.626 E-.00058
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.135 Y161.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.135 J-.385 E.04338
G1 X170.035 Y160.591 E.00218
G3 X170.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.1873
G1 X169.863 Y161.387 E-.13187
G1 X169.742 Y161.32 E-.13184
G1 X169.65 Y161.215 E-.13192
G1 X169.592 Y161.043 E-.17259
G1 X169.607 Y160.88 E-.15629
G1 X169.67 Y160.756 E-.13187
G1 X169.807 Y160.637 E-.17257
G1 X169.965 Y160.591 E-.15624
G1 X170.035 Y160.591 E-.06613
G1 X170.169 Y160.626 E-.13193
G1 X170.33 Y160.756 E-.19661
G1 X170.393 Y160.88 E-.13195
G1 X170.393 Y160.881 E-.00091
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.135 Y161.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.135 J-.385 E.04338
G1 X169.035 Y160.591 E.00218
G3 X169.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.1873
G1 X168.863 Y161.387 E-.13187
G1 X168.742 Y161.32 E-.13184
G1 X168.65 Y161.215 E-.13192
G1 X168.592 Y161.043 E-.17259
G1 X168.607 Y160.88 E-.15626
G1 X168.67 Y160.756 E-.13197
G1 X168.807 Y160.637 E-.17245
G1 X168.965 Y160.591 E-.15627
G1 X169.035 Y160.591 E-.06613
G1 X169.169 Y160.626 E-.13193
G1 X169.33 Y160.756 E-.19661
G1 X169.393 Y160.88 E-.13195
G1 X169.393 Y160.881 E-.00092
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.135 Y161.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.135 J-.385 E.04338
G1 X168.035 Y160.591 E.00218
G3 X168.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.1873
G1 X167.863 Y161.387 E-.13187
G1 X167.742 Y161.32 E-.13184
G1 X167.65 Y161.215 E-.13192
G1 X167.592 Y161.043 E-.17259
G1 X167.607 Y160.88 E-.15629
G1 X167.67 Y160.756 E-.13187
G1 X167.807 Y160.637 E-.17256
G1 X167.965 Y160.591 E-.15624
G1 X168.035 Y160.591 E-.06613
G1 X168.169 Y160.626 E-.13193
G1 X168.33 Y160.756 E-.19661
G1 X168.393 Y160.88 E-.13195
G1 X168.393 Y160.881 E-.00091
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.135 Y161.382 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.135 J-.385 E.04338
G1 X167.035 Y160.591 E.00218
G3 X167.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.1873
G1 X166.863 Y161.387 E-.13187
G1 X166.742 Y161.32 E-.13183
G1 X166.65 Y161.215 E-.13192
G1 X166.592 Y161.043 E-.1726
G1 X166.607 Y160.88 E-.15629
G1 X166.67 Y160.756 E-.13187
G1 X166.807 Y160.637 E-.17256
G1 X166.965 Y160.591 E-.15624
G1 X167.035 Y160.591 E-.06613
G1 X167.169 Y160.626 E-.13192
G1 X167.33 Y160.756 E-.19662
G1 X167.393 Y160.88 E-.13196
G1 X167.393 Y160.881 E-.0009
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.37 Y159.495 Z1.8 F60000
G1 Z1.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.65 J.5 E.0364
G2 X166.642 Y161.725 I.653 J.5 E.04856
G1 X166.589 Y161.898 E.00612
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03345
G1 X166.644 Y158.273 E.00606
G2 X166.335 Y159.447 I.368 J.725 E.0464
; COOLING_NODE: 48
M204 S10000
G1 X167.135 Y159.382 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.135 J-.385 E.04339
G1 X167.035 Y158.591 E.00218
G3 X167.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 47
M204 S10000
G1 X167.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.391 J.117 E.06287
G1 X167.035 Y159.591 E.00218
G3 X167.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.18771
G1 X167.381 Y160.153 E-.13196
G1 X167.258 Y160.32 E-.19656
G1 X167.137 Y160.387 E-.13195
G1 X167 Y160.411 E-.13193
G1 X166.863 Y160.387 E-.13187
G1 X166.742 Y160.32 E-.13187
G1 X166.65 Y160.215 E-.13194
G1 X166.592 Y160.043 E-.17253
G1 X166.607 Y159.88 E-.15629
G1 X166.67 Y159.756 E-.13187
G1 X166.807 Y159.637 E-.17256
G1 X166.899 Y159.61 E-.09097
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.391 Y159.88 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.391 J.117 E.06287
G1 X168.035 Y159.591 E.00218
G3 X168.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 45
M204 S10000
G1 X168.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.135 J-.385 E.04339
G1 X168.035 Y158.591 E.00218
G3 X168.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 44
M204 S10000
G1 X169.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.135 J-.385 E.04339
G1 X169.035 Y158.591 E.00218
G3 X169.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.18729
G1 X168.863 Y159.387 E-.13187
G1 X168.742 Y159.32 E-.13184
G1 X168.65 Y159.215 E-.13192
G1 X168.592 Y159.043 E-.17259
G1 X168.607 Y158.88 E-.15626
G1 X168.67 Y158.756 E-.13197
G1 X168.807 Y158.637 E-.17245
G1 X168.965 Y158.591 E-.15628
G1 X169.035 Y158.591 E-.06613
G1 X169.169 Y158.626 E-.13194
G1 X169.33 Y158.756 E-.19661
G1 X169.393 Y158.88 E-.13195
G1 X169.393 Y158.881 E-.00093
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.654 Y160.213 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.346 J-.216 E.02612
G1 X169.035 Y159.591 E.00218
G3 X168.69 Y160.261 I-.035 J.406 E.05014
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.592 Y160.043 E-.22709
G1 X168.607 Y159.88 E-.15626
G1 X168.67 Y159.756 E-.13197
G1 X168.807 Y159.637 E-.17245
G1 X168.965 Y159.591 E-.15628
G1 X169.035 Y159.591 E-.06613
G1 X169.169 Y159.626 E-.13194
G1 X169.33 Y159.756 E-.19661
G1 X169.393 Y159.88 E-.13195
G1 X169.41 Y160.017 E-.13188
G1 X169.35 Y160.215 E-.19671
G1 X169.258 Y160.32 E-.1318
G1 X169.195 Y160.355 E-.06896
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.391 Y159.88 Z1.8 F60000
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06287
G1 X170.035 Y159.591 E.00218
G3 X170.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 43
M204 S10000
G1 X170.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.135 J-.385 E.04339
G1 X170.035 Y158.591 E.00218
G3 X170.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X170 Y159.411 E-.18729
G1 X169.863 Y159.387 E-.13187
G1 X169.742 Y159.32 E-.13184
G1 X169.65 Y159.215 E-.13192
G1 X169.592 Y159.043 E-.17259
G1 X169.607 Y158.88 E-.15629
G1 X169.67 Y158.756 E-.13187
G1 X169.807 Y158.637 E-.17257
G1 X169.965 Y158.591 E-.15624
G1 X170.035 Y158.591 E-.06613
G1 X170.169 Y158.626 E-.13194
G1 X170.33 Y158.756 E-.19661
G1 X170.393 Y158.88 E-.13195
G1 X170.393 Y158.881 E-.00092
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.82 Y160.639 Z1.8 F60000
G1 X184.79 Y162.29 Z1.8
G1 Z1.4
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
M73 P49 R18
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311784
G1 F4016.909
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294558
G1 F4291.886
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266368
G1 F4833.354
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243519
G1 F5383.886
G2 X184.078 Y160.68 I-2.442 J-.221 E.00912
; LINE_WIDTH: 0.278583
G1 F4582.821
G1 X184.075 Y160.66 E.0004
; LINE_WIDTH: 0.297341
G1 F4244.944
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.328441
G1 F3782.564
G1 X184.044 Y160.497 E.00197
G1 X184.024 Y160.496 E.00047
; LINE_WIDTH: 0.28982
G1 F4374.25
G1 X183.95 Y160.496 E.00153
; LINE_WIDTH: 0.251779
G1 F5170.957
G1 X183.875 Y160.496 E.00129
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311788
G1 F4016.843
M204 S8000
G1 X184.062 Y160.415 E.00893
; LINE_WIDTH: 0.294558
G1 F4291.886
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266368
G1 F4833.349
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243519
G1 F5383.886
G2 X184.078 Y159.68 I-2.442 J-.221 E.00912
; LINE_WIDTH: 0.278583
G1 F4582.821
G1 X184.075 Y159.66 E.0004
; LINE_WIDTH: 0.297351
G1 F4244.768
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328453
G1 F3782.399
G1 X184.044 Y159.497 E.00197
G1 X184.024 Y159.497 E.00047
; LINE_WIDTH: 0.289764
G1 F4375.239
G1 X183.95 Y159.496 E.00153
; LINE_WIDTH: 0.251649
G1 F5174.185
G1 X183.875 Y159.496 E.00129
M204 S10000
G1 X183.986 Y159.806 F60000
; LINE_WIDTH: 0.311784
G1 F4016.909
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294558
G1 F4291.886
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266368
G1 F4833.349
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243519
G1 F5383.886
G2 X184.078 Y158.68 I-2.442 J-.221 E.00912
; LINE_WIDTH: 0.278583
G1 F4582.821
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298126
G1 F4231.887
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353201
G1 F3480.715
G1 X184.036 Y158.464 E.00292
G1 X183.753 Y158.306 E.00837
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609609
G1 F1905.808
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574645
G1 F2031.125
G2 X182.196 Y158.161 I-.351 J1.735 E.00657
; LINE_WIDTH: 0.541522
G1 F2166.058
G2 X181.741 Y158.169 I-.193 J1.898 E.01893
; LINE_WIDTH: 0.582308
G1 F2002.271
G1 X181.673 Y158.182 E.00308
; LINE_WIDTH: 0.608316
G1 F1910.166
G1 X181.606 Y158.195 E.00323
; LINE_WIDTH: 0.638631
G1 F1812.962
G1 X181.538 Y158.213 E.00348
; LINE_WIDTH: 0.668754
G1 F1725.697
G3 X181.494 Y158.221 I-.029 J-.03 E.00245
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609609
G1 F1905.808
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574645
G1 F2031.125
G2 X168.196 Y158.161 I-.351 J1.735 E.00657
; LINE_WIDTH: 0.541522
G1 F2166.058
G2 X167.741 Y158.169 I-.193 J1.898 E.01893
; LINE_WIDTH: 0.582308
G1 F2002.271
G1 X167.673 Y158.182 E.00308
; LINE_WIDTH: 0.608316
G1 F1910.166
G1 X167.606 Y158.195 E.00323
; LINE_WIDTH: 0.638631
G1 F1812.962
G1 X167.538 Y158.213 E.00348
; LINE_WIDTH: 0.675532
G1 F1707.21
G1 X167.503 Y158.224 E.00195
G1 X166.773 Y158.029 E.03973
M204 S10000
G1 X166.244 Y158.306 F60000
; LINE_WIDTH: 0.358564
G1 F3421.581
M204 S8000
G1 X165.964 Y158.464 E.00844
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.33128
G1 F3745.324
G1 X165.942 Y158.575 E.00209
; LINE_WIDTH: 0.294558
G1 F4291.893
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.242728
G1 F5405.211
G2 X165.902 Y159.133 I3.173 J.367 E.00755
; LINE_WIDTH: 0.249839
G1 F5219.449
G1 X165.916 Y159.256 E.00213
; LINE_WIDTH: 0.293379
G1 F4312.083
G2 X166.009 Y159.827 I4.763 J-.485 E.01205
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.250883
G1 F5193.246
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.288855
G1 F4391.415
G1 X165.977 Y159.496 E.00151
; LINE_WIDTH: 0.314578
G1 F3975.594
G1 X165.956 Y159.497 E.00046
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.244257
G1 F5364.161
G2 X165.902 Y160.133 I2.13 J.341 E.00795
; LINE_WIDTH: 0.249839
G1 F5219.449
G1 X165.916 Y160.256 E.00213
; LINE_WIDTH: 0.29338
G1 F4312.07
G2 X166.009 Y160.827 I4.77 J-.485 E.01205
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.250922
G1 F5192.272
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.288964
G1 F4389.468
G1 X165.977 Y160.496 E.00152
; LINE_WIDTH: 0.314579
G1 F3975.573
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.244256
G1 F5364.172
G2 X165.902 Y161.133 I2.13 J.341 E.00795
; LINE_WIDTH: 0.249839
G1 F5219.449
G1 X165.916 Y161.256 E.00213
; LINE_WIDTH: 0.292114
G1 F4333.973
G2 X165.986 Y161.694 I3.659 J-.358 E.0092
; WIPE_START
M204 S8000
G1 X165.916 Y161.256 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z1.8 I-1.217 J.015 P1  F60000
G1 X167.428 Y279.944 Z1.8
G1 Z1.4
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #8
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z1.8 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z1.4
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
M73 P49 R17
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
M73 P50 R17
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
M73 P51 R17
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S176 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z1.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E14

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z4.4 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y252.694 F60000
G1 Z1.4

; filament start gcode
G17
G3 Z1.8 I0 J-1.217 P1
G1 X199.428 Y252.694 Z1.8
G1 Z1.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X200.928  F600
G1  X199.428  F240
G1  X199.928  F600
G1  Y253.194 
G1  X198.928 
G1  Y252.194 
G1  X200.428 
G1  Y253.694 
G1  X198.428 
G1  Y251.694 
M73 P52 R17
G1  X196.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X167.428  E1.2162 F2473
G1  Y254.944  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X167.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X199.428  E1.2162
G1  Y257.194  E0.0285
G1  X167.428  E1.2162
G1  Y257.944  E0.0285
G1  X199.428  E1.2162
G1  Y258.694  E0.0285
G1  X167.428  E1.2162
G1  Y259.444  E0.0285
G1  X199.428  E1.2162
G1  Y260.194  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #8
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.543 Y251.744   E0.0535
G1 E-0.4000 F1800
M204 S10000
G1  X201.169 Y253.644   F600
G1 E0.4000 F1800
M204 S8000
G3  X200.739 Y256.835   I-1.385 J1.438 E0.1423 F5400
G2  X199.928 Y259.090   I2.785 J2.275 E0.0929
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END

; WIPE_START
G1 F4333.973
M204 S8000
G1 X166.928 Y280.444 E-.00001
G1 X167.578 Y281.204 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
M73 P52 R16
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3349
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 7 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z1.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer7 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 8/25
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3265
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 8 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer8 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z1.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.216 Y278.401   I8.989 J-9.270 E0.1015 F5400
G1 E-0.4000 F1800
M204 S10000
G1  X165.744 Y276.190   F600
G1 E0.4000 F1800
M204 S8000
G2  X166.928 Y273.548   I-2.389 J-2.656 E0.1133 F5400
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G3  X168.451 Y250.453   I20.946 J15.027 E0.1782
G3  X171.859 Y251.132   I1.345 J2.142 E0.1456
G2  X175.079 Y252.194   I3.241 J-4.414 E0.1310
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X167.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #9
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z1.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S74 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E13

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

M73 P53 R16
G1 Y295
G1 Y265 F18000
G1 Z4.6 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y265.285 F60000
G1 Z1.6
G1 X204.318 Y272.917 Z2
G1 X204.318 Y285.121 Z2
G1 X162.538 Y285.121
G1 X162.538 Y277.194

; filament start gcode
G1 X167.428 Y277.194
G1 Z1.6
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X165.928 
G1  X167.428  F240
G1  X167.928  F600
G1  Y277.694 
G1  X166.928 
G1  Y276.694 
G1  X168.428 
G1  Y278.194 
G1  X166.428 
G1  Y276.194 
G1  X170.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X199.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X167.428  E1.2162
G1  Y274.194  E0.0285
G1  X199.428  E1.2162
G1  Y273.444  E0.0285
G1  X167.428  E1.2162
G1  Y272.694  E0.0285
G1  X199.428  E1.2162
G1  Y271.944  E0.0285
G1  X167.428  E1.2162
G1  Y271.194  E0.0285
G1  X199.428  E1.2162
G1  Y270.444  E0.0285
G1  X167.428  E1.2162
G1  Y269.694  E0.0285
G1  X199.428  E1.2162
G1  Y268.944  E0.0285
G1  X167.428  E1.2162
G1  Y268.194  E0.0285
G1  X199.428  E1.2162
G1  Y267.444  E0.0285
G1  X167.428  E1.2162
G1  Y266.694  E0.0285
G1  X199.428  E1.2162
G1  Y265.944  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y277.944  E0.0760 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #9
M204 S8000
M73 P54 R16
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.714 Y160.29
G1 Z1.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.29 J-.291 E.02913
G1 X175.042 Y159.591 E.0024
G3 X174.759 Y160.329 I-.038 J.409 E.04742
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.21371
G1 X174.59 Y160.017 E-.13183
G1 X174.621 Y159.841 E-.17028
G1 X174.716 Y159.703 E-.15855
G1 X174.831 Y159.626 E-.13188
G1 X174.965 Y159.591 E-.13195
G1 X175.042 Y159.591 E-.07271
G1 X175.226 Y159.657 E-.18605
G1 X175.335 Y159.761 E-.14311
G1 X175.383 Y159.853 E-.09859
G1 X175.41 Y160.017 E-.15868
G1 X175.379 Y160.16 E-.13841
G1 X175.276 Y160.298 E-.16423
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.135 Y159.383 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.132 J-.386 E.04319
G1 X175.042 Y158.591 E.0024
G3 X175.191 Y159.359 I-.038 J.406 E.03289
; COOLING_NODE: 10
M204 S10000
G1 X176.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.135 J-.385 E.04339
G1 X176.035 Y158.591 E.00218
G3 X176.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 13
M204 S10000
G1 X175.59 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.41 J-.018 E.01967
G1 X176.035 Y159.591 E.00218
G3 X175.597 Y160.077 I-.035 J.409 E.05703
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X175.621 Y159.841 E-.22545
G1 X175.716 Y159.703 E-.15855
G1 X175.831 Y159.626 E-.13188
G1 X175.965 Y159.591 E-.13195
G1 X176.035 Y159.591 E-.06613
G1 X176.206 Y159.645 E-.17021
G1 X176.335 Y159.761 E-.16516
G1 X176.383 Y159.853 E-.09859
G1 X176.41 Y160.017 E-.15868
G1 X176.379 Y160.16 E-.13841
G1 X176.262 Y160.317 E-.18602
G1 X176.137 Y160.387 E-.13659
G1 X176 Y160.411 E-.13186
G1 X175.999 Y160.411 E-.00053
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.383 Y159.853 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.383 J.146 E.06418
G1 X173.035 Y159.591 E.00218
G3 X173.357 Y159.798 I-.035 J.409 E.01252
; COOLING_NODE: 1
M204 S10000
G1 X173.714 Y160.29 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.29 J-.29 E.02913
G1 X174.042 Y159.591 E.0024
G3 X173.759 Y160.329 I-.038 J.409 E.04742
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.21371
G1 X173.59 Y160.017 E-.13183
G1 X173.621 Y159.841 E-.17028
G1 X173.716 Y159.703 E-.15855
G1 X173.831 Y159.626 E-.13188
G1 X173.965 Y159.591 E-.13196
G1 X174.042 Y159.591 E-.07271
G1 X174.226 Y159.657 E-.18605
G1 X174.335 Y159.761 E-.14311
G1 X174.383 Y159.853 E-.09859
G1 X174.41 Y160.017 E-.15868
G1 X174.379 Y160.16 E-.13841
G1 X174.276 Y160.298 E-.16422
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.135 Y159.383 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.132 J-.386 E.04319
G1 X174.042 Y158.591 E.0024
G3 X174.191 Y159.359 I-.038 J.406 E.03289
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174 Y159.411 E-.18762
G1 X173.863 Y159.387 E-.13185
G1 X173.711 Y159.292 E-.17027
G1 X173.619 Y159.153 E-.15863
G1 X173.59 Y159.017 E-.13181
G1 X173.621 Y158.841 E-.17028
G1 X173.716 Y158.703 E-.15855
G1 X173.831 Y158.626 E-.13188
G1 X173.965 Y158.591 E-.13195
G1 X174.042 Y158.591 E-.07271
G1 X174.226 Y158.657 E-.18605
G1 X174.335 Y158.761 E-.14311
G1 X174.383 Y158.853 E-.09859
G1 X174.388 Y158.88 E-.0267
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.135 Y159.382 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.135 J-.385 E.04339
G1 X173.035 Y158.591 E.00218
G3 X173.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173 Y159.411 E-.18743
G1 X172.863 Y159.387 E-.13185
G1 X172.711 Y159.292 E-.17027
G1 X172.619 Y159.153 E-.15863
G1 X172.59 Y159.017 E-.13181
G1 X172.607 Y158.88 E-.13203
G1 X172.67 Y158.756 E-.13182
G1 X172.805 Y158.638 E-.17018
G1 X172.965 Y158.591 E-.15866
G1 X173.035 Y158.591 E-.06611
G1 X173.206 Y158.645 E-.17021
G1 X173.335 Y158.761 E-.16516
G1 X173.383 Y158.853 E-.09859
G1 X173.388 Y158.881 E-.02728
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X172.136 Y159.386 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.136 J-.387 E.04365
G1 X172.035 Y158.591 E.00218
G3 X172.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 5
M204 S10000
G1 X172.382 Y159.853 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.382 J.144 E.06377
G1 X172.035 Y159.591 E.00218
G3 X172.356 Y159.799 I-.035 J.406 E.0125
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X172.41 Y160.017 E-.21403
G1 X172.381 Y160.153 E-.13189
G1 X172.258 Y160.32 E-.19659
G1 X172.137 Y160.387 E-.13194
G1 X172 Y160.411 E-.13188
G1 X171.863 Y160.387 E-.13185
G1 X171.711 Y160.292 E-.17028
G1 X171.619 Y160.153 E-.1586
G1 X171.59 Y160.017 E-.13183
G1 X171.607 Y159.88 E-.13203
G1 X171.67 Y159.756 E-.13182
G1 X171.805 Y159.638 E-.17018
G1 X171.873 Y159.618 E-.06709
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.136 Y161.386 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.136 J-.387 E.04365
G1 X172.035 Y160.591 E.00218
G3 X172.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 36
M204 S10000
G1 X173.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.135 J-.385 E.04339
G1 X173.035 Y160.591 E.00218
G3 X173.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 35
M204 S10000
G1 X174.135 Y161.383 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.132 J-.386 E.04319
G1 X174.042 Y160.591 E.0024
G3 X174.191 Y161.359 I-.038 J.406 E.03289
; COOLING_NODE: 34
M204 S10000
G1 X175.135 Y161.383 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.132 J-.386 E.04319
G1 X175.042 Y160.591 E.0024
G3 X175.191 Y161.359 I-.038 J.406 E.03289
; COOLING_NODE: 33
M204 S10000
G1 X176.135 Y161.382 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.135 J-.385 E.04339
G1 X176.035 Y160.591 E.00218
G3 X176.19 Y161.358 I-.035 J.406 E.03288
; COOLING_NODE: 32
M204 S10000
G1 X177.137 Y161.387 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.133 J-.388 E.04347
G1 X177.042 Y160.591 E.0024
G3 X177.192 Y161.364 I-.038 J.409 E.03307
; COOLING_NODE: 31
M204 S10000
G1 X178.137 Y161.387 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.133 J-.388 E.04347
G1 X178.042 Y160.591 E.0024
G3 X178.192 Y161.364 I-.038 J.409 E.03307
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.18791
G1 X177.863 Y161.387 E-.13185
G1 X177.711 Y161.292 E-.17027
G1 X177.619 Y161.153 E-.15863
G1 X177.59 Y161.017 E-.13181
G1 X177.607 Y160.88 E-.13203
G1 X177.67 Y160.756 E-.13182
G1 X177.831 Y160.626 E-.19661
G1 X177.965 Y160.591 E-.13195
G1 X178.042 Y160.591 E-.07271
G1 X178.226 Y160.657 E-.18605
G1 X178.335 Y160.761 E-.14311
G1 X178.383 Y160.853 E-.09859
G1 X178.388 Y160.88 E-.02667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.2 Y161.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.892 Y160.603 I-.199 J-.359 E.04347
G1 X178.972 Y160.59 E.00256
G3 X179.25 Y161.325 I.029 J.409 E.03292
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X179.069 Y161.405 E-.18774
G1 X178.931 Y161.405 E-.13188
G1 X178.793 Y161.356 E-.13848
G1 X178.652 Y161.22 E-.18608
G1 X178.598 Y161.086 E-.13661
G1 X178.593 Y160.948 E-.13181
G1 X178.633 Y160.815 E-.13192
G1 X178.72 Y160.698 E-.13837
G1 X178.892 Y160.603 E-.18609
G1 X178.972 Y160.59 E-.07749
G1 X179.165 Y160.623 E-.18601
G1 X179.284 Y160.703 E-.1365
G1 X179.361 Y160.818 E-.13103
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.382 Y159.853 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.892 Y159.603 I-.382 J.144 E.06145
G1 X178.972 Y159.59 E.00256
G3 X179.357 Y159.799 I.028 J.407 E.0145
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X179.407 Y159.943 E-.14507
G1 X179.402 Y160.087 E-.13663
G1 X179.35 Y160.215 E-.13187
G1 X179.2 Y160.359 E-.19659
G1 X179.069 Y160.405 E-.13192
G1 X178.931 Y160.405 E-.13188
G1 X178.793 Y160.356 E-.13848
G1 X178.652 Y160.22 E-.18606
G1 X178.598 Y160.086 E-.13662
G1 X178.593 Y159.948 E-.13181
G1 X178.633 Y159.815 E-.13192
G1 X178.72 Y159.698 E-.13837
G1 X178.87 Y159.615 E-.16278
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.625 Y160.151 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.378 J-.153 E.02384
G1 X178.042 Y159.591 E.0024
G3 X177.652 Y160.204 I-.038 J.406 E.0523
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18723
G1 X177.607 Y159.88 E-.13203
G1 X177.67 Y159.756 E-.13182
G1 X177.831 Y159.626 E-.19661
G1 X177.965 Y159.591 E-.13195
G1 X178.042 Y159.591 E-.07271
G1 X178.226 Y159.657 E-.18605
G1 X178.335 Y159.761 E-.14311
G1 X178.383 Y159.853 E-.09859
G1 X178.41 Y160.017 E-.15868
G1 X178.379 Y160.16 E-.13841
G1 X178.262 Y160.317 E-.18602
G1 X178.137 Y160.387 E-.13659
G1 X178.137 Y160.387 E-.0002
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.625 Y160.151 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.378 J-.153 E.02384
G1 X177.042 Y159.591 E.0024
G3 X176.652 Y160.204 I-.038 J.406 E.0523
; COOLING_NODE: 11
M204 S10000
G1 X177.137 Y159.387 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.133 J-.388 E.04347
G1 X177.042 Y158.591 E.0024
G3 X177.192 Y159.364 I-.038 J.409 E.03307
; COOLING_NODE: 17
M204 S10000
G1 X178.137 Y159.387 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.133 J-.388 E.04347
G1 X178.042 Y158.591 E.0024
G3 X178.192 Y159.364 I-.038 J.409 E.03307
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.1879
G1 X177.863 Y159.387 E-.13185
G1 X177.711 Y159.292 E-.17027
G1 X177.619 Y159.153 E-.15863
G1 X177.59 Y159.017 E-.13181
G1 X177.607 Y158.88 E-.13203
G1 X177.67 Y158.756 E-.13182
G1 X177.831 Y158.626 E-.19661
G1 X177.965 Y158.591 E-.13195
G1 X178.042 Y158.591 E-.07271
G1 X178.226 Y158.657 E-.18605
G1 X178.335 Y158.761 E-.14311
G1 X178.383 Y158.853 E-.09859
G1 X178.388 Y158.88 E-.02668
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X179.2 Y159.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.892 Y158.603 I-.199 J-.359 E.04347
G1 X178.972 Y158.59 E.00256
G3 X179.25 Y159.325 I.029 J.409 E.03292
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X179.069 Y159.405 E-.18775
G1 X178.931 Y159.405 E-.13188
G1 X178.793 Y159.356 E-.13848
G1 X178.652 Y159.22 E-.18608
G1 X178.598 Y159.086 E-.13661
G1 X178.593 Y158.948 E-.13181
G1 X178.633 Y158.815 E-.13192
G1 X178.72 Y158.698 E-.13837
G1 X178.892 Y158.603 E-.18609
G1 X178.972 Y158.59 E-.07749
G1 X179.165 Y158.623 E-.18601
G1 X179.284 Y158.703 E-.1365
G1 X179.361 Y158.818 E-.13102
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.382 Y159.853 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.892 Y159.603 I-.382 J.144 E.06145
G1 X180.972 Y159.59 E.00256
G3 X181.357 Y159.799 I.028 J.407 E.0145
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.407 Y159.943 E-.14507
G1 X181.402 Y160.087 E-.13663
G1 X181.35 Y160.215 E-.13187
G1 X181.2 Y160.359 E-.19659
G1 X181.069 Y160.405 E-.13192
G1 X180.931 Y160.405 E-.13188
G1 X180.793 Y160.356 E-.13848
G1 X180.652 Y160.22 E-.18606
G1 X180.598 Y160.086 E-.13662
G1 X180.593 Y159.948 E-.13181
G1 X180.633 Y159.815 E-.13192
G1 X180.72 Y159.698 E-.13837
G1 X180.87 Y159.615 E-.16278
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.136 Y160.386 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.136 J-.387 E.04365
G1 X180.035 Y159.591 E.00218
G3 X180.191 Y160.362 I-.035 J.409 E.03305
; COOLING_NODE: 18
M204 S10000
G1 X180.135 Y159.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.135 J-.385 E.04339
G1 X180.035 Y158.591 E.00218
G3 X180.19 Y159.358 I-.035 J.406 E.03288
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X180 Y159.411 E-.18742
G1 X179.863 Y159.387 E-.13185
G1 X179.711 Y159.292 E-.17027
G1 X179.619 Y159.153 E-.15863
G1 X179.59 Y159.017 E-.13181
G1 X179.607 Y158.88 E-.13203
G1 X179.67 Y158.756 E-.13182
G1 X179.831 Y158.626 E-.19667
G1 X179.965 Y158.591 E-.13189
G1 X180.035 Y158.591 E-.06613
G1 X180.206 Y158.645 E-.17021
G1 X180.335 Y158.761 E-.16516
G1 X180.383 Y158.853 E-.09859
G1 X180.388 Y158.881 E-.02754
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X181.2 Y159.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.892 Y158.603 I-.199 J-.359 E.04347
G1 X180.972 Y158.59 E.00256
G3 X181.25 Y159.325 I.029 J.409 E.03292
; COOLING_NODE: 22
M204 S10000
G1 X182.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X181.892 Y158.603 I-.199 J-.359 E.04347
G1 X181.972 Y158.59 E.00256
G3 X182.25 Y159.325 I.029 J.409 E.03292
; COOLING_NODE: 23
M204 S10000
G1 X182.382 Y159.853 F60000
G1 F2864.117
M204 S5000
G3 X181.892 Y159.603 I-.382 J.144 E.06145
G1 X181.972 Y159.59 E.00256
G3 X182.357 Y159.799 I.028 J.407 E.0145
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X182.407 Y159.943 E-.14507
G1 X182.402 Y160.087 E-.13663
G1 X182.35 Y160.215 E-.13187
G1 X182.2 Y160.359 E-.19659
G1 X182.069 Y160.405 E-.13192
G1 X181.931 Y160.405 E-.13188
G1 X181.793 Y160.356 E-.13848
G1 X181.652 Y160.22 E-.18606
G1 X181.598 Y160.086 E-.13662
G1 X181.593 Y159.948 E-.13181
G1 X181.633 Y159.815 E-.13192
G1 X181.72 Y159.698 E-.13837
G1 X181.87 Y159.615 E-.16278
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.2 Y161.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.892 Y160.603 I-.199 J-.359 E.04347
G1 X181.972 Y160.59 E.00256
G3 X182.25 Y161.325 I.029 J.409 E.03292
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182.069 Y161.405 E-.18774
G1 X181.931 Y161.405 E-.13188
G1 X181.793 Y161.356 E-.13848
G1 X181.652 Y161.22 E-.18608
G1 X181.598 Y161.086 E-.13661
G1 X181.593 Y160.948 E-.13181
G1 X181.633 Y160.815 E-.13192
G1 X181.72 Y160.698 E-.13837
G1 X181.892 Y160.603 E-.18609
G1 X181.972 Y160.59 E-.07749
G1 X182.165 Y160.623 E-.18601
G1 X182.284 Y160.703 E-.1365
G1 X182.361 Y160.818 E-.13103
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.2 Y161.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.892 Y160.603 I-.199 J-.359 E.04347
G1 X180.972 Y160.59 E.00256
G3 X181.25 Y161.325 I.029 J.409 E.03292
; COOLING_NODE: 29
M204 S10000
G1 X180.259 Y161.312 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.258 J-.315 E.04785
G1 X180.035 Y160.591 E.00218
G3 X180.302 Y161.271 I-.035 J.406 E.02841
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X180.137 Y161.387 E-.1919
G1 X180 Y161.411 E-.13188
G1 X179.863 Y161.387 E-.13185
G1 X179.711 Y161.292 E-.17027
G1 X179.619 Y161.153 E-.15863
G1 X179.59 Y161.017 E-.13181
G1 X179.607 Y160.88 E-.13203
G1 X179.67 Y160.756 E-.13182
G1 X179.831 Y160.626 E-.19667
G1 X179.965 Y160.591 E-.13189
G1 X180.035 Y160.591 E-.06613
G1 X180.206 Y160.645 E-.1702
G1 X180.327 Y160.754 E-.15492
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.348 Y159.214 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.896 Y158.602 I-.345 J-.218 E.04971
G1 X182.972 Y158.59 E.0024
G3 X183.376 Y159.161 I.031 J.407 E.02637
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.258 Y159.32 E-.18777
G1 X183.069 Y159.405 E-.19665
G1 X182.931 Y159.405 E-.13188
G1 X182.793 Y159.356 E-.13848
G1 X182.652 Y159.22 E-.18608
G1 X182.598 Y159.086 E-.13661
G1 X182.593 Y158.941 E-.13834
G1 X182.667 Y158.759 E-.18613
G1 X182.77 Y158.66 E-.13654
G1 X182.896 Y158.602 E-.1318
G1 X182.972 Y158.59 E-.07286
G1 X183.165 Y158.623 E-.18601
G1 X183.227 Y158.665 E-.07086
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.602 Y160.086 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.896 Y159.602 I.401 J-.087 E.01957
G1 X182.972 Y159.59 E.0024
G3 X182.619 Y160.143 I.031 J.409 E.05697
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182.593 Y159.941 E-.19388
G1 X182.667 Y159.759 E-.18613
G1 X182.77 Y159.66 E-.13654
G1 X182.896 Y159.602 E-.1318
G1 X182.972 Y159.59 E-.07286
G1 X183.165 Y159.623 E-.18601
G1 X183.284 Y159.703 E-.1365
G1 X183.383 Y159.853 E-.17023
G1 X183.407 Y159.943 E-.08864
G1 X183.402 Y160.087 E-.13663
G1 X183.326 Y160.249 E-.17016
G1 X183.2 Y160.359 E-.15856
G1 X183.069 Y160.405 E-.13192
G1 X183.069 Y160.405 E-.00015
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X183.348 Y161.214 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.896 Y160.602 I-.345 J-.218 E.04971
G1 X182.972 Y160.59 E.0024
G3 X183.376 Y161.161 I.031 J.407 E.02637
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.258 Y161.32 E-.18777
G1 X183.069 Y161.405 E-.19665
G1 X182.931 Y161.405 E-.13188
G1 X182.793 Y161.356 E-.13848
G1 X182.652 Y161.22 E-.18608
G1 X182.598 Y161.086 E-.13661
G1 X182.593 Y160.941 E-.13834
G1 X182.667 Y160.759 E-.18613
G1 X182.77 Y160.66 E-.13654
G1 X182.896 Y160.602 E-.1318
G1 X182.972 Y160.59 E-.07286
G1 X183.165 Y160.623 E-.18601
G1 X183.227 Y160.665 E-.07086
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z2 F60000
G1 Z1.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.637 Y160.494 I-.384 J-.734 E.04858
G2 X183.635 Y159.489 I-.69 J-.501 E.03637
G2 X183.363 Y158.285 I-.627 J-.491 E.04783
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 43
; WIPE_START
G1 X183.411 Y161.898 E-.9394
G1 X183.358 Y161.725 E-.1716
G1 X183.505 Y161.626 E-.16883
G1 X183.604 Y161.531 E-.12962
G1 X183.746 Y161.3 E-.25813
G1 X183.786 Y161.17 E-.12953
G1 X183.8 Y161.062 E-.1029
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.227 Y160.113 Z2 F60000
G1 X170.2 Y159.358 Z2
G1 Z1.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X169.892 Y158.603 I-.199 J-.359 E.04347
G1 X169.972 Y158.59 E.00256
G3 X170.25 Y159.325 I.029 J.409 E.03292
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.069 Y159.405 E-.18775
G1 X169.931 Y159.405 E-.13188
G1 X169.793 Y159.356 E-.13848
G1 X169.652 Y159.22 E-.18608
G1 X169.598 Y159.086 E-.13661
G1 X169.593 Y158.948 E-.13181
G1 X169.633 Y158.815 E-.13192
G1 X169.72 Y158.698 E-.13837
G1 X169.892 Y158.603 E-.18609
G1 X169.972 Y158.59 E-.07749
G1 X170.165 Y158.623 E-.18601
G1 X170.284 Y158.703 E-.1365
G1 X170.361 Y158.818 E-.13103
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X169.135 Y159.383 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.132 J-.386 E.04319
G1 X169.042 Y158.591 E.0024
G3 X169.191 Y159.359 I-.038 J.406 E.03289
; COOLING_NODE: 41
M204 S10000
G1 X168.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.381 J-.152 E.0239
G1 X169.042 Y159.591 E.0024
G3 X168.649 Y160.206 I-.038 J.409 E.05264
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18746
G1 X168.621 Y159.841 E-.17028
G1 X168.716 Y159.703 E-.15855
G1 X168.831 Y159.626 E-.13188
G1 X168.965 Y159.591 E-.13195
G1 X169.042 Y159.591 E-.07271
G1 X169.226 Y159.657 E-.18605
G1 X169.335 Y159.761 E-.14311
G1 X169.383 Y159.853 E-.09859
G1 X169.41 Y160.017 E-.15868
G1 X169.379 Y160.16 E-.13841
G1 X169.262 Y160.317 E-.18602
G1 X169.137 Y160.387 E-.1363
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.382 Y159.853 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.892 Y159.603 I-.382 J.144 E.06145
G1 X169.972 Y159.59 E.00256
G3 X170.357 Y159.799 I.028 J.407 E.0145
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.407 Y159.943 E-.14507
G1 X170.402 Y160.087 E-.13663
G1 X170.35 Y160.215 E-.13187
G1 X170.2 Y160.359 E-.19658
G1 X170.069 Y160.405 E-.13192
G1 X169.931 Y160.405 E-.13188
G1 X169.793 Y160.356 E-.13848
G1 X169.652 Y160.22 E-.18606
G1 X169.598 Y160.086 E-.13662
G1 X169.593 Y159.948 E-.13181
G1 X169.633 Y159.815 E-.13192
G1 X169.72 Y159.698 E-.13837
G1 X169.87 Y159.615 E-.16279
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.384 Y159.852 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.892 Y159.603 I-.383 J.146 E.06186
G1 X170.972 Y159.59 E.00256
G3 X171.359 Y159.798 I.029 J.409 E.01453
; COOLING_NODE: 7
M204 S10000
G1 X171.346 Y159.213 F60000
G1 F2864.117
M204 S5000
G3 X170.892 Y158.603 I-.346 J-.217 E.04969
G1 X170.972 Y158.59 E.00256
G3 X171.374 Y159.16 I.028 J.407 E.02626
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X171.258 Y159.32 E-.18761
G1 X171.069 Y159.405 E-.19665
G1 X170.931 Y159.405 E-.13188
G1 X170.793 Y159.356 E-.13848
G1 X170.652 Y159.22 E-.18608
G1 X170.598 Y159.086 E-.13661
G1 X170.593 Y158.948 E-.13181
G1 X170.633 Y158.815 E-.13192
G1 X170.72 Y158.698 E-.13837
G1 X170.892 Y158.603 E-.18609
G1 X170.972 Y158.59 E-.07749
G1 X171.165 Y158.623 E-.18601
G1 X171.227 Y158.665 E-.07101
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.346 Y161.213 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.892 Y160.603 I-.346 J-.217 E.04969
G1 X170.972 Y160.59 E.00256
G3 X171.374 Y161.16 I.028 J.407 E.02626
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.258 Y161.32 E-.18762
G1 X171.069 Y161.405 E-.19665
G1 X170.931 Y161.405 E-.13188
G1 X170.793 Y161.356 E-.13848
G1 X170.652 Y161.22 E-.18608
G1 X170.598 Y161.086 E-.13661
G1 X170.593 Y160.948 E-.13181
G1 X170.633 Y160.815 E-.13192
G1 X170.72 Y160.698 E-.13837
G1 X170.892 Y160.603 E-.18609
G1 X170.972 Y160.59 E-.07749
G1 X171.165 Y160.623 E-.18601
G1 X171.227 Y160.665 E-.071
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.2 Y161.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.892 Y160.603 I-.199 J-.359 E.04347
G1 X169.972 Y160.59 E.00256
G3 X170.25 Y161.325 I.029 J.409 E.03292
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170.069 Y161.405 E-.18775
G1 X169.931 Y161.405 E-.13188
G1 X169.793 Y161.356 E-.13848
G1 X169.652 Y161.22 E-.18608
G1 X169.598 Y161.086 E-.13661
G1 X169.593 Y160.948 E-.13181
G1 X169.633 Y160.815 E-.13192
G1 X169.72 Y160.698 E-.13837
G1 X169.892 Y160.603 E-.18609
G1 X169.972 Y160.59 E-.07749
G1 X170.165 Y160.623 E-.18601
G1 X170.284 Y160.703 E-.1365
G1 X170.361 Y160.818 E-.13102
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.135 Y161.383 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.132 J-.386 E.04319
G1 X169.042 Y160.591 E.0024
G3 X169.191 Y161.359 I-.038 J.406 E.03289
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.18761
G1 X168.863 Y161.387 E-.13185
G1 X168.711 Y161.292 E-.17027
G1 X168.619 Y161.153 E-.15863
G1 X168.59 Y161.017 E-.13181
G1 X168.621 Y160.841 E-.17028
G1 X168.716 Y160.703 E-.15855
G1 X168.831 Y160.626 E-.13188
G1 X168.965 Y160.591 E-.13195
G1 X169.042 Y160.591 E-.07271
G1 X169.226 Y160.657 E-.18605
G1 X169.335 Y160.761 E-.14311
G1 X169.383 Y160.853 E-.09859
G1 X169.388 Y160.88 E-.0267
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.136 Y161.386 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.136 J-.387 E.04365
G1 X167.035 Y160.591 E.00218
G3 X167.191 Y161.362 I-.035 J.409 E.03305
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.18774
G1 X166.863 Y161.387 E-.13185
G1 X166.711 Y161.292 E-.17027
G1 X166.619 Y161.153 E-.15863
G1 X166.59 Y161.017 E-.13181
G1 X166.607 Y160.88 E-.13203
G1 X166.67 Y160.756 E-.13182
G1 X166.805 Y160.638 E-.17018
G1 X166.965 Y160.591 E-.15866
G1 X167.035 Y160.591 E-.06611
G1 X167.206 Y160.645 E-.1702
G1 X167.335 Y160.761 E-.16516
G1 X167.383 Y160.853 E-.09859
G1 X167.388 Y160.881 E-.02697
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.2 Y161.358 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.892 Y160.603 I-.199 J-.359 E.04347
G1 X167.972 Y160.59 E.00256
G3 X168.25 Y161.325 I.029 J.409 E.03292
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X168.069 Y161.405 E-.18775
G1 X167.931 Y161.405 E-.13188
G1 X167.793 Y161.356 E-.13848
G1 X167.652 Y161.22 E-.18608
G1 X167.598 Y161.086 E-.13661
G1 X167.593 Y160.948 E-.13181
G1 X167.633 Y160.815 E-.13192
G1 X167.72 Y160.698 E-.13837
G1 X167.892 Y160.603 E-.18609
G1 X167.972 Y160.59 E-.07749
G1 X168.165 Y160.623 E-.18601
G1 X168.284 Y160.703 E-.1365
G1 X168.361 Y160.818 E-.13102
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.382 Y159.853 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.892 Y159.603 I-.382 J.144 E.06145
G1 X167.972 Y159.59 E.00256
G3 X168.357 Y159.799 I.028 J.407 E.0145
; COOLING_NODE: 47
M204 S10000
G1 X167.382 Y159.853 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.382 J.144 E.06377
G1 X167.035 Y159.591 E.00218
G3 X167.356 Y159.799 I-.035 J.406 E.0125
; COOLING_NODE: 45
M204 S10000
G1 X168.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X167.892 Y158.603 I-.199 J-.359 E.04347
G1 X167.972 Y158.59 E.00256
G3 X168.25 Y159.325 I.029 J.409 E.03292
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X168.069 Y159.405 E-.18775
G1 X167.931 Y159.405 E-.13188
G1 X167.793 Y159.356 E-.13848
G1 X167.652 Y159.22 E-.18608
G1 X167.598 Y159.086 E-.13661
G1 X167.593 Y158.948 E-.13181
G1 X167.633 Y158.815 E-.13192
G1 X167.72 Y158.698 E-.13837
G1 X167.892 Y158.603 E-.18609
G1 X167.972 Y158.59 E-.07749
G1 X168.165 Y158.623 E-.18601
G1 X168.284 Y158.703 E-.1365
G1 X168.361 Y158.818 E-.13103
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X167.136 Y159.386 Z2 F60000
G1 Z1.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.136 J-.387 E.04365
G1 X167.035 Y158.591 E.00218
G3 X167.191 Y159.362 I-.035 J.409 E.03305
; COOLING_NODE: 48
M204 S10000
G1 X166.37 Y159.494 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.494 I.684 J.5 E.03621
G2 X166.64 Y161.733 I.678 J.501 E.04855
G1 X166.583 Y161.898 E.00591
G1 X165.602 Y161.898 E.03321
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03344
G1 X166.644 Y158.272 E.00605
G2 X166.336 Y159.445 I.391 J.729 E.04604
; COOLING_NODE: 51
; WIPE_START
G1 X166.282 Y159.638 E-.1906
G1 X166.231 Y159.764 E-.12947
G1 X166.197 Y160.034 E-.25844
G1 X166.254 Y160.3 E-.25818
G1 X166.37 Y160.494 E-.2154
G1 X166.282 Y160.638 E-.16019
G1 X166.231 Y160.764 E-.12944
G1 X166.202 Y160.898 E-.12984
G1 X166.214 Y161.169 E-.258
G1 X166.254 Y161.3 E-.1297
G1 X166.273 Y161.338 E-.04073
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.895 Y161.73 Z2 F60000
G1 X184.79 Y162.29 Z2
G1 Z1.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311792
G1 F4016.789
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294566
G1 F4291.75
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266446
G1 F4831.653
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.237252
G1 F5557.505
G2 X184.095 Y160.828 I-3.258 J-.245 E.00644
; LINE_WIDTH: 0.255789
G1 F5073.562
G1 X184.081 Y160.715 E.00202
; LINE_WIDTH: 0.301131
G1 F4182.63
G2 X183.988 Y160.192 I-4.554 J.534 E.0114
M204 S10000
G1 X183.987 Y159.804 F60000
; LINE_WIDTH: 0.311815
G1 F4016.437
M204 S8000
G1 X184.062 Y159.415 E.00887
; LINE_WIDTH: 0.29458
G1 F4291.506
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266451
G1 F4831.552
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.237252
G1 F5557.507
G2 X184.095 Y158.828 I-3.258 J-.245 E.00644
; LINE_WIDTH: 0.255794
G1 F5073.443
G1 X184.081 Y158.715 E.00202
; LINE_WIDTH: 0.299927
G1 F4202.218
G2 X184.01 Y158.306 I-3.579 J.408 E.00888
M204 S10000
G1 X183.144 Y158.348 F60000
; LINE_WIDTH: 0.602766
G1 F1929.104
M204 S8000
G1 X182.321 Y158.18 E.03908
; LINE_WIDTH: 0.570161
G1 F2048.399
G1 X182.184 Y158.16 E.00608
; LINE_WIDTH: 0.541545
G1 F2165.96
G2 X181.738 Y158.17 I-.185 J1.697 E.01854
; LINE_WIDTH: 0.583375
G1 F1998.316
G1 X181.67 Y158.183 E.00314
; LINE_WIDTH: 0.610152
G1 F1903.984
G1 X181.601 Y158.196 E.00329
; LINE_WIDTH: 0.640964
G1 F1805.888
G1 X181.533 Y158.214 E.00349
; LINE_WIDTH: 0.66983
G1 F1722.737
G3 X181.494 Y158.221 I-.026 J-.027 E.0022
; WIPE_START
G1 X181.533 Y158.214 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.988 Y159.192 Z2 F60000
G1 Z1.6
G1 E2 F600
; LINE_WIDTH: 0.301132
G1 F4182.621
M204 S8000
G3 X184.081 Y159.715 I-4.471 J1.058 E.0114
; LINE_WIDTH: 0.255789
G1 F5073.562
G1 X184.095 Y159.828 E.00202
; LINE_WIDTH: 0.237252
G1 F5557.502
G3 X184.09 Y160.226 I-3.263 J.153 E.00644
; LINE_WIDTH: 0.268408
G1 F4789.61
G1 X184.073 Y160.343 E.00221
; LINE_WIDTH: 0.300497
G1 F4192.928
G1 X184.058 Y160.441 E.00214
; LINE_WIDTH: 0.33557
G1 F3690.416
G3 X183.974 Y160.757 I-2.771 J-.568 E.00796
; WIPE_START
G1 X184.058 Y160.441 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.503 Y159.357 Z2 F60000
G1 X168.382 Y158.192 Z2
G1 Z1.6
G1 E2 F600
; LINE_WIDTH: 0.602766
G1 F1929.104
M204 S8000
G1 X168.321 Y158.18 E.00287
; LINE_WIDTH: 0.570161
G1 F2048.399
G1 X168.184 Y158.16 E.00608
; LINE_WIDTH: 0.541545
G1 F2165.96
G2 X167.738 Y158.17 I-.185 J1.697 E.01854
; LINE_WIDTH: 0.583375
G1 F1998.316
G1 X167.67 Y158.183 E.00314
; LINE_WIDTH: 0.610152
G1 F1903.984
G1 X167.601 Y158.196 E.00329
; LINE_WIDTH: 0.640964
G1 F1805.888
G1 X167.533 Y158.214 E.00349
; LINE_WIDTH: 0.653481
G1 F1768.865
G3 X167.489 Y158.22 I-.026 J-.027 E.00241
G1 X166.773 Y158.029 E.03765
M204 S10000
G1 X166.247 Y158.306 F60000
; LINE_WIDTH: 0.35856
G1 F3421.625
M204 S8000
G1 X165.964 Y158.464 E.00851
G1 X165.958 Y158.489 E.00067
; LINE_WIDTH: 0.33136
G1 F3744.281
G1 X165.942 Y158.574 E.00209
; LINE_WIDTH: 0.294578
G1 F4291.551
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.243873
G1 F5374.4
G2 X165.912 Y159.243 I2.461 J.325 E.00944
; LINE_WIDTH: 0.268856
G1 F4780.128
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308636
G1 F4064.497
G2 X166.014 Y159.807 I5.602 J-.794 E.01074
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.250572
G1 F5201.007
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.28839
G1 F4399.724
G1 X165.977 Y159.497 E.00151
; LINE_WIDTH: 0.314585
G1 F3975.486
G1 X165.956 Y159.497 E.00046
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.257966
G1 F5022.192
G2 X165.903 Y159.868 I6.894 J.846 E.00374
; LINE_WIDTH: 0.23791
G1 F5538.751
G2 X165.912 Y160.243 I3.137 J.109 E.0061
; LINE_WIDTH: 0.26888
G1 F4779.625
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.30865
G1 F4064.28
G2 X166.014 Y160.807 I5.617 J-.797 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.250741
G1 F5196.782
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.288574
G1 F4396.427
G1 X165.977 Y160.496 E.00151
; LINE_WIDTH: 0.314579
G1 F3975.571
G1 X165.956 Y160.497 E.00046
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.257957
G1 F5022.401
G2 X165.903 Y160.868 I6.932 J.849 E.00374
; LINE_WIDTH: 0.237909
G1 F5538.794
G2 X165.912 Y161.243 I3.136 J.109 E.00609
; LINE_WIDTH: 0.268856
G1 F4780.128
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307691
G1 F4079.009
G2 X165.992 Y161.694 I4.266 J-.594 E.00818
M204 S10000
G1 X166.766 Y161.969 F60000
; LINE_WIDTH: 0.656515
G1 F1760.119
M204 S8000
G2 X168.07 Y161.601 I-3.746 J-15.784 E.06916
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1760.119
G1 X167.469 Y161.786 E-.88185
G1 X166.766 Y161.969 E-1.01815
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 9/25
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2 I.251 J1.191 P1  F60000
G1 X174.715 Y160.292 Z2
G1 Z1.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.288 J-.292 E.02921
G1 X175.041 Y159.591 E.00239
G3 X174.761 Y160.331 I-.038 J.409 E.04734
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.21611
M73 P55 R16
G1 X174.59 Y160.017 E-.13174
G1 X174.607 Y159.88 E-.13193
G1 X174.694 Y159.726 E-.16793
G1 X174.831 Y159.626 E-.16083
G1 X174.965 Y159.591 E-.13192
G1 X175.041 Y159.591 E-.07248
G1 X175.14 Y159.614 E-.09655
G1 X175.284 Y159.703 E-.1609
G1 X175.367 Y159.815 E-.13191
G1 X175.41 Y159.986 E-.1678
G1 X175.381 Y160.153 E-.16103
G1 X175.308 Y160.271 E-.13181
G1 X175.277 Y160.294 E-.03705
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.715 Y160.292 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.288 J-.292 E.02921
G1 X174.041 Y159.591 E.00239
G3 X173.761 Y160.331 I-.038 J.409 E.04734
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.21611
G1 X173.59 Y160.017 E-.13174
G1 X173.607 Y159.88 E-.13193
G1 X173.694 Y159.726 E-.16793
G1 X173.831 Y159.626 E-.16083
G1 X173.965 Y159.591 E-.13192
G1 X174.041 Y159.591 E-.07248
G1 X174.14 Y159.614 E-.09655
G1 X174.284 Y159.703 E-.1609
G1 X174.367 Y159.815 E-.13191
G1 X174.41 Y159.986 E-.1678
G1 X174.381 Y160.153 E-.16103
G1 X174.308 Y160.271 E-.13181
G1 X174.277 Y160.294 E-.03705
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.163 J-.377 E.04446
G1 X174.041 Y158.591 E.00239
G3 X174.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 9
M204 S10000
G1 X175.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.163 J-.377 E.04446
G1 X175.041 Y158.591 E.00239
G3 X175.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 10
M204 S10000
G1 X176.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.163 J-.377 E.04446
G1 X176.041 Y158.591 E.00239
G3 X176.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.41 J-.018 E.01958
G1 X176.041 Y159.591 E.00239
G3 X175.6 Y160.077 I-.038 J.409 E.05697
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18756
G1 X175.694 Y159.726 E-.16793
G1 X175.831 Y159.626 E-.16083
G1 X175.965 Y159.591 E-.13192
G1 X176.041 Y159.591 E-.07248
G1 X176.14 Y159.614 E-.09655
G1 X176.284 Y159.703 E-.1609
G1 X176.367 Y159.815 E-.13191
G1 X176.41 Y159.986 E-.1678
G1 X176.381 Y160.153 E-.16102
G1 X176.308 Y160.271 E-.13181
G1 X176.166 Y160.376 E-.16796
G1 X176 Y160.411 E-.16091
G1 X176 Y160.411 E-.00042
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.622 Y160.152 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.381 J-.152 E.02391
G1 X177.041 Y159.591 E.00239
G3 X176.649 Y160.206 I-.038 J.409 E.05264
; COOLING_NODE: 14
M204 S10000
G1 X177.622 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.381 J-.152 E.02391
G1 X178.041 Y159.591 E.00239
G3 X177.649 Y160.206 I-.038 J.409 E.05264
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18737
G1 X177.607 Y159.88 E-.13198
G1 X177.694 Y159.726 E-.16789
G1 X177.831 Y159.626 E-.16082
G1 X177.965 Y159.591 E-.13192
G1 X178.041 Y159.591 E-.07248
G1 X178.14 Y159.614 E-.09655
G1 X178.284 Y159.703 E-.1609
G1 X178.367 Y159.815 E-.13191
G1 X178.41 Y159.986 E-.1678
G1 X178.381 Y160.153 E-.16102
G1 X178.308 Y160.271 E-.13181
G1 X178.166 Y160.376 E-.16796
G1 X178.135 Y160.382 E-.02957
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.369 Y159.814 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.366 J.185 E.06546
G1 X179.041 Y159.591 E.00239
G3 X179.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 16
M204 S10000
G1 X179.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.163 J-.377 E.04446
G1 X179.041 Y158.591 E.00239
G3 X179.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X179 Y159.411 E-.21634
G1 X178.863 Y159.387 E-.13189
G1 X178.713 Y159.294 E-.16791
G1 X178.619 Y159.153 E-.16093
G1 X178.59 Y159.017 E-.1318
G1 X178.607 Y158.88 E-.13198
G1 X178.694 Y158.726 E-.16789
G1 X178.831 Y158.626 E-.16084
G1 X178.965 Y158.591 E-.13189
G1 X179.041 Y158.591 E-.07249
G1 X179.14 Y158.614 E-.09655
G1 X179.284 Y158.703 E-.1609
G1 X179.367 Y158.815 E-.13191
G1 X179.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.163 J-.377 E.04446
G1 X178.041 Y158.591 E.00239
G3 X178.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.21634
G1 X177.863 Y159.387 E-.13189
G1 X177.713 Y159.294 E-.16791
G1 X177.619 Y159.153 E-.16093
G1 X177.59 Y159.017 E-.1318
G1 X177.607 Y158.88 E-.13198
G1 X177.694 Y158.726 E-.16789
G1 X177.831 Y158.626 E-.16082
G1 X177.965 Y158.591 E-.13192
G1 X178.041 Y158.591 E-.07248
G1 X178.14 Y158.614 E-.09655
G1 X178.284 Y158.703 E-.1609
G1 X178.367 Y158.815 E-.13191
G1 X178.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.163 J-.377 E.04446
G1 X177.041 Y158.591 E.00239
G3 X177.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X177 Y159.411 E-.21634
G1 X176.863 Y159.387 E-.13189
G1 X176.713 Y159.294 E-.16791
G1 X176.619 Y159.153 E-.16093
G1 X176.59 Y159.017 E-.1318
G1 X176.607 Y158.88 E-.13198
G1 X176.694 Y158.726 E-.16789
G1 X176.831 Y158.626 E-.16082
G1 X176.965 Y158.591 E-.13192
G1 X177.041 Y158.591 E-.07248
G1 X177.14 Y158.614 E-.09655
G1 X177.284 Y158.703 E-.1609
G1 X177.367 Y158.815 E-.13191
G1 X177.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.166 Y161.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.163 J-.377 E.04446
G1 X174.041 Y160.591 E.00239
G3 X174.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 34
M204 S10000
G1 X175.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.163 J-.377 E.04446
G1 X175.041 Y160.591 E.00239
G3 X175.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 33
M204 S10000
G1 X176.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.163 J-.377 E.04446
G1 X176.041 Y160.591 E.00239
G3 X176.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 32
M204 S10000
G1 X177.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.163 J-.377 E.04446
G1 X177.041 Y160.591 E.00239
G3 X177.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 31
M204 S10000
G1 X178.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.163 J-.377 E.04446
G1 X178.041 Y160.591 E.00239
G3 X178.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 30
M204 S10000
G1 X179.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.163 J-.377 E.04446
G1 X179.041 Y160.591 E.00239
G3 X179.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.21634
G1 X178.863 Y161.387 E-.1319
G1 X178.713 Y161.294 E-.16791
G1 X178.619 Y161.153 E-.16093
G1 X178.59 Y161.017 E-.1318
G1 X178.607 Y160.88 E-.13198
G1 X178.694 Y160.726 E-.16789
G1 X178.831 Y160.626 E-.16084
G1 X178.965 Y160.591 E-.13189
G1 X179.041 Y160.591 E-.07249
G1 X179.14 Y160.614 E-.09655
G1 X179.284 Y160.703 E-.1609
G1 X179.367 Y160.815 E-.13191
G1 X179.376 Y160.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.309 Y161.272 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.306 J-.273 E.05006
G1 X180.041 Y160.591 E.00239
G3 X180.346 Y161.225 I-.038 J.409 E.02649
; COOLING_NODE: 28
M204 S10000
G1 X181.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.163 J-.377 E.04446
G1 X181.041 Y160.591 E.00239
G3 X181.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 27
M204 S10000
G1 X182.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.163 J-.377 E.04446
G1 X182.041 Y160.591 E.00239
G3 X182.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.21634
G1 X181.863 Y161.387 E-.1319
G1 X181.713 Y161.294 E-.16791
G1 X181.619 Y161.153 E-.16093
G1 X181.59 Y161.017 E-.1318
G1 X181.607 Y160.88 E-.13198
G1 X181.694 Y160.726 E-.16789
G1 X181.831 Y160.626 E-.16084
G1 X181.965 Y160.591 E-.13189
G1 X182.041 Y160.591 E-.07249
G1 X182.14 Y160.614 E-.09655
G1 X182.284 Y160.703 E-.1609
G1 X182.367 Y160.815 E-.13191
G1 X182.376 Y160.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.309 Y161.272 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.306 J-.273 E.05006
G1 X183.041 Y160.591 E.00239
G3 X183.346 Y161.225 I-.038 J.409 E.02649
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.166 Y161.376 E-.22353
G1 X183 Y161.411 E-.16089
G1 X182.863 Y161.387 E-.1319
G1 X182.713 Y161.294 E-.16791
G1 X182.619 Y161.153 E-.16093
G1 X182.59 Y161.017 E-.1318
G1 X182.607 Y160.88 E-.13193
G1 X182.694 Y160.726 E-.16793
G1 X182.831 Y160.626 E-.16085
G1 X182.965 Y160.591 E-.13189
G1 X183.041 Y160.591 E-.07249
G1 X183.14 Y160.614 E-.09655
G1 X183.284 Y160.703 E-.1609
G1 X183.285 Y160.704 E-.0005
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z2.2 F60000
G1 Z1.8
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.406 Y161.898 E.03357
G1 X183.357 Y161.718 E.00631
G2 X183.63 Y160.495 I-.365 J-.723 E.04848
G2 X183.63 Y159.495 I-.649 J-.5 E.03641
G2 X183.365 Y158.265 I-.676 J-.498 E.04817
G1 X183.423 Y158.102 E.00585
G1 X184.398 Y158.102 E.03301
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 25
; WIPE_START
G1 X183.406 Y161.898 E-.94378
G1 X183.357 Y161.718 E-.17722
G1 X183.492 Y161.639 E-.14821
G1 X183.604 Y161.531 E-.14759
G1 X183.746 Y161.3 E-.25801
G1 X183.791 Y161.155 E-.14434
G1 X183.797 Y161.07 E-.08086
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.309 Y159.272 Z2.2 F60000
G1 Z1.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.306 J-.273 E.05006
G1 X183.041 Y158.591 E.00239
G3 X183.346 Y159.225 I-.038 J.409 E.02649
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.166 Y159.376 E-.22352
G1 X183 Y159.411 E-.16089
G1 X182.863 Y159.387 E-.13189
G1 X182.713 Y159.294 E-.16791
G1 X182.619 Y159.153 E-.16093
G1 X182.59 Y159.017 E-.1318
G1 X182.607 Y158.88 E-.13193
G1 X182.694 Y158.726 E-.16793
G1 X182.831 Y158.626 E-.16085
G1 X182.965 Y158.591 E-.13189
G1 X183.041 Y158.591 E-.07249
G1 X183.14 Y158.614 E-.09655
G1 X183.284 Y158.703 E-.1609
G1 X183.285 Y158.704 E-.00051
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.622 Y160.152 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.381 J-.152 E.02391
G1 X183.041 Y159.591 E.00239
G3 X182.649 Y160.206 I-.038 J.409 E.05264
; COOLING_NODE: 23
M204 S10000
G1 X182.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.366 J.185 E.06546
G1 X182.041 Y159.591 E.00239
G3 X182.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 20
M204 S10000
G1 X181.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.366 J.185 E.06546
G1 X181.041 Y159.591 E.00239
G3 X181.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.41 Y159.986 E-.22349
G1 X181.381 Y160.153 E-.16099
G1 X181.308 Y160.271 E-.13191
G1 X181.166 Y160.376 E-.1679
G1 X181 Y160.411 E-.16089
G1 X180.863 Y160.387 E-.13189
G1 X180.713 Y160.294 E-.16789
G1 X180.619 Y160.153 E-.16101
G1 X180.59 Y160.017 E-.13174
G1 X180.607 Y159.88 E-.13198
G1 X180.694 Y159.726 E-.16789
G1 X180.831 Y159.626 E-.16084
G1 X180.832 Y159.625 E-.00158
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.166 Y160.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.163 J-.377 E.04446
G1 X180.041 Y159.591 E.00239
M73 P55 R15
G3 X180.219 Y160.348 I-.038 J.409 E.0321
; COOLING_NODE: 18
M204 S10000
G1 X180.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.163 J-.377 E.04446
G1 X180.041 Y158.591 E.00239
G3 X180.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 21
M204 S10000
G1 X181.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.163 J-.377 E.04446
G1 X181.041 Y158.591 E.00239
G3 X181.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 22
M204 S10000
G1 X182.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.163 J-.377 E.04446
G1 X182.041 Y158.591 E.00239
G3 X182.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X182 Y159.411 E-.21634
G1 X181.863 Y159.387 E-.13189
G1 X181.713 Y159.294 E-.16791
G1 X181.619 Y159.153 E-.16093
G1 X181.59 Y159.017 E-.1318
G1 X181.607 Y158.88 E-.13198
G1 X181.694 Y158.726 E-.16789
G1 X181.831 Y158.626 E-.16084
G1 X181.965 Y158.591 E-.13189
G1 X182.041 Y158.591 E-.07249
G1 X182.14 Y158.614 E-.09655
G1 X182.284 Y158.703 E-.1609
G1 X182.367 Y158.815 E-.13191
G1 X182.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.847 Y160.102 Z2.2 F60000
G1 X167.166 Y161.376 Z2.2
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.163 J-.377 E.04446
G1 X167.041 Y160.591 E.00239
G3 X167.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 50
M204 S10000
G1 X168.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.163 J-.377 E.04446
G1 X168.041 Y160.591 E.00239
G3 X168.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 40
M204 S10000
G1 X169.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.163 J-.377 E.04446
G1 X169.041 Y160.591 E.00239
G3 X169.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 39
M204 S10000
G1 X170.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.163 J-.377 E.04446
G1 X170.041 Y160.591 E.00239
G3 X170.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.21637
G1 X169.863 Y161.387 E-.13187
G1 X169.713 Y161.294 E-.16793
G1 X169.619 Y161.153 E-.16093
G1 X169.59 Y161.017 E-.1318
G1 X169.607 Y160.88 E-.13198
G1 X169.694 Y160.726 E-.16787
G1 X169.831 Y160.626 E-.16091
G1 X169.965 Y160.591 E-.13184
G1 X170.041 Y160.591 E-.07249
G1 X170.14 Y160.614 E-.09655
G1 X170.284 Y160.703 E-.1609
G1 X170.367 Y160.815 E-.13191
G1 X170.376 Y160.852 E-.03666
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.309 Y161.272 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.306 J-.273 E.05006
G1 X171.041 Y160.591 E.00239
G3 X171.346 Y161.225 I-.038 J.409 E.02649
; COOLING_NODE: 37
M204 S10000
G1 X172.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.163 J-.377 E.04446
G1 X172.041 Y160.591 E.00239
G3 X172.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 36
M204 S10000
G1 X173.166 Y161.376 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.163 J-.377 E.04446
G1 X173.041 Y160.591 E.00239
G3 X173.219 Y161.348 I-.038 J.409 E.0321
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X173 Y161.411 E-.21635
G1 X172.863 Y161.387 E-.13189
G1 X172.713 Y161.294 E-.16791
G1 X172.619 Y161.153 E-.16093
G1 X172.59 Y161.017 E-.1318
G1 X172.607 Y160.88 E-.13198
G1 X172.694 Y160.726 E-.16789
G1 X172.831 Y160.626 E-.16084
G1 X172.965 Y160.591 E-.13189
G1 X173.041 Y160.591 E-.07249
G1 X173.14 Y160.614 E-.09655
G1 X173.284 Y160.703 E-.1609
G1 X173.367 Y160.815 E-.13191
G1 X173.376 Y160.852 E-.03666
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.369 Y159.814 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.366 J.185 E.06546
G1 X173.041 Y159.591 E.00239
G3 X173.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 3
M204 S10000
G1 X173.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.163 J-.377 E.04446
G1 X173.041 Y158.591 E.00239
G3 X173.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173 Y159.411 E-.21635
G1 X172.863 Y159.387 E-.13189
G1 X172.713 Y159.294 E-.16791
G1 X172.619 Y159.153 E-.16093
G1 X172.59 Y159.017 E-.1318
G1 X172.607 Y158.88 E-.13198
G1 X172.694 Y158.726 E-.16789
G1 X172.831 Y158.626 E-.16084
G1 X172.965 Y158.591 E-.13189
G1 X173.041 Y158.591 E-.07249
G1 X173.14 Y158.614 E-.09655
G1 X173.284 Y158.703 E-.1609
G1 X173.367 Y158.815 E-.13191
G1 X173.376 Y158.852 E-.03667
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X172.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.163 J-.377 E.04446
G1 X172.041 Y158.591 E.00239
G3 X172.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 5
M204 S10000
G1 X172.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.366 J.185 E.06546
G1 X172.041 Y159.591 E.00239
G3 X172.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 6
M204 S10000
G1 X171.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.366 J.185 E.06546
G1 X171.041 Y159.591 E.00239
G3 X171.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 7
M204 S10000
G1 X171.309 Y159.272 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.306 J-.273 E.05006
G1 X171.041 Y158.591 E.00239
G3 X171.346 Y159.225 I-.038 J.409 E.02649
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X171.166 Y159.376 E-.22353
G1 X171 Y159.411 E-.16089
G1 X170.863 Y159.387 E-.13189
G1 X170.713 Y159.294 E-.16791
G1 X170.619 Y159.153 E-.16093
G1 X170.59 Y159.017 E-.1318
G1 X170.607 Y158.88 E-.13198
G1 X170.694 Y158.726 E-.16787
G1 X170.831 Y158.626 E-.16091
G1 X170.965 Y158.591 E-.13184
G1 X171.041 Y158.591 E-.07249
G1 X171.14 Y158.614 E-.09655
G1 X171.284 Y158.703 E-.1609
G1 X171.285 Y158.704 E-.00051
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.163 J-.377 E.04446
G1 X170.041 Y158.591 E.00239
G3 X170.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170 Y159.411 E-.21637
G1 X169.863 Y159.387 E-.13186
G1 X169.713 Y159.294 E-.16793
G1 X169.619 Y159.153 E-.16093
G1 X169.59 Y159.017 E-.1318
G1 X169.607 Y158.88 E-.13198
G1 X169.694 Y158.726 E-.16787
G1 X169.831 Y158.626 E-.16091
G1 X169.965 Y158.591 E-.13184
G1 X170.041 Y158.591 E-.07249
G1 X170.14 Y158.614 E-.09655
G1 X170.284 Y158.703 E-.1609
G1 X170.367 Y158.815 E-.13191
G1 X170.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.163 J-.377 E.04446
G1 X169.041 Y158.591 E.00239
G3 X169.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.21635
G1 X168.863 Y159.387 E-.13189
G1 X168.713 Y159.294 E-.16791
G1 X168.619 Y159.153 E-.16093
G1 X168.59 Y159.017 E-.1318
G1 X168.607 Y158.88 E-.13193
G1 X168.694 Y158.726 E-.16793
G1 X168.831 Y158.626 E-.16083
G1 X168.965 Y158.591 E-.13192
G1 X169.041 Y158.591 E-.07248
G1 X169.14 Y158.614 E-.09655
G1 X169.284 Y158.703 E-.1609
G1 X169.367 Y158.815 E-.13191
G1 X169.376 Y158.852 E-.03667
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.622 Y160.152 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.381 J-.152 E.02391
G1 X169.041 Y159.591 E.00239
G3 X168.649 Y160.206 I-.038 J.409 E.05264
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18738
G1 X168.607 Y159.88 E-.13193
G1 X168.694 Y159.726 E-.16793
G1 X168.831 Y159.626 E-.16083
G1 X168.965 Y159.591 E-.13192
G1 X169.041 Y159.591 E-.07248
G1 X169.14 Y159.614 E-.09655
G1 X169.284 Y159.703 E-.1609
G1 X169.367 Y159.815 E-.13191
G1 X169.41 Y159.986 E-.1678
G1 X169.381 Y160.153 E-.16103
G1 X169.308 Y160.271 E-.13181
G1 X169.166 Y160.376 E-.16796
G1 X169.135 Y160.382 E-.02957
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.369 Y159.814 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.366 J.185 E.06546
G1 X170.041 Y159.591 E.00239
G3 X170.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X170.41 Y159.986 E-.22348
G1 X170.381 Y160.153 E-.16099
G1 X170.308 Y160.271 E-.13191
G1 X170.166 Y160.376 E-.1679
G1 X170 Y160.411 E-.16091
G1 X169.863 Y160.387 E-.13186
G1 X169.713 Y160.294 E-.1679
G1 X169.619 Y160.153 E-.16101
G1 X169.59 Y160.017 E-.13174
G1 X169.607 Y159.88 E-.13198
G1 X169.694 Y159.726 E-.16787
G1 X169.831 Y159.626 E-.16091
G1 X169.832 Y159.625 E-.00154
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.166 Y159.376 Z2.2 F60000
G1 Z1.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.163 J-.377 E.04446
G1 X168.041 Y158.591 E.00239
G3 X168.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 46
M204 S10000
G1 X168.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.366 J.185 E.06546
G1 X168.041 Y159.591 E.00239
G3 X168.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 47
M204 S10000
G1 X167.369 Y159.814 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.366 J.185 E.06546
G1 X167.041 Y159.591 E.00239
G3 X167.338 Y159.762 I-.038 J.409 E.01109
; COOLING_NODE: 48
M204 S10000
G1 X167.166 Y159.376 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.163 J-.377 E.04446
G1 X167.041 Y158.591 E.00239
G3 X167.219 Y159.348 I-.038 J.409 E.0321
; COOLING_NODE: 48
M204 S10000
G1 X166.374 Y159.499 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.374 Y160.499 I.665 J.5 E.03632
G2 X166.64 Y161.732 I.669 J.501 E.04838
G1 X166.584 Y161.898 E.00592
G1 X165.602 Y161.898 E.03323
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.338 Y159.451 I.355 J.713 E.04623
; COOLING_NODE: 51
; WIPE_START
G1 X166.289 Y159.62 E-.1675
G1 X166.231 Y159.764 E-.14738
G1 X166.197 Y160.034 E-.25841
G1 X166.254 Y160.3 E-.25795
G1 X166.374 Y160.499 E-.22151
G1 X166.289 Y160.62 E-.14092
G1 X166.231 Y160.764 E-.14736
G1 X166.202 Y160.898 E-.12972
G1 X166.214 Y161.169 E-.25813
G1 X166.254 Y161.3 E-.12965
G1 X166.273 Y161.339 E-.04147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.896 Y161.73 Z2.2 F60000
G1 X184.79 Y162.29 Z2.2
G1 Z1.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311844
G1 F4016.007
M204 S8000
G1 X184.062 Y161.415 E.00636
; LINE_WIDTH: 0.293042
G1 F4317.905
G1 X184.077 Y161.319 E.00202
; LINE_WIDTH: 0.261167
G1 F4948.527
G2 X184.093 Y161.201 I-1.062 J-.208 E.00217
; LINE_WIDTH: 0.242795
G1 F5403.386
G2 X184.08 Y160.685 I-3.215 J-.176 E.00857
; LINE_WIDTH: 0.290062
G1 F4369.959
G1 X184.062 Y160.591 E.00197
; LINE_WIDTH: 0.326425
G1 F3809.463
G1 X184.044 Y160.497 E.00226
G1 X184.024 Y160.496 E.00047
; LINE_WIDTH: 0.28916
G1 F4385.974
G1 X183.949 Y160.496 E.00152
; LINE_WIDTH: 0.250914
G1 F5192.477
G1 X183.875 Y160.496 E.00128
M204 S10000
G1 X183.986 Y160.809 F60000
; LINE_WIDTH: 0.311821
G1 F4016.358
M204 S8000
G1 X184.062 Y160.415 E.00897
; LINE_WIDTH: 0.293032
G1 F4318.066
G1 X184.077 Y160.319 E.00202
; LINE_WIDTH: 0.261175
G1 F4948.348
G2 X184.093 Y160.201 I-1.072 J-.21 E.00217
; LINE_WIDTH: 0.2428
G1 F5403.263
G2 X184.08 Y159.685 I-3.216 J-.176 E.00857
; LINE_WIDTH: 0.290062
G1 F4369.959
G1 X184.062 Y159.591 E.00197
; LINE_WIDTH: 0.326411
G1 F3809.644
G1 X184.044 Y159.497 E.00226
G1 X184.024 Y159.496 E.00047
; LINE_WIDTH: 0.289072
G1 F4387.534
G1 X183.949 Y159.496 E.00152
; LINE_WIDTH: 0.250904
G1 F5192.723
G1 X183.875 Y159.496 E.00128
M204 S10000
G1 X183.986 Y159.808 F60000
; LINE_WIDTH: 0.311812
G1 F4016.491
M204 S8000
G1 X184.062 Y159.415 E.00896
; LINE_WIDTH: 0.293027
G1 F4318.152
G1 X184.077 Y159.319 E.00202
; LINE_WIDTH: 0.261163
G1 F4948.628
G2 X184.093 Y159.201 I-1.064 J-.208 E.00217
; LINE_WIDTH: 0.242795
G1 F5403.386
G2 X184.08 Y158.685 I-3.216 J-.176 E.00857
; LINE_WIDTH: 0.290857
G1 F4355.947
G1 X184.061 Y158.587 E.00206
; LINE_WIDTH: 0.351846
G1 F3495.982
G2 X184.036 Y158.464 I-1.524 J.243 E.00323
G1 X183.756 Y158.306 E.00827
; WIPE_START
G1 X184.036 Y158.464 E-1.36602
G1 X184.061 Y158.587 E-.53398
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.999 Y161.607 Z2.2 F60000
G1 Z1.8
G1 E2 F600
; LINE_WIDTH: 0.666224
G1 F1732.704
M204 S8000
G2 X183.225 Y161.979 I3.964 J-10.882 E.06642
M204 S10000
G1 X183.135 Y161.647 F60000
; LINE_WIDTH: 0.607259
G1 F1913.743
M204 S8000
G1 X182.329 Y161.819 E.03867
; LINE_WIDTH: 0.572198
G1 F2040.515
G1 X182.189 Y161.84 E.0062
; LINE_WIDTH: 0.541994
G1 F2164.008
G3 X181.731 Y161.829 I-.184 J-1.9 E.01908
; LINE_WIDTH: 0.580465
G1 F2009.134
G1 X181.685 Y161.821 E.00207
; WIPE_START
G1 X181.731 Y161.829 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.366 Y159.825 Z2.2 F60000
G1 X168.329 Y158.181 Z2.2
G1 Z1.8
G1 E2 F600
; LINE_WIDTH: 0.583106
G1 F1999.314
M204 S8000
G1 X168.268 Y158.171 E.00279
; LINE_WIDTH: 0.54378
G1 F2156.294
G2 X167.76 Y158.166 I-.269 J1.845 E.02121
; LINE_WIDTH: 0.581533
G1 F2005.151
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.60965
G1 F1905.671
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.228 Y158.306 F60000
; LINE_WIDTH: 0.33816
G1 F3658.051
M204 S8000
G1 X165.963 Y158.464 E.00757
; LINE_WIDTH: 0.338565
G1 F3653.034
G1 X165.944 Y158.562 E.00246
; LINE_WIDTH: 0.296933
G1 F4251.765
G1 X165.922 Y158.68 E.00254
; LINE_WIDTH: 0.243866
G1 F5374.588
G2 X165.912 Y159.244 I2.461 J.325 E.00944
; LINE_WIDTH: 0.268908
G1 F4779.03
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308699
G1 F4063.535
G2 X166.014 Y159.807 I5.646 J-.801 E.01074
M204 S10000
G1 X166.013 Y160.204 F60000
; LINE_WIDTH: 0.328888
G1 F3776.648
M204 S8000
G1 X165.969 Y160.432 E.00552
; LINE_WIDTH: 0.295902
G1 F4269.09
G2 X165.922 Y160.68 I2.922 J.683 E.00531
; LINE_WIDTH: 0.243866
G1 F5374.592
G2 X165.912 Y161.244 I2.461 J.325 E.00944
; LINE_WIDTH: 0.268898
G1 F4779.228
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.30775
G1 F4078.095
G2 X165.992 Y161.694 I4.275 J-.596 E.00818
M204 S10000
G1 X166.014 Y160.807 F60000
; LINE_WIDTH: 0.308604
G1 F4064.979
M204 S8000
G3 X165.925 Y160.329 I5.617 J-1.289 E.01074
; LINE_WIDTH: 0.268906
G1 F4779.056
G1 X165.912 Y160.244 E.00162
; LINE_WIDTH: 0.243869
G1 F5374.51
G3 X165.922 Y159.68 I2.471 J-.239 E.00944
; LINE_WIDTH: 0.295899
G1 F4269.14
G3 X165.969 Y159.432 I2.967 J.435 E.00531
; LINE_WIDTH: 0.328879
G1 F3776.766
G1 X166.013 Y159.204 E.00552
; WIPE_START
M204 S8000
G1 X165.969 Y159.432 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z2.2 I-1.173 J.326 P1  F60000
G1 X199.428 Y279.944 Z2.2
G1 Z1.8
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y279.944  E1.2162 F2363
G1  Y270.944  E0.3421
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #10
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z2.2 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z1.8
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M73 P56 R15
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
G1  X198.678  F366
G1  Y269.319 
M73 P57 R15
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S176 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z2.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E12

;deretract


M73 P58 R14
;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z4.8 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y264.712 F60000
G1 Z1.8
G17
G3 Z2.2 I1.217 J0 P1
G1 X204.318 Y247.518 Z2.2
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z1.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y254.194  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F2473
G1  Y254.944  E0.0285
G1  X167.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X199.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X167.428  E1.2162
G1  Y257.194  E0.0285
G1  X199.428  E1.2162
G1  Y257.944  E0.0285
G1  X167.428  E1.2162
G1  Y258.694  E0.0285
G1  X199.428  E1.2162
G1  Y259.444  E0.0285
G1  X167.428  E1.2162
G1  Y260.194  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
M73 P59 R14
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #10
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X199.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X199.928 Y280.444  
M204 S8000
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S10000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S8000
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F5400
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
; WIPE_TOWER_END

; WIPE_START
G1 F3776.766
M204 S8000
G1 X199.928 Y280.444 E0
G1 X199.928 Y280.444 E0
G1 X200.578 Y279.685 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3171
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 9 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z2.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer9 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 10/25
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3067
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 10 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z2.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer10 end: 224,265
M625
M204 S10000
G1 X199.428 Y279.944
G1 Z2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X201.640 Y278.401  
M204 S8000
G3  X197.871 Y282.511   I-16.869 J-11.684 E0.2126 F5400
G3  X194.841 Y281.395   I-0.631 J-2.959 E0.1295
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.112 Y276.190   I3.543 J-0.156 E0.1075
; WIPE_TOWER_END
G1  X199.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #11
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2.4 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S84 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E11

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z5 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y277.194 F60000
G1 Z2

; filament start gcode
G1 X199.428 Y277.194 Z2.4
G1 Z2
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X200.928 
G1  X199.428  F240
G1  X199.928  F600
G1  Y277.694 
G1  X198.928 
G1  Y276.694 
G1  X200.428 
G1  Y278.194 
G1  X198.428 
G1  Y276.194 
G1  X196.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X199.428  E1.2162 F2025
M73 P60 R14
G1  Y275.694  E0.0285
G1  X167.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X199.428  E1.2162
G1  Y274.194  E0.0285
G1  X167.428  E1.2162
G1  Y273.444  E0.0285
G1  X199.428  E1.2162
G1  Y272.694  E0.0285
G1  X167.428  E1.2162
G1  Y271.944  E0.0285
G1  X199.428  E1.2162
G1  Y271.194  E0.0285
G1  X167.428  E1.2162
G1  Y270.444  E0.0285
G1  X199.428  E1.2162
G1  Y269.694  E0.0285
G1  X167.428  E1.2162
G1  Y268.944  E0.0285
G1  X199.428  E1.2162
G1  Y268.194  E0.0285
G1  X167.428  E1.2162
G1  Y267.444  E0.0285
G1  X199.428  E1.2162
G1  Y266.694  E0.0285
G1  X167.428  E1.2162
G1  Y265.944  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162 F2363
G1  Y277.944  E0.0760
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #11
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.745 Y160.315
G1 Z2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03044
G1 X175.035 Y159.591 E.00219
G3 X174.795 Y160.349 I-.035 J.406 E.0458
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01962
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05662
; COOLING_NODE: 10
M204 S10000
G1 X176.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.167 J-.374 E.0447
G1 X176.035 Y158.591 E.00219
G3 X176.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 11
M204 S10000
G1 X177.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.167 J-.374 E.0447
G1 X177.035 Y158.591 E.00219
G3 X177.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177 Y159.411 E-.21849
G1 X176.863 Y159.387 E-.13184
G1 X176.692 Y159.271 E-.19663
G1 X176.619 Y159.153 E-.13195
G1 X176.59 Y159.017 E-.13184
G1 X176.607 Y158.88 E-.13194
G1 X176.693 Y158.728 E-.16556
G1 X176.831 Y158.626 E-.16325
G1 X176.965 Y158.591 E-.13189
G1 X177.035 Y158.591 E-.06622
G1 X177.169 Y158.626 E-.13194
G1 X177.284 Y158.703 E-.13184
G1 X177.367 Y158.815 E-.132
G1 X177.376 Y158.85 E-.03463
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.637 Y160.182 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.363 J-.185 E.025
G1 X177.035 Y159.591 E.00219
G3 X176.668 Y160.233 I-.035 J.406 E.05124
; COOLING_NODE: 14
M204 S10000
G1 X177.637 Y160.182 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.363 J-.185 E.025
G1 X178.035 Y159.591 E.00219
G3 X177.668 Y160.233 I-.035 J.406 E.05124
; COOLING_NODE: 17
M204 S10000
G1 X178.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.167 J-.374 E.0447
G1 X178.035 Y158.591 E.00219
G3 X178.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X178 Y159.411 E-.21848
G1 X177.863 Y159.387 E-.13184
G1 X177.692 Y159.271 E-.19663
G1 X177.619 Y159.153 E-.13195
G1 X177.59 Y159.017 E-.13184
G1 X177.607 Y158.88 E-.13194
G1 X177.693 Y158.728 E-.16556
G1 X177.831 Y158.626 E-.16325
G1 X177.965 Y158.591 E-.13189
G1 X178.035 Y158.591 E-.06622
G1 X178.169 Y158.626 E-.13194
G1 X178.284 Y158.703 E-.13184
G1 X178.367 Y158.815 E-.132
G1 X178.376 Y158.851 E-.03464
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X180.167 Y159.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.167 J-.374 E.0447
G1 X180.035 Y158.591 E.00219
M73 P60 R13
G3 X180.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X180 Y159.411 E-.21847
G1 X179.863 Y159.387 E-.13185
G1 X179.692 Y159.271 E-.19663
G1 X179.619 Y159.153 E-.13195
G1 X179.59 Y159.017 E-.13184
G1 X179.607 Y158.88 E-.13194
G1 X179.693 Y158.728 E-.16555
G1 X179.831 Y158.626 E-.16325
G1 X179.965 Y158.591 E-.13189
G1 X180.035 Y158.591 E-.06622
G1 X180.169 Y158.626 E-.13194
G1 X180.284 Y158.703 E-.13184
G1 X180.367 Y158.815 E-.132
G1 X180.376 Y158.851 E-.03464
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.167 Y159.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.167 J-.374 E.0447
G1 X179.035 Y158.591 E.00218
G3 X179.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 15
M204 S10000
G1 X179.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.365 J.181 E.06502
G1 X179.035 Y159.591 E.00218
G3 X179.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X179.41 Y159.984 E-.22064
G1 X179.381 Y160.153 E-.16322
G1 X179.308 Y160.271 E-.13204
G1 X179.168 Y160.375 E-.16546
G1 X179 Y160.411 E-.16329
G1 X178.863 Y160.387 E-.13184
G1 X178.742 Y160.32 E-.13198
G1 X178.633 Y160.184 E-.16549
G1 X178.59 Y160.017 E-.1632
G1 X178.607 Y159.88 E-.13193
G1 X178.693 Y159.728 E-.16557
G1 X178.831 Y159.626 E-.16319
G1 X178.833 Y159.625 E-.00215
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.166 Y160.369 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.166 J-.373 E.04441
G1 X180.035 Y159.591 E.00219
G3 X180.219 Y160.341 I-.035 J.406 E.03183
; COOLING_NODE: 29
M204 S10000
G1 X180.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.307 J-.271 E.05019
G1 X180.035 Y160.591 E.00219
G3 X180.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X180.168 Y161.375 E-.22084
G1 X180 Y161.411 E-.16327
G1 X179.863 Y161.387 E-.13185
G1 X179.692 Y161.271 E-.19663
G1 X179.619 Y161.153 E-.13195
G1 X179.59 Y161.017 E-.13184
G1 X179.607 Y160.88 E-.13194
G1 X179.693 Y160.728 E-.16555
G1 X179.831 Y160.626 E-.16325
G1 X179.965 Y160.591 E-.13189
G1 X180.035 Y160.591 E-.06622
G1 X180.169 Y160.626 E-.13193
G1 X180.284 Y160.703 E-.13184
G1 X180.285 Y160.704 E-.00101
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.167 J-.374 E.0447
G1 X179.035 Y160.591 E.00218
G3 X179.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X179 Y161.411 E-.21849
G1 X178.863 Y161.387 E-.13184
G1 X178.692 Y161.271 E-.19663
G1 X178.619 Y161.153 E-.13195
G1 X178.59 Y161.017 E-.13184
G1 X178.607 Y160.88 E-.13194
G1 X178.693 Y160.728 E-.16556
G1 X178.831 Y160.626 E-.16319
G1 X178.965 Y160.591 E-.13199
G1 X179.035 Y160.591 E-.06618
G1 X179.169 Y160.626 E-.13193
G1 X179.284 Y160.703 E-.13184
G1 X179.367 Y160.815 E-.132
G1 X179.376 Y160.85 E-.03463
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.167 J-.374 E.0447
G1 X178.035 Y160.591 E.00219
G3 X178.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178 Y161.411 E-.21849
G1 X177.863 Y161.387 E-.13184
G1 X177.692 Y161.271 E-.19663
G1 X177.619 Y161.153 E-.13195
G1 X177.59 Y161.017 E-.13184
G1 X177.607 Y160.88 E-.13194
G1 X177.693 Y160.728 E-.16556
G1 X177.831 Y160.626 E-.16325
G1 X177.965 Y160.591 E-.13189
G1 X178.035 Y160.591 E-.06622
G1 X178.169 Y160.626 E-.13193
G1 X178.284 Y160.703 E-.13184
G1 X178.367 Y160.815 E-.132
G1 X178.376 Y160.85 E-.03462
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.167 J-.374 E.0447
G1 X177.035 Y160.591 E.00219
M73 P61 R13
G3 X177.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177 Y161.411 E-.21849
G1 X176.863 Y161.387 E-.13184
G1 X176.692 Y161.271 E-.19663
G1 X176.619 Y161.153 E-.13195
G1 X176.59 Y161.017 E-.13184
G1 X176.607 Y160.88 E-.13194
G1 X176.693 Y160.728 E-.16556
G1 X176.831 Y160.626 E-.16325
G1 X176.965 Y160.591 E-.13189
G1 X177.035 Y160.591 E-.06622
G1 X177.169 Y160.626 E-.13193
G1 X177.284 Y160.703 E-.13184
G1 X177.367 Y160.815 E-.132
G1 X177.376 Y160.85 E-.03462
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.167 J-.374 E.0447
G1 X176.035 Y160.591 E.00219
G3 X176.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176 Y161.411 E-.21849
G1 X175.863 Y161.387 E-.13184
G1 X175.692 Y161.271 E-.19663
G1 X175.619 Y161.153 E-.13195
G1 X175.59 Y161.017 E-.13184
G1 X175.607 Y160.88 E-.13196
G1 X175.673 Y160.75 E-.13773
G1 X175.825 Y160.628 E-.18599
G1 X175.965 Y160.591 E-.13733
G1 X176.035 Y160.591 E-.06622
G1 X176.169 Y160.626 E-.13193
G1 X176.284 Y160.703 E-.13184
G1 X176.367 Y160.815 E-.132
G1 X176.376 Y160.85 E-.03426
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.167 J-.374 E.0447
G1 X175.035 Y160.591 E.00219
G3 X175.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175 Y161.411 E-.21848
G1 X174.863 Y161.387 E-.13185
G1 X174.692 Y161.271 E-.19663
G1 X174.619 Y161.153 E-.13195
G1 X174.59 Y161.017 E-.13184
G1 X174.607 Y160.88 E-.13196
G1 X174.673 Y160.75 E-.13773
G1 X174.825 Y160.628 E-.18599
G1 X174.965 Y160.591 E-.13733
G1 X175.035 Y160.591 E-.06622
G1 X175.169 Y160.626 E-.13193
G1 X175.284 Y160.703 E-.13184
G1 X175.367 Y160.815 E-.132
G1 X175.376 Y160.85 E-.03426
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.167 J-.374 E.0447
G1 X174.035 Y160.591 E.00219
G3 X174.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174 Y161.411 E-.21849
G1 X173.863 Y161.387 E-.13185
G1 X173.692 Y161.271 E-.19663
G1 X173.619 Y161.153 E-.13195
G1 X173.59 Y161.017 E-.13184
G1 X173.607 Y160.88 E-.13196
G1 X173.673 Y160.75 E-.13773
G1 X173.825 Y160.628 E-.18599
G1 X173.965 Y160.591 E-.13733
G1 X174.035 Y160.591 E-.06622
G1 X174.169 Y160.626 E-.13193
G1 X174.284 Y160.703 E-.13184
G1 X174.367 Y160.815 E-.132
G1 X174.376 Y160.85 E-.03425
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.167 J-.374 E.0447
G1 X173.035 Y160.591 E.00218
G3 X173.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173 Y161.411 E-.21847
G1 X172.863 Y161.387 E-.13185
G1 X172.692 Y161.271 E-.19665
G1 X172.619 Y161.153 E-.13195
G1 X172.59 Y161.017 E-.13184
G1 X172.607 Y160.88 E-.13194
G1 X172.693 Y160.728 E-.16556
G1 X172.831 Y160.626 E-.16319
G1 X172.965 Y160.591 E-.13199
G1 X173.035 Y160.591 E-.06618
G1 X173.169 Y160.626 E-.13193
G1 X173.284 Y160.703 E-.13184
G1 X173.367 Y160.815 E-.132
G1 X173.376 Y160.85 E-.03462
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.167 J-.374 E.0447
G1 X172.035 Y160.591 E.00218
G3 X172.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 38
M204 S10000
G1 X171.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.307 J-.271 E.05019
G1 X171.035 Y160.591 E.00218
G3 X171.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.168 Y161.375 E-.22072
G1 X171 Y161.411 E-.16329
G1 X170.863 Y161.387 E-.13184
G1 X170.692 Y161.271 E-.19663
G1 X170.619 Y161.153 E-.13195
G1 X170.59 Y161.017 E-.13184
G1 X170.607 Y160.88 E-.13194
G1 X170.693 Y160.728 E-.16555
G1 X170.831 Y160.626 E-.16322
G1 X170.965 Y160.591 E-.13196
G1 X171.035 Y160.591 E-.06618
G1 X171.169 Y160.626 E-.13193
G1 X171.284 Y160.703 E-.13184
G1 X171.285 Y160.704 E-.00113
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.167 J-.374 E.0447
G1 X170.035 Y160.591 E.00218
G3 X170.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170 Y161.411 E-.21848
G1 X169.863 Y161.387 E-.13189
G1 X169.692 Y161.271 E-.19658
G1 X169.619 Y161.153 E-.13195
G1 X169.59 Y161.017 E-.13184
G1 X169.607 Y160.88 E-.13194
G1 X169.693 Y160.728 E-.16555
G1 X169.831 Y160.626 E-.16322
G1 X169.965 Y160.591 E-.13196
G1 X170.035 Y160.591 E-.06618
G1 X170.169 Y160.626 E-.13193
G1 X170.284 Y160.703 E-.13184
G1 X170.367 Y160.815 E-.132
G1 X170.376 Y160.851 E-.03464
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.167 J-.374 E.0447
G1 X169.035 Y160.591 E.00219
G3 X169.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169 Y161.411 E-.2185
G1 X168.863 Y161.387 E-.13184
G1 X168.692 Y161.271 E-.19663
G1 X168.619 Y161.153 E-.13195
G1 X168.59 Y161.017 E-.13184
G1 X168.607 Y160.88 E-.13196
G1 X168.673 Y160.75 E-.13773
G1 X168.825 Y160.628 E-.18599
G1 X168.965 Y160.591 E-.13733
G1 X169.035 Y160.591 E-.06622
G1 X169.169 Y160.626 E-.13193
G1 X169.284 Y160.703 E-.13184
G1 X169.367 Y160.815 E-.132
G1 X169.376 Y160.85 E-.03425
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.167 J-.374 E.0447
G1 X168.035 Y160.591 E.00218
G3 X168.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168 Y161.411 E-.21849
G1 X167.863 Y161.387 E-.13184
G1 X167.692 Y161.271 E-.19663
G1 X167.619 Y161.153 E-.13195
G1 X167.59 Y161.017 E-.13184
G1 X167.607 Y160.88 E-.13194
G1 X167.693 Y160.728 E-.16556
G1 X167.831 Y160.626 E-.16319
G1 X167.965 Y160.591 E-.13199
G1 X168.035 Y160.591 E-.06618
G1 X168.169 Y160.626 E-.13193
G1 X168.284 Y160.703 E-.13184
G1 X168.367 Y160.815 E-.132
G1 X168.376 Y160.85 E-.03463
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.167 J-.374 E.0447
G1 X167.035 Y160.591 E.00218
G3 X167.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167 Y161.411 E-.21848
G1 X166.863 Y161.387 E-.13189
G1 X166.692 Y161.271 E-.19658
G1 X166.619 Y161.153 E-.13195
G1 X166.59 Y161.017 E-.13184
G1 X166.607 Y160.88 E-.13194
G1 X166.693 Y160.728 E-.16556
G1 X166.831 Y160.626 E-.16319
G1 X166.965 Y160.591 E-.13199
G1 X167.035 Y160.591 E-.06618
G1 X167.169 Y160.626 E-.13193
G1 X167.284 Y160.703 E-.13184
G1 X167.367 Y160.815 E-.132
G1 X167.376 Y160.85 E-.03463
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.373 Y159.5 Z2.4 F60000
G1 Z2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.372 Y160.502 I.632 J.501 E.03657
G2 X166.642 Y161.725 I.663 J.495 E.04811
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.337 Y159.452 I.357 J.714 E.04625
; COOLING_NODE: 48
M204 S10000
G1 X167.167 Y159.374 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.167 J-.374 E.0447
G1 X167.035 Y158.591 E.00218
G3 X167.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 47
M204 S10000
G1 X167.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.365 J.181 E.06502
G1 X167.035 Y159.591 E.00218
G3 X167.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y159.984 E-.22064
G1 X167.381 Y160.153 E-.16322
G1 X167.308 Y160.271 E-.13204
G1 X167.168 Y160.375 E-.16546
G1 X167 Y160.411 E-.16328
G1 X166.863 Y160.387 E-.13189
G1 X166.742 Y160.32 E-.13193
G1 X166.633 Y160.184 E-.16549
G1 X166.59 Y160.017 E-.1632
G1 X166.607 Y159.88 E-.13193
G1 X166.693 Y159.728 E-.16557
G1 X166.831 Y159.626 E-.16319
G1 X166.833 Y159.625 E-.00217
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.365 Y159.816 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.365 J.181 E.06502
G1 X168.035 Y159.591 E.00218
G3 X168.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 41
M204 S10000
G1 X168.637 Y160.182 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.363 J-.185 E.025
G1 X169.035 Y159.591 E.00219
G3 X168.668 Y160.233 I-.035 J.406 E.05124
; COOLING_NODE: 44
M204 S10000
G1 X169.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.167 J-.374 E.0447
G1 X169.035 Y158.591 E.00219
G3 X169.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169 Y159.411 E-.21849
G1 X168.863 Y159.387 E-.13184
G1 X168.692 Y159.271 E-.19663
G1 X168.619 Y159.153 E-.13195
G1 X168.59 Y159.017 E-.13184
G1 X168.607 Y158.88 E-.13196
G1 X168.673 Y158.75 E-.13773
G1 X168.825 Y158.628 E-.18599
G1 X168.965 Y158.591 E-.13734
G1 X169.035 Y158.591 E-.06622
G1 X169.169 Y158.626 E-.13194
G1 X169.284 Y158.703 E-.13184
G1 X169.367 Y158.815 E-.132
G1 X169.376 Y158.85 E-.03426
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.167 Y159.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.167 J-.374 E.0447
G1 X168.035 Y158.591 E.00218
G3 X168.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X168 Y159.411 E-.21848
G1 X167.863 Y159.387 E-.13184
G1 X167.692 Y159.271 E-.19663
G1 X167.619 Y159.153 E-.13195
G1 X167.59 Y159.017 E-.13184
G1 X167.607 Y158.88 E-.13194
G1 X167.693 Y158.728 E-.16556
G1 X167.831 Y158.626 E-.16319
G1 X167.965 Y158.591 E-.13199
G1 X168.035 Y158.591 E-.06618
G1 X168.169 Y158.626 E-.13194
G1 X168.284 Y158.703 E-.13184
G1 X168.367 Y158.815 E-.132
G1 X168.376 Y158.851 E-.03464
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.167 Y159.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.167 J-.374 E.0447
G1 X170.035 Y158.591 E.00218
G3 X170.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 42
M204 S10000
G1 X170.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.365 J.181 E.06502
G1 X170.035 Y159.591 E.00218
G3 X170.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.41 Y159.984 E-.22064
G1 X170.381 Y160.153 E-.16322
G1 X170.308 Y160.271 E-.13204
G1 X170.168 Y160.375 E-.16546
G1 X170 Y160.411 E-.16328
G1 X169.863 Y160.387 E-.13189
G1 X169.742 Y160.32 E-.13193
G1 X169.633 Y160.184 E-.16549
G1 X169.59 Y160.017 E-.1632
G1 X169.607 Y159.88 E-.13193
G1 X169.693 Y159.728 E-.16556
G1 X169.831 Y159.626 E-.16322
G1 X169.833 Y159.625 E-.00214
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.365 Y159.816 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.365 J.181 E.06502
G1 X171.035 Y159.591 E.00218
G3 X171.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 7
M204 S10000
G1 X171.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.307 J-.271 E.05019
G1 X171.035 Y158.591 E.00218
G3 X171.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 4
M204 S10000
G1 X172.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.167 J-.374 E.0447
G1 X172.035 Y158.591 E.00218
G3 X172.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 5
M204 S10000
G1 X172.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.365 J.181 E.06502
G1 X172.035 Y159.591 E.00218
G3 X172.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X172.41 Y159.984 E-.22064
G1 X172.381 Y160.153 E-.16322
G1 X172.308 Y160.271 E-.13204
G1 X172.168 Y160.375 E-.16546
G1 X172 Y160.411 E-.16329
G1 X171.863 Y160.387 E-.13184
G1 X171.742 Y160.32 E-.13198
G1 X171.633 Y160.184 E-.16549
G1 X171.59 Y160.017 E-.1632
G1 X171.607 Y159.88 E-.13193
G1 X171.693 Y159.728 E-.16557
G1 X171.831 Y159.626 E-.16319
G1 X171.833 Y159.625 E-.00216
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.745 Y160.315 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03044
G1 X174.035 Y159.591 E.00219
G3 X173.795 Y160.349 I-.035 J.406 E.0458
; COOLING_NODE: 2
M204 S10000
G1 X173.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.365 J.181 E.06502
G1 X173.035 Y159.591 E.00218
G3 X173.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 3
M204 S10000
G1 X173.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.167 J-.374 E.0447
G1 X173.035 Y158.591 E.00218
G3 X173.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 8
M204 S10000
G1 X174.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.167 J-.374 E.0447
G1 X174.035 Y158.591 E.00219
G3 X174.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 9
M204 S10000
G1 X175.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.167 J-.374 E.0447
G1 X175.035 Y158.591 E.00219
G3 X175.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X175 Y159.411 E-.21848
G1 X174.863 Y159.387 E-.13185
G1 X174.692 Y159.271 E-.19663
G1 X174.619 Y159.153 E-.13195
G1 X174.59 Y159.017 E-.13184
G1 X174.607 Y158.88 E-.13196
G1 X174.673 Y158.75 E-.13773
G1 X174.825 Y158.628 E-.18599
G1 X174.965 Y158.591 E-.13734
G1 X175.035 Y158.591 E-.06622
G1 X175.169 Y158.626 E-.13194
G1 X175.284 Y158.703 E-.13184
G1 X175.367 Y158.815 E-.132
G1 X175.376 Y158.85 E-.03426
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.998 Y159.254 Z2.4 F60000
G1 X183.307 Y159.271 Z2.4
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.307 J-.271 E.05019
G1 X183.035 Y158.591 E.00218
G3 X183.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.168 Y159.375 E-.22071
G1 X183 Y159.411 E-.16329
G1 X182.863 Y159.387 E-.13184
G1 X182.692 Y159.271 E-.19663
G1 X182.619 Y159.153 E-.13195
G1 X182.59 Y159.017 E-.13184
G1 X182.607 Y158.88 E-.13196
G1 X182.673 Y158.75 E-.13773
G1 X182.825 Y158.628 E-.18593
G1 X182.965 Y158.591 E-.13743
G1 X183.035 Y158.591 E-.06618
G1 X183.169 Y158.626 E-.13194
G1 X183.284 Y158.703 E-.13184
G1 X183.285 Y158.704 E-.00075
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.637 Y160.182 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.363 J-.185 E.025
G1 X183.035 Y159.591 E.00218
G3 X182.668 Y160.233 I-.035 J.406 E.05124
; COOLING_NODE: 23
M204 S10000
G1 X182.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.365 J.181 E.06502
G1 X182.035 Y159.591 E.00218
G3 X182.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 20
M204 S10000
G1 X181.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.365 J.181 E.06502
G1 X181.035 Y159.591 E.00218
G3 X181.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 21
M204 S10000
G1 X181.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.167 J-.374 E.0447
G1 X181.035 Y158.591 E.00218
G3 X181.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 22
M204 S10000
G1 X182.167 Y159.374 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.167 J-.374 E.0447
G1 X182.035 Y158.591 E.00218
G3 X182.22 Y159.345 I-.035 J.409 E.032
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182 Y159.411 E-.21847
G1 X181.863 Y159.387 E-.13184
G1 X181.692 Y159.271 E-.19663
G1 X181.619 Y159.153 E-.13195
G1 X181.59 Y159.017 E-.13184
G1 X181.607 Y158.88 E-.13194
G1 X181.693 Y158.728 E-.16556
G1 X181.831 Y158.626 E-.16319
G1 X181.965 Y158.591 E-.13199
G1 X182.035 Y158.591 E-.06618
G1 X182.169 Y158.626 E-.13194
G1 X182.284 Y158.703 E-.13184
G1 X182.367 Y158.815 E-.132
G1 X182.376 Y158.851 E-.03465
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.167 Y161.374 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.167 J-.374 E.0447
G1 X181.035 Y160.591 E.00218
G3 X181.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 27
M204 S10000
G1 X182.167 Y161.374 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.167 J-.374 E.0447
G1 X182.035 Y160.591 E.00218
G3 X182.22 Y161.345 I-.035 J.409 E.032
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182 Y161.411 E-.21849
G1 X181.863 Y161.387 E-.13184
G1 X181.692 Y161.271 E-.19663
G1 X181.619 Y161.153 E-.13195
G1 X181.59 Y161.017 E-.13184
G1 X181.607 Y160.88 E-.13194
G1 X181.693 Y160.728 E-.16556
G1 X181.831 Y160.626 E-.16319
G1 X181.965 Y160.591 E-.13199
G1 X182.035 Y160.591 E-.06618
G1 X182.169 Y160.626 E-.13193
G1 X182.284 Y160.703 E-.13184
G1 X182.367 Y160.815 E-.132
G1 X182.376 Y160.85 E-.03463
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.307 Y161.271 Z2.4 F60000
G1 Z2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.307 J-.271 E.05019
G1 X183.035 Y160.591 E.00218
G3 X183.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.168 Y161.375 E-.22071
G1 X183 Y161.411 E-.16329
G1 X182.863 Y161.387 E-.13184
G1 X182.692 Y161.271 E-.19663
G1 X182.619 Y161.153 E-.13195
G1 X182.59 Y161.017 E-.13184
G1 X182.607 Y160.88 E-.13196
G1 X182.673 Y160.75 E-.13773
G1 X182.825 Y160.628 E-.18593
G1 X182.965 Y160.591 E-.13743
G1 X183.035 Y160.591 E-.06618
G1 X183.169 Y160.626 E-.13193
G1 X183.284 Y160.703 E-.13184
G1 X183.285 Y160.704 E-.00075
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z2.4 F60000
G1 Z2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.406 Y161.898 E.03356
G1 X183.357 Y161.718 E.0063
G2 X183.63 Y160.495 I-.365 J-.724 E.04849
G2 X183.63 Y159.495 I-.65 J-.5 E.0364
G2 X183.363 Y158.285 I-.623 J-.497 E.04808
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311731
G1 F4017.693
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.292871
G1 F4320.852
G1 X184.077 Y161.318 E.00203
; LINE_WIDTH: 0.260783
G1 F4957.242
G2 X184.093 Y161.199 I-1.06 J-.208 E.00219
; LINE_WIDTH: 0.242875
G1 F5401.218
G2 X184.08 Y160.684 I-3.197 J-.173 E.00856
; LINE_WIDTH: 0.290444
G1 F4363.224
G1 X184.062 Y160.591 E.00196
; LINE_WIDTH: 0.326687
G1 F3805.951
G1 X184.044 Y160.497 E.00225
G1 X184.025 Y160.496 E.00045
; LINE_WIDTH: 0.29094
G1 F4354.495
G1 X183.95 Y160.496 E.00154
; LINE_WIDTH: 0.252488
G1 F5153.463
G1 X183.875 Y160.496 E.0013
M204 S10000
G1 X183.986 Y160.809 F60000
; LINE_WIDTH: 0.311755
G1 F4017.343
M204 S8000
G1 X184.062 Y160.415 E.00897
; LINE_WIDTH: 0.292895
G1 F4320.442
G1 X184.077 Y160.318 E.00203
; LINE_WIDTH: 0.260799
G1 F4956.894
G2 X184.093 Y160.199 I-1.069 J-.209 E.00219
; LINE_WIDTH: 0.242875
G1 F5401.218
G2 X184.08 Y159.684 I-3.197 J-.173 E.00856
; LINE_WIDTH: 0.290444
G1 F4363.224
G1 X184.062 Y159.591 E.00196
; LINE_WIDTH: 0.326671
G1 F3806.16
G1 X184.044 Y159.497 E.00225
G1 X184.025 Y159.496 E.00045
; LINE_WIDTH: 0.290768
G1 F4357.516
G1 X183.95 Y159.496 E.00154
; LINE_WIDTH: 0.252314
G1 F5157.748
G1 X183.875 Y159.496 E.0013
M204 S10000
G1 X183.986 Y159.809 F60000
; LINE_WIDTH: 0.311731
G1 F4017.693
M204 S8000
G1 X184.062 Y159.415 E.00897
; LINE_WIDTH: 0.292871
G1 F4320.852
G1 X184.077 Y159.318 E.00203
; LINE_WIDTH: 0.260784
G1 F4957.236
G2 X184.093 Y159.199 I-1.061 J-.208 E.00219
; LINE_WIDTH: 0.242875
G1 F5401.221
G2 X184.08 Y158.684 I-3.197 J-.173 E.00856
; LINE_WIDTH: 0.291189
G1 F4350.13
G1 X184.061 Y158.587 E.00205
; LINE_WIDTH: 0.352139
G1 F3492.678
G2 X184.036 Y158.464 I-1.492 J.238 E.00323
G1 X183.754 Y158.306 E.00831
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609662
G1 F1905.632
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574712
G1 F2030.869
G2 X182.196 Y158.161 I-.348 J1.717 E.00657
; LINE_WIDTH: 0.54043
G1 F2170.812
G2 X181.76 Y158.166 I-.194 J1.905 E.01808
; LINE_WIDTH: 0.581545
G1 F2005.106
G1 X181.657 Y158.184 E.0047
; LINE_WIDTH: 0.609677
G1 F1905.58
G1 X181.609 Y158.195 E.00233
; WIPE_START
G1 X181.657 Y158.184 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.134 Y161.645 Z2.4 F60000
G1 Z2
G1 E2 F600
; LINE_WIDTH: 0.609171
G1 F1907.283
M204 S8000
G1 X182.333 Y161.818 E.03856
; LINE_WIDTH: 0.573272
G1 F2036.385
G1 X182.191 Y161.84 E.00633
; LINE_WIDTH: 0.542019
G1 F2163.901
G3 X181.731 Y161.829 I-.186 J-1.898 E.01915
; LINE_WIDTH: 0.580472
G1 F2009.11
G1 X181.685 Y161.821 E.00207
M204 S10000
G1 X181.929 Y161.601 F60000
; LINE_WIDTH: 0.656971
G1 F1758.811
M204 S8000
G2 X183.222 Y161.966 I5.012 J-15.294 E.06857
; WIPE_START
G1 X182.531 Y161.786 E-1.01003
G1 X181.929 Y161.601 E-.88997
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.528 Y159.739 Z2.4 F60000
G1 X168.391 Y158.195 Z2.4
G1 Z2
G1 E2 F600
; LINE_WIDTH: 0.609662
G1 F1905.632
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574712
G1 F2030.869
G2 X168.196 Y158.161 I-.348 J1.717 E.00657
; LINE_WIDTH: 0.54043
G1 F2170.812
G2 X167.76 Y158.166 I-.194 J1.905 E.01808
; LINE_WIDTH: 0.581545
G1 F2005.106
G1 X167.657 Y158.184 E.0047
; LINE_WIDTH: 0.609677
G1 F1905.58
G1 X166.859 Y158.357 E.03848
M204 S10000
G1 X166.229 Y158.306 F60000
; LINE_WIDTH: 0.339401
G1 F3642.735
M204 S8000
G1 X165.963 Y158.466 E.00765
; LINE_WIDTH: 0.33806
G1 F3659.289
G1 X165.944 Y158.563 E.00243
; LINE_WIDTH: 0.296739
G1 F4255.013
G1 X165.922 Y158.68 E.00252
; LINE_WIDTH: 0.243857
G1 F5374.832
G2 X165.912 Y159.244 I2.46 J.324 E.00943
; LINE_WIDTH: 0.268913
G1 F4778.925
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308695
G1 F4063.6
G2 X166.014 Y159.806 I5.557 J-.788 E.01073
M204 S10000
G1 X166.013 Y159.204 F60000
; LINE_WIDTH: 0.328857
G1 F3777.06
M204 S8000
G1 X165.969 Y159.432 E.00552
; LINE_WIDTH: 0.295857
G1 F4269.843
G2 X165.922 Y159.68 I2.935 J.685 E.00531
; LINE_WIDTH: 0.244488
G1 F5357.997
G2 X165.915 Y160.272 I2.494 J.327 E.00994
; LINE_WIDTH: 0.281363
G1 F4529.391
G1 X165.935 Y160.387 E.00232
; LINE_WIDTH: 0.322268
G1 F3866.152
G1 X165.955 Y160.502 E.00272
M204 S10000
G1 X166.124 Y160.494 F60000
; LINE_WIDTH: 0.159529
G1 F9261.722
M204 S8000
G1 X166.044 Y160.498 E.00078
; LINE_WIDTH: 0.199006
G1 F6919.284
G1 X166.024 Y160.5 E.00025
; LINE_WIDTH: 0.235443
G1 F5609.743
G1 X166.004 Y160.501 E.00033
; LINE_WIDTH: 0.273683
G1 F4680.137
G1 X165.983 Y160.502 E.0004
; LINE_WIDTH: 0.317665
G1 F3930.921
G1 X165.955 Y160.502 E.00062
; LINE_WIDTH: 0.327437
G1 F3795.918
G1 X165.94 Y160.581 E.00191
; LINE_WIDTH: 0.293224
G1 F4314.758
G1 X165.922 Y160.68 E.0021
; LINE_WIDTH: 0.243857
G1 F5374.832
G2 X165.912 Y161.244 I2.46 J.324 E.00943
; LINE_WIDTH: 0.268913
G1 F4778.925
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307752
G1 F4078.065
G2 X165.992 Y161.694 I4.26 J-.593 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4078.065
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 11/25
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I.139 J1.209 P1  F60000
G1 X174.744 Y160.317 Z2.4
G1 Z2.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.896 Y159.603 I.259 J-.318 E.02826
G1 X174.971 Y159.59 E.00237
G3 X174.793 Y160.351 I.032 J.409 E.04831
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X174.65 Y160.215 E-.18749
G1 X174.598 Y160.087 E-.13186
G1 X174.593 Y159.942 E-.13742
G1 X174.666 Y159.76 E-.18587
G1 X174.77 Y159.66 E-.1378
G1 X174.896 Y159.603 E-.13175
G1 X174.971 Y159.59 E-.07172
G1 X175.164 Y159.623 E-.18596
G1 X175.284 Y159.703 E-.13781
G1 X175.367 Y159.815 E-.13192
G1 X175.41 Y159.981 E-.16317
G1 X175.381 Y160.153 E-.16557
G1 X175.308 Y160.271 E-.13167
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.198 Y159.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.896 Y158.603 I-.196 J-.358 E.04323
G1 X174.971 Y158.59 E.00237
G3 X175.249 Y159.322 I.031 J.407 E.03288
; COOLING_NODE: 10
M204 S10000
G1 X176.198 Y159.354 F60000
G1 F2864.117
M204 S5000
G3 X175.896 Y158.603 I-.196 J-.358 E.04323
G1 X175.971 Y158.59 E.00237
G3 X176.249 Y159.322 I.031 J.407 E.03288
; COOLING_NODE: 11
M204 S10000
G1 X177.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X176.896 Y158.603 I-.198 J-.36 E.0435
G1 X176.971 Y158.59 E.00237
G3 X177.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 17
M204 S10000
G1 X178.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X177.896 Y158.603 I-.198 J-.36 E.0435
G1 X177.971 Y158.59 E.00237
G3 X178.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178.069 Y159.405 E-.18792
G1 X177.931 Y159.405 E-.13188
G1 X177.794 Y159.356 E-.1374
G1 X177.653 Y159.221 E-.18596
G1 X177.598 Y159.087 E-.1377
G1 X177.593 Y158.948 E-.13196
G1 X177.633 Y158.815 E-.13185
G1 X177.716 Y158.703 E-.13192
G1 X177.896 Y158.603 E-.19653
G1 X177.971 Y158.59 E-.07172
G1 X178.164 Y158.623 E-.18596
G1 X178.284 Y158.703 E-.13781
G1 X178.366 Y158.815 E-.1314
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.656 Y160.212 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.896 Y159.603 I.347 J-.215 E.02385
G1 X177.971 Y159.59 E.00237
G3 X177.691 Y160.261 I.032 J.407 E.0523
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X177.598 Y160.087 E-.18727
G1 X177.593 Y159.948 E-.13196
G1 X177.633 Y159.815 E-.13185
G1 X177.716 Y159.703 E-.13192
G1 X177.896 Y159.603 E-.19653
G1 X177.971 Y159.59 E-.07172
G1 X178.164 Y159.623 E-.18596
G1 X178.284 Y159.703 E-.13781
G1 X178.367 Y159.815 E-.13192
G1 X178.41 Y159.981 E-.16317
G1 X178.381 Y160.153 E-.16557
G1 X178.308 Y160.271 E-.13192
G1 X178.2 Y160.359 E-.13181
G1 X178.2 Y160.359 E-.00061
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X178.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.896 Y160.603 I-.198 J-.36 E.0435
G1 X177.971 Y160.59 E.00237
G3 X178.251 Y161.326 I.032 J.409 E.03306
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178.069 Y161.405 E-.18793
G1 X177.931 Y161.405 E-.13188
G1 X177.794 Y161.356 E-.1374
G1 X177.653 Y161.221 E-.18596
G1 X177.598 Y161.087 E-.1377
G1 X177.593 Y160.948 E-.13196
G1 X177.633 Y160.815 E-.13185
G1 X177.716 Y160.703 E-.13192
G1 X177.896 Y160.603 E-.19653
G1 X177.971 Y160.59 E-.07172
G1 X178.164 Y160.623 E-.18596
G1 X178.284 Y160.703 E-.13781
G1 X178.366 Y160.815 E-.13139
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.896 Y160.603 I-.198 J-.36 E.0435
G1 X176.971 Y160.59 E.00237
G3 X177.251 Y161.326 I.032 J.409 E.03306
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.069 Y161.405 E-.18793
G1 X176.931 Y161.405 E-.13188
G1 X176.794 Y161.356 E-.1374
G1 X176.653 Y161.221 E-.18596
G1 X176.598 Y161.087 E-.1377
G1 X176.593 Y160.948 E-.13196
G1 X176.633 Y160.815 E-.13185
G1 X176.716 Y160.703 E-.13192
G1 X176.896 Y160.603 E-.19653
G1 X176.971 Y160.59 E-.07172
G1 X177.164 Y160.623 E-.18596
G1 X177.284 Y160.703 E-.13781
G1 X177.366 Y160.815 E-.13139
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.656 Y160.212 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.896 Y159.603 I.347 J-.215 E.02385
G1 X176.971 Y159.59 E.00237
G3 X176.691 Y160.261 I.032 J.407 E.0523
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X176.598 Y160.087 E-.18727
G1 X176.593 Y159.948 E-.13196
G1 X176.633 Y159.815 E-.13185
G1 X176.716 Y159.703 E-.13192
G1 X176.896 Y159.603 E-.19653
G1 X176.971 Y159.59 E-.07172
G1 X177.164 Y159.623 E-.18596
G1 X177.284 Y159.703 E-.13781
G1 X177.367 Y159.815 E-.13192
G1 X177.41 Y159.981 E-.16317
G1 X177.381 Y160.153 E-.16557
G1 X177.308 Y160.271 E-.13192
G1 X177.2 Y160.359 E-.13181
G1 X177.2 Y160.359 E-.00061
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X175.602 Y160.086 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.896 Y159.603 I.401 J-.087 E.01958
G1 X175.971 Y159.59 E.00237
G3 X175.619 Y160.143 I.032 J.409 E.05698
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X175.593 Y159.942 E-.19301
G1 X175.666 Y159.76 E-.18587
G1 X175.77 Y159.66 E-.1378
G1 X175.896 Y159.603 E-.13175
G1 X175.971 Y159.59 E-.07172
G1 X176.164 Y159.623 E-.18596
G1 X176.284 Y159.703 E-.13781
G1 X176.367 Y159.815 E-.13192
G1 X176.41 Y159.981 E-.16317
G1 X176.381 Y160.153 E-.16557
G1 X176.308 Y160.271 E-.13192
G1 X176.2 Y160.359 E-.13181
G1 X176.07 Y160.405 E-.13169
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.198 Y161.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.896 Y160.603 I-.196 J-.358 E.04323
G1 X175.971 Y160.59 E.00237
G3 X176.249 Y161.322 I.031 J.407 E.03288
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176.069 Y161.405 E-.18762
G1 X175.931 Y161.405 E-.13188
G1 X175.794 Y161.356 E-.1374
G1 X175.653 Y161.221 E-.18596
G1 X175.598 Y161.087 E-.1377
G1 X175.593 Y160.942 E-.13742
G1 X175.666 Y160.76 E-.18587
G1 X175.77 Y160.66 E-.13781
G1 X175.896 Y160.603 E-.13175
G1 X175.971 Y160.59 E-.07172
G1 X176.164 Y160.623 E-.18596
G1 X176.284 Y160.703 E-.13781
G1 X176.366 Y160.814 E-.1311
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.198 Y161.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.896 Y160.603 I-.196 J-.358 E.04323
G1 X174.971 Y160.59 E.00237
G3 X175.249 Y161.322 I.031 J.407 E.03288
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X175.069 Y161.405 E-.18761
G1 X174.931 Y161.405 E-.13189
G1 X174.794 Y161.356 E-.13741
G1 X174.653 Y161.221 E-.18596
G1 X174.598 Y161.087 E-.1377
G1 X174.593 Y160.942 E-.13742
G1 X174.666 Y160.76 E-.18587
G1 X174.77 Y160.66 E-.1378
G1 X174.896 Y160.603 E-.13175
G1 X174.971 Y160.59 E-.07172
G1 X175.164 Y160.623 E-.18596
G1 X175.284 Y160.703 E-.13781
G1 X175.366 Y160.814 E-.1311
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.198 Y159.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.896 Y158.603 I-.196 J-.358 E.04323
G1 X173.971 Y158.59 E.00237
G3 X174.249 Y159.322 I.031 J.407 E.03288
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.069 Y159.405 E-.18762
G1 X173.931 Y159.405 E-.13189
G1 X173.794 Y159.356 E-.13741
G1 X173.653 Y159.221 E-.18596
G1 X173.598 Y159.087 E-.1377
G1 X173.593 Y158.942 E-.13742
G1 X173.666 Y158.76 E-.18587
G1 X173.77 Y158.66 E-.1378
G1 X173.896 Y158.603 E-.13175
G1 X173.971 Y158.59 E-.07172
G1 X174.164 Y158.623 E-.18596
G1 X174.284 Y158.703 E-.13781
G1 X174.366 Y158.814 E-.1311
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.2 Y159.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.896 Y158.603 I-.197 J-.36 E.0435
G1 X172.971 Y158.59 E.00236
G3 X173.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173.069 Y159.405 E-.18793
G1 X172.931 Y159.405 E-.13187
G1 X172.794 Y159.356 E-.13741
G1 X172.653 Y159.221 E-.18596
G1 X172.598 Y159.087 E-.1377
G1 X172.607 Y158.88 E-.19663
G1 X172.67 Y158.756 E-.13191
G1 X172.77 Y158.66 E-.13195
G1 X172.896 Y158.603 E-.13182
G1 X172.971 Y158.59 E-.07162
G1 X173.164 Y158.623 E-.18599
G1 X173.284 Y158.703 E-.13781
G1 X173.366 Y158.815 E-.13142
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X172.2 Y159.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.896 Y158.603 I-.197 J-.36 E.0435
G1 X171.971 Y158.59 E.00236
G3 X172.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 5
M204 S10000
G1 X172.368 Y159.815 F60000
G1 F2864.117
M204 S5000
G3 X171.896 Y159.603 I-.365 J.182 E.06286
G1 X171.971 Y159.59 E.00236
G3 X172.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X172.41 Y159.981 E-.21876
G1 X172.381 Y160.153 E-.16557
G1 X172.308 Y160.271 E-.1318
G1 X172.2 Y160.359 E-.13196
G1 X172.069 Y160.405 E-.13193
G1 X171.931 Y160.405 E-.13188
G1 X171.742 Y160.32 E-.19659
G1 X171.65 Y160.215 E-.13201
G1 X171.598 Y160.087 E-.13186
G1 X171.607 Y159.88 E-.19663
G1 X171.67 Y159.756 E-.13191
G1 X171.77 Y159.66 E-.13195
G1 X171.834 Y159.631 E-.06715
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.368 Y159.815 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.896 Y159.603 I-.365 J.182 E.06286
G1 X172.971 Y159.59 E.00236
G3 X173.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 1
M204 S10000
G1 X173.744 Y160.317 F60000
G1 F2864.117
M204 S5000
G3 X173.896 Y159.603 I.259 J-.318 E.02826
G1 X173.971 Y159.59 E.00237
G3 X173.793 Y160.351 I.032 J.409 E.04831
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X173.65 Y160.215 E-.18749
G1 X173.598 Y160.087 E-.13186
G1 X173.593 Y159.942 E-.13742
G1 X173.666 Y159.76 E-.18587
G1 X173.77 Y159.66 E-.1378
G1 X173.896 Y159.603 E-.13175
G1 X173.971 Y159.59 E-.07172
G1 X174.164 Y159.623 E-.18596
G1 X174.284 Y159.703 E-.13781
G1 X174.367 Y159.815 E-.13192
G1 X174.41 Y159.981 E-.16317
G1 X174.381 Y160.153 E-.16557
G1 X174.308 Y160.271 E-.13166
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.198 Y161.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.896 Y160.603 I-.196 J-.358 E.04323
G1 X173.971 Y160.59 E.00237
G3 X174.249 Y161.322 I.031 J.407 E.03288
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174.069 Y161.405 E-.18762
G1 X173.931 Y161.405 E-.13189
G1 X173.794 Y161.356 E-.13741
G1 X173.653 Y161.221 E-.18596
G1 X173.598 Y161.087 E-.1377
G1 X173.593 Y160.942 E-.13742
G1 X173.666 Y160.76 E-.18587
G1 X173.77 Y160.66 E-.1378
G1 X173.896 Y160.603 E-.13175
G1 X173.971 Y160.59 E-.07172
G1 X174.164 Y160.623 E-.18596
G1 X174.284 Y160.703 E-.13781
G1 X174.366 Y160.814 E-.13109
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.896 Y160.603 I-.197 J-.36 E.0435
G1 X172.971 Y160.59 E.00236
G3 X173.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173.069 Y161.405 E-.18793
G1 X172.931 Y161.405 E-.13187
G1 X172.794 Y161.356 E-.13741
G1 X172.653 Y161.221 E-.18596
G1 X172.598 Y161.087 E-.1377
G1 X172.607 Y160.88 E-.19663
G1 X172.67 Y160.756 E-.13191
G1 X172.77 Y160.66 E-.13195
G1 X172.896 Y160.603 E-.13182
G1 X172.971 Y160.59 E-.07162
G1 X173.164 Y160.623 E-.18599
G1 X173.284 Y160.703 E-.13781
G1 X173.366 Y160.815 E-.13141
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.896 Y160.603 I-.197 J-.36 E.0435
G1 X171.971 Y160.59 E.00236
G3 X172.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X172.069 Y161.405 E-.18794
G1 X171.931 Y161.405 E-.13188
G1 X171.794 Y161.356 E-.1374
G1 X171.653 Y161.221 E-.18596
G1 X171.598 Y161.087 E-.1377
G1 X171.607 Y160.88 E-.19663
G1 X171.67 Y160.756 E-.13191
G1 X171.77 Y160.66 E-.13195
G1 X171.896 Y160.603 E-.13182
G1 X171.971 Y160.59 E-.07162
G1 X172.164 Y160.623 E-.18599
G1 X172.284 Y160.703 E-.13781
G1 X172.366 Y160.815 E-.1314
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.307 Y159.27 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.862 Y158.613 I-.302 J-.275 E.04631
G1 X170.965 Y158.589 E.0033
G3 X171.344 Y159.223 I.04 J.406 E.02893
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X171.2 Y159.359 E-.1878
G1 X171.069 Y159.405 E-.13193
G1 X170.931 Y159.405 E-.13188
G1 X170.794 Y159.356 E-.1374
G1 X170.653 Y159.221 E-.18596
G1 X170.598 Y159.087 E-.1377
G1 X170.593 Y158.948 E-.13196
G1 X170.633 Y158.815 E-.13185
G1 X170.716 Y158.703 E-.13184
G1 X170.862 Y158.613 E-.16323
G1 X170.965 Y158.589 E-.10007
G1 X171.164 Y158.623 E-.19185
G1 X171.283 Y158.703 E-.13655
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.199 Y159.355 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.862 Y158.613 I-.194 J-.359 E.04196
G1 X169.965 Y158.589 E.0033
G3 X170.249 Y159.323 I.04 J.406 E.03327
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.069 Y159.405 E-.18776
G1 X169.931 Y159.405 E-.13188
G1 X169.794 Y159.356 E-.1374
G1 X169.653 Y159.221 E-.18596
G1 X169.598 Y159.087 E-.1377
G1 X169.593 Y158.948 E-.13196
G1 X169.633 Y158.815 E-.13185
G1 X169.716 Y158.703 E-.13184
G1 X169.862 Y158.613 E-.16323
G1 X169.965 Y158.589 E-.10007
G1 X170.164 Y158.623 E-.19185
G1 X170.284 Y158.703 E-.13781
G1 X170.366 Y158.814 E-.13071
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X169.198 Y159.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.896 Y158.603 I-.196 J-.358 E.04323
G1 X168.971 Y158.59 E.00237
G3 X169.249 Y159.322 I.031 J.407 E.03288
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.069 Y159.405 E-.18764
G1 X168.931 Y159.405 E-.13188
G1 X168.794 Y159.356 E-.1374
G1 X168.653 Y159.221 E-.18596
G1 X168.598 Y159.087 E-.1377
G1 X168.593 Y158.942 E-.13742
G1 X168.666 Y158.76 E-.18587
G1 X168.77 Y158.66 E-.1378
G1 X168.896 Y158.603 E-.13175
G1 X168.971 Y158.59 E-.07172
G1 X169.164 Y158.623 E-.18596
G1 X169.284 Y158.703 E-.13781
G1 X169.366 Y158.814 E-.1311
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.2 Y159.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.896 Y158.603 I-.197 J-.36 E.0435
G1 X167.971 Y158.59 E.00236
M73 P62 R13
G3 X168.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 46
M204 S10000
G1 X168.368 Y159.815 F60000
G1 F2864.117
M204 S5000
G3 X167.896 Y159.603 I-.365 J.182 E.06286
G1 X167.971 Y159.59 E.00236
G3 X168.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 41
M204 S10000
G1 X168.653 Y160.214 F60000
G1 F2864.117
M204 S5000
G3 X168.896 Y159.603 I.35 J-.215 E.02392
G1 X168.971 Y159.59 E.00237
G3 X168.688 Y160.262 I.032 J.409 E.05265
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.598 Y160.087 E-.18756
G1 X168.593 Y159.942 E-.13742
G1 X168.666 Y159.76 E-.18587
G1 X168.77 Y159.66 E-.1378
G1 X168.896 Y159.603 E-.13175
G1 X168.971 Y159.59 E-.07172
G1 X169.164 Y159.623 E-.18596
G1 X169.284 Y159.703 E-.13781
G1 X169.367 Y159.815 E-.13192
G1 X169.41 Y159.981 E-.16317
G1 X169.381 Y160.153 E-.16557
G1 X169.308 Y160.271 E-.13192
G1 X169.201 Y160.358 E-.13153
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.372 Y159.813 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.862 Y159.613 I-.366 J.186 E.06213
G1 X169.965 Y159.589 E.0033
G3 X170.341 Y159.761 I.041 J.409 E.01359
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.41 Y159.981 E-.21929
G1 X170.381 Y160.153 E-.16557
G1 X170.308 Y160.271 E-.1318
G1 X170.2 Y160.359 E-.13196
G1 X170.069 Y160.405 E-.13193
G1 X169.931 Y160.405 E-.13188
G1 X169.742 Y160.32 E-.19659
G1 X169.65 Y160.215 E-.13201
G1 X169.598 Y160.087 E-.13186
G1 X169.593 Y159.948 E-.13196
G1 X169.633 Y159.815 E-.13185
G1 X169.716 Y159.703 E-.13184
G1 X169.834 Y159.631 E-.13147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.372 Y159.813 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.862 Y159.613 I-.366 J.186 E.06213
G1 X170.965 Y159.589 E.0033
G3 X171.341 Y159.761 I.041 J.409 E.01359
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X171.41 Y159.981 E-.21929
G1 X171.381 Y160.153 E-.16557
G1 X171.308 Y160.271 E-.13192
G1 X171.2 Y160.359 E-.13181
G1 X171.069 Y160.405 E-.13195
G1 X170.931 Y160.405 E-.13188
G1 X170.742 Y160.32 E-.19659
G1 X170.65 Y160.215 E-.13201
G1 X170.598 Y160.087 E-.13186
G1 X170.593 Y159.948 E-.13196
G1 X170.633 Y159.815 E-.13185
G1 X170.716 Y159.703 E-.13184
G1 X170.834 Y159.631 E-.13148
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.307 Y161.27 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.862 Y160.613 I-.302 J-.275 E.0463
G1 X170.965 Y160.589 E.0033
G3 X171.344 Y161.223 I.04 J.406 E.02893
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.2 Y161.359 E-.18781
G1 X171.069 Y161.405 E-.13193
G1 X170.931 Y161.405 E-.13188
G1 X170.794 Y161.356 E-.1374
G1 X170.653 Y161.221 E-.18596
G1 X170.598 Y161.087 E-.1377
G1 X170.593 Y160.948 E-.13196
G1 X170.633 Y160.815 E-.13185
G1 X170.716 Y160.703 E-.13184
G1 X170.862 Y160.613 E-.16323
G1 X170.965 Y160.589 E-.10007
G1 X171.164 Y160.623 E-.19185
G1 X171.283 Y160.703 E-.13654
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.199 Y161.355 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.862 Y160.613 I-.194 J-.359 E.04196
G1 X169.965 Y160.589 E.0033
G3 X170.249 Y161.323 I.04 J.406 E.03327
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170.069 Y161.405 E-.18776
G1 X169.931 Y161.405 E-.13188
G1 X169.794 Y161.356 E-.1374
G1 X169.653 Y161.221 E-.18596
G1 X169.598 Y161.087 E-.1377
G1 X169.593 Y160.948 E-.13196
G1 X169.633 Y160.815 E-.13185
G1 X169.716 Y160.703 E-.13184
G1 X169.862 Y160.613 E-.16323
G1 X169.965 Y160.589 E-.10007
G1 X170.164 Y160.623 E-.19185
G1 X170.284 Y160.703 E-.13781
G1 X170.366 Y160.814 E-.13071
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.198 Y161.354 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.896 Y160.603 I-.196 J-.358 E.04323
G1 X168.971 Y160.59 E.00237
G3 X169.249 Y161.322 I.031 J.407 E.03288
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169.069 Y161.405 E-.18764
G1 X168.931 Y161.405 E-.13188
G1 X168.794 Y161.356 E-.1374
G1 X168.653 Y161.221 E-.18596
G1 X168.598 Y161.087 E-.1377
G1 X168.593 Y160.942 E-.13742
G1 X168.666 Y160.76 E-.18587
G1 X168.77 Y160.66 E-.1378
G1 X168.896 Y160.603 E-.13175
G1 X168.971 Y160.59 E-.07172
G1 X169.164 Y160.623 E-.18596
G1 X169.284 Y160.703 E-.13781
G1 X169.366 Y160.814 E-.13109
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.896 Y160.603 I-.197 J-.36 E.0435
G1 X167.971 Y160.59 E.00236
G3 X168.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.069 Y161.405 E-.18794
G1 X167.931 Y161.405 E-.13188
G1 X167.794 Y161.356 E-.1374
G1 X167.653 Y161.221 E-.18596
G1 X167.598 Y161.087 E-.1377
G1 X167.607 Y160.88 E-.19663
G1 X167.67 Y160.756 E-.13191
G1 X167.77 Y160.66 E-.13195
G1 X167.896 Y160.603 E-.13182
G1 X167.971 Y160.59 E-.07162
G1 X168.164 Y160.623 E-.18599
G1 X168.284 Y160.703 E-.13781
G1 X168.366 Y160.815 E-.1314
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.896 Y160.603 I-.197 J-.36 E.0435
G1 X166.971 Y160.59 E.00236
G3 X167.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.069 Y161.405 E-.18794
G1 X166.931 Y161.405 E-.13188
G1 X166.794 Y161.356 E-.1374
G1 X166.653 Y161.221 E-.18596
G1 X166.598 Y161.087 E-.1377
G1 X166.607 Y160.88 E-.19663
G1 X166.67 Y160.756 E-.13191
G1 X166.77 Y160.66 E-.13195
G1 X166.896 Y160.603 E-.13182
G1 X166.971 Y160.59 E-.07162
G1 X167.164 Y160.623 E-.18599
G1 X167.284 Y160.703 E-.13781
G1 X167.366 Y160.815 E-.1314
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.368 Y159.815 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.896 Y159.603 I-.365 J.182 E.06286
G1 X166.971 Y159.59 E.00236
G3 X167.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 48
M204 S10000
G1 X167.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X166.896 Y158.603 I-.197 J-.36 E.0435
G1 X166.971 Y158.59 E.00236
G3 X167.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 48
M204 S10000
G1 X166.36 Y159.511 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.695 J.486 E.03556
G2 X166.641 Y161.732 I.657 J.504 E.04876
G1 X166.585 Y161.898 E.00594
G1 X165.602 Y161.898 E.03326
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.327 Y159.461 I.399 J.734 E.04613
; COOLING_NODE: 30
; WIPE_START
G1 X166.282 Y159.638 E-.17316
G1 X166.231 Y159.765 E-.12966
G1 X166.196 Y160.034 E-.25821
G1 X166.254 Y160.3 E-.25814
G1 X166.37 Y160.495 E-.21598
G1 X166.282 Y160.638 E-.15909
G1 X166.231 Y160.765 E-.12964
G1 X166.196 Y161.034 E-.25821
G1 X166.214 Y161.169 E-.12962
G1 X166.254 Y161.3 E-.12944
G1 X166.282 Y161.355 E-.05885
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.914 Y161.357 Z2.6 F60000
G1 X179.2 Y161.358 Z2.6
G1 Z2.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X178.896 Y160.603 I-.197 J-.36 E.0435
G1 X178.971 Y160.59 E.00236
G3 X179.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179.069 Y161.405 E-.18793
G1 X178.931 Y161.405 E-.13188
G1 X178.794 Y161.356 E-.1374
G1 X178.653 Y161.221 E-.18596
G1 X178.598 Y161.087 E-.1377
G1 X178.607 Y160.88 E-.19663
G1 X178.67 Y160.756 E-.13191
G1 X178.77 Y160.66 E-.13195
G1 X178.896 Y160.603 E-.13182
G1 X178.971 Y160.59 E-.07162
G1 X179.164 Y160.623 E-.18599
G1 X179.284 Y160.703 E-.13781
G1 X179.366 Y160.815 E-.13141
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.309 Y161.272 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.896 Y160.603 I-.306 J-.273 E.04788
G1 X179.971 Y160.59 E.00237
G3 X180.345 Y161.224 I.032 J.409 E.02869
; COOLING_NODE: 19
M204 S10000
G1 X180.105 Y160.397 F60000
G1 F2864.117
M204 S5000
G3 X179.896 Y159.603 I-.102 J-.398 E.04029
G1 X179.971 Y159.59 E.00237
G3 X180.162 Y160.378 I.032 J.409 E.03632
; COOLING_NODE: 15
M204 S10000
G1 X179.368 Y159.815 F60000
G1 F2864.117
M204 S5000
G3 X178.896 Y159.603 I-.365 J.182 E.06286
G1 X178.971 Y159.59 E.00236
G3 X179.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 16
M204 S10000
G1 X179.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X178.896 Y158.603 I-.197 J-.36 E.0435
G1 X178.971 Y158.59 E.00236
G3 X179.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 18
M204 S10000
G1 X180.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X179.896 Y158.603 I-.198 J-.36 E.0435
G1 X179.971 Y158.59 E.00237
G3 X180.251 Y159.326 I.032 J.409 E.03306
; COOLING_NODE: 21
M204 S10000
G1 X181.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X180.896 Y158.603 I-.197 J-.36 E.0435
G1 X180.971 Y158.59 E.00236
G3 X181.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 22
M204 S10000
G1 X182.2 Y159.358 F60000
G1 F2864.117
M204 S5000
G3 X181.896 Y158.603 I-.197 J-.36 E.0435
G1 X181.971 Y158.59 E.00236
G3 X182.251 Y159.326 I.032 J.409 E.03307
; COOLING_NODE: 23
M204 S10000
G1 X182.368 Y159.815 F60000
G1 F2864.117
M204 S5000
G3 X181.896 Y159.603 I-.365 J.182 E.06286
G1 X181.971 Y159.59 E.00236
G3 X182.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 24
M204 S10000
G1 X182.653 Y160.213 F60000
G1 F2864.117
M204 S5000
G3 X182.896 Y159.603 I.35 J-.215 E.02392
G1 X182.971 Y159.59 E.00236
G3 X182.688 Y160.262 I.032 J.409 E.05265
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182.598 Y160.087 E-.18755
G1 X182.593 Y159.942 E-.13742
G1 X182.666 Y159.76 E-.18587
G1 X182.77 Y159.66 E-.1378
G1 X182.896 Y159.603 E-.13182
G1 X182.971 Y159.59 E-.07162
G1 X183.164 Y159.623 E-.18599
G1 X183.284 Y159.703 E-.13781
G1 X183.367 Y159.815 E-.13192
G1 X183.41 Y159.981 E-.16317
G1 X183.381 Y160.153 E-.16557
G1 X183.308 Y160.271 E-.13192
G1 X183.201 Y160.358 E-.13156
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.306 Y161.269 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.896 Y160.603 I-.303 J-.273 E.04755
G1 X182.971 Y160.59 E.00236
G3 X183.343 Y161.222 I.032 J.407 E.02856
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X183.2 Y161.359 E-.18765
G1 X183.069 Y161.405 E-.13189
G1 X182.931 Y161.405 E-.13192
G1 X182.794 Y161.356 E-.1374
G1 X182.653 Y161.221 E-.18596
G1 X182.598 Y161.087 E-.1377
G1 X182.593 Y160.942 E-.13742
G1 X182.666 Y160.76 E-.18587
G1 X182.77 Y160.66 E-.13781
G1 X182.896 Y160.603 E-.13182
G1 X182.971 Y160.59 E-.07162
G1 X183.164 Y160.623 E-.18599
G1 X183.284 Y160.703 E-.13696
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.896 Y160.603 I-.197 J-.36 E.0435
G1 X181.971 Y160.59 E.00236
G3 X182.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182.069 Y161.405 E-.18793
G1 X181.931 Y161.405 E-.13188
G1 X181.794 Y161.356 E-.1374
G1 X181.653 Y161.221 E-.18596
G1 X181.598 Y161.087 E-.1377
G1 X181.607 Y160.88 E-.19663
G1 X181.67 Y160.756 E-.13191
G1 X181.77 Y160.66 E-.13195
G1 X181.896 Y160.603 E-.13182
G1 X181.971 Y160.59 E-.07162
G1 X182.164 Y160.623 E-.18599
G1 X182.284 Y160.703 E-.13781
G1 X182.366 Y160.815 E-.13141
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.2 Y161.358 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.896 Y160.603 I-.197 J-.36 E.0435
G1 X180.971 Y160.59 E.00236
G3 X181.251 Y161.326 I.032 J.409 E.03307
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X181.069 Y161.405 E-.18793
G1 X180.931 Y161.405 E-.13188
G1 X180.794 Y161.356 E-.1374
G1 X180.653 Y161.221 E-.18596
G1 X180.598 Y161.087 E-.1377
G1 X180.607 Y160.88 E-.19663
G1 X180.67 Y160.756 E-.13191
G1 X180.77 Y160.66 E-.13195
G1 X180.896 Y160.603 E-.13182
G1 X180.971 Y160.59 E-.07162
G1 X181.164 Y160.623 E-.18599
G1 X181.284 Y160.703 E-.13781
G1 X181.366 Y160.815 E-.13141
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.368 Y159.815 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.896 Y159.603 I-.365 J.182 E.06286
G1 X180.971 Y159.59 E.00236
G3 X181.337 Y159.763 I.032 J.407 E.01329
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X181.41 Y159.981 E-.21877
G1 X181.381 Y160.153 E-.16557
G1 X181.308 Y160.271 E-.1318
G1 X181.2 Y160.359 E-.13196
G1 X181.069 Y160.405 E-.13193
G1 X180.931 Y160.405 E-.13188
G1 X180.742 Y160.32 E-.19659
G1 X180.65 Y160.215 E-.13201
G1 X180.598 Y160.087 E-.13186
G1 X180.607 Y159.88 E-.19663
G1 X180.67 Y159.756 E-.13191
G1 X180.77 Y159.66 E-.13195
G1 X180.834 Y159.631 E-.06714
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.306 Y159.269 Z2.6 F60000
G1 Z2.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.896 Y158.603 I-.303 J-.273 E.04755
G1 X182.971 Y158.59 E.00236
G3 X183.343 Y159.222 I.032 J.407 E.02856
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X183.2 Y159.359 E-.18763
G1 X183.069 Y159.405 E-.13189
G1 X182.931 Y159.405 E-.13192
G1 X182.794 Y159.356 E-.1374
G1 X182.653 Y159.221 E-.18596
G1 X182.598 Y159.087 E-.1377
G1 X182.593 Y158.942 E-.13742
G1 X182.666 Y158.76 E-.18587
G1 X182.77 Y158.66 E-.1378
G1 X182.896 Y158.603 E-.13182
G1 X182.971 Y158.59 E-.07162
G1 X183.164 Y158.623 E-.18599
G1 X183.284 Y158.703 E-.13699
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z2.6 F60000
G1 Z2.2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.376 J-.728 E.04862
G2 X183.63 Y159.495 I-.651 J-.5 E.0364
G2 X183.363 Y158.285 I-.623 J-.497 E.04808
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311788
G1 F4016.843
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.292789
G1 F4322.268
G1 X184.077 Y161.317 E.00205
; LINE_WIDTH: 0.246317
G1 F5309.825
G2 X184.079 Y160.682 I-2.447 J-.327 E.01077
; LINE_WIDTH: 0.290909
G1 F4355.037
G1 X184.061 Y160.59 E.00194
; LINE_WIDTH: 0.326733
G1 F3805.327
G1 X184.044 Y160.497 E.00223
G1 X184.024 Y160.496 E.00046
; LINE_WIDTH: 0.290045
G1 F4370.273
G1 X183.95 Y160.496 E.00153
; LINE_WIDTH: 0.251815
G1 F5170.079
G1 X183.875 Y160.496 E.00129
M204 S10000
G1 X183.986 Y160.809 F60000
; LINE_WIDTH: 0.311755
G1 F4017.343
M204 S8000
G1 X184.062 Y160.415 E.00897
; LINE_WIDTH: 0.292766
G1 F4322.669
G1 X184.077 Y160.317 E.00205
; LINE_WIDTH: 0.246315
G1 F5309.874
G2 X184.079 Y159.682 I-2.448 J-.327 E.01077
; LINE_WIDTH: 0.290909
G1 F4355.037
G1 X184.061 Y159.59 E.00194
; LINE_WIDTH: 0.326733
G1 F3805.327
G1 X184.044 Y159.497 E.00223
G1 X184.024 Y159.496 E.00046
; LINE_WIDTH: 0.290044
G1 F4370.274
G1 X183.95 Y159.496 E.00153
; LINE_WIDTH: 0.251815
G1 F5170.081
G1 X183.875 Y159.496 E.00129
M204 S10000
G1 X183.986 Y159.809 F60000
; LINE_WIDTH: 0.311778
G1 F4016.993
M204 S8000
G1 X184.062 Y159.415 E.00897
; LINE_WIDTH: 0.292785
G1 F4322.345
G1 X184.077 Y159.317 E.00205
; LINE_WIDTH: 0.246317
G1 F5309.83
G2 X184.079 Y158.682 I-2.447 J-.327 E.01077
; LINE_WIDTH: 0.291684
G1 F4341.47
G1 X184.061 Y158.586 E.00203
; LINE_WIDTH: 0.352131
G1 F3492.76
G2 X184.036 Y158.464 I-1.488 J.238 E.0032
G1 X183.756 Y158.306 E.00827
M204 S10000
G1 X183.144 Y158.345 F60000
; LINE_WIDTH: 0.600942
G1 F1935.41
M204 S8000
G1 X182.315 Y158.179 E.03923
; LINE_WIDTH: 0.567727
G1 F2057.901
G1 X182.171 Y158.158 E.00636
; LINE_WIDTH: 0.539929
G1 F2173.001
G2 X181.76 Y158.167 I-.171 J1.686 E.01702
; LINE_WIDTH: 0.581543
G1 F2005.114
G1 X181.657 Y158.184 E.00468
; LINE_WIDTH: 0.60961
G1 F1905.804
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.379 Y158.191 F60000
; LINE_WIDTH: 0.600942
G1 F1935.41
M204 S8000
G1 X168.315 Y158.179 E.00301
; LINE_WIDTH: 0.567727
G1 F2057.901
G1 X168.171 Y158.158 E.00636
; LINE_WIDTH: 0.539929
G1 F2173.001
G2 X167.76 Y158.167 I-.171 J1.686 E.01702
; LINE_WIDTH: 0.581543
G1 F2005.114
G1 X167.657 Y158.184 E.00468
; LINE_WIDTH: 0.60961
G1 F1905.804
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.245 Y158.306 F60000
; LINE_WIDTH: 0.35859
G1 F3421.294
M204 S8000
G1 X165.964 Y158.464 E.00846
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331255
G1 F3745.648
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.294469
G1 F4293.403
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.243855
G1 F5374.871
G2 X165.912 Y159.244 I2.461 J.324 E.00944
; LINE_WIDTH: 0.268936
G1 F4778.425
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308637
G1 F4064.479
G2 X166.014 Y159.807 I5.597 J-.793 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.251071
G1 F5188.554
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.289042
G1 F4388.081
G1 X165.977 Y159.497 E.00152
; LINE_WIDTH: 0.314537
G1 F3976.186
G1 X165.956 Y159.497 E.00045
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.257936
G1 F5022.898
G2 X165.903 Y159.868 I6.974 J.853 E.00373
; LINE_WIDTH: 0.237917
G1 F5538.551
G2 X165.912 Y160.244 I3.128 J.109 E.0061
; LINE_WIDTH: 0.268922
G1 F4778.728
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.308642
G1 F4064.397
G2 X166.014 Y160.806 I5.576 J-.79 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251196
G1 F5185.425
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.289253
G1 F4384.309
G1 X165.976 Y160.496 E.00152
; LINE_WIDTH: 0.314539
G1 F3976.168
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.257934
G1 F5022.928
G2 X165.903 Y160.868 I6.963 J.852 E.00373
; LINE_WIDTH: 0.237922
G1 F5538.412
G2 X165.912 Y161.244 I3.136 J.109 E.0061
; LINE_WIDTH: 0.268936
G1 F4778.425
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.307696
G1 F4078.932
G2 X165.992 Y161.694 I4.282 J-.597 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z2.6 I-1.217 J.015 P1  F60000
G1 X167.428 Y279.944 Z2.6
G1 Z2.2
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #12
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z2.6 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z2.2
G1 E2 F600
M104 T1 S220 N0 ;Multi extruder pre heating
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M73 P63 R13
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
G1  X198.678  F366
G1  Y269.319 
M73 P63 R12
G1  X168.178 
M73 P64 R12
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S174 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z2.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E10

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

M73 P65 R12
G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z5.2 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S160.65
M106 P2 S191
G1 X204.318 Y252.694 F60000
G1 Z2.2

; filament start gcode
G17
G3 Z2.6 I0 J-1.217 P1
G1 X199.428 Y252.694 Z2.6
G1 Z2.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X200.928  F600
G1  X199.428  F240
G1  X199.928  F600
G1  Y253.194 
G1  X198.928 
G1  Y252.194 
G1  X200.428 
G1  Y253.694 
G1  X198.428 
G1  Y251.694 
G1  X196.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X167.428  E1.2162 F2473
G1  Y254.944  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X167.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X199.428  E1.2162
G1  Y257.194  E0.0285
G1  X167.428  E1.2162
G1  Y257.944  E0.0285
G1  X199.428  E1.2162
G1  Y258.694  E0.0285
G1  X167.428  E1.2162
G1  Y259.444  E0.0285
G1  X199.428  E1.2162
G1  Y260.194  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #12
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.543 Y251.744   E0.0535
G1 E-0.4000 F1800
M204 S10000
G1  X201.169 Y253.644   F600
G1 E0.4000 F1800
M204 S8000
G3  X200.739 Y256.835   I-1.385 J1.438 E0.1423 F5400
G2  X199.928 Y259.090   I2.785 J2.275 E0.0929
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END

; WIPE_START
G1 F4078.932
M204 S8000
G1 X166.928 Y280.444 E-.00001
G1 X167.578 Y281.204 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z2.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2954
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z2.6
G1 Z2.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 11 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z2.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer11 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 12/25
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z2.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2832
M204 S5000
G1 X197.71 Y162.29 E.14073
M73 P66 R12
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 12 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z2.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer12 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z2.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.216 Y278.401   I8.989 J-9.270 E0.1015 F5400
G1 E-0.4000 F1800
M204 S10000
G1  X165.744 Y276.190   F600
G1 E0.4000 F1800
M204 S8000
G2  X166.928 Y273.548   I-2.389 J-2.656 E0.1133 F5400
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G3  X168.451 Y250.453   I20.946 J15.027 E0.1782
G3  X171.859 Y251.132   I1.345 J2.142 E0.1456
G2  X175.079 Y252.194   I3.241 J-4.414 E0.1310
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X167.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #13
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #12
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2.8 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z2.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S80 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E9

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

M73 P66 R11
G1 Y295
G1 Y265 F18000
G1 Z5.4 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y265.285 F60000
G1 Z2.4
G1 X204.318 Y272.917 Z2.8
G1 X204.318 Y285.121 Z2.8
G1 X162.538 Y285.121
G1 X162.538 Y277.194

; filament start gcode
G1 X167.428 Y277.194
G1 Z2.4
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X165.928 
G1  X167.428  F240
G1  X167.928  F600
G1  Y277.694 
G1  X166.928 
G1  Y276.694 
G1  X168.428 
G1  Y278.194 
G1  X166.428 
G1  Y276.194 
G1  X170.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X199.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X167.428  E1.2162
G1  Y274.194  E0.0285
G1  X199.428  E1.2162
G1  Y273.444  E0.0285
G1  X167.428  E1.2162
G1  Y272.694  E0.0285
G1  X199.428  E1.2162
G1  Y271.944  E0.0285
G1  X167.428  E1.2162
G1  Y271.194  E0.0285
M73 P67 R11
G1  X199.428  E1.2162
G1  Y270.444  E0.0285
G1  X167.428  E1.2162
G1  Y269.694  E0.0285
G1  X199.428  E1.2162
G1  Y268.944  E0.0285
G1  X167.428  E1.2162
G1  Y268.194  E0.0285
G1  X199.428  E1.2162
G1  Y267.444  E0.0285
G1  X167.428  E1.2162
G1  Y266.694  E0.0285
G1  X199.428  E1.2162
G1  Y265.944  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y277.944  E0.0760 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #13
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.719 Y160.298
G1 Z2.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.281 J-.299 E.0296
G1 X175.035 Y159.591 E.00219
G3 X174.766 Y160.336 I-.035 J.409 E.0471
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.22302
G1 X174.59 Y160.018 E-.13183
G1 X174.607 Y159.88 E-.13202
G1 X174.67 Y159.756 E-.13189
G1 X174.831 Y159.626 E-.19663
G1 X174.965 Y159.591 E-.13184
G1 X175.035 Y159.591 E-.06627
G1 X175.169 Y159.626 E-.13187
G1 X175.288 Y159.707 E-.1369
G1 X175.391 Y159.873 E-.18601
G1 X175.408 Y160.048 E-.16712
G1 X175.35 Y160.215 E-.1679
G1 X175.282 Y160.292 E-.09671
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.719 Y160.298 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.281 J-.299 E.0296
G1 X174.035 Y159.591 E.00219
G3 X173.766 Y160.336 I-.035 J.409 E.0471
; COOLING_NODE: 2
M204 S10000
G1 X173.39 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.39 J.126 E.06349
G1 X173.035 Y159.591 E.00219
G3 X173.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 5
M204 S10000
G1 X172.39 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.39 J.126 E.06349
G1 X172.035 Y159.591 E.00219
G3 X172.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 6
M204 S10000
G1 X171.389 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.389 J.123 E.06308
G1 X171.035 Y159.591 E.00219
G3 X171.367 Y159.818 I-.035 J.406 E.01319
; COOLING_NODE: 7
M204 S10000
G1 X171.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.255 J-.318 E.04769
G1 X171.035 Y158.591 E.00219
G3 X171.299 Y159.274 I-.035 J.406 E.02855
; COOLING_NODE: 4
M204 S10000
G1 X172.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.257 J-.319 E.04801
G1 X172.035 Y158.591 E.00219
G3 X172.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 3
M204 S10000
G1 X173.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.257 J-.319 E.04801
G1 X173.035 Y158.591 E.00219
G3 X173.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 8
M204 S10000
G1 X174.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.255 J-.318 E.0477
G1 X174.035 Y158.591 E.00219
G3 X174.299 Y159.274 I-.035 J.406 E.02856
; COOLING_NODE: 9
M204 S10000
G1 X175.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.255 J-.318 E.0477
G1 X175.035 Y158.591 E.00219
G3 X175.299 Y159.274 I-.035 J.406 E.02856
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X175.137 Y159.387 E-.18757
G1 X175 Y159.411 E-.13184
G1 X174.863 Y159.387 E-.13192
G1 X174.692 Y159.271 E-.19666
G1 X174.619 Y159.153 E-.13191
G1 X174.59 Y159.018 E-.13182
G1 X174.607 Y158.88 E-.13202
G1 X174.67 Y158.756 E-.13189
G1 X174.831 Y158.626 E-.19663
G1 X174.965 Y158.591 E-.13184
G1 X175.035 Y158.591 E-.06627
G1 X175.169 Y158.626 E-.13187
G1 X175.288 Y158.707 E-.1369
G1 X175.322 Y158.761 E-.06087
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.257 J-.319 E.04801
G1 X177.035 Y158.591 E.00219
G3 X177.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X177.137 Y159.387 E-.18779
G1 X177 Y159.411 E-.13191
G1 X176.834 Y159.376 E-.16095
G1 X176.692 Y159.271 E-.16785
G1 X176.619 Y159.153 E-.13191
G1 X176.59 Y159.018 E-.13182
G1 X176.607 Y158.88 E-.13203
G1 X176.67 Y158.756 E-.13185
G1 X176.831 Y158.626 E-.19665
G1 X176.965 Y158.591 E-.13184
G1 X177.035 Y158.591 E-.06627
G1 X177.169 Y158.626 E-.13187
G1 X177.288 Y158.707 E-.1369
G1 X177.322 Y158.761 E-.06038
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.257 J-.319 E.04801
G1 X176.035 Y158.591 E.00219
G3 X176.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.18779
G1 X176 Y159.411 E-.13191
G1 X175.834 Y159.376 E-.16095
G1 X175.692 Y159.271 E-.16785
G1 X175.619 Y159.153 E-.13191
G1 X175.59 Y159.018 E-.13182
G1 X175.607 Y158.88 E-.13202
G1 X175.67 Y158.756 E-.13189
G1 X175.831 Y158.626 E-.19663
G1 X175.965 Y158.591 E-.13184
G1 X176.035 Y158.591 E-.06627
G1 X176.169 Y158.626 E-.13187
G1 X176.288 Y158.707 E-.1369
G1 X176.322 Y158.761 E-.06038
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X175.59 Y160.017 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.41 J-.018 E.01967
G1 X176.035 Y159.591 E.00219
G3 X175.597 Y160.077 I-.035 J.409 E.05703
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18788
G1 X175.67 Y159.756 E-.13189
G1 X175.831 Y159.626 E-.19663
G1 X175.965 Y159.591 E-.13184
G1 X176.035 Y159.591 E-.06627
G1 X176.169 Y159.626 E-.13187
G1 X176.288 Y159.707 E-.1369
G1 X176.391 Y159.873 E-.18601
G1 X176.408 Y160.048 E-.16712
G1 X176.35 Y160.215 E-.1679
G1 X176.258 Y160.32 E-.13185
G1 X176.137 Y160.387 E-.13191
G1 X176 Y160.411 E-.13191
G1 X176 Y160.411 E-.00003
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.62 Y160.153 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.38 J-.154 E.02403
G1 X177.035 Y159.591 E.00219
G3 X176.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 14
M204 S10000
G1 X177.62 Y160.153 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.38 J-.154 E.02403
G1 X178.035 Y159.591 E.00219
G3 X177.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X177.59 Y160.018 E-.18757
G1 X177.607 Y159.88 E-.13203
G1 X177.67 Y159.756 E-.13185
G1 X177.831 Y159.626 E-.19665
G1 X177.965 Y159.591 E-.13184
G1 X178.035 Y159.591 E-.06627
G1 X178.169 Y159.626 E-.13187
G1 X178.288 Y159.707 E-.1369
G1 X178.391 Y159.873 E-.18601
G1 X178.408 Y160.048 E-.16712
G1 X178.35 Y160.215 E-.1679
G1 X178.258 Y160.32 E-.13185
G1 X178.137 Y160.387 E-.13191
G1 X178.137 Y160.387 E-.00024
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.257 J-.319 E.04801
G1 X178.035 Y158.591 E.00219
G3 X178.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 16
M204 S10000
G1 X179.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.257 J-.319 E.04801
G1 X179.035 Y158.591 E.00219
G3 X179.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 18
M204 S10000
G1 X180.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.257 J-.319 E.04801
G1 X180.035 Y158.591 E.00219
G3 X180.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X180.137 Y159.387 E-.18779
G1 X180 Y159.411 E-.13184
G1 X179.863 Y159.387 E-.13192
G1 X179.692 Y159.271 E-.19666
G1 X179.619 Y159.153 E-.13191
G1 X179.59 Y159.018 E-.13182
G1 X179.607 Y158.88 E-.13203
G1 X179.673 Y158.751 E-.13689
G1 X179.825 Y158.628 E-.18603
G1 X179.965 Y158.591 E-.13801
G1 X180.035 Y158.591 E-.06627
G1 X180.169 Y158.626 E-.13187
G1 X180.288 Y158.707 E-.1369
G1 X180.322 Y158.761 E-.06005
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.135 Y160.382 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04339
G1 X180.035 Y159.591 E.00219
G3 X180.19 Y160.358 I-.035 J.406 E.03288
; COOLING_NODE: 15
M204 S10000
G1 X179.39 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.39 J.126 E.06349
G1 X179.035 Y159.591 E.00219
G3 X179.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X179.408 Y160.048 E-.22209
G1 X179.35 Y160.215 E-.16789
G1 X179.258 Y160.32 E-.1319
G1 X179.137 Y160.387 E-.13188
G1 X179 Y160.411 E-.13191
G1 X178.863 Y160.387 E-.13189
G1 X178.719 Y160.299 E-.16092
G1 X178.619 Y160.153 E-.16789
G1 X178.59 Y160.018 E-.13183
G1 X178.607 Y159.88 E-.13203
G1 X178.67 Y159.756 E-.13185
G1 X178.831 Y159.626 E-.1966
G1 X178.893 Y159.609 E-.06133
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.257 J-.319 E.04801
G1 X179.035 Y160.591 E.00219
G3 X179.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 29
M204 S10000
G1 X180.257 Y161.319 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.257 J-.319 E.04801
G1 X180.035 Y160.591 E.00219
G3 X180.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 28
M204 S10000
G1 X181.257 Y161.319 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.257 J-.319 E.04801
G1 X181.035 Y160.591 E.00219
G3 X181.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 27
M204 S10000
G1 X182.257 Y161.319 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.257 J-.319 E.04801
G1 X182.035 Y160.591 E.00219
G3 X182.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 26
M204 S10000
G1 X183.257 Y161.319 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.257 J-.319 E.04801
G1 X183.035 Y160.591 E.00219
G3 X183.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.1878
G1 X183 Y161.411 E-.13191
G1 X182.834 Y161.376 E-.16095
G1 X182.692 Y161.271 E-.16785
G1 X182.619 Y161.153 E-.13191
G1 X182.59 Y161.018 E-.13182
G1 X182.607 Y160.88 E-.13202
G1 X182.67 Y160.756 E-.13189
G1 X182.831 Y160.626 E-.19658
G1 X182.965 Y160.591 E-.13192
G1 X183.035 Y160.591 E-.06623
G1 X183.169 Y160.626 E-.13187
G1 X183.288 Y160.707 E-.1369
G1 X183.322 Y160.761 E-.06035
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z2.8 F60000
G1 Z2.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.626 Y160.501 I-.372 J-.723 E.04842
G2 X183.626 Y159.501 I-.63 J-.5 E.03653
G2 X183.363 Y158.285 I-.627 J-.501 E.04821
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 25
; WIPE_START
G1 X183.411 Y161.898 E-.93941
G1 X183.358 Y161.725 E-.17158
G1 X183.505 Y161.626 E-.16891
G1 X183.685 Y161.422 E-.25804
G1 X183.755 Y161.283 E-.14768
G1 X183.799 Y161.096 E-.18231
G1 X183.8 Y161.063 E-.03208
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.257 J-.319 E.04801
G1 X183.035 Y158.591 E.00219
G3 X183.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.18779
G1 X183 Y159.411 E-.13191
G1 X182.834 Y159.376 E-.16095
G1 X182.692 Y159.271 E-.16785
G1 X182.619 Y159.153 E-.13191
G1 X182.59 Y159.018 E-.13182
G1 X182.607 Y158.88 E-.13202
G1 X182.67 Y158.756 E-.13189
G1 X182.831 Y158.626 E-.19658
G1 X182.965 Y158.591 E-.13193
G1 X183.035 Y158.591 E-.06623
G1 X183.169 Y158.626 E-.13187
G1 X183.288 Y158.707 E-.1369
G1 X183.322 Y158.761 E-.06037
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.62 Y160.153 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.38 J-.154 E.02403
G1 X183.035 Y159.591 E.00219
G3 X182.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 23
M204 S10000
G1 X182.39 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.39 J.126 E.06349
G1 X182.035 Y159.591 E.00219
G3 X182.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 20
M204 S10000
G1 X181.39 Y159.874 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.39 J.126 E.06349
G1 X181.035 Y159.591 E.00219
G3 X181.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 21
M204 S10000
G1 X181.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.257 J-.319 E.04801
G1 X181.035 Y158.591 E.00219
G3 X181.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 22
M204 S10000
G1 X182.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.257 J-.319 E.04801
G1 X182.035 Y158.591 E.00219
G3 X182.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X182.137 Y159.387 E-.18775
G1 X182 Y159.411 E-.13191
G1 X181.834 Y159.376 E-.16095
G1 X181.692 Y159.271 E-.16785
G1 X181.619 Y159.153 E-.13191
G1 X181.59 Y159.018 E-.13182
G1 X181.607 Y158.88 E-.13203
G1 X181.67 Y158.756 E-.13185
G1 X181.831 Y158.626 E-.1966
G1 X181.965 Y158.591 E-.13193
G1 X182.035 Y158.591 E-.06623
G1 X182.169 Y158.626 E-.13187
G1 X182.288 Y158.707 E-.1369
G1 X182.322 Y158.761 E-.06041
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.257 J-.319 E.04801
G1 X178.035 Y160.591 E.00219
G3 X178.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178.137 Y161.387 E-.1878
G1 X178 Y161.411 E-.13191
G1 X177.834 Y161.376 E-.16095
G1 X177.692 Y161.271 E-.16785
G1 X177.619 Y161.153 E-.13191
G1 X177.59 Y161.018 E-.13182
G1 X177.607 Y160.88 E-.13203
G1 X177.67 Y160.756 E-.13185
G1 X177.831 Y160.626 E-.19665
G1 X177.965 Y160.591 E-.13184
G1 X178.035 Y160.591 E-.06627
G1 X178.169 Y160.626 E-.13187
G1 X178.288 Y160.707 E-.1369
G1 X178.322 Y160.761 E-.06037
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.257 J-.319 E.04801
G1 X177.035 Y160.591 E.00219
G3 X177.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177.137 Y161.387 E-.1878
G1 X177 Y161.411 E-.13191
G1 X176.834 Y161.376 E-.16095
G1 X176.692 Y161.271 E-.16785
G1 X176.619 Y161.153 E-.13191
G1 X176.59 Y161.018 E-.13182
G1 X176.607 Y160.88 E-.13203
G1 X176.67 Y160.756 E-.13185
G1 X176.831 Y160.626 E-.19665
G1 X176.965 Y160.591 E-.13184
G1 X177.035 Y160.591 E-.06627
G1 X177.169 Y160.626 E-.13187
G1 X177.288 Y160.707 E-.1369
G1 X177.322 Y160.761 E-.06037
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.257 J-.319 E.04801
G1 X176.035 Y160.591 E.00219
G3 X176.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176.137 Y161.387 E-.1878
G1 X176 Y161.411 E-.13191
G1 X175.834 Y161.376 E-.16095
G1 X175.692 Y161.271 E-.16785
G1 X175.619 Y161.153 E-.13191
G1 X175.59 Y161.018 E-.13182
G1 X175.607 Y160.88 E-.13202
G1 X175.67 Y160.756 E-.13189
G1 X175.831 Y160.626 E-.19663
G1 X175.965 Y160.591 E-.13184
G1 X176.035 Y160.591 E-.06627
G1 X176.169 Y160.626 E-.13187
G1 X176.288 Y160.707 E-.1369
G1 X176.322 Y160.761 E-.06035
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.255 Y161.315 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.255 J-.318 E.0477
G1 X175.035 Y160.591 E.00219
G3 X175.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.137 Y161.387 E-.18758
G1 X175 Y161.411 E-.13184
G1 X174.863 Y161.387 E-.13192
G1 X174.692 Y161.271 E-.19666
G1 X174.619 Y161.153 E-.13191
G1 X174.59 Y161.018 E-.13182
G1 X174.607 Y160.88 E-.13202
G1 X174.67 Y160.756 E-.13189
G1 X174.831 Y160.626 E-.19663
G1 X174.965 Y160.591 E-.13184
G1 X175.035 Y160.591 E-.06627
G1 X175.169 Y160.626 E-.13187
G1 X175.288 Y160.707 E-.1369
G1 X175.322 Y160.761 E-.06086
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.255 Y161.315 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.255 J-.318 E.0477
G1 X174.035 Y160.591 E.00219
G3 X174.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174.137 Y161.387 E-.18759
G1 X174 Y161.411 E-.13184
G1 X173.863 Y161.387 E-.13192
G1 X173.692 Y161.271 E-.19666
G1 X173.619 Y161.153 E-.13191
G1 X173.59 Y161.018 E-.13182
G1 X173.607 Y160.88 E-.13202
G1 X173.67 Y160.756 E-.13189
G1 X173.831 Y160.626 E-.19663
G1 X173.965 Y160.591 E-.13184
G1 X174.035 Y160.591 E-.06627
G1 X174.169 Y160.626 E-.13187
G1 X174.288 Y160.707 E-.1369
G1 X174.322 Y160.761 E-.06085
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.257 J-.319 E.04801
G1 X173.035 Y160.591 E.00219
G3 X173.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.18781
G1 X173 Y161.411 E-.13191
G1 X172.834 Y161.376 E-.16095
G1 X172.692 Y161.271 E-.16785
G1 X172.619 Y161.153 E-.13191
G1 X172.59 Y161.018 E-.13182
G1 X172.607 Y160.88 E-.13203
G1 X172.67 Y160.756 E-.13185
G1 X172.831 Y160.626 E-.1966
G1 X172.965 Y160.591 E-.13192
G1 X173.035 Y160.591 E-.06623
G1 X173.169 Y160.626 E-.13186
G1 X173.288 Y160.707 E-.1369
G1 X173.322 Y160.761 E-.06036
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.257 J-.319 E.04801
G1 X172.035 Y160.591 E.00219
G3 X172.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X172.137 Y161.387 E-.18778
G1 X172 Y161.411 E-.13191
G1 X171.834 Y161.376 E-.16095
G1 X171.692 Y161.271 E-.16785
G1 X171.619 Y161.153 E-.13191
G1 X171.59 Y161.018 E-.13182
G1 X171.607 Y160.88 E-.13203
G1 X171.67 Y160.756 E-.13185
G1 X171.831 Y160.626 E-.1966
G1 X171.965 Y160.591 E-.13192
G1 X172.035 Y160.591 E-.06623
G1 X172.169 Y160.626 E-.13186
G1 X172.288 Y160.707 E-.1369
G1 X172.322 Y160.761 E-.06039
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.255 Y161.315 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
M73 P68 R11
G3 X170.965 Y160.591 I-.255 J-.318 E.04769
G1 X171.035 Y160.591 E.00219
G3 X171.299 Y161.274 I-.035 J.406 E.02855
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.137 Y161.387 E-.18754
G1 X171 Y161.411 E-.13191
G1 X170.834 Y161.376 E-.16095
G1 X170.692 Y161.271 E-.16785
G1 X170.619 Y161.153 E-.13191
G1 X170.59 Y161.018 E-.13182
G1 X170.607 Y160.88 E-.13203
G1 X170.673 Y160.751 E-.13689
G1 X170.825 Y160.628 E-.18599
G1 X170.965 Y160.591 E-.13809
G1 X171.035 Y160.591 E-.06623
G1 X171.169 Y160.626 E-.13186
G1 X171.288 Y160.707 E-.1369
G1 X171.322 Y160.761 E-.06003
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.255 Y161.315 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.255 J-.318 E.04769
G1 X170.035 Y160.591 E.00219
G3 X170.299 Y161.274 I-.035 J.406 E.02855
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X170.137 Y161.387 E-.18751
G1 X170 Y161.411 E-.13191
G1 X169.834 Y161.376 E-.16095
G1 X169.692 Y161.271 E-.16785
G1 X169.619 Y161.153 E-.13191
G1 X169.59 Y161.018 E-.13182
G1 X169.607 Y160.88 E-.13203
G1 X169.673 Y160.751 E-.1369
G1 X169.825 Y160.628 E-.18599
G1 X169.965 Y160.591 E-.13809
G1 X170.035 Y160.591 E-.06623
G1 X170.169 Y160.626 E-.13187
G1 X170.288 Y160.707 E-.1369
G1 X170.322 Y160.761 E-.06005
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.389 Y159.874 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.389 J.123 E.06308
G1 X170.035 Y159.591 E.00219
G3 X170.367 Y159.818 I-.035 J.406 E.01319
; COOLING_NODE: 43
M204 S10000
G1 X170.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.255 J-.318 E.04769
G1 X170.035 Y158.591 E.00219
G3 X170.299 Y159.274 I-.035 J.406 E.02855
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170.137 Y159.387 E-.1875
G1 X170 Y159.411 E-.13191
G1 X169.834 Y159.376 E-.16095
G1 X169.692 Y159.271 E-.16785
G1 X169.619 Y159.153 E-.13191
G1 X169.59 Y159.018 E-.13182
G1 X169.607 Y158.88 E-.13203
G1 X169.673 Y158.751 E-.13689
G1 X169.825 Y158.628 E-.18599
G1 X169.965 Y158.591 E-.13809
G1 X170.035 Y158.591 E-.06623
G1 X170.169 Y158.626 E-.13187
G1 X170.288 Y158.707 E-.1369
G1 X170.322 Y158.761 E-.06007
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X169.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.257 J-.319 E.04801
G1 X169.035 Y160.591 E.00219
G3 X169.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169.137 Y161.387 E-.18781
G1 X169 Y161.411 E-.13191
G1 X168.834 Y161.376 E-.16095
G1 X168.692 Y161.271 E-.16785
G1 X168.619 Y161.153 E-.13191
G1 X168.59 Y161.018 E-.13182
G1 X168.607 Y160.88 E-.13202
G1 X168.67 Y160.756 E-.13189
G1 X168.831 Y160.626 E-.19663
G1 X168.965 Y160.591 E-.13184
G1 X169.035 Y160.591 E-.06627
G1 X169.169 Y160.626 E-.13187
G1 X169.288 Y160.707 E-.1369
G1 X169.322 Y160.761 E-.06035
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.257 J-.319 E.04801
G1 X168.035 Y160.591 E.00219
G3 X168.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.18778
G1 X168 Y161.411 E-.13191
G1 X167.834 Y161.376 E-.16095
G1 X167.692 Y161.271 E-.16785
G1 X167.619 Y161.153 E-.13191
G1 X167.59 Y161.018 E-.13182
G1 X167.607 Y160.88 E-.13203
G1 X167.67 Y160.756 E-.13185
G1 X167.831 Y160.626 E-.1966
G1 X167.965 Y160.591 E-.13192
G1 X168.035 Y160.591 E-.06623
G1 X168.169 Y160.626 E-.13186
G1 X168.288 Y160.707 E-.1369
G1 X168.322 Y160.761 E-.06039
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.257 Y161.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.257 J-.319 E.04801
G1 X167.035 Y160.591 E.00219
G3 X167.301 Y161.277 I-.035 J.409 E.02869
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.137 Y161.387 E-.18778
G1 X167 Y161.411 E-.13191
G1 X166.834 Y161.376 E-.16095
G1 X166.692 Y161.271 E-.16785
G1 X166.619 Y161.153 E-.13191
G1 X166.59 Y161.018 E-.13182
G1 X166.607 Y160.88 E-.13203
G1 X166.67 Y160.756 E-.13185
G1 X166.831 Y160.626 E-.1966
G1 X166.965 Y160.591 E-.13192
G1 X167.035 Y160.591 E-.06623
G1 X167.169 Y160.626 E-.13186
G1 X167.288 Y160.707 E-.1369
G1 X167.322 Y160.761 E-.06039
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.39 Y159.874 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.39 J.126 E.06349
G1 X167.035 Y159.591 E.00219
G3 X167.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.408 Y160.048 E-.22209
G1 X167.35 Y160.215 E-.16789
G1 X167.258 Y160.32 E-.1319
G1 X167.137 Y160.387 E-.13188
G1 X167 Y160.411 E-.13191
G1 X166.863 Y160.387 E-.13189
G1 X166.719 Y160.299 E-.16092
G1 X166.619 Y160.153 E-.16789
G1 X166.59 Y160.018 E-.13183
G1 X166.607 Y159.88 E-.13203
G1 X166.67 Y159.756 E-.13185
G1 X166.831 Y159.626 E-.1966
G1 X166.893 Y159.609 E-.06134
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.39 Y159.874 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.39 J.126 E.06349
G1 X168.035 Y159.591 E.00219
G3 X168.368 Y159.818 I-.035 J.409 E.01322
; COOLING_NODE: 41
M204 S10000
G1 X168.62 Y160.153 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.38 J-.154 E.02403
G1 X169.035 Y159.591 E.00219
G3 X168.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.59 Y160.018 E-.18757
G1 X168.607 Y159.88 E-.13202
G1 X168.67 Y159.756 E-.13189
G1 X168.831 Y159.626 E-.19663
G1 X168.965 Y159.591 E-.13184
G1 X169.035 Y159.591 E-.06627
G1 X169.169 Y159.626 E-.13187
G1 X169.288 Y159.707 E-.1369
G1 X169.391 Y159.873 E-.18601
G1 X169.408 Y160.048 E-.16712
G1 X169.35 Y160.215 E-.1679
G1 X169.258 Y160.32 E-.13185
G1 X169.137 Y160.387 E-.13191
G1 X169.137 Y160.387 E-.00022
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.257 J-.319 E.04801
G1 X169.035 Y158.591 E.00219
G3 X169.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.1878
G1 X169 Y159.411 E-.13191
G1 X168.834 Y159.376 E-.16095
G1 X168.692 Y159.271 E-.16785
G1 X168.619 Y159.153 E-.13191
G1 X168.59 Y159.018 E-.13182
G1 X168.607 Y158.88 E-.13202
G1 X168.67 Y158.756 E-.13189
G1 X168.831 Y158.626 E-.19663
G1 X168.965 Y158.591 E-.13184
G1 X169.035 Y158.591 E-.06627
G1 X169.169 Y158.626 E-.13187
G1 X169.288 Y158.707 E-.1369
G1 X169.322 Y158.761 E-.06036
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.257 J-.319 E.04801
G1 X168.035 Y158.591 E.00219
G3 X168.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X168.137 Y159.387 E-.18776
G1 X168 Y159.411 E-.13191
G1 X167.834 Y159.376 E-.16095
G1 X167.692 Y159.271 E-.16785
G1 X167.619 Y159.153 E-.13191
G1 X167.59 Y159.018 E-.13182
G1 X167.607 Y158.88 E-.13203
G1 X167.67 Y158.756 E-.13185
G1 X167.831 Y158.626 E-.1966
G1 X167.965 Y158.591 E-.13193
G1 X168.035 Y158.591 E-.06623
G1 X168.169 Y158.626 E-.13187
G1 X168.288 Y158.707 E-.1369
G1 X168.322 Y158.761 E-.0604
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.257 Y159.319 Z2.8 F60000
G1 Z2.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.257 J-.319 E.04801
G1 X167.035 Y158.591 E.00219
G3 X167.301 Y159.277 I-.035 J.409 E.02869
; COOLING_NODE: 48
M204 S10000
G1 X166.37 Y159.495 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.36 Y160.511 I.686 J.514 E.03679
G2 X166.643 Y161.718 I.67 J.48 E.0475
G1 X166.594 Y161.898 E.00631
G1 X165.602 Y161.898 E.03357
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04592
; COOLING_NODE: 51
; WIPE_START
G1 X166.282 Y159.638 E-.18823
G1 X166.231 Y159.764 E-.1295
G1 X166.196 Y160.034 E-.25851
G1 X166.254 Y160.3 E-.25812
G1 X166.36 Y160.511 E-.22446
G1 X166.282 Y160.638 E-.14174
G1 X166.231 Y160.764 E-.12951
G1 X166.202 Y160.898 E-.12966
G1 X166.214 Y161.169 E-.25835
G1 X166.254 Y161.3 E-.12952
G1 X166.283 Y161.347 E-.05239
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.905 Y161.735 Z2.8 F60000
G1 X184.79 Y162.29 Z2.8
G1 Z2.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.014 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.29888
G1 F4219.42
M204 S8000
G1 X184.069 Y161.383 E.00674
; LINE_WIDTH: 0.279517
G1 F4564.738
G1 X184.083 Y161.263 E.00237
; LINE_WIDTH: 0.245859
G1 F5321.801
G2 X184.075 Y160.655 I-2.343 J-.274 E.01029
; LINE_WIDTH: 0.285696
G1 F4448.546
G1 X183.993 Y160.161 E.01011
M204 S10000
G1 X183.99 Y159.825 F60000
; LINE_WIDTH: 0.298884
G1 F4219.346
M204 S8000
G1 X184.069 Y159.383 E.00957
; LINE_WIDTH: 0.279517
G1 F4564.738
G1 X184.083 Y159.263 E.00237
; LINE_WIDTH: 0.245859
G1 F5321.794
G2 X184.075 Y158.655 I-2.343 J-.274 E.01029
; LINE_WIDTH: 0.285696
G1 F4448.546
G1 X184.017 Y158.306 E.00715
M204 S10000
G1 X183.993 Y159.161 F60000
G1 F4448.546
M204 S8000
G1 X184.075 Y159.655 E.01011
; LINE_WIDTH: 0.24586
G1 F5321.785
G3 X184.083 Y160.263 I-2.336 J.334 E.0103
; LINE_WIDTH: 0.279513
G1 F4564.806
G1 X184.069 Y160.383 E.00237
; LINE_WIDTH: 0.29888
G1 F4219.418
G1 X183.99 Y160.825 E.00956
; WIPE_START
G1 X184.069 Y160.383 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.141 Y158.357 Z2.8 F60000
G1 Z2.4
G1 E2 F600
; LINE_WIDTH: 0.6096
G1 F1905.839
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574711
G1 F2030.875
G2 X182.196 Y158.161 I-.35 J1.73 E.00656
; LINE_WIDTH: 0.540438
G1 F2170.779
G2 X181.76 Y158.166 I-.194 J1.906 E.01809
; LINE_WIDTH: 0.581558
G1 F2005.06
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609628
G1 F1905.746
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.6096
G1 F1905.839
M204 S8000
G1 X168.343 Y158.184 E.00231
; LINE_WIDTH: 0.574711
G1 F2030.875
G2 X168.196 Y158.161 I-.35 J1.73 E.00656
; LINE_WIDTH: 0.540438
G1 F2170.779
G2 X167.76 Y158.166 I-.194 J1.906 E.01809
; LINE_WIDTH: 0.581558
G1 F2005.06
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609628
G1 F1905.746
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.247 Y158.306 F60000
; LINE_WIDTH: 0.358572
G1 F3421.496
M204 S8000
G1 X165.964 Y158.464 E.00851
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331254
G1 F3745.658
G1 X165.942 Y158.575 E.00209
; LINE_WIDTH: 0.294564
G1 F4291.789
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.243879
G1 F5374.251
G2 X165.912 Y159.244 I2.457 J.325 E.00944
; LINE_WIDTH: 0.268927
G1 F4778.623
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308656
G1 F4064.19
G2 X166.014 Y159.807 I5.605 J-.795 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.251067
G1 F5188.661
M204 S8000
G1 X166.051 Y159.496 E.00128
; LINE_WIDTH: 0.289165
G1 F4385.882
G1 X165.976 Y159.496 E.00152
; LINE_WIDTH: 0.314589
G1 F3975.432
G1 X165.956 Y159.497 E.00045
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.257973
G1 F5022.029
G2 X165.903 Y159.868 I6.999 J.858 E.00373
; LINE_WIDTH: 0.237927
G1 F5538.264
G2 X165.912 Y160.244 I3.135 J.109 E.0061
; LINE_WIDTH: 0.268937
G1 F4778.412
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.308653
G1 F4064.229
G2 X166.014 Y160.807 I5.657 J-.802 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251064
G1 F5188.736
M204 S8000
G1 X166.051 Y160.496 E.00128
; LINE_WIDTH: 0.289122
G1 F4386.653
G1 X165.976 Y160.496 E.00152
; LINE_WIDTH: 0.314584
G1 F3975.511
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.257973
G1 F5022.029
G2 X165.903 Y160.868 I6.999 J.858 E.00373
; LINE_WIDTH: 0.237924
G1 F5538.36
G2 X165.912 Y161.244 I3.136 J.109 E.0061
; LINE_WIDTH: 0.268936
G1 F4778.423
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.307734
G1 F4078.346
G2 X165.992 Y161.694 I4.275 J-.596 E.00818
M204 S10000
G1 X166.779 Y161.966 F60000
; LINE_WIDTH: 0.65687
G1 F1759.101
M204 S8000
G2 X168.07 Y161.602 I-3.669 J-15.481 E.06853
M204 S10000
G1 X168.315 Y161.821 F60000
; LINE_WIDTH: 0.560811
G1 F2085.381
M204 S8000
G3 X168.124 Y161.846 I-.412 J-2.439 E.00829
; LINE_WIDTH: 0.536128
G1 F2189.748
G3 X167.811 Y161.84 I-.115 J-2.237 E.01285
; LINE_WIDTH: 0.572187
G1 F2040.56
G1 X167.671 Y161.819 E.00621
; LINE_WIDTH: 0.607293
G1 F1913.628
G1 X166.866 Y161.647 E.03866
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1913.628
G1 X167.671 Y161.819 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 13/25
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I.254 J1.19 P1  F60000
G1 X174.741 Y160.312 Z2.8
G1 Z2.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.259 J-.315 E.0303
G1 X175.035 Y159.591 E.00218
G3 X174.791 Y160.347 I-.035 J.406 E.04597
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.621 Y160.16 E-.24011
G1 X174.59 Y160.017 E-.1384
G1 X174.607 Y159.88 E-.13203
G1 X174.688 Y159.733 E-.15853
G1 X174.831 Y159.626 E-.17026
G1 X174.965 Y159.591 E-.13186
G1 X175.035 Y159.591 E-.06615
G1 X175.169 Y159.626 E-.13185
G1 X175.284 Y159.704 E-.13204
G1 X175.393 Y159.88 E-.19653
G1 X175.41 Y160.017 E-.13197
G1 X175.381 Y160.153 E-.13183
G1 X175.308 Y160.271 E-.13197
G1 X175.303 Y160.275 E-.00647
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.739 Y160.315 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.261 J-.316 E.03042
G1 X174.035 Y159.591 E.00218
G3 X173.788 Y160.35 I-.035 J.409 E.04628
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00218
G3 X173.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 5
M204 S10000
G1 X172.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00218
G3 X172.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 4
M204 S10000
G1 X172.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.307 J-.271 E.05019
G1 X172.035 Y158.591 E.00218
G3 X172.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 3
M204 S10000
G1 X173.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.257 J-.319 E.04801
G1 X173.035 Y158.591 E.00218
G3 X173.301 Y159.278 I-.035 J.409 E.0287
; COOLING_NODE: 8
M204 S10000
G1 X174.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.255 J-.318 E.0477
G1 X174.035 Y158.591 E.00218
G3 X174.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 9
M204 S10000
G1 X175.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.257 J-.319 E.04801
G1 X175.035 Y158.591 E.00218
G3 X175.301 Y159.278 I-.035 J.409 E.0287
; COOLING_NODE: 10
M204 S10000
G1 X176.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.257 J-.319 E.04801
G1 X176.035 Y158.591 E.00218
G3 X176.301 Y159.278 I-.035 J.409 E.0287
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.18751
G1 X176 Y159.411 E-.13186
G1 X175.863 Y159.387 E-.13185
G1 X175.742 Y159.32 E-.13195
G1 X175.619 Y159.153 E-.19661
G1 X175.59 Y159.017 E-.13187
G1 X175.607 Y158.88 E-.13203
G1 X175.688 Y158.733 E-.15853
G1 X175.831 Y158.626 E-.17026
G1 X175.965 Y158.591 E-.13186
G1 X176.035 Y158.591 E-.06615
G1 X176.169 Y158.626 E-.13185
G1 X176.284 Y158.704 E-.13204
G1 X176.32 Y158.762 E-.06563
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.593 Y160.017 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00218
G3 X175.6 Y160.077 I-.035 J.406 E.05663
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18764
G1 X175.688 Y159.733 E-.15853
G1 X175.831 Y159.626 E-.17026
G1 X175.965 Y159.591 E-.13186
G1 X176.035 Y159.591 E-.06615
G1 X176.169 Y159.626 E-.13185
G1 X176.284 Y159.704 E-.13204
G1 X176.393 Y159.88 E-.19653
G1 X176.41 Y160.017 E-.13197
G1 X176.381 Y160.153 E-.13183
G1 X176.308 Y160.271 E-.13197
G1 X176.137 Y160.387 E-.19665
G1 X176 Y160.411 E-.13186
G1 X175.999 Y160.411 E-.00086
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.622 Y160.159 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.378 J-.16 E.02425
G1 X177.035 Y159.591 E.00218
G3 X176.65 Y160.212 I-.035 J.409 E.05246
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.19383
G1 X176.607 Y159.88 E-.13203
G1 X176.67 Y159.756 E-.1318
G1 X176.77 Y159.66 E-.132
G1 X176.965 Y159.591 E-.1966
G1 X177.035 Y159.591 E-.06615
G1 X177.169 Y159.626 E-.13185
G1 X177.284 Y159.704 E-.13204
G1 X177.393 Y159.88 E-.19653
G1 X177.41 Y160.017 E-.13197
G1 X177.381 Y160.153 E-.13183
G1 X177.308 Y160.271 E-.13197
G1 X177.141 Y160.384 E-.19141
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.305 Y159.268 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.305 J-.271 E.04986
G1 X177.035 Y158.591 E.00218
G3 X177.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 17
M204 S10000
G1 X178.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.255 J-.318 E.0477
G1 X178.035 Y158.591 E.00218
G3 X178.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178.137 Y159.387 E-.18733
G1 X178 Y159.411 E-.13187
G1 X177.863 Y159.387 E-.13185
G1 X177.742 Y159.32 E-.13195
G1 X177.619 Y159.153 E-.19661
G1 X177.59 Y159.017 E-.13187
G1 X177.607 Y158.88 E-.13203
G1 X177.67 Y158.756 E-.1318
G1 X177.77 Y158.66 E-.132
G1 X177.965 Y158.591 E-.1966
G1 X178.035 Y158.591 E-.06615
G1 X178.169 Y158.626 E-.13185
G1 X178.284 Y158.704 E-.13204
G1 X178.321 Y158.763 E-.06606
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.622 Y160.159 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.378 J-.16 E.02425
G1 X178.035 Y159.591 E.00218
G3 X177.65 Y160.212 I-.035 J.409 E.05246
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.19383
G1 X177.607 Y159.88 E-.13203
G1 X177.67 Y159.756 E-.1318
G1 X177.77 Y159.66 E-.132
G1 X177.965 Y159.591 E-.1966
G1 X178.035 Y159.591 E-.06615
G1 X178.169 Y159.626 E-.13185
G1 X178.284 Y159.704 E-.13204
G1 X178.393 Y159.88 E-.19653
G1 X178.41 Y160.017 E-.13197
G1 X178.381 Y160.153 E-.13183
G1 X178.308 Y160.271 E-.13197
G1 X178.141 Y160.384 E-.1914
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.255 Y161.315 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.255 J-.318 E.0477
G1 X178.035 Y160.591 E.00218
G3 X178.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 32
M204 S10000
G1 X177.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.305 J-.271 E.04986
G1 X177.035 Y160.591 E.00218
G3 X177.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177.137 Y161.387 E-.25068
G1 X177 Y161.411 E-.13185
G1 X176.863 Y161.387 E-.13187
G1 X176.742 Y161.32 E-.13195
G1 X176.619 Y161.153 E-.19658
G1 X176.59 Y161.017 E-.1319
G1 X176.607 Y160.88 E-.13203
G1 X176.67 Y160.756 E-.1318
G1 X176.77 Y160.66 E-.132
G1 X176.965 Y160.591 E-.19659
G1 X177.035 Y160.591 E-.06615
G1 X177.169 Y160.626 E-.13185
G1 X177.284 Y160.704 E-.13204
G1 X177.286 Y160.706 E-.00271
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.257 Y161.319 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.257 J-.319 E.04801
G1 X176.035 Y160.591 E.00218
G3 X176.301 Y161.278 I-.035 J.409 E.0287
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176.137 Y161.387 E-.18751
G1 X176 Y161.411 E-.13187
G1 X175.863 Y161.387 E-.13185
G1 X175.742 Y161.32 E-.13195
G1 X175.619 Y161.153 E-.19658
G1 X175.59 Y161.017 E-.1319
G1 X175.607 Y160.88 E-.13203
G1 X175.688 Y160.733 E-.15853
G1 X175.831 Y160.626 E-.17026
G1 X175.965 Y160.591 E-.13186
G1 X176.035 Y160.591 E-.06615
G1 X176.169 Y160.626 E-.13185
G1 X176.284 Y160.704 E-.13204
G1 X176.321 Y160.762 E-.06563
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.257 Y161.319 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.257 J-.319 E.04801
G1 X175.035 Y160.591 E.00218
G3 X175.301 Y161.278 I-.035 J.409 E.0287
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.137 Y161.387 E-.18751
G1 X175 Y161.411 E-.13187
G1 X174.863 Y161.387 E-.13185
G1 X174.742 Y161.32 E-.13195
G1 X174.619 Y161.153 E-.19658
G1 X174.59 Y161.017 E-.1319
G1 X174.607 Y160.88 E-.13203
G1 X174.688 Y160.733 E-.15853
G1 X174.831 Y160.626 E-.17026
G1 X174.965 Y160.591 E-.13186
G1 X175.035 Y160.591 E-.06615
G1 X175.169 Y160.626 E-.13185
G1 X175.284 Y160.704 E-.13204
G1 X175.321 Y160.762 E-.06563
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.255 Y161.315 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.255 J-.318 E.0477
G1 X174.035 Y160.591 E.00218
G3 X174.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174.137 Y161.387 E-.18735
G1 X174 Y161.411 E-.13187
G1 X173.863 Y161.387 E-.13185
G1 X173.742 Y161.32 E-.13195
G1 X173.619 Y161.153 E-.19658
G1 X173.59 Y161.017 E-.1319
G1 X173.607 Y160.88 E-.13203
G1 X173.67 Y160.756 E-.13191
G1 X173.77 Y160.66 E-.13188
G1 X173.965 Y160.591 E-.19659
G1 X174.035 Y160.591 E-.06615
G1 X174.169 Y160.626 E-.13185
G1 X174.284 Y160.704 E-.13204
G1 X174.321 Y160.763 E-.06605
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.257 Y161.319 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.257 J-.319 E.04801
G1 X173.035 Y160.591 E.00218
G3 X173.301 Y161.278 I-.035 J.409 E.0287
; COOLING_NODE: 37
M204 S10000
G1 X172.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.307 J-.271 E.05019
G1 X172.035 Y160.591 E.00218
G3 X172.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X172.137 Y161.387 E-.25127
G1 X172 Y161.411 E-.13187
G1 X171.863 Y161.387 E-.13185
G1 X171.742 Y161.32 E-.13195
G1 X171.619 Y161.153 E-.19658
G1 X171.59 Y161.017 E-.1319
G1 X171.607 Y160.88 E-.13203
G1 X171.688 Y160.733 E-.1585
G1 X171.831 Y160.626 E-.17027
G1 X171.965 Y160.591 E-.13191
G1 X172.035 Y160.591 E-.06611
G1 X172.169 Y160.626 E-.13185
G1 X172.284 Y160.704 E-.13204
G1 X172.285 Y160.705 E-.00188
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.257 Y161.319 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.257 J-.319 E.04801
G1 X171.035 Y160.591 E.00218
G3 X171.301 Y161.278 I-.035 J.409 E.0287
; COOLING_NODE: 39
M204 S10000
G1 X170.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.307 J-.271 E.05019
G1 X170.035 Y160.591 E.00218
G3 X170.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X170.137 Y161.387 E-.25127
G1 X170 Y161.411 E-.13187
G1 X169.863 Y161.387 E-.13185
G1 X169.742 Y161.32 E-.13195
G1 X169.619 Y161.153 E-.19658
G1 X169.59 Y161.017 E-.1319
G1 X169.607 Y160.88 E-.13203
G1 X169.67 Y160.756 E-.13178
G1 X169.794 Y160.645 E-.15867
G1 X169.965 Y160.591 E-.17023
G1 X170.035 Y160.591 E-.06611
G1 X170.169 Y160.626 E-.13185
G1 X170.284 Y160.704 E-.13204
G1 X170.285 Y160.705 E-.00188
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.391 Y159.88 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.117 E.06287
G1 X170.035 Y159.591 E.00218
G3 X170.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.41 Y160.017 E-.18751
G1 X170.381 Y160.153 E-.1318
G1 X170.308 Y160.271 E-.13196
G1 X170.137 Y160.387 E-.19669
G1 X170 Y160.411 E-.13186
G1 X169.863 Y160.387 E-.13185
G1 X169.738 Y160.317 E-.13662
G1 X169.621 Y160.16 E-.18601
G1 X169.59 Y160.017 E-.1384
G1 X169.607 Y159.88 E-.13203
G1 X169.67 Y159.756 E-.13178
G1 X169.794 Y159.645 E-.15867
G1 X169.9 Y159.611 E-.10482
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.391 Y159.88 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.391 J.117 E.06287
G1 X171.035 Y159.591 E.00218
G3 X171.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 7
M204 S10000
G1 X171.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.257 J-.319 E.04801
G1 X171.035 Y158.591 E.00218
G3 X171.301 Y159.278 I-.035 J.409 E.0287
; COOLING_NODE: 43
M204 S10000
G1 X170.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.307 J-.271 E.05019
G1 X170.035 Y158.591 E.00218
G3 X170.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X170.137 Y159.387 E-.25125
G1 X170 Y159.411 E-.13186
G1 X169.863 Y159.387 E-.13185
G1 X169.742 Y159.32 E-.13195
G1 X169.619 Y159.153 E-.19661
G1 X169.59 Y159.017 E-.13187
G1 X169.607 Y158.88 E-.13203
G1 X169.67 Y158.756 E-.13178
G1 X169.794 Y158.645 E-.15867
G1 X169.965 Y158.591 E-.17023
G1 X170.035 Y158.591 E-.06611
G1 X170.169 Y158.626 E-.13185
G1 X170.284 Y158.704 E-.13204
G1 X170.285 Y158.705 E-.0019
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.307 Y159.271 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.307 J-.271 E.05019
G1 X168.035 Y158.591 E.00218
G3 X168.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 44
M204 S10000
G1 X169.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.257 J-.319 E.04801
G1 X169.035 Y158.591 E.00218
G3 X169.301 Y159.278 I-.035 J.409 E.0287
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.18751
G1 X169 Y159.411 E-.13186
G1 X168.863 Y159.387 E-.13185
G1 X168.742 Y159.32 E-.13195
G1 X168.619 Y159.153 E-.19661
G1 X168.59 Y159.017 E-.13187
G1 X168.607 Y158.88 E-.13203
G1 X168.688 Y158.733 E-.15853
G1 X168.831 Y158.626 E-.17026
G1 X168.965 Y158.591 E-.13186
G1 X169.035 Y158.591 E-.06615
G1 X169.169 Y158.626 E-.13185
G1 X169.284 Y158.704 E-.13204
G1 X169.321 Y158.762 E-.06563
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.625 Y160.158 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.375 J-.161 E.02418
G1 X169.035 Y159.591 E.00218
G3 X168.653 Y160.211 I-.035 J.406 E.05209
; COOLING_NODE: 46
M204 S10000
G1 X168.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.391 J.117 E.06287
G1 X168.035 Y159.591 E.00218
G3 X168.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 47
M204 S10000
G1 X167.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.391 J.117 E.06287
G1 X167.035 Y159.591 E.00218
G3 X167.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 48
M204 S10000
G1 X167.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.307 J-.271 E.05019
G1 X167.035 Y158.591 E.00218
G3 X167.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.137 Y159.387 E-.25125
G1 X167 Y159.411 E-.13186
G1 X166.863 Y159.387 E-.13185
G1 X166.742 Y159.32 E-.13195
G1 X166.619 Y159.153 E-.19661
G1 X166.59 Y159.017 E-.13187
G1 X166.607 Y158.88 E-.13203
G1 X166.688 Y158.733 E-.1585
G1 X166.831 Y158.626 E-.17027
G1 X166.965 Y158.591 E-.13192
G1 X167.035 Y158.591 E-.06611
G1 X167.169 Y158.626 E-.13185
G1 X167.284 Y158.704 E-.13204
G1 X167.285 Y158.705 E-.0019
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X166.373 Y159.499 Z3 F60000
G1 Z2.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.369 Y160.505 I.645 J.505 E.03663
G2 X166.642 Y161.725 I.667 J.492 E.04798
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.337 Y159.451 I.357 J.714 E.04621
; COOLING_NODE: 49
; WIPE_START
G1 X166.287 Y159.625 E-.17168
G1 X166.231 Y159.764 E-.14257
G1 X166.196 Y160.034 E-.25853
G1 X166.214 Y160.169 E-.1295
G1 X166.26 Y160.319 E-.14846
G1 X166.369 Y160.505 E-.20481
G1 X166.287 Y160.625 E-.13842
G1 X166.231 Y160.764 E-.14254
G1 X166.202 Y160.898 E-.12968
G1 X166.214 Y161.169 E-.25837
G1 X166.254 Y161.3 E-.12971
G1 X166.279 Y161.341 E-.04572
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.307 Y161.271 Z3 F60000
G1 Z2.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.307 J-.271 E.05019
G1 X167.035 Y160.591 E.00218
G3 X167.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 50
M204 S10000
G1 X168.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.307 J-.271 E.05019
G1 X168.035 Y160.591 E.00218
G3 X168.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 40
M204 S10000
G1 X169.257 Y161.319 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.257 J-.319 E.04801
G1 X169.035 Y160.591 E.00218
G3 X169.301 Y161.278 I-.035 J.409 E.0287
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X169.137 Y161.387 E-.18751
G1 X169 Y161.411 E-.13186
G1 X168.863 Y161.387 E-.13185
G1 X168.742 Y161.32 E-.13195
G1 X168.619 Y161.153 E-.19658
G1 X168.59 Y161.017 E-.1319
G1 X168.607 Y160.88 E-.13203
G1 X168.688 Y160.733 E-.15853
G1 X168.831 Y160.626 E-.17026
G1 X168.965 Y160.591 E-.13186
G1 X169.035 Y160.591 E-.06615
G1 X169.169 Y160.626 E-.13185
G1 X169.284 Y160.704 E-.13204
G1 X169.321 Y160.762 E-.06563
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.943 Y161.15 Z3 F60000
G1 X179.307 Y161.271 Z3
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.307 J-.271 E.05019
G1 X179.035 Y160.591 E.00218
G3 X179.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 29
M204 S10000
G1 X180.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.307 J-.271 E.05019
G1 X180.035 Y160.591 E.00218
G3 X180.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 19
M204 S10000
G1 X180.135 Y160.382 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.135 J-.385 E.04339
G1 X180.035 Y159.591 E.00218
G3 X180.19 Y160.358 I-.035 J.406 E.03288
; COOLING_NODE: 15
M204 S10000
G1 X179.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00218
G3 X179.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 16
M204 S10000
G1 X179.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.307 J-.271 E.05019
G1 X179.035 Y158.591 E.00218
G3 X179.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 18
M204 S10000
G1 X180.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.307 J-.271 E.05019
G1 X180.035 Y158.591 E.00218
G3 X180.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 21
M204 S10000
G1 X181.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.307 J-.271 E.05019
G1 X181.035 Y158.591 E.00218
G3 X181.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 20
M204 S10000
G1 X181.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.391 J.117 E.06287
G1 X181.035 Y159.591 E.00218
G3 X181.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.18752
G1 X181.381 Y160.153 E-.1318
G1 X181.308 Y160.271 E-.13196
G1 X181.137 Y160.387 E-.19669
G1 X181 Y160.411 E-.13187
G1 X180.863 Y160.387 E-.13185
G1 X180.738 Y160.317 E-.13662
G1 X180.621 Y160.16 E-.18601
G1 X180.59 Y160.017 E-.1384
G1 X180.607 Y159.88 E-.13203
G1 X180.688 Y159.733 E-.1585
G1 X180.831 Y159.626 E-.17027
G1 X180.899 Y159.608 E-.06649
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.307 Y161.271 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.307 J-.271 E.05019
G1 X181.035 Y160.591 E.00218
G3 X181.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 27
M204 S10000
G1 X182.307 Y161.271 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.307 J-.271 E.05019
G1 X182.035 Y160.591 E.00218
G3 X182.344 Y161.223 I-.035 J.409 E.02651
; COOLING_NODE: 26
M204 S10000
G1 X183.255 Y161.315 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.255 J-.318 E.0477
G1 X183.035 Y160.591 E.00218
G3 X183.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.18734
G1 X183 Y161.411 E-.13187
G1 X182.863 Y161.387 E-.13185
G1 X182.742 Y161.32 E-.13195
G1 X182.619 Y161.153 E-.19658
G1 X182.59 Y161.017 E-.1319
G1 X182.607 Y160.88 E-.13203
G1 X182.67 Y160.756 E-.13191
G1 X182.77 Y160.66 E-.13188
G1 X182.965 Y160.591 E-.19663
G1 X183.035 Y160.591 E-.06611
G1 X183.169 Y160.626 E-.13185
G1 X183.284 Y160.704 E-.13204
G1 X183.321 Y160.763 E-.06605
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.622 Y160.159 Z3 F60000
G1 Z2.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.378 J-.16 E.02425
G1 X183.035 Y159.591 E.00218
G3 X182.65 Y160.212 I-.035 J.409 E.05246
; COOLING_NODE: 23
M204 S10000
G1 X182.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.391 J.117 E.06287
G1 X182.035 Y159.591 E.00218
G3 X182.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 22
M204 S10000
G1 X182.307 Y159.271 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.307 J-.271 E.05019
G1 X182.035 Y158.591 E.00218
G3 X182.344 Y159.223 I-.035 J.409 E.02651
; COOLING_NODE: 25
M204 S10000
G1 X183.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.255 J-.318 E.04771
G1 X183.035 Y158.591 E.00218
G3 X183.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.18734
G1 X183 Y159.411 E-.13186
G1 X182.863 Y159.387 E-.13185
G1 X182.742 Y159.32 E-.13195
G1 X182.619 Y159.153 E-.19661
G1 X182.59 Y159.017 E-.13187
G1 X182.607 Y158.88 E-.13203
G1 X182.67 Y158.756 E-.13191
G1 X182.77 Y158.66 E-.13188
G1 X182.965 Y158.591 E-.19663
G1 X183.035 Y158.591 E-.06611
G1 X183.169 Y158.626 E-.13185
G1 X183.284 Y158.704 E-.13204
G1 X183.321 Y158.763 E-.06606
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z3 F60000
G1 Z2.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03619
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.31165
G1 F4018.906
M204 S8000
G1 X184.062 Y161.414 E.00637
; LINE_WIDTH: 0.294419
G1 F4294.255
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266316
G1 F4834.467
G1 X184.09 Y161.225 E.00194
; LINE_WIDTH: 0.243523
G1 F5383.775
G2 X184.078 Y160.68 I-2.44 J-.22 E.00912
; LINE_WIDTH: 0.278667
G1 F4581.187
G1 X184.075 Y160.66 E.0004
; LINE_WIDTH: 0.297404
G1 F4243.884
G1 X184.059 Y160.579 E.00175
; LINE_WIDTH: 0.328388
G1 F3783.266
G1 X184.044 Y160.497 E.00197
G1 X184.024 Y160.497 E.00048
; LINE_WIDTH: 0.289084
G1 F4387.322
G1 X183.949 Y160.496 E.00152
; LINE_WIDTH: 0.251117
G1 F5187.398
G1 X183.875 Y160.496 E.00128
M204 S10000
G1 X183.986 Y160.806 F60000
; LINE_WIDTH: 0.311697
G1 F4018.204
M204 S8000
G1 X184.062 Y160.415 E.00892
; LINE_WIDTH: 0.294471
G1 F4293.371
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266332
G1 F4834.116
G1 X184.09 Y160.225 E.00194
; LINE_WIDTH: 0.243523
G1 F5383.774
G2 X184.078 Y159.68 I-2.44 J-.22 E.00912
; LINE_WIDTH: 0.278667
G1 F4581.187
G1 X184.075 Y159.66 E.0004
; LINE_WIDTH: 0.297404
G1 F4243.884
G1 X184.059 Y159.579 E.00175
; LINE_WIDTH: 0.328371
G1 F3783.493
G1 X184.044 Y159.497 E.00197
G1 X184.023 Y159.497 E.00048
; LINE_WIDTH: 0.288935
G1 F4389.978
G1 X183.949 Y159.496 E.00152
; LINE_WIDTH: 0.250975
G1 F5190.945
G1 X183.875 Y159.496 E.00128
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311646
G1 F4018.974
M204 S8000
G1 X184.062 Y159.414 E.00893
; LINE_WIDTH: 0.294419
G1 F4294.255
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266316
G1 F4834.462
G1 X184.09 Y159.225 E.00194
; LINE_WIDTH: 0.243523
G1 F5383.775
G2 X184.078 Y158.68 I-2.44 J-.22 E.00912
; LINE_WIDTH: 0.278667
G1 F4581.187
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298199
G1 F4230.678
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353121
G1 F3481.619
G1 X184.036 Y158.464 E.00291
G1 X183.755 Y158.306 E.00832
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609502
G1 F1906.167
M204 S8000
G1 X182.343 Y158.184 E.0385
; LINE_WIDTH: 0.574614
G1 F2031.244
G2 X182.196 Y158.161 I-.349 J1.731 E.00656
; LINE_WIDTH: 0.540427
G1 F2170.824
G2 X181.76 Y158.166 I-.194 J1.905 E.01807
; LINE_WIDTH: 0.581533
G1 F2005.151
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609605
G1 F1905.823
G1 X181.609 Y158.195 E.00231
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609502
G1 F1906.167
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574614
G1 F2031.244
G2 X168.196 Y158.161 I-.349 J1.731 E.00656
; LINE_WIDTH: 0.540427
G1 F2170.824
G2 X167.76 Y158.166 I-.194 J1.905 E.01807
; LINE_WIDTH: 0.581533
G1 F2005.151
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609605
G1 F1905.823
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.232 Y158.306 F60000
; LINE_WIDTH: 0.343582
G1 F3592.072
M204 S8000
G1 X165.962 Y158.471 E.00792
; LINE_WIDTH: 0.336644
G1 F3676.924
G1 X165.943 Y158.565 E.00236
; LINE_WIDTH: 0.296346
G1 F4261.597
G1 X165.922 Y158.68 E.00246
; LINE_WIDTH: 0.243879
G1 F5374.232
G2 X165.912 Y159.244 I2.457 J.325 E.00944
; LINE_WIDTH: 0.268951
G1 F4778.107
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308744
G1 F4062.838
G2 X166.014 Y159.806 I5.59 J-.793 E.01073
M204 S10000
G1 X166.013 Y159.204 F60000
; LINE_WIDTH: 0.328893
G1 F3776.58
M204 S8000
G1 X165.969 Y159.432 E.00552
; LINE_WIDTH: 0.295949
G1 F4268.291
G2 X165.922 Y159.68 I2.92 J.683 E.00531
; LINE_WIDTH: 0.243879
G1 F5374.238
G2 X165.912 Y160.244 I2.457 J.325 E.00944
; LINE_WIDTH: 0.270927
G1 F4736.706
G1 X165.927 Y160.343 E.00189
; LINE_WIDTH: 0.305959
G1 F4105.867
G2 X165.949 Y160.474 I1.115 J-.116 E.00292
; LINE_WIDTH: 0.315979
G1 F3955.2
G1 X165.925 Y160.66 E.00425
; LINE_WIDTH: 0.257976
G1 F5021.967
G2 X165.903 Y160.868 I7.006 J.858 E.00374
; LINE_WIDTH: 0.237924
G1 F5538.346
G2 X165.912 Y161.244 I3.137 J.109 E.0061
; LINE_WIDTH: 0.268956
G1 F4778.001
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307817
G1 F4077.057
G2 X165.992 Y161.694 I4.279 J-.596 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z3 I-1.171 J.331 P1  F60000
G1 X199.428 Y279.944 Z3
G1 Z2.6
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y279.944  E1.2162 F2363
G1  Y270.944  E0.3421
G1  X199.428  E1.2162
M73 P69 R11
G1  Y279.944  E0.3421
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #14
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z3 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z2.6
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M73 P69 R10
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
M73 P70 R10
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
M73 P71 R10
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S174 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z3 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E8

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z5.6 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y264.712 F60000
G1 Z2.6
G17
G3 Z3 I1.217 J0 P1
G1 X204.318 Y247.518 Z3
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z2.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y253.444  E0.0285
M73 P72 R10
G1  X167.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X199.428  E1.2162 F2473
G1  Y254.944  E0.0285
M73 P72 R9
G1  X167.428  E1.2162 F4725
G1  Y255.694  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X167.428  E1.2162
G1  Y257.194  E0.0285
G1  X199.428  E1.2162
G1  Y257.944  E0.0285
G1  X167.428  E1.2162
G1  Y258.694  E0.0285
G1  X199.428  E1.2162
G1  Y259.444  E0.0285
G1  X167.428  E1.2162
G1  Y260.194  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #14
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X199.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X199.928 Y280.444  
M204 S8000
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S10000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S8000
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F5400
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
; WIPE_TOWER_END

; WIPE_START
G1 F4077.057
M204 S8000
G1 X199.928 Y280.444 E0
G1 X199.928 Y280.444 E0
G1 X200.578 Y279.685 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z2.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2702
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 13 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z3 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer13 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 14/25
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z2.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2565
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 14 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z3.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer14 end: 224,265
M625
M204 S10000
G1 X199.428 Y279.944
G1 Z2.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X201.640 Y278.401  
M204 S8000
G3  X197.871 Y282.511   I-16.869 J-11.684 E0.2126 F5400
G3  X194.841 Y281.395   I-0.631 J-2.959 E0.1295
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.112 Y276.190   I3.543 J-0.156 E0.1075
; WIPE_TOWER_END
G1  X199.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #15
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #14
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z3.2 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z2.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S80 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E7

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

M73 P73 R9
G1 Y295
G1 Y265 F18000
G1 Z5.8 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y277.194 F60000
G1 Z2.8

; filament start gcode
G1 X199.428 Y277.194 Z3.2
G1 Z2.8
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X200.928 
G1  X199.428  F240
G1  X199.928  F600
G1  Y277.694 
G1  X198.928 
G1  Y276.694 
G1  X200.428 
G1  Y278.194 
G1  X198.428 
G1  Y276.194 
G1  X196.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X167.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X199.428  E1.2162
G1  Y274.194  E0.0285
G1  X167.428  E1.2162
G1  Y273.444  E0.0285
G1  X199.428  E1.2162
G1  Y272.694  E0.0285
G1  X167.428  E1.2162
G1  Y271.944  E0.0285
G1  X199.428  E1.2162
G1  Y271.194  E0.0285
G1  X167.428  E1.2162
G1  Y270.444  E0.0285
G1  X199.428  E1.2162
G1  Y269.694  E0.0285
G1  X167.428  E1.2162
G1  Y268.944  E0.0285
G1  X199.428  E1.2162
G1  Y268.194  E0.0285
G1  X167.428  E1.2162
G1  Y267.444  E0.0285
G1  X199.428  E1.2162
G1  Y266.694  E0.0285
G1  X167.428  E1.2162
G1  Y265.944  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162 F2363
G1  Y277.944  E0.0760
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #15
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
M73 P74 R9
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.743 Y160.318
G1 Z2.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.257 J-.319 E.03057
G1 X175.035 Y159.591 E.00218
G3 X174.792 Y160.353 I-.035 J.409 E.04613
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.25112
G1 X174.59 Y160.017 E-.13188
G1 X174.607 Y159.88 E-.1319
G1 X174.67 Y159.756 E-.13185
G1 X174.792 Y159.646 E-.15628
G1 X174.965 Y159.591 E-.17264
G1 X175.035 Y159.591 E-.06612
G1 X175.173 Y159.627 E-.13611
G1 X175.326 Y159.75 E-.1862
G1 X175.393 Y159.88 E-.13871
G1 X175.41 Y160.017 E-.132
G1 X175.38 Y160.157 E-.13589
G1 X175.299 Y160.267 E-.1293
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.743 Y160.318 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.257 J-.319 E.03057
G1 X174.035 Y159.591 E.00218
G3 X173.792 Y160.353 I-.035 J.409 E.04613
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.25112
G1 X173.59 Y160.017 E-.13188
G1 X173.607 Y159.88 E-.1319
G1 X173.67 Y159.756 E-.13185
G1 X173.792 Y159.646 E-.15628
G1 X173.965 Y159.591 E-.17264
G1 X174.035 Y159.591 E-.06612
G1 X174.173 Y159.627 E-.13611
G1 X174.326 Y159.75 E-.1862
G1 X174.393 Y159.88 E-.13871
G1 X174.41 Y160.017 E-.132
G1 X174.38 Y160.157 E-.13589
G1 X174.3 Y160.267 E-.12929
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.305 Y159.268 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.305 J-.271 E.04987
G1 X174.035 Y158.591 E.00218
G3 X174.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 9
M204 S10000
G1 X175.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.305 J-.271 E.04987
G1 X175.035 Y158.591 E.00218
G3 X175.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 10
M204 S10000
G1 X176.263 Y159.314 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.263 J-.315 E.04824
G1 X176.035 Y158.591 E.00218
G3 X176.306 Y159.272 I-.035 J.409 E.02847
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.19411
G1 X176 Y159.411 E-.13179
G1 X175.863 Y159.387 E-.13207
G1 X175.742 Y159.32 E-.13189
G1 X175.65 Y159.215 E-.13183
G1 X175.59 Y159.017 E-.19666
G1 X175.607 Y158.88 E-.1319
G1 X175.67 Y158.756 E-.13185
G1 X175.792 Y158.646 E-.15628
G1 X175.965 Y158.591 E-.17264
G1 X176.035 Y158.591 E-.06612
G1 X176.193 Y158.637 E-.15625
G1 X176.325 Y158.752 E-.1666
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.59 Y160.017 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.41 J-.018 E.01967
G1 X176.035 Y159.591 E.00218
G3 X175.597 Y160.077 I-.035 J.409 E.05703
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18777
G1 X175.67 Y159.756 E-.13185
G1 X175.792 Y159.646 E-.15628
G1 X175.965 Y159.591 E-.17264
G1 X176.035 Y159.591 E-.06612
G1 X176.193 Y159.637 E-.15625
G1 X176.33 Y159.756 E-.17259
G1 X176.393 Y159.88 E-.13185
G1 X176.41 Y160.017 E-.132
G1 X176.38 Y160.157 E-.13589
G1 X176.264 Y160.315 E-.1863
G1 X176.137 Y160.387 E-.13872
G1 X176 Y160.411 E-.13173
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.62 Y160.153 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.38 J-.154 E.02404
G1 X177.035 Y159.591 E.00218
G3 X176.646 Y160.206 I-.035 J.409 E.05268
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.18745
G1 X176.633 Y159.815 E-.19668
G1 X176.719 Y159.7 E-.13604
G1 X176.792 Y159.646 E-.08676
G1 X176.965 Y159.591 E-.17262
G1 X177.035 Y159.591 E-.06612
G1 X177.193 Y159.637 E-.15625
G1 X177.33 Y159.756 E-.17259
G1 X177.393 Y159.88 E-.13185
G1 X177.41 Y160.017 E-.132
G1 X177.38 Y160.157 E-.13589
G1 X177.264 Y160.315 E-.1863
G1 X177.137 Y160.387 E-.13872
G1 X177.136 Y160.387 E-.00073
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.263 Y159.314 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.263 J-.315 E.04824
G1 X177.035 Y158.591 E.00218
G3 X177.306 Y159.272 I-.035 J.409 E.02847
; COOLING_NODE: 17
M204 S10000
G1 X178.263 Y159.314 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.263 J-.315 E.04824
G1 X178.035 Y158.591 E.00218
G3 X178.306 Y159.272 I-.035 J.409 E.02847
; COOLING_NODE: 16
M204 S10000
G1 X179.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.255 J-.318 E.0477
G1 X179.035 Y158.591 E.00218
G3 X179.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 18
M204 S10000
G1 X180.256 Y159.317 F60000
G1 F2864.117
M204 S5000
G3 X179.958 Y158.591 I-.259 J-.318 E.04798
G1 X180.035 Y158.591 E.00241
G3 X180.299 Y159.275 I-.038 J.408 E.0285
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X180.137 Y159.387 E-.18743
G1 X180 Y159.411 E-.13181
G1 X179.863 Y159.387 E-.13201
G1 X179.742 Y159.32 E-.13194
G1 X179.65 Y159.215 E-.13183
G1 X179.59 Y159.017 E-.19666
G1 X179.607 Y158.88 E-.13192
G1 X179.67 Y158.756 E-.13186
G1 X179.773 Y158.657 E-.13608
G1 X179.958 Y158.591 E-.18628
G1 X180.035 Y158.591 E-.073
G1 X180.193 Y158.637 E-.15625
G1 X180.33 Y158.756 E-.17259
G1 X180.33 Y158.756 E-.00035
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.136 Y160.385 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.958 Y159.591 I-.139 J-.386 E.04365
G1 X180.035 Y159.591 E.00241
G3 X180.191 Y160.36 I-.038 J.408 E.03283
; COOLING_NODE: 15
M204 S10000
G1 X179.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00218
G3 X179.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.18786
G1 X179.38 Y160.157 E-.13593
G1 X179.264 Y160.316 E-.18629
G1 X179.137 Y160.387 E-.13871
G1 X179 Y160.411 E-.13181
G1 X178.863 Y160.387 E-.13201
G1 X178.742 Y160.32 E-.13196
G1 X178.619 Y160.153 E-.19659
G1 X178.59 Y160.017 E-.13188
G1 X178.633 Y159.815 E-.19668
G1 X178.716 Y159.703 E-.1319
G1 X178.831 Y159.626 E-.13187
G1 X178.899 Y159.608 E-.06652
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.62 Y160.153 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.38 J-.154 E.02404
G1 X178.035 Y159.591 E.00218
G3 X177.646 Y160.206 I-.035 J.409 E.05268
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18745
G1 X177.633 Y159.815 E-.19668
G1 X177.719 Y159.7 E-.13604
G1 X177.792 Y159.646 E-.08676
G1 X177.965 Y159.591 E-.17262
G1 X178.035 Y159.591 E-.06612
G1 X178.193 Y159.637 E-.15625
G1 X178.33 Y159.756 E-.17259
G1 X178.393 Y159.88 E-.13185
G1 X178.41 Y160.017 E-.132
G1 X178.38 Y160.157 E-.13589
G1 X178.264 Y160.315 E-.1863
G1 X178.137 Y160.387 E-.13872
G1 X178.136 Y160.387 E-.00072
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.255 Y159.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.255 J-.318 E.0477
G1 X181.035 Y158.591 E.00218
G3 X181.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 20
M204 S10000
G1 X181.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.391 J.117 E.06287
G1 X181.035 Y159.591 E.00218
G3 X181.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.18786
G1 X181.38 Y160.157 E-.13593
G1 X181.264 Y160.316 E-.18629
G1 X181.137 Y160.387 E-.13871
G1 X181 Y160.411 E-.13181
G1 X180.863 Y160.387 E-.13201
G1 X180.742 Y160.32 E-.13196
G1 X180.619 Y160.153 E-.19659
G1 X180.59 Y160.017 E-.13188
G1 X180.633 Y159.815 E-.19668
G1 X180.716 Y159.703 E-.1319
G1 X180.831 Y159.626 E-.13187
G1 X180.899 Y159.608 E-.06652
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.391 Y159.88 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.391 J.117 E.06287
G1 X182.035 Y159.591 E.00218
G3 X182.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 22
M204 S10000
G1 X182.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.255 J-.318 E.0477
G1 X182.035 Y158.591 E.00218
G3 X182.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 25
M204 S10000
G1 X183.263 Y159.314 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.263 J-.315 E.04824
G1 X183.035 Y158.591 E.00218
G3 X183.306 Y159.272 I-.035 J.409 E.02847
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.1941
G1 X183 Y159.411 E-.13181
G1 X182.863 Y159.387 E-.13201
G1 X182.742 Y159.32 E-.13194
G1 X182.65 Y159.215 E-.13183
G1 X182.59 Y159.017 E-.19666
G1 X182.633 Y158.815 E-.19657
G1 X182.719 Y158.7 E-.13615
G1 X182.792 Y158.646 E-.08675
G1 X182.965 Y158.591 E-.17261
G1 X183.035 Y158.591 E-.06614
G1 X183.193 Y158.637 E-.15625
G1 X183.326 Y158.752 E-.16718
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.62 Y160.153 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.38 J-.154 E.02404
G1 X183.035 Y159.591 E.00218
G3 X182.646 Y160.206 I-.035 J.409 E.05268
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182.59 Y160.017 E-.18745
G1 X182.633 Y159.815 E-.19657
G1 X182.719 Y159.7 E-.13615
G1 X182.792 Y159.646 E-.08675
G1 X182.965 Y159.591 E-.17261
G1 X183.035 Y159.591 E-.06614
G1 X183.193 Y159.637 E-.15625
G1 X183.33 Y159.756 E-.17259
G1 X183.393 Y159.88 E-.13185
G1 X183.41 Y160.017 E-.132
G1 X183.38 Y160.157 E-.13589
G1 X183.264 Y160.315 E-.1863
G1 X183.137 Y160.387 E-.13872
G1 X183.136 Y160.387 E-.00071
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.263 Y161.314 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.263 J-.315 E.04824
G1 X183.035 Y160.591 E.00218
G3 X183.306 Y161.272 I-.035 J.409 E.02847
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.19411
G1 X183 Y161.411 E-.13181
G1 X182.863 Y161.387 E-.13201
G1 X182.742 Y161.32 E-.13194
G1 X182.65 Y161.215 E-.13183
G1 X182.59 Y161.017 E-.19666
G1 X182.633 Y160.815 E-.19657
G1 X182.719 Y160.7 E-.13615
G1 X182.792 Y160.646 E-.08675
G1 X182.965 Y160.591 E-.17261
G1 X183.035 Y160.591 E-.06614
G1 X183.193 Y160.637 E-.15625
G1 X183.326 Y160.752 E-.16716
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.255 J-.318 E.0477
G1 X182.035 Y160.591 E.00218
G3 X182.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182.137 Y161.387 E-.18745
G1 X182 Y161.411 E-.13181
G1 X181.863 Y161.387 E-.13201
G1 X181.742 Y161.32 E-.13194
G1 X181.65 Y161.215 E-.13183
G1 X181.59 Y161.017 E-.19666
G1 X181.633 Y160.815 E-.19668
G1 X181.716 Y160.703 E-.1319
G1 X181.831 Y160.626 E-.13187
G1 X181.965 Y160.591 E-.13193
G1 X182.035 Y160.591 E-.06615
G1 X182.193 Y160.637 E-.15625
G1 X182.33 Y160.756 E-.17259
G1 X182.331 Y160.757 E-.00093
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.255 J-.318 E.0477
G1 X181.035 Y160.591 E.00218
G3 X181.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X181.137 Y161.387 E-.18745
G1 X181 Y161.411 E-.13181
G1 X180.863 Y161.387 E-.13201
G1 X180.742 Y161.32 E-.13194
G1 X180.65 Y161.215 E-.13183
G1 X180.59 Y161.017 E-.19666
G1 X180.633 Y160.815 E-.19668
G1 X180.716 Y160.703 E-.1319
G1 X180.831 Y160.626 E-.13187
G1 X180.965 Y160.591 E-.13193
G1 X181.035 Y160.591 E-.06615
G1 X181.193 Y160.637 E-.15625
G1 X181.33 Y160.756 E-.17259
G1 X181.331 Y160.757 E-.00093
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.256 Y161.317 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.958 Y160.591 I-.259 J-.318 E.04798
G1 X180.035 Y160.591 E.00241
G3 X180.299 Y161.275 I-.038 J.408 E.0285
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X180.137 Y161.387 E-.18743
G1 X180 Y161.411 E-.13181
G1 X179.863 Y161.387 E-.13201
G1 X179.742 Y161.32 E-.13194
G1 X179.65 Y161.215 E-.13183
G1 X179.59 Y161.017 E-.19666
G1 X179.607 Y160.88 E-.13192
G1 X179.67 Y160.756 E-.13186
G1 X179.773 Y160.657 E-.13608
G1 X179.958 Y160.591 E-.18628
G1 X180.035 Y160.591 E-.073
G1 X180.193 Y160.637 E-.15625
G1 X180.33 Y160.756 E-.17259
G1 X180.33 Y160.756 E-.00035
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.255 J-.318 E.0477
G1 X179.035 Y160.591 E.00218
G3 X179.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X179.137 Y161.387 E-.18745
G1 X179 Y161.411 E-.13181
G1 X178.863 Y161.387 E-.13201
G1 X178.742 Y161.32 E-.13194
G1 X178.65 Y161.215 E-.13183
G1 X178.59 Y161.017 E-.19666
G1 X178.633 Y160.815 E-.19668
G1 X178.716 Y160.703 E-.1319
G1 X178.831 Y160.626 E-.13187
G1 X178.965 Y160.591 E-.13193
G1 X179.035 Y160.591 E-.06615
G1 X179.193 Y160.637 E-.15625
G1 X179.33 Y160.756 E-.17259
G1 X179.331 Y160.757 E-.00093
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.263 Y161.314 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.263 J-.315 E.04824
G1 X178.035 Y160.591 E.00218
G3 X178.306 Y161.272 I-.035 J.409 E.02847
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178.137 Y161.387 E-.19412
G1 X178 Y161.411 E-.13181
G1 X177.863 Y161.387 E-.13201
G1 X177.742 Y161.32 E-.13194
G1 X177.65 Y161.215 E-.13183
G1 X177.59 Y161.017 E-.19666
G1 X177.633 Y160.815 E-.19668
G1 X177.719 Y160.7 E-.13604
G1 X177.792 Y160.646 E-.08676
G1 X177.965 Y160.591 E-.17262
G1 X178.035 Y160.591 E-.06612
G1 X178.193 Y160.637 E-.15625
G1 X178.326 Y160.752 E-.16716
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.263 Y161.314 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.263 J-.315 E.04824
G1 X177.035 Y160.591 E.00218
G3 X177.306 Y161.272 I-.035 J.409 E.02847
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177.137 Y161.387 E-.19411
G1 X177 Y161.411 E-.13182
G1 X176.863 Y161.387 E-.13201
G1 X176.742 Y161.32 E-.13194
G1 X176.65 Y161.215 E-.13183
G1 X176.59 Y161.017 E-.19666
G1 X176.633 Y160.815 E-.19668
G1 X176.719 Y160.7 E-.13604
G1 X176.792 Y160.646 E-.08676
G1 X176.965 Y160.591 E-.17262
G1 X177.035 Y160.591 E-.06612
G1 X177.193 Y160.637 E-.15625
G1 X177.326 Y160.752 E-.16716
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.263 Y161.314 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.263 J-.315 E.04824
G1 X176.035 Y160.591 E.00218
G3 X176.306 Y161.272 I-.035 J.409 E.02847
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176.137 Y161.387 E-.19412
G1 X176 Y161.411 E-.13179
G1 X175.863 Y161.387 E-.13207
G1 X175.742 Y161.32 E-.13189
G1 X175.65 Y161.215 E-.13183
G1 X175.59 Y161.017 E-.19666
G1 X175.633 Y160.815 E-.1966
G1 X175.719 Y160.7 E-.13612
G1 X175.792 Y160.646 E-.08673
G1 X175.965 Y160.591 E-.17264
G1 X176.035 Y160.591 E-.06612
G1 X176.193 Y160.637 E-.15625
G1 X176.326 Y160.752 E-.16716
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.305 Y161.268 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.305 J-.271 E.04986
G1 X175.035 Y160.591 E.00218
G3 X175.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.137 Y161.387 E-.25066
G1 X175 Y161.411 E-.13179
G1 X174.863 Y161.387 E-.13207
G1 X174.742 Y161.32 E-.13189
G1 X174.65 Y161.215 E-.13183
G1 X174.59 Y161.017 E-.19666
G1 X174.633 Y160.815 E-.1966
G1 X174.719 Y160.7 E-.13612
G1 X174.792 Y160.646 E-.08673
G1 X174.965 Y160.591 E-.17264
G1 X175.035 Y160.591 E-.06612
G1 X175.173 Y160.627 E-.13611
G1 X175.281 Y160.713 E-.13077
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.305 Y161.268 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.305 J-.271 E.04986
G1 X174.035 Y160.591 E.00218
G3 X174.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174.137 Y161.387 E-.25066
G1 X174 Y161.411 E-.13181
G1 X173.863 Y161.387 E-.13201
G1 X173.742 Y161.32 E-.13194
G1 X173.65 Y161.215 E-.13183
G1 X173.59 Y161.017 E-.19666
G1 X173.633 Y160.815 E-.1966
G1 X173.719 Y160.7 E-.13612
G1 X173.792 Y160.646 E-.08673
G1 X173.965 Y160.591 E-.17264
G1 X174.035 Y160.591 E-.06612
G1 X174.173 Y160.627 E-.13611
G1 X174.281 Y160.713 E-.13077
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.26 Y161.311 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.26 J-.314 E.04792
G1 X173.035 Y160.591 E.00218
G3 X173.303 Y161.269 I-.035 J.406 E.02834
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.19391
G1 X173 Y161.411 E-.13181
G1 X172.863 Y161.387 E-.13201
G1 X172.742 Y161.32 E-.13194
G1 X172.65 Y161.215 E-.13183
G1 X172.59 Y161.017 E-.19666
G1 X172.633 Y160.815 E-.19668
G1 X172.716 Y160.703 E-.1319
G1 X172.831 Y160.626 E-.13187
G1 X172.965 Y160.591 E-.13193
G1 X173.035 Y160.591 E-.06615
G1 X173.193 Y160.637 E-.15625
G1 X173.326 Y160.752 E-.16707
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.255 J-.318 E.0477
G1 X172.035 Y160.591 E.00218
G3 X172.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X172.137 Y161.387 E-.18745
G1 X172 Y161.411 E-.13181
G1 X171.863 Y161.387 E-.13201
G1 X171.742 Y161.32 E-.13194
G1 X171.65 Y161.215 E-.13183
G1 X171.59 Y161.017 E-.19666
G1 X171.633 Y160.815 E-.19668
G1 X171.716 Y160.703 E-.1319
G1 X171.831 Y160.626 E-.13187
G1 X171.965 Y160.591 E-.13193
G1 X172.035 Y160.591 E-.06615
G1 X172.193 Y160.637 E-.15625
G1 X172.33 Y160.756 E-.17259
G1 X172.331 Y160.757 E-.00094
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.26 Y159.311 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.26 J-.314 E.04792
G1 X173.035 Y158.591 E.00218
G3 X173.303 Y159.269 I-.035 J.406 E.02834
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00218
G3 X173.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 5
M204 S10000
G1 X172.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00218
G3 X172.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 4
M204 S10000
G1 X172.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.255 J-.318 E.0477
G1 X172.035 Y158.591 E.00218
G3 X172.299 Y159.274 I-.035 J.406 E.02856
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X172.137 Y159.387 E-.18745
G1 X172 Y159.411 E-.13181
G1 X171.863 Y159.387 E-.13201
G1 X171.742 Y159.32 E-.13194
G1 X171.65 Y159.215 E-.13183
G1 X171.59 Y159.017 E-.19666
G1 X171.633 Y158.815 E-.19668
G1 X171.716 Y158.703 E-.1319
G1 X171.831 Y158.626 E-.13187
G1 X171.965 Y158.591 E-.13194
G1 X172.035 Y158.591 E-.06615
G1 X172.193 Y158.637 E-.15625
G1 X172.33 Y158.756 E-.17259
G1 X172.331 Y158.757 E-.00095
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X171.261 Y159.312 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.958 Y158.591 I-.265 J-.313 E.0482
G1 X171.035 Y158.591 E.00241
G3 X171.304 Y159.27 I-.038 J.408 E.02828
; COOLING_NODE: 6
M204 S10000
G1 X171.389 Y159.881 F60000
G1 F2864.117
M204 S5000
G3 X170.958 Y159.591 I-.393 J.118 E.06313
G1 X171.035 Y159.591 E.00241
G3 X171.368 Y159.825 I-.038 J.408 E.01334
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X171.41 Y160.017 E-.18771
G1 X171.38 Y160.157 E-.13589
G1 X171.264 Y160.315 E-.1863
G1 X171.137 Y160.387 E-.13872
G1 X171 Y160.411 E-.13181
G1 X170.863 Y160.387 E-.13201
G1 X170.742 Y160.32 E-.13196
G1 X170.619 Y160.153 E-.19659
G1 X170.59 Y160.017 E-.13188
G1 X170.607 Y159.88 E-.13192
G1 X170.67 Y159.756 E-.13186
G1 X170.773 Y159.657 E-.13608
G1 X170.9 Y159.612 E-.12727
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.261 Y161.312 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.958 Y160.591 I-.265 J-.313 E.0482
G1 X171.035 Y160.591 E.00241
G3 X171.304 Y161.27 I-.038 J.408 E.02828
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.137 Y161.387 E-.1939
G1 X171 Y161.411 E-.13181
G1 X170.863 Y161.387 E-.13201
G1 X170.742 Y161.32 E-.13194
G1 X170.65 Y161.215 E-.13183
G1 X170.59 Y161.017 E-.19666
G1 X170.607 Y160.88 E-.13192
G1 X170.67 Y160.756 E-.13186
G1 X170.773 Y160.657 E-.13608
G1 X170.958 Y160.591 E-.18626
G1 X171.035 Y160.591 E-.07302
G1 X171.193 Y160.637 E-.15625
G1 X171.325 Y160.752 E-.16647
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.256 Y161.317 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.958 Y160.591 I-.259 J-.318 E.04798
G1 X170.035 Y160.591 E.00241
G3 X170.299 Y161.275 I-.038 J.408 E.02849
; COOLING_NODE: 40
M204 S10000
G1 X169.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.305 J-.271 E.04986
G1 X169.035 Y160.591 E.00218
G3 X169.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X169.137 Y161.387 E-.25066
G1 X169 Y161.411 E-.13181
G1 X168.863 Y161.387 E-.13201
G1 X168.742 Y161.32 E-.13194
G1 X168.65 Y161.215 E-.13183
G1 X168.59 Y161.017 E-.19666
G1 X168.633 Y160.815 E-.19657
G1 X168.719 Y160.7 E-.13615
G1 X168.792 Y160.646 E-.08674
G1 X168.965 Y160.591 E-.17264
G1 X169.035 Y160.591 E-.06612
G1 X169.193 Y160.637 E-.15625
G1 X169.281 Y160.713 E-.11062
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.62 Y160.153 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.38 J-.154 E.02404
G1 X169.035 Y159.591 E.00218
G3 X168.646 Y160.206 I-.035 J.409 E.05268
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18746
G1 X168.633 Y159.815 E-.19657
G1 X168.719 Y159.7 E-.13615
G1 X168.792 Y159.646 E-.08674
G1 X168.965 Y159.591 E-.17264
G1 X169.035 Y159.591 E-.06612
G1 X169.193 Y159.637 E-.15625
G1 X169.33 Y159.756 E-.17259
G1 X169.393 Y159.88 E-.13185
G1 X169.41 Y160.017 E-.132
G1 X169.38 Y160.157 E-.13589
G1 X169.264 Y160.316 E-.18633
G1 X169.137 Y160.387 E-.13871
G1 X169.136 Y160.387 E-.0007
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.389 Y159.881 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.958 Y159.591 I-.393 J.118 E.06313
G1 X170.035 Y159.591 E.00241
G3 X170.368 Y159.825 I-.038 J.408 E.01334
; COOLING_NODE: 43
M204 S10000
G1 X170.256 Y159.317 F60000
G1 F2864.117
M204 S5000
G3 X169.958 Y158.591 I-.259 J-.318 E.04798
G1 X170.035 Y158.591 E.00241
G3 X170.299 Y159.275 I-.038 J.408 E.0285
; COOLING_NODE: 44
M204 S10000
G1 X169.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.305 J-.271 E.04987
G1 X169.035 Y158.591 E.00218
G3 X169.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.25065
G1 X169 Y159.411 E-.13181
G1 X168.863 Y159.387 E-.13201
G1 X168.742 Y159.32 E-.13194
G1 X168.65 Y159.215 E-.13183
G1 X168.59 Y159.017 E-.19666
G1 X168.633 Y158.815 E-.19657
G1 X168.719 Y158.7 E-.13615
G1 X168.792 Y158.646 E-.08674
G1 X168.965 Y158.591 E-.17264
G1 X169.035 Y158.591 E-.06612
G1 X169.193 Y158.637 E-.15625
G1 X169.281 Y158.713 E-.11064
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.255 J-.318 E.0477
G1 X168.035 Y160.591 E.00218
G3 X168.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.18745
G1 X168 Y161.411 E-.13181
G1 X167.863 Y161.387 E-.13201
G1 X167.742 Y161.32 E-.13194
G1 X167.65 Y161.215 E-.13183
G1 X167.59 Y161.017 E-.19666
G1 X167.633 Y160.815 E-.19668
G1 X167.716 Y160.703 E-.1319
G1 X167.831 Y160.626 E-.13187
G1 X167.965 Y160.591 E-.13193
G1 X168.035 Y160.591 E-.06615
G1 X168.193 Y160.637 E-.15625
G1 X168.33 Y160.756 E-.17259
G1 X168.331 Y160.757 E-.00094
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.255 Y161.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.255 J-.318 E.0477
G1 X167.035 Y160.591 E.00218
G3 X167.299 Y161.274 I-.035 J.406 E.02856
; COOLING_NODE: 47
; WIPE_START
M204 S8000
G1 X167.137 Y161.387 E-.18745
G1 X167 Y161.411 E-.13181
G1 X166.863 Y161.387 E-.13201
G1 X166.742 Y161.32 E-.13194
G1 X166.65 Y161.215 E-.13183
G1 X166.59 Y161.017 E-.19666
G1 X166.633 Y160.815 E-.19668
G1 X166.716 Y160.703 E-.1319
G1 X166.831 Y160.626 E-.13187
G1 X166.965 Y160.591 E-.13193
G1 X167.035 Y160.591 E-.06615
G1 X167.173 Y160.627 E-.13611
G1 X167.326 Y160.75 E-.1862
G1 X167.33 Y160.757 E-.00748
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.391 Y159.88 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.391 J.117 E.06287
G1 X167.035 Y159.591 E.00218
G3 X167.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.18785
G1 X167.38 Y160.157 E-.13593
G1 X167.264 Y160.316 E-.18629
G1 X167.137 Y160.387 E-.13871
G1 X167 Y160.411 E-.13181
G1 X166.863 Y160.387 E-.13201
G1 X166.742 Y160.32 E-.13196
G1 X166.619 Y160.153 E-.19659
G1 X166.59 Y160.017 E-.13188
G1 X166.633 Y159.815 E-.19668
G1 X166.716 Y159.703 E-.1319
G1 X166.831 Y159.626 E-.13187
G1 X166.899 Y159.608 E-.06654
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.391 Y159.88 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.391 J.117 E.06287
G1 X168.035 Y159.591 E.00218
G3 X168.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 45
M204 S10000
G1 X168.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.255 J-.318 E.0477
G1 X168.035 Y158.591 E.00218
G3 X168.299 Y159.274 I-.035 J.406 E.02856
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X168.137 Y159.387 E-.18745
G1 X168 Y159.411 E-.13181
G1 X167.863 Y159.387 E-.13201
G1 X167.742 Y159.32 E-.13194
G1 X167.65 Y159.215 E-.13183
G1 X167.59 Y159.017 E-.19666
G1 X167.633 Y158.815 E-.19668
G1 X167.716 Y158.703 E-.1319
G1 X167.831 Y158.626 E-.13187
G1 X167.965 Y158.591 E-.13194
G1 X168.035 Y158.591 E-.06615
G1 X168.193 Y158.637 E-.15625
G1 X168.33 Y158.756 E-.17259
G1 X168.331 Y158.757 E-.00095
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X167.255 Y159.315 Z3.2 F60000
G1 Z2.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.255 J-.318 E.0477
G1 X167.035 Y158.591 E.00218
G3 X167.299 Y159.274 I-.035 J.406 E.02856
; COOLING_NODE: 48
M204 S10000
G1 X166.37 Y159.495 F60000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.688 J.5 E.03618
G2 X166.642 Y161.725 I.673 J.496 E.04829
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04593
; COOLING_NODE: 48
; WIPE_START
G1 X166.282 Y159.638 E-.18829
G1 X166.231 Y159.764 E-.12959
G1 X166.197 Y160.034 E-.2582
G1 X166.254 Y160.3 E-.25835
G1 X166.37 Y160.495 E-.21584
G1 X166.282 Y160.638 E-.15909
G1 X166.231 Y160.764 E-.12955
G1 X166.202 Y160.898 E-.12953
G1 X166.214 Y161.169 E-.25828
M73 P74 R8
G1 X166.282 Y161.339 E-.17328
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.911 Y161.574 Z3.2 F60000
G1 X184.398 Y161.898 Z3.2
G1 Z2.8
G1 E2 F600
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00612
G2 X183.636 Y160.504 I-.375 J-.727 E.04828
G2 X183.636 Y159.504 I-.671 J-.5 E.03628
G2 X183.356 Y158.273 I-.659 J-.497 E.04863
G1 X183.41 Y158.102 E.00606
G1 X184.398 Y158.102 E.03345
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.006 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.318267
G1 F3922.335
M204 S8000
G1 X184.06 Y161.431 E.00615
; LINE_WIDTH: 0.298261
G1 F4229.637
G1 X184.074 Y161.337 E.00202
; LINE_WIDTH: 0.267609
G1 F4806.652
G1 X184.09 Y161.226 E.00211
; LINE_WIDTH: 0.243539
G1 F5383.357
G2 X184.078 Y160.68 I-2.438 J-.221 E.00912
; LINE_WIDTH: 0.278725
G1 F4580.061
G1 X184.075 Y160.66 E.00039
; LINE_WIDTH: 0.2973
G1 F4245.626
G1 X184.059 Y160.579 E.00174
; LINE_WIDTH: 0.327947
G1 F3789.124
G3 X184.06 Y160.431 I.217 J-.074 E.00357
; LINE_WIDTH: 0.298205
G1 F4230.569
G1 X184.074 Y160.337 E.00202
; LINE_WIDTH: 0.267592
G1 F4807.009
G1 X184.09 Y160.226 E.00211
; LINE_WIDTH: 0.243539
G1 F5383.354
G2 X184.078 Y159.68 I-2.438 J-.221 E.00912
; LINE_WIDTH: 0.278725
G1 F4580.061
G1 X184.075 Y159.66 E.00039
; LINE_WIDTH: 0.2973
G1 F4245.626
G1 X184.059 Y159.579 E.00174
; LINE_WIDTH: 0.327958
G1 F3788.973
G3 X184.06 Y159.431 I.217 J-.074 E.00357
; LINE_WIDTH: 0.298266
G1 F4229.565
G1 X184.074 Y159.337 E.00202
; LINE_WIDTH: 0.267609
G1 F4806.655
G1 X184.09 Y159.226 E.00211
; LINE_WIDTH: 0.243539
G1 F5383.359
G2 X184.078 Y158.68 I-2.438 J-.221 E.00912
; LINE_WIDTH: 0.278725
G1 F4580.061
G1 X184.075 Y158.66 E.00039
; LINE_WIDTH: 0.298215
G1 F4230.41
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353218
G1 F3480.528
G1 X184.036 Y158.464 E.00291
G1 X183.753 Y158.306 E.00837
M204 S10000
G1 X183.227 Y158.028 F60000
; LINE_WIDTH: 0.655701
G1 F1762.459
M204 S8000
G2 X182.498 Y158.224 I1.368 J6.536 E.0385
G1 X182.462 Y158.213 E.00192
; LINE_WIDTH: 0.638648
G1 F1812.91
G1 X182.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X182.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X182.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.540672
G1 F2169.757
G2 X181.76 Y158.166 I-.201 J1.918 E.01844
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X181.657 Y158.184 E.00468
; LINE_WIDTH: 0.609614
G1 F1905.791
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X182.04 Y158.395 F60000
; LINE_WIDTH: 0.667075
G1 F1730.342
M204 S8000
G1 X181.462 Y158.213 E.03145
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X181.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X181.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X181.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.540672
G1 F2169.757
G2 X180.76 Y158.166 I-.201 J1.918 E.01844
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X180.657 Y158.184 E.00468
; LINE_WIDTH: 0.609614
G1 F1905.791
G1 X180.609 Y158.195 E.00232
M204 S10000
G1 X181.04 Y158.395 F60000
; LINE_WIDTH: 0.667075
G1 F1730.342
M204 S8000
G1 X180.462 Y158.213 E.03145
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X180.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X180.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X180.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.543176
G1 F2158.895
G2 X179.724 Y158.172 I-.201 J1.794 E.02006
; LINE_WIDTH: 0.586085
G1 F1988.348
G1 X179.662 Y158.183 E.00285
M204 S10000
G1 X180.04 Y158.395 F60000
; LINE_WIDTH: 0.666758
G1 F1731.221
M204 S8000
G1 X179.462 Y158.213 E.03143
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X179.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X179.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X179.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.540672
G1 F2169.757
G2 X178.76 Y158.166 I-.201 J1.918 E.01844
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X178.657 Y158.184 E.00468
; LINE_WIDTH: 0.609614
G1 F1905.791
G1 X178.609 Y158.195 E.00232
M204 S10000
G1 X179.04 Y158.395 F60000
; LINE_WIDTH: 0.667075
G1 F1730.342
M204 S8000
G1 X178.462 Y158.213 E.03145
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X178.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X178.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X178.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.542512
G1 F2161.767
G2 X177.728 Y158.171 I-.2 J1.903 E.01986
M204 S10000
G1 X173.04 Y158.395 F60000
; LINE_WIDTH: 0.667075
G1 F1730.342
M204 S8000
G1 X172.462 Y158.213 E.03145
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X172.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X172.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X172.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.540672
G1 F2169.757
G2 X171.76 Y158.166 I-.201 J1.918 E.01843
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X171.657 Y158.184 E.00468
; LINE_WIDTH: 0.609614
G1 F1905.791
G1 X171.609 Y158.195 E.00232
M204 S10000
G1 X172.04 Y158.395 F60000
; LINE_WIDTH: 0.667075
G1 F1730.342
M204 S8000
G1 X171.462 Y158.213 E.03145
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X171.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X171.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X171.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.543176
G1 F2158.898
G2 X170.724 Y158.172 I-.201 J1.794 E.02006
; LINE_WIDTH: 0.58609
G1 F1988.33
G1 X170.662 Y158.183 E.00285
M204 S10000
G1 X171.04 Y158.395 F60000
; LINE_WIDTH: 0.666758
G1 F1731.221
M204 S8000
G1 X170.462 Y158.213 E.03144
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X170.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X170.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X170.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.543176
G1 F2158.898
G2 X169.724 Y158.172 I-.201 J1.794 E.02006
; LINE_WIDTH: 0.58609
G1 F1988.33
G1 X169.662 Y158.183 E.00285
M204 S10000
G1 X170.04 Y158.395 F60000
; LINE_WIDTH: 0.666758
G1 F1731.221
M204 S8000
G1 X169.462 Y158.213 E.03144
; LINE_WIDTH: 0.638653
G1 F1812.893
G1 X169.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X169.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X169.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.542512
G1 F2161.765
G2 X168.728 Y158.171 I-.2 J1.903 E.01986
M204 S10000
G1 X168.576 Y158.203 F60000
; LINE_WIDTH: 0.660284
G1 F1749.374
M204 S8000
G1 X168.506 Y158.221 E.00372
G3 X168.462 Y158.213 I-.016 J-.035 E.00243
; LINE_WIDTH: 0.638648
G1 F1812.91
G1 X168.394 Y158.195 E.00348
; LINE_WIDTH: 0.608348
G1 F1910.057
G1 X168.327 Y158.182 E.00323
; LINE_WIDTH: 0.573118
G1 F2036.974
G2 X168.205 Y158.162 I-.256 J1.147 E.00547
; LINE_WIDTH: 0.540672
G1 F2169.757
G2 X167.76 Y158.166 I-.201 J1.918 E.01843
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X167.657 Y158.184 E.00468
; LINE_WIDTH: 0.609614
G1 F1905.791
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.246 Y158.306 F60000
; LINE_WIDTH: 0.358598
G1 F3421.206
M204 S8000
G1 X165.964 Y158.464 E.00849
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331234
G1 F3745.917
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.2945
G1 F4292.869
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.243862
G1 F5374.7
G2 X165.912 Y159.244 I2.461 J.325 E.00944
; LINE_WIDTH: 0.268912
G1 F4778.936
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308703
G1 F4063.465
G2 X166.014 Y159.807 I5.618 J-.797 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.251361
G1 F5181.336
M204 S8000
G1 X166.05 Y159.496 E.00129
; LINE_WIDTH: 0.289492
G1 F4380.061
G1 X165.976 Y159.496 E.00152
; LINE_WIDTH: 0.31456
G1 F3975.858
G1 X165.956 Y159.497 E.00045
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.257932
G1 F5022.975
G2 X165.903 Y159.868 I6.927 J.849 E.00373
; LINE_WIDTH: 0.237924
G1 F5538.351
G2 X165.912 Y160.244 I3.143 J.109 E.0061
; LINE_WIDTH: 0.268917
G1 F4778.831
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.308714
G1 F4063.307
G2 X166.014 Y160.807 I5.64 J-.801 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251399
G1 F5180.385
M204 S8000
G1 X166.05 Y160.496 E.00129
; LINE_WIDTH: 0.289505
G1 F4379.838
G1 X165.976 Y160.496 E.00152
; LINE_WIDTH: 0.31456
G1 F3975.86
G1 X165.956 Y160.497 E.00045
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.257932
G1 F5022.975
G2 X165.903 Y160.868 I6.918 J.848 E.00373
; LINE_WIDTH: 0.237924
G1 F5538.351
G2 X165.912 Y161.244 I3.143 J.109 E.0061
; LINE_WIDTH: 0.268912
G1 F4778.936
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307749
G1 F4078.104
G2 X165.992 Y161.694 I4.306 J-.601 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4078.104
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 15/25
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.2 I.141 J1.209 P1  F60000
G1 X174.725 Y160.303 Z3.2
G1 Z3
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.275 J-.304 E.02984
G1 X175.035 Y159.591 E.00219
M73 P75 R8
G3 X174.772 Y160.34 I-.035 J.409 E.04686
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01962
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.1875
G1 X175.716 Y159.703 E-.19658
G1 X175.831 Y159.626 E-.13186
G1 X175.965 Y159.591 E-.13195
G1 X176.035 Y159.591 E-.06622
G1 X176.169 Y159.626 E-.13187
G1 X176.33 Y159.756 E-.19659
G1 X176.393 Y159.88 E-.13199
G1 X176.409 Y160.041 E-.15381
G1 X176.35 Y160.215 E-.17497
G1 X176.258 Y160.32 E-.1319
G1 X176.137 Y160.387 E-.13191
G1 X176 Y160.411 E-.13189
G1 X175.999 Y160.411 E-.00097
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.257 Y159.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.257 J-.319 E.04801
G1 X176.035 Y158.591 E.00219
G3 X176.301 Y159.278 I-.035 J.409 E.02869
; COOLING_NODE: 11
M204 S10000
G1 X177.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.255 J-.318 E.0477
G1 X177.035 Y158.591 E.00219
G3 X177.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.137 Y159.387 E-.18747
G1 X177 Y159.411 E-.13189
G1 X176.863 Y159.387 E-.13194
G1 X176.692 Y159.271 E-.19665
G1 X176.619 Y159.153 E-.1318
G1 X176.59 Y159.017 E-.13201
G1 X176.615 Y158.857 E-.15386
G1 X176.716 Y158.703 E-.17486
G1 X176.831 Y158.626 E-.1319
G1 X176.965 Y158.591 E-.13195
G1 X177.035 Y158.591 E-.06622
G1 X177.169 Y158.626 E-.13187
G1 X177.33 Y158.756 E-.19659
G1 X177.331 Y158.757 E-.00099
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.62 Y160.153 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.38 J-.154 E.02403
G1 X177.035 Y159.591 E.00219
G3 X176.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.18767
G1 X176.615 Y159.857 E-.15386
G1 X176.716 Y159.703 E-.17486
G1 X176.831 Y159.626 E-.1319
G1 X176.965 Y159.591 E-.13195
G1 X177.035 Y159.591 E-.06622
G1 X177.169 Y159.626 E-.13187
G1 X177.33 Y159.756 E-.19659
G1 X177.393 Y159.88 E-.13199
G1 X177.409 Y160.041 E-.15381
G1 X177.35 Y160.215 E-.17497
G1 X177.258 Y160.32 E-.1319
G1 X177.137 Y160.387 E-.13191
G1 X177.136 Y160.387 E-.00051
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X178.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.255 J-.318 E.0477
G1 X178.035 Y158.591 E.00219
G3 X178.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178.137 Y159.387 E-.18747
G1 X178 Y159.411 E-.13189
G1 X177.863 Y159.387 E-.13194
G1 X177.692 Y159.271 E-.19665
G1 X177.619 Y159.153 E-.1318
G1 X177.59 Y159.017 E-.13201
G1 X177.615 Y158.857 E-.15386
G1 X177.716 Y158.703 E-.17486
G1 X177.831 Y158.626 E-.1319
G1 X177.965 Y158.591 E-.13195
G1 X178.035 Y158.591 E-.06622
G1 X178.169 Y158.626 E-.13187
G1 X178.33 Y158.756 E-.19659
G1 X178.331 Y158.757 E-.001
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.62 Y160.153 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.38 J-.154 E.02403
G1 X178.035 Y159.591 E.00219
G3 X177.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18767
G1 X177.615 Y159.857 E-.15386
G1 X177.716 Y159.703 E-.17486
G1 X177.831 Y159.626 E-.1319
G1 X177.965 Y159.591 E-.13195
G1 X178.035 Y159.591 E-.06622
G1 X178.169 Y159.626 E-.13187
G1 X178.33 Y159.756 E-.19659
G1 X178.393 Y159.88 E-.13199
G1 X178.409 Y160.041 E-.15381
G1 X178.35 Y160.215 E-.17497
G1 X178.258 Y160.32 E-.1319
G1 X178.137 Y160.387 E-.13191
G1 X178.136 Y160.387 E-.00051
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X179.391 Y159.88 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.116 E.06284
G1 X179.035 Y159.591 E.00219
G3 X179.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 19
M204 S10000
G1 X180.177 Y160.364 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.177 J-.367 E.0448
G1 X180.035 Y159.591 E.00219
G3 X180.229 Y160.334 I-.035 J.406 E.03145
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X180 Y160.411 E-.22913
G1 X179.863 Y160.387 E-.13194
G1 X179.724 Y160.304 E-.15381
G1 X179.619 Y160.153 E-.17497
G1 X179.59 Y160.017 E-.13196
G1 X179.615 Y159.857 E-.15386
G1 X179.716 Y159.703 E-.17485
G1 X179.831 Y159.626 E-.13191
G1 X179.965 Y159.591 E-.13194
G1 X180.035 Y159.591 E-.06622
G1 X180.169 Y159.626 E-.13187
G1 X180.33 Y159.756 E-.19659
G1 X180.373 Y159.841 E-.09092
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.255 J-.318 E.0477
G1 X180.035 Y158.591 E.00219
G3 X180.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X180.137 Y159.387 E-.18747
G1 X180 Y159.411 E-.13189
G1 X179.863 Y159.387 E-.13194
G1 X179.692 Y159.271 E-.19665
G1 X179.619 Y159.153 E-.1318
G1 X179.59 Y159.017 E-.13201
G1 X179.615 Y158.857 E-.15386
G1 X179.716 Y158.703 E-.17485
G1 X179.831 Y158.626 E-.13191
G1 X179.965 Y158.591 E-.13194
G1 X180.035 Y158.591 E-.06622
G1 X180.169 Y158.626 E-.13187
G1 X180.33 Y158.756 E-.19659
G1 X180.331 Y158.757 E-.00099
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.255 J-.318 E.0477
G1 X179.035 Y158.591 E.00219
G3 X179.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X179.137 Y159.387 E-.18747
G1 X179 Y159.411 E-.13189
G1 X178.863 Y159.387 E-.13194
G1 X178.692 Y159.271 E-.19665
G1 X178.619 Y159.153 E-.1318
G1 X178.59 Y159.017 E-.13201
G1 X178.615 Y158.857 E-.15386
G1 X178.716 Y158.703 E-.17486
G1 X178.831 Y158.626 E-.13193
G1 X178.965 Y158.591 E-.13192
G1 X179.035 Y158.591 E-.06622
G1 X179.169 Y158.626 E-.13187
G1 X179.33 Y158.756 E-.19659
G1 X179.331 Y158.757 E-.00099
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.392 Y159.88 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.392 J.119 E.06329
G1 X181.035 Y159.591 E.00219
G3 X181.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 21
M204 S10000
G1 X181.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.257 J-.319 E.04801
G1 X181.035 Y158.591 E.00219
G3 X181.301 Y159.278 I-.035 J.409 E.02869
; COOLING_NODE: 22
M204 S10000
G1 X182.257 Y159.319 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.257 J-.319 E.04801
G1 X182.035 Y158.591 E.00219
G3 X182.301 Y159.278 I-.035 J.409 E.02869
; COOLING_NODE: 23
M204 S10000
G1 X182.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.392 J.119 E.06329
G1 X182.035 Y159.591 E.00219
G3 X182.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 24
M204 S10000
G1 X182.62 Y160.153 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.38 J-.154 E.02403
G1 X183.035 Y159.591 E.00219
G3 X182.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182.59 Y160.017 E-.18767
G1 X182.607 Y159.88 E-.1319
G1 X182.716 Y159.703 E-.19658
G1 X182.831 Y159.626 E-.13189
G1 X182.965 Y159.591 E-.13192
G1 X183.035 Y159.591 E-.06622
G1 X183.169 Y159.626 E-.13187
G1 X183.33 Y159.756 E-.19659
G1 X183.393 Y159.88 E-.13199
G1 X183.41 Y160.017 E-.13187
G1 X183.381 Y160.153 E-.13191
G1 X183.308 Y160.271 E-.13189
G1 X183.2 Y160.359 E-.13181
G1 X183.133 Y160.376 E-.0659
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.305 Y159.268 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.305 J-.271 E.04986
G1 X183.035 Y158.591 E.00219
G3 X183.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.25064
G1 X183 Y159.411 E-.13188
G1 X182.863 Y159.387 E-.13194
G1 X182.692 Y159.271 E-.19665
G1 X182.619 Y159.153 E-.1318
G1 X182.59 Y159.017 E-.13201
G1 X182.607 Y158.88 E-.1319
G1 X182.716 Y158.703 E-.19658
G1 X182.831 Y158.626 E-.13189
G1 X182.965 Y158.591 E-.13192
G1 X183.035 Y158.591 E-.06622
G1 X183.169 Y158.626 E-.13187
G1 X183.28 Y158.715 E-.1347
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z3.4 F60000
G1 Z3
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.401 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03619
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 26
; WIPE_START
G1 X183.411 Y161.898 E-.93936
G1 X183.358 Y161.725 E-.17155
G1 X183.505 Y161.626 E-.16889
G1 X183.604 Y161.532 E-.12931
G1 X183.746 Y161.3 E-.25842
G1 X183.786 Y161.169 E-.12985
G1 X183.791 Y161.061 E-.10263
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X183.305 Y161.268 Z3.4 F60000
G1 Z3
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.305 J-.271 E.04986
G1 X183.035 Y160.591 E.00219
G3 X183.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.25063
G1 X183 Y161.411 E-.13188
G1 X182.863 Y161.387 E-.13195
G1 X182.692 Y161.271 E-.19666
G1 X182.619 Y161.153 E-.1318
G1 X182.59 Y161.017 E-.13201
G1 X182.607 Y160.88 E-.1319
G1 X182.716 Y160.703 E-.19658
G1 X182.831 Y160.626 E-.13189
G1 X182.965 Y160.591 E-.13192
G1 X183.035 Y160.591 E-.06622
G1 X183.169 Y160.626 E-.13187
G1 X183.28 Y160.715 E-.13471
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.257 Y161.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.257 J-.319 E.04801
G1 X182.035 Y160.591 E.00219
G3 X182.301 Y161.278 I-.035 J.409 E.02869
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182.137 Y161.387 E-.18773
G1 X182 Y161.411 E-.13189
G1 X181.863 Y161.387 E-.13194
G1 X181.692 Y161.271 E-.19665
G1 X181.619 Y161.153 E-.1318
G1 X181.59 Y161.017 E-.13201
G1 X181.615 Y160.857 E-.15386
G1 X181.716 Y160.703 E-.17486
G1 X181.831 Y160.626 E-.13193
G1 X181.965 Y160.591 E-.13192
G1 X182.035 Y160.591 E-.06622
G1 X182.169 Y160.626 E-.13187
G1 X182.33 Y160.756 E-.19659
G1 X182.331 Y160.756 E-.00072
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.257 Y161.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.257 J-.319 E.04801
G1 X181.035 Y160.591 E.00219
G3 X181.301 Y161.278 I-.035 J.409 E.02869
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X181.137 Y161.387 E-.18773
G1 X181 Y161.411 E-.13189
G1 X180.863 Y161.387 E-.13194
G1 X180.692 Y161.271 E-.19665
G1 X180.619 Y161.153 E-.1318
G1 X180.59 Y161.017 E-.13201
G1 X180.615 Y160.857 E-.15384
G1 X180.716 Y160.703 E-.17488
G1 X180.831 Y160.626 E-.13193
G1 X180.965 Y160.591 E-.13192
G1 X181.035 Y160.591 E-.06622
G1 X181.169 Y160.626 E-.13187
G1 X181.33 Y160.756 E-.1966
G1 X181.331 Y160.756 E-.00071
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.255 J-.318 E.0477
G1 X180.035 Y160.591 E.00219
G3 X180.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X180.137 Y161.387 E-.18747
G1 X180 Y161.411 E-.13189
G1 X179.863 Y161.387 E-.13195
G1 X179.692 Y161.271 E-.19665
G1 X179.619 Y161.153 E-.1318
G1 X179.59 Y161.017 E-.13201
G1 X179.615 Y160.857 E-.15386
G1 X179.716 Y160.703 E-.17485
G1 X179.831 Y160.626 E-.13191
G1 X179.965 Y160.591 E-.13194
G1 X180.035 Y160.591 E-.06622
G1 X180.169 Y160.626 E-.13187
G1 X180.33 Y160.756 E-.1966
G1 X180.331 Y160.757 E-.00098
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.255 J-.318 E.0477
G1 X179.035 Y160.591 E.00219
G3 X179.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X179.137 Y161.387 E-.18747
G1 X179 Y161.411 E-.13189
G1 X178.863 Y161.387 E-.13194
G1 X178.692 Y161.271 E-.19665
G1 X178.619 Y161.153 E-.1318
G1 X178.59 Y161.017 E-.13201
G1 X178.615 Y160.857 E-.15386
G1 X178.716 Y160.703 E-.17486
G1 X178.831 Y160.626 E-.13193
G1 X178.965 Y160.591 E-.13192
G1 X179.035 Y160.591 E-.06622
G1 X179.169 Y160.626 E-.13187
G1 X179.33 Y160.756 E-.1966
G1 X179.331 Y160.757 E-.00098
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.255 J-.318 E.0477
G1 X178.035 Y160.591 E.00219
G3 X178.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178.137 Y161.387 E-.18747
G1 X178 Y161.411 E-.13189
G1 X177.863 Y161.387 E-.13195
G1 X177.692 Y161.271 E-.19666
G1 X177.619 Y161.153 E-.1318
G1 X177.59 Y161.017 E-.13201
G1 X177.615 Y160.857 E-.15386
G1 X177.716 Y160.703 E-.17486
G1 X177.831 Y160.626 E-.1319
G1 X177.965 Y160.591 E-.13195
G1 X178.035 Y160.591 E-.06622
G1 X178.169 Y160.626 E-.13187
G1 X178.33 Y160.756 E-.1966
G1 X178.331 Y160.757 E-.00098
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.255 J-.318 E.0477
G1 X177.035 Y160.591 E.00219
G3 X177.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177.137 Y161.387 E-.18747
G1 X177 Y161.411 E-.13189
G1 X176.863 Y161.387 E-.13195
G1 X176.692 Y161.271 E-.19666
G1 X176.619 Y161.153 E-.1318
G1 X176.59 Y161.017 E-.13201
G1 X176.615 Y160.857 E-.15386
G1 X176.716 Y160.703 E-.17486
G1 X176.831 Y160.626 E-.1319
G1 X176.965 Y160.591 E-.13195
G1 X177.035 Y160.591 E-.06622
G1 X177.169 Y160.626 E-.13187
G1 X177.33 Y160.756 E-.1966
G1 X177.331 Y160.757 E-.00098
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.257 Y161.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.257 J-.319 E.04801
G1 X176.035 Y160.591 E.00219
G3 X176.301 Y161.278 I-.035 J.409 E.02869
; COOLING_NODE: 34
M204 S10000
G1 X175.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.305 J-.271 E.04986
G1 X175.035 Y160.591 E.00219
G3 X175.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.137 Y161.387 E-.25068
G1 X175 Y161.411 E-.13189
G1 X174.863 Y161.387 E-.13194
G1 X174.692 Y161.271 E-.19665
G1 X174.619 Y161.153 E-.1318
G1 X174.59 Y161.017 E-.13201
G1 X174.607 Y160.88 E-.1319
G1 X174.716 Y160.703 E-.19658
G1 X174.831 Y160.626 E-.13186
G1 X174.965 Y160.591 E-.13195
G1 X175.035 Y160.591 E-.06622
G1 X175.169 Y160.626 E-.13187
G1 X175.279 Y160.715 E-.13465
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.305 Y161.268 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.305 J-.271 E.04986
G1 X174.035 Y160.591 E.00219
G3 X174.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X174.137 Y161.387 E-.25068
G1 X174 Y161.411 E-.13189
G1 X173.863 Y161.387 E-.13194
G1 X173.692 Y161.271 E-.19665
G1 X173.619 Y161.153 E-.1318
G1 X173.59 Y161.017 E-.13201
G1 X173.633 Y160.815 E-.19655
G1 X173.716 Y160.703 E-.13194
G1 X173.831 Y160.626 E-.13186
G1 X173.965 Y160.591 E-.13195
G1 X174.035 Y160.591 E-.06622
G1 X174.169 Y160.626 E-.13187
G1 X174.279 Y160.715 E-.13464
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.255 J-.318 E.0477
G1 X173.035 Y160.591 E.00219
G3 X173.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.18748
G1 X173 Y161.411 E-.13189
G1 X172.863 Y161.387 E-.13194
G1 X172.692 Y161.271 E-.19665
G1 X172.619 Y161.153 E-.1318
G1 X172.59 Y161.017 E-.13201
G1 X172.615 Y160.857 E-.15386
G1 X172.716 Y160.703 E-.17486
G1 X172.831 Y160.626 E-.13193
G1 X172.965 Y160.591 E-.13192
G1 X173.035 Y160.591 E-.06622
G1 X173.169 Y160.626 E-.13187
G1 X173.33 Y160.756 E-.19659
G1 X173.331 Y160.757 E-.00097
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.255 J-.318 E.0477
G1 X172.035 Y160.591 E.00219
G3 X172.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X172.137 Y161.387 E-.18748
G1 X172 Y161.411 E-.13189
G1 X171.863 Y161.387 E-.13194
G1 X171.692 Y161.271 E-.19665
G1 X171.619 Y161.153 E-.1318
G1 X171.59 Y161.017 E-.13201
G1 X171.615 Y160.857 E-.15386
G1 X171.716 Y160.703 E-.17486
G1 X171.831 Y160.626 E-.13193
G1 X171.965 Y160.591 E-.13192
G1 X172.035 Y160.591 E-.06622
G1 X172.169 Y160.626 E-.13187
G1 X172.33 Y160.756 E-.19659
G1 X172.331 Y160.757 E-.00097
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.255 J-.318 E.0477
G1 X171.035 Y160.591 E.00219
G3 X171.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.137 Y161.387 E-.18748
G1 X171 Y161.411 E-.13189
G1 X170.863 Y161.387 E-.13194
G1 X170.692 Y161.271 E-.19665
G1 X170.619 Y161.153 E-.1318
G1 X170.59 Y161.017 E-.13201
G1 X170.615 Y160.857 E-.15386
G1 X170.716 Y160.703 E-.17485
G1 X170.831 Y160.626 E-.13195
G1 X170.965 Y160.591 E-.13191
G1 X171.035 Y160.591 E-.06622
G1 X171.169 Y160.626 E-.13187
G1 X171.33 Y160.756 E-.19659
G1 X171.331 Y160.757 E-.00097
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.255 J-.318 E.0477
G1 X170.035 Y160.591 E.00219
G3 X170.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 40
M204 S10000
G1 X169.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.305 J-.271 E.04986
G1 X169.035 Y160.591 E.00219
G3 X169.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169.137 Y161.387 E-.25068
G1 X169 Y161.411 E-.13189
G1 X168.863 Y161.387 E-.13194
G1 X168.692 Y161.271 E-.19665
G1 X168.619 Y161.153 E-.1318
G1 X168.59 Y161.017 E-.13201
G1 X168.607 Y160.88 E-.1319
G1 X168.67 Y160.756 E-.13187
G1 X168.831 Y160.626 E-.19657
G1 X168.965 Y160.591 E-.13195
G1 X169.035 Y160.591 E-.06622
G1 X169.169 Y160.626 E-.13187
G1 X169.279 Y160.715 E-.13465
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.257 Y161.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.257 J-.319 E.04801
G1 X168.035 Y160.591 E.00219
G3 X168.301 Y161.278 I-.035 J.409 E.02869
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.18774
G1 X168 Y161.411 E-.13189
G1 X167.863 Y161.387 E-.13194
G1 X167.692 Y161.271 E-.19665
G1 X167.619 Y161.153 E-.1318
G1 X167.59 Y161.017 E-.13201
G1 X167.615 Y160.857 E-.15386
G1 X167.716 Y160.703 E-.17486
G1 X167.831 Y160.626 E-.13193
G1 X167.965 Y160.591 E-.13192
G1 X168.035 Y160.591 E-.06622
G1 X168.169 Y160.626 E-.13187
G1 X168.33 Y160.756 E-.19659
G1 X168.331 Y160.756 E-.00071
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.255 Y161.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.255 J-.318 E.0477
G1 X167.035 Y160.591 E.00219
G3 X167.299 Y161.275 I-.035 J.406 E.02856
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X167.137 Y161.387 E-.18748
G1 X167 Y161.411 E-.13189
G1 X166.863 Y161.387 E-.13194
G1 X166.692 Y161.271 E-.19665
G1 X166.619 Y161.153 E-.1318
G1 X166.59 Y161.017 E-.13201
G1 X166.607 Y160.88 E-.13196
G1 X166.716 Y160.703 E-.19647
G1 X166.831 Y160.626 E-.13193
G1 X166.965 Y160.591 E-.13192
G1 X167.035 Y160.591 E-.06622
G1 X167.169 Y160.626 E-.13187
G1 X167.33 Y160.756 E-.19659
G1 X167.331 Y160.757 E-.00125
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.37 Y159.495 Z3.4 F60000
G1 Z3
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.36 Y160.511 I.686 J.514 E.03679
G2 X166.642 Y161.725 I.681 J.482 E.04766
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04593
; COOLING_NODE: 48
M204 S10000
G1 X167.255 Y159.316 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.255 J-.318 E.0477
G1 X167.035 Y158.591 E.00219
G3 X167.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 47
M204 S10000
G1 X167.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.391 J.116 E.06284
G1 X167.035 Y159.591 E.00219
G3 X167.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.18773
G1 X167.381 Y160.153 E-.13188
G1 X167.308 Y160.271 E-.13189
G1 X167.18 Y160.37 E-.15387
G1 X167 Y160.411 E-.17497
G1 X166.863 Y160.387 E-.13194
G1 X166.724 Y160.304 E-.15381
G1 X166.619 Y160.153 E-.17497
G1 X166.59 Y160.017 E-.13196
G1 X166.607 Y159.88 E-.13196
G1 X166.716 Y159.703 E-.19647
G1 X166.831 Y159.626 E-.13193
G1 X166.899 Y159.608 E-.0666
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.392 Y159.88 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.392 J.119 E.06329
G1 X168.035 Y159.591 E.00219
G3 X168.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 41
M204 S10000
G1 X168.62 Y160.153 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.38 J-.154 E.02403
G1 X169.035 Y159.591 E.00219
G3 X168.646 Y160.207 I-.035 J.409 E.05267
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18768
G1 X168.607 Y159.88 E-.1319
G1 X168.67 Y159.756 E-.13187
G1 X168.831 Y159.626 E-.19657
G1 X168.965 Y159.591 E-.13195
G1 X169.035 Y159.591 E-.06622
G1 X169.169 Y159.626 E-.13187
G1 X169.33 Y159.756 E-.1966
G1 X169.393 Y159.88 E-.13199
G1 X169.41 Y160.017 E-.13187
G1 X169.381 Y160.153 E-.13191
G1 X169.258 Y160.32 E-.19662
G1 X169.137 Y160.387 E-.13191
G1 X169.136 Y160.387 E-.00105
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.305 Y159.268 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.305 J-.271 E.04986
G1 X169.035 Y158.591 E.00219
G3 X169.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.25066
G1 X169 Y159.411 E-.13189
G1 X168.863 Y159.387 E-.13194
G1 X168.692 Y159.271 E-.19665
G1 X168.619 Y159.153 E-.1318
G1 X168.59 Y159.017 E-.13201
G1 X168.607 Y158.88 E-.1319
G1 X168.67 Y158.756 E-.13187
G1 X168.831 Y158.626 E-.19657
G1 X168.965 Y158.591 E-.13195
G1 X169.035 Y158.591 E-.06622
G1 X169.169 Y158.626 E-.13187
G1 X169.28 Y158.715 E-.13467
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.257 Y159.319 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.257 J-.319 E.04801
G1 X168.035 Y158.591 E.00219
G3 X168.301 Y159.278 I-.035 J.409 E.02869
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X168.137 Y159.387 E-.18773
G1 X168 Y159.411 E-.13189
G1 X167.863 Y159.387 E-.13194
G1 X167.692 Y159.271 E-.19665
G1 X167.619 Y159.153 E-.1318
G1 X167.59 Y159.017 E-.13201
G1 X167.615 Y158.857 E-.15386
G1 X167.716 Y158.703 E-.17486
G1 X167.831 Y158.626 E-.13193
G1 X167.965 Y158.591 E-.13192
G1 X168.035 Y158.591 E-.06622
G1 X168.169 Y158.626 E-.13187
G1 X168.33 Y158.756 E-.19659
G1 X168.331 Y158.756 E-.00074
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.255 J-.318 E.0477
G1 X170.035 Y158.591 E.00219
G3 X170.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 42
M204 S10000
G1 X170.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.391 J.116 E.06284
G1 X170.035 Y159.591 E.00219
G3 X170.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.409 Y160.041 E-.20926
G1 X170.35 Y160.215 E-.17499
G1 X170.255 Y160.322 E-.13559
G1 X170.18 Y160.37 E-.08478
G1 X170 Y160.411 E-.17497
G1 X169.863 Y160.387 E-.13194
G1 X169.724 Y160.304 E-.15381
G1 X169.619 Y160.153 E-.17497
G1 X169.59 Y160.017 E-.13196
G1 X169.615 Y159.857 E-.15384
G1 X169.716 Y159.703 E-.17487
G1 X169.831 Y159.626 E-.13195
G1 X169.899 Y159.608 E-.06706
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.392 Y159.88 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.392 J.119 E.06328
G1 X171.035 Y159.591 E.00219
G3 X171.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.409 Y160.041 E-.20938
G1 X171.35 Y160.215 E-.17497
G1 X171.258 Y160.32 E-.1319
G1 X171.137 Y160.387 E-.13191
G1 X171 Y160.411 E-.13189
G1 X170.863 Y160.387 E-.13194
G1 X170.724 Y160.304 E-.15381
G1 X170.619 Y160.153 E-.17497
G1 X170.59 Y160.017 E-.13196
G1 X170.615 Y159.857 E-.15386
G1 X170.716 Y159.703 E-.17485
G1 X170.831 Y159.626 E-.13195
G1 X170.899 Y159.608 E-.06661
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.391 Y159.88 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.116 E.06284
G1 X172.035 Y159.591 E.00219
G3 X172.369 Y159.824 I-.035 J.406 E.01339
; COOLING_NODE: 4
M204 S10000
G1 X172.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.255 J-.318 E.0477
G1 X172.035 Y158.591 E.00219
G3 X172.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X172.137 Y159.387 E-.18747
G1 X172 Y159.411 E-.13189
G1 X171.863 Y159.387 E-.13194
G1 X171.692 Y159.271 E-.19665
G1 X171.619 Y159.153 E-.1318
G1 X171.59 Y159.017 E-.13201
G1 X171.615 Y158.857 E-.15386
G1 X171.716 Y158.703 E-.17486
G1 X171.831 Y158.626 E-.13193
G1 X171.965 Y158.591 E-.13192
G1 X172.035 Y158.591 E-.06622
G1 X172.169 Y158.626 E-.13187
G1 X172.33 Y158.756 E-.19659
G1 X172.331 Y158.757 E-.00099
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X171.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.255 J-.318 E.0477
G1 X171.035 Y158.591 E.00219
G3 X171.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X171.137 Y159.387 E-.18747
G1 X171 Y159.411 E-.13189
G1 X170.863 Y159.387 E-.13194
G1 X170.692 Y159.271 E-.19665
G1 X170.619 Y159.153 E-.1318
G1 X170.59 Y159.017 E-.13201
G1 X170.615 Y158.857 E-.15386
G1 X170.716 Y158.703 E-.17485
G1 X170.831 Y158.626 E-.13195
G1 X170.965 Y158.591 E-.13191
G1 X171.035 Y158.591 E-.06622
G1 X171.169 Y158.626 E-.13187
G1 X171.33 Y158.756 E-.19659
G1 X171.331 Y158.757 E-.00099
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.255 Y159.316 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.255 J-.318 E.0477
G1 X173.035 Y158.591 E.00219
G3 X173.299 Y159.275 I-.035 J.406 E.02856
; COOLING_NODE: 2
M204 S10000
G1 X173.392 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.392 J.119 E.06328
G1 X173.035 Y159.591 E.00219
G3 X173.371 Y159.824 I-.035 J.409 E.01342
; COOLING_NODE: 1
M204 S10000
G1 X173.725 Y160.303 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.275 J-.304 E.02984
G1 X174.035 Y159.591 E.00219
G3 X173.772 Y160.34 I-.035 J.409 E.04686
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.22994
G1 X173.59 Y160.017 E-.13196
G1 X173.633 Y159.815 E-.19655
G1 X173.716 Y159.703 E-.13194
G1 X173.831 Y159.626 E-.13186
G1 X173.965 Y159.591 E-.13195
G1 X174.035 Y159.591 E-.06622
G1 X174.169 Y159.626 E-.13187
G1 X174.33 Y159.756 E-.1966
G1 X174.393 Y159.88 E-.13199
G1 X174.41 Y160.017 E-.13187
G1 X174.381 Y160.153 E-.13191
G1 X174.284 Y160.285 E-.15535
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.305 Y159.268 Z3.4 F60000
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.305 J-.271 E.04986
G1 X174.035 Y158.591 E.00219
G3 X174.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 9
M204 S10000
G1 X175.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.305 J-.271 E.04986
G1 X175.035 Y158.591 E.00219
G3 X175.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X175.137 Y159.387 E-.25066
G1 X175 Y159.411 E-.13189
G1 X174.863 Y159.387 E-.13194
G1 X174.692 Y159.271 E-.19665
G1 X174.619 Y159.153 E-.1318
G1 X174.59 Y159.017 E-.13201
G1 X174.607 Y158.88 E-.1319
G1 X174.716 Y158.703 E-.19658
G1 X174.831 Y158.626 E-.13186
G1 X174.965 Y158.591 E-.13195
G1 X175.035 Y158.591 E-.06622
G1 X175.169 Y158.626 E-.13187
G1 X175.28 Y158.715 E-.13467
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.424 Y161.4 Z3.4 F60000
G1 X184.79 Y162.29 Z3.4
G1 Z3
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311773
G1 F4017.071
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294507
G1 F4292.752
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.26631
G1 F4834.598
G1 X184.09 Y161.225 E.00195
; LINE_WIDTH: 0.243508
G1 F5384.189
G2 X184.078 Y160.68 I-2.438 J-.22 E.00911
; LINE_WIDTH: 0.278646
G1 F4581.602
G1 X184.075 Y160.66 E.00039
; LINE_WIDTH: 0.297372
G1 F4244.426
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.328541
G1 F3781.24
G1 X184.044 Y160.497 E.00197
G1 X184.025 Y160.497 E.00045
; LINE_WIDTH: 0.290674
G1 F4359.174
G1 X183.95 Y160.496 E.00154
; LINE_WIDTH: 0.252299
G1 F5158.128
G1 X183.875 Y160.496 E.0013
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311801
G1 F4016.653
M204 S8000
G1 X184.062 Y160.415 E.00892
; LINE_WIDTH: 0.294517
G1 F4292.583
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266314
G1 F4834.511
G1 X184.09 Y160.225 E.00195
; LINE_WIDTH: 0.243508
G1 F5384.189
G2 X184.078 Y159.68 I-2.438 J-.22 E.00911
; LINE_WIDTH: 0.278646
G1 F4581.602
G1 X184.075 Y159.66 E.00039
; LINE_WIDTH: 0.297372
G1 F4244.426
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328551
G1 F3781.109
G1 X184.044 Y159.497 E.00197
G1 X184.025 Y159.496 E.00045
; LINE_WIDTH: 0.290758
G1 F4357.697
G1 X183.95 Y159.496 E.00154
; LINE_WIDTH: 0.252372
G1 F5156.311
G1 X183.875 Y159.496 E.0013
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311777
G1 F4017.004
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294507
G1 F4292.752
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.26631
G1 F4834.592
G1 X184.09 Y159.225 E.00195
; LINE_WIDTH: 0.243503
G1 F5384.326
G2 X184.078 Y158.68 I-2.44 J-.22 E.00911
; LINE_WIDTH: 0.278591
G1 F4582.658
G1 X184.075 Y158.66 E.0004
; LINE_WIDTH: 0.298128
G1 F4231.851
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353114
G1 F3481.701
G1 X184.036 Y158.464 E.00292
G1 X183.753 Y158.306 E.00836
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609607
G1 F1905.815
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574675
G1 F2031.012
G2 X182.196 Y158.161 I-.349 J1.727 E.00657
; LINE_WIDTH: 0.540428
G1 F2170.82
G2 X181.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581528
G1 F2005.172
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609618
G1 F1905.78
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609607
G1 F1905.815
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574675
G1 F2031.012
G2 X168.196 Y158.161 I-.349 J1.727 E.00657
; LINE_WIDTH: 0.540428
G1 F2170.82
G2 X167.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581528
G1 F2005.172
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609618
G1 F1905.78
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.243 Y158.306 F60000
; LINE_WIDTH: 0.358493
G1 F3422.348
M204 S8000
G1 X165.964 Y158.464 E.00842
G1 X165.958 Y158.489 E.00067
; LINE_WIDTH: 0.331422
G1 F3743.483
G1 X165.942 Y158.574 E.00209
; LINE_WIDTH: 0.294588
G1 F4291.368
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.24387
G1 F5374.477
G2 X165.912 Y159.244 I2.46 J.325 E.00945
; LINE_WIDTH: 0.268969
G1 F4777.734
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308762
G1 F4062.573
G2 X166.014 Y159.807 I5.642 J-.802 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.250007
G1 F5215.209
M204 S8000
G1 X166.051 Y159.496 E.00127
; LINE_WIDTH: 0.287648
G1 F4413.075
G1 X165.977 Y159.497 E.0015
; LINE_WIDTH: 0.314581
G1 F3975.545
G1 X165.956 Y159.497 E.00047
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.257987
G1 F5021.695
G2 X165.903 Y159.868 I6.941 J.85 E.00374
; LINE_WIDTH: 0.237915
G1 F5538.626
G2 X165.912 Y160.244 I3.131 J.109 E.00611
; LINE_WIDTH: 0.268935
G1 F4778.447
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.30871
G1 F4063.357
G2 X166.014 Y160.806 I5.587 J-.793 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.250067
G1 F5213.699
M204 S8000
G1 X166.051 Y160.496 E.00127
; LINE_WIDTH: 0.287752
G1 F4411.201
G1 X165.977 Y160.497 E.0015
; LINE_WIDTH: 0.314577
G1 F3975.612
G1 X165.956 Y160.497 E.00047
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.257987
G1 F5021.695
G2 X165.903 Y160.868 I6.941 J.85 E.00374
; LINE_WIDTH: 0.237916
G1 F5538.598
G2 X165.912 Y161.244 I3.132 J.109 E.00611
; LINE_WIDTH: 0.268969
G1 F4777.734
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307817
G1 F4077.07
G2 X165.992 Y161.694 I4.311 J-.602 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z3.4 I-1.217 J.015 P1  F60000
G1 X167.428 Y279.944 Z3.4
G1 Z3
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #16
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
M73 P76 R8
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z3.4 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z3
G1 E2 F600
M104 T1 S220 N0 ;Multi extruder pre heating
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
M73 P77 R8
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
M73 P77 R7
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S174 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
M73 P78 R7
G3 Z3.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E6

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z6 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S160.65
M106 P2 S191
G1 X204.318 Y252.694 F60000
G1 Z3

; filament start gcode
G17
G3 Z3.4 I0 J-1.217 P1
G1 X199.428 Y252.694 Z3.4
G1 Z3
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X200.928  F600
G1  X199.428  F240
G1  X199.928  F600
G1  Y253.194 
G1  X198.928 
G1  Y252.194 
G1  X200.428 
G1  Y253.694 
G1  X198.428 
G1  Y251.694 
G1  X196.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X167.428  E1.2162 F2473
G1  Y254.944  E0.0285
G1  X199.428  E1.2162 F4725
G1  Y255.694  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X167.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X199.428  E1.2162
G1  Y257.194  E0.0285
M73 P79 R7
G1  X167.428  E1.2162
G1  Y257.944  E0.0285
G1  X199.428  E1.2162
G1  Y258.694  E0.0285
G1  X167.428  E1.2162
G1  Y259.444  E0.0285
G1  X199.428  E1.2162
G1  Y260.194  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #16
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.543 Y251.744   E0.0535
G1 E-0.4000 F1800
M204 S10000
G1  X201.169 Y253.644   F600
G1 E0.4000 F1800
M204 S8000
G3  X200.739 Y256.835   I-1.385 J1.438 E0.1423 F5400
G2  X199.928 Y259.090   I2.785 J2.275 E0.0929
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END

; WIPE_START
G1 F4077.07
M204 S8000
G1 X166.928 Y280.444 E-.00001
G1 X167.578 Y281.204 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z3
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2421
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 15 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z3.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer15 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 16/25
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

M106 S186.15
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z3.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2272
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 16 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z3.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer16 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z3.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.216 Y278.401   I8.989 J-9.270 E0.1015 F5400
G1 E-0.4000 F1800
M204 S10000
G1  X165.744 Y276.190   F600
G1 E0.4000 F1800
M204 S8000
G2  X166.928 Y273.548   I-2.389 J-2.656 E0.1133 F5400
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G3  X168.451 Y250.453   I20.946 J15.027 E0.1782
G3  X171.859 Y251.132   I1.345 J2.142 E0.1456
G2  X175.079 Y252.194   I3.241 J-4.414 E0.1310
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X167.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #17
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #16
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z3.6 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z3.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S78 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E5

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z6.2 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
M73 P80 R7
G1 X204.318 Y265.285 F60000
G1 Z3.2
G1 X204.318 Y272.917 Z3.6
G1 X204.318 Y285.121 Z3.6
G1 X162.538 Y285.121
G1 X162.538 Y277.194

; filament start gcode
G1 X167.428 Y277.194
G1 Z3.2
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X165.928 
G1  X167.428  F240
G1  X167.928  F600
G1  Y277.694 
G1  X166.928 
G1  Y276.694 
G1  X168.428 
G1  Y278.194 
G1  X166.428 
G1  Y276.194 
G1  X170.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X199.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X167.428  E1.2162
G1  Y274.194  E0.0285
G1  X199.428  E1.2162
G1  Y273.444  E0.0285
G1  X167.428  E1.2162
G1  Y272.694  E0.0285
G1  X199.428  E1.2162
G1  Y271.944  E0.0285
G1  X167.428  E1.2162
G1  Y271.194  E0.0285
G1  X199.428  E1.2162
G1  Y270.444  E0.0285
M73 P80 R6
G1  X167.428  E1.2162
G1  Y269.694  E0.0285
G1  X199.428  E1.2162
G1  Y268.944  E0.0285
G1  X167.428  E1.2162
G1  Y268.194  E0.0285
G1  X199.428  E1.2162
G1  Y267.444  E0.0285
G1  X167.428  E1.2162
G1  Y266.694  E0.0285
G1  X199.428  E1.2162
G1  Y265.944  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y277.944  E0.0760 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #17
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.732 Y160.299
G1 Z3.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.268 J-.304 E.02966
G1 X175.035 Y159.591 E.00219
G3 X174.78 Y160.335 I-.035 J.404 E.04613
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.619 Y160.153 E-.23099
G1 X174.59 Y160.017 E-.13193
G1 X174.607 Y159.88 E-.13186
G1 X174.67 Y159.756 E-.13198
G1 X174.831 Y159.626 E-.19666
G1 X174.965 Y159.591 E-.13184
G1 X175.035 Y159.591 E-.06626
G1 X175.169 Y159.626 E-.13189
G1 X175.33 Y159.756 E-.19658
G1 X175.394 Y159.883 E-.13498
G1 X175.41 Y160.017 E-.12891
G1 X175.381 Y160.153 E-.13186
G1 X175.308 Y160.271 E-.13182
G1 X175.29 Y160.286 E-.02244
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.732 Y160.299 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.268 J-.304 E.02966
G1 X174.035 Y159.591 E.00219
G3 X173.78 Y160.335 I-.035 J.404 E.04613
; COOLING_NODE: 8
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.23099
G1 X173.59 Y160.017 E-.13193
G1 X173.607 Y159.88 E-.13186
G1 X173.67 Y159.756 E-.13198
G1 X173.831 Y159.626 E-.19666
G1 X173.965 Y159.591 E-.13184
G1 X174.035 Y159.591 E-.06626
G1 X174.169 Y159.626 E-.13189
G1 X174.33 Y159.756 E-.19658
G1 X174.394 Y159.883 E-.13498
G1 X174.41 Y160.017 E-.12891
G1 X174.381 Y160.153 E-.13186
G1 X174.308 Y160.271 E-.13182
G1 X174.29 Y160.286 E-.02243
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.302 J-.271 E.04951
M73 P81 R6
G1 X174.035 Y158.591 E.00219
G3 X174.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 9
M204 S10000
G1 X175.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.302 J-.271 E.04951
G1 X175.035 Y158.591 E.00219
G3 X175.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 10
M204 S10000
G1 X176.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.302 J-.271 E.04951
G1 X176.035 Y158.591 E.00219
G3 X176.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 13
; WIPE_START
M204 S8000
G1 X176.198 Y159.36 E-.19046
G1 X176.008 Y159.411 E-.18665
G1 X175.863 Y159.387 E-.13928
G1 X175.726 Y159.306 E-.15162
G1 X175.619 Y159.153 E-.1773
G1 X175.59 Y159.017 E-.13187
G1 X175.607 Y158.88 E-.1319
G1 X175.67 Y158.756 E-.13195
G1 X175.831 Y158.626 E-.19666
G1 X175.965 Y158.591 E-.13184
G1 X176.035 Y158.591 E-.06626
G1 X176.169 Y158.626 E-.13189
G1 X176.278 Y158.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.595 Y160.017 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.405 J-.022 E.01958
G1 X176.035 Y159.591 E.00219
G3 X175.603 Y160.077 I-.035 J.404 E.05622
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18717
G1 X175.67 Y159.756 E-.13198
G1 X175.831 Y159.626 E-.19666
G1 X175.965 Y159.591 E-.13184
G1 X176.035 Y159.591 E-.06626
G1 X176.169 Y159.626 E-.13189
G1 X176.33 Y159.756 E-.19658
G1 X176.394 Y159.883 E-.13498
G1 X176.41 Y160.017 E-.12891
G1 X176.381 Y160.153 E-.13186
G1 X176.308 Y160.271 E-.13182
G1 X176.198 Y160.36 E-.13513
G1 X176.008 Y160.411 E-.18668
G1 X175.999 Y160.41 E-.00825
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.626 Y160.15 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.374 J-.156 E.02388
G1 X177.035 Y159.591 E.00219
G3 X176.653 Y160.204 I-.035 J.404 E.05191
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.18714
G1 X176.607 Y159.88 E-.13177
G1 X176.67 Y159.756 E-.13209
G1 X176.831 Y159.626 E-.19664
G1 X176.965 Y159.591 E-.13184
G1 X177.035 Y159.591 E-.06626
G1 X177.169 Y159.626 E-.13189
G1 X177.33 Y159.756 E-.19658
G1 X177.394 Y159.883 E-.13498
G1 X177.41 Y160.017 E-.12891
G1 X177.381 Y160.153 E-.13186
G1 X177.308 Y160.271 E-.13182
G1 X177.198 Y160.36 E-.13513
G1 X177.133 Y160.378 E-.06308
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.302 J-.271 E.04951
G1 X177.035 Y158.591 E.00219
G3 X177.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 17
M204 S10000
G1 X178.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.302 J-.271 E.04951
G1 X178.035 Y158.591 E.00219
G3 X178.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 16
M204 S10000
G1 X179.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.302 J-.271 E.04951
G1 X179.035 Y158.591 E.00219
G3 X179.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 15
M204 S10000
G1 X179.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.39 J.111 E.06233
G1 X179.035 Y159.591 E.00219
G3 X179.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.18472
G1 X179.381 Y160.153 E-.13186
G1 X179.308 Y160.271 E-.13193
G1 X179.198 Y160.36 E-.13505
G1 X179.008 Y160.411 E-.18665
G1 X178.863 Y160.387 E-.13928
G1 X178.726 Y160.306 E-.15162
G1 X178.619 Y160.153 E-.17723
G1 X178.59 Y160.017 E-.13193
G1 X178.607 Y159.88 E-.13177
G1 X178.67 Y159.756 E-.13209
G1 X178.831 Y159.626 E-.19658
G1 X178.901 Y159.607 E-.06928
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.626 Y160.15 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.374 J-.156 E.02388
G1 X178.035 Y159.591 E.00219
G3 X177.653 Y160.204 I-.035 J.404 E.05191
; COOLING_NODE: 30
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18714
G1 X177.607 Y159.88 E-.13177
G1 X177.67 Y159.756 E-.13209
G1 X177.831 Y159.626 E-.19664
G1 X177.965 Y159.591 E-.13184
G1 X178.035 Y159.591 E-.06626
G1 X178.169 Y159.626 E-.13189
G1 X178.33 Y159.756 E-.19658
G1 X178.394 Y159.883 E-.13498
G1 X178.41 Y160.017 E-.12891
G1 X178.381 Y160.153 E-.13186
G1 X178.308 Y160.271 E-.13182
G1 X178.198 Y160.36 E-.13513
G1 X178.133 Y160.378 E-.06308
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.302 J-.271 E.04951
G1 X179.035 Y160.591 E.00219
G3 X179.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X179.198 Y161.36 E-.19049
G1 X179.008 Y161.411 E-.18665
G1 X178.863 Y161.387 E-.13928
G1 X178.726 Y161.306 E-.15162
G1 X178.619 Y161.153 E-.1773
G1 X178.59 Y161.017 E-.13187
G1 X178.607 Y160.88 E-.13177
G1 X178.67 Y160.756 E-.13209
G1 X178.831 Y160.626 E-.19658
G1 X178.965 Y160.591 E-.13189
G1 X179.035 Y160.591 E-.06628
G1 X179.169 Y160.626 E-.13188
G1 X179.278 Y160.713 E-.1323
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.302 J-.271 E.04951
G1 X178.035 Y160.591 E.00219
G3 X178.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X178.198 Y161.36 E-.19047
G1 X178.008 Y161.411 E-.18665
G1 X177.863 Y161.387 E-.13928
G1 X177.726 Y161.306 E-.15162
G1 X177.619 Y161.153 E-.1773
G1 X177.59 Y161.017 E-.13187
G1 X177.607 Y160.88 E-.13177
G1 X177.67 Y160.756 E-.13209
G1 X177.831 Y160.626 E-.19664
G1 X177.965 Y160.591 E-.13184
G1 X178.035 Y160.591 E-.06626
G1 X178.169 Y160.626 E-.13188
G1 X178.278 Y160.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.302 J-.271 E.04951
G1 X177.035 Y160.591 E.00219
G3 X177.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 33
; WIPE_START
M204 S8000
G1 X177.198 Y161.36 E-.19047
G1 X177.008 Y161.411 E-.18665
G1 X176.863 Y161.387 E-.13928
G1 X176.726 Y161.306 E-.15162
G1 X176.619 Y161.153 E-.1773
G1 X176.59 Y161.017 E-.13187
G1 X176.607 Y160.88 E-.13177
G1 X176.67 Y160.756 E-.13209
G1 X176.831 Y160.626 E-.19664
G1 X176.965 Y160.591 E-.13184
G1 X177.035 Y160.591 E-.06626
G1 X177.169 Y160.626 E-.13188
G1 X177.278 Y160.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.302 J-.271 E.04951
G1 X176.035 Y160.591 E.00219
G3 X176.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 34
; WIPE_START
M204 S8000
G1 X176.198 Y161.36 E-.19047
G1 X176.008 Y161.411 E-.18665
G1 X175.863 Y161.387 E-.13928
G1 X175.726 Y161.306 E-.15162
G1 X175.619 Y161.153 E-.1773
G1 X175.59 Y161.017 E-.13187
G1 X175.607 Y160.88 E-.13186
G1 X175.67 Y160.756 E-.13198
G1 X175.831 Y160.626 E-.19666
G1 X175.965 Y160.591 E-.13184
G1 X176.035 Y160.591 E-.06626
G1 X176.169 Y160.626 E-.13188
G1 X176.278 Y160.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.302 J-.271 E.04951
G1 X175.035 Y160.591 E.00219
G3 X175.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X175.198 Y161.36 E-.19047
G1 X175.008 Y161.411 E-.18665
G1 X174.863 Y161.387 E-.13928
G1 X174.726 Y161.306 E-.15162
G1 X174.619 Y161.153 E-.1773
G1 X174.59 Y161.017 E-.13187
G1 X174.607 Y160.88 E-.13186
G1 X174.67 Y160.756 E-.13198
G1 X174.831 Y160.626 E-.19666
G1 X174.965 Y160.591 E-.13184
G1 X175.035 Y160.591 E-.06626
G1 X175.169 Y160.626 E-.13188
G1 X175.278 Y160.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.302 J-.271 E.04951
G1 X174.035 Y160.591 E.00219
G3 X174.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X174.198 Y161.36 E-.19047
G1 X174.008 Y161.411 E-.18665
G1 X173.863 Y161.387 E-.13928
G1 X173.726 Y161.306 E-.15161
G1 X173.619 Y161.153 E-.1773
G1 X173.59 Y161.017 E-.13187
G1 X173.607 Y160.88 E-.13186
G1 X173.67 Y160.756 E-.13198
G1 X173.831 Y160.626 E-.19666
G1 X173.965 Y160.591 E-.13184
G1 X174.035 Y160.591 E-.06626
G1 X174.169 Y160.626 E-.13188
G1 X174.278 Y160.713 E-.13234
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X167.302 Y161.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.302 J-.271 E.04951
G1 X167.035 Y160.591 E.00219
G3 X167.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 50
M204 S10000
G1 X168.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.302 J-.271 E.04951
G1 X168.035 Y160.591 E.00219
G3 X168.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 40
M204 S10000
G1 X169.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.302 J-.271 E.04951
G1 X169.035 Y160.591 E.00219
G3 X169.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 39
M204 S10000
G1 X170.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.302 J-.271 E.04951
G1 X170.035 Y160.591 E.00219
G3 X170.339 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 38
M204 S10000
G1 X171.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.302 J-.271 E.04951
G1 X171.035 Y160.591 E.00219
G3 X171.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 37
M204 S10000
G1 X172.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.302 J-.271 E.04951
G1 X172.035 Y160.591 E.00219
G3 X172.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 36
M204 S10000
G1 X173.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.255 J-.319 E.04773
G1 X173.035 Y160.591 E.00219
G3 X173.299 Y161.275 I-.035 J.407 E.02858
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.18739
G1 X172.989 Y161.41 E-.1418
G1 X172.8 Y161.359 E-.18654
G1 X172.692 Y161.271 E-.13186
G1 X172.619 Y161.153 E-.13195
G1 X172.59 Y161.017 E-.13187
G1 X172.607 Y160.88 E-.13177
G1 X172.67 Y160.756 E-.13209
G1 X172.831 Y160.626 E-.19658
G1 X172.965 Y160.591 E-.13189
G1 X173.035 Y160.591 E-.06628
G1 X173.172 Y160.627 E-.13498
G1 X173.33 Y160.756 E-.19365
G1 X173.331 Y160.757 E-.00136
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.392 Y159.88 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.392 J.119 E.06329
G1 X173.035 Y159.591 E.00219
G3 X173.371 Y159.824 I-.035 J.409 E.01341
; COOLING_NODE: 3
M204 S10000
G1 X173.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.255 J-.319 E.04773
G1 X173.035 Y158.591 E.00219
G3 X173.299 Y159.275 I-.035 J.407 E.02858
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X173.137 Y159.387 E-.18738
G1 X172.989 Y159.41 E-.1418
G1 X172.8 Y159.359 E-.18654
G1 X172.692 Y159.271 E-.13186
G1 X172.619 Y159.153 E-.13195
G1 X172.59 Y159.017 E-.13187
G1 X172.607 Y158.88 E-.13181
G1 X172.67 Y158.756 E-.13205
G1 X172.831 Y158.626 E-.19658
G1 X172.965 Y158.591 E-.13189
G1 X173.035 Y158.591 E-.06628
G1 X173.172 Y158.627 E-.13498
G1 X173.33 Y158.756 E-.19365
G1 X173.331 Y158.757 E-.00137
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X171.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.302 J-.271 E.04951
G1 X171.035 Y158.591 E.00219
G3 X171.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 4
M204 S10000
G1 X172.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.302 J-.271 E.04951
G1 X172.035 Y158.591 E.00219
G3 X172.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 5
M204 S10000
G1 X172.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.39 J.111 E.06233
G1 X172.035 Y159.591 E.00219
G3 X172.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 6
M204 S10000
G1 X171.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.39 J.111 E.06233
G1 X171.035 Y159.591 E.00219
G3 X171.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 42
M204 S10000
G1 X170.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.39 J.111 E.06233
G1 X170.035 Y159.591 E.00219
G3 X170.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X170.41 Y160.017 E-.18472
G1 X170.381 Y160.153 E-.13186
G1 X170.308 Y160.271 E-.13193
G1 X170.198 Y160.36 E-.13505
G1 X170.008 Y160.411 E-.18665
G1 X169.863 Y160.387 E-.13928
G1 X169.726 Y160.306 E-.15162
G1 X169.619 Y160.153 E-.17723
G1 X169.59 Y160.017 E-.13193
G1 X169.607 Y159.88 E-.13177
G1 X169.67 Y159.756 E-.13211
G1 X169.831 Y159.626 E-.19655
G1 X169.901 Y159.607 E-.0693
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.626 Y160.15 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.374 J-.156 E.02388
G1 X169.035 Y159.591 E.00219
G3 X168.653 Y160.204 I-.035 J.404 E.05191
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18715
G1 X168.607 Y159.88 E-.13186
G1 X168.67 Y159.756 E-.13198
G1 X168.831 Y159.626 E-.19666
G1 X168.965 Y159.591 E-.13184
G1 X169.035 Y159.591 E-.06626
G1 X169.169 Y159.626 E-.13189
G1 X169.33 Y159.756 E-.19658
G1 X169.394 Y159.883 E-.13498
G1 X169.41 Y160.017 E-.12891
G1 X169.381 Y160.153 E-.13186
G1 X169.308 Y160.271 E-.13182
G1 X169.198 Y160.36 E-.13513
G1 X169.133 Y160.378 E-.06307
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.302 J-.271 E.04951
G1 X169.035 Y158.591 E.00219
G3 X169.338 Y159.218 I-.035 J.404 E.02629
; COOLING_NODE: 43
M204 S10000
G1 X170.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.302 J-.271 E.04951
G1 X170.035 Y158.591 E.00219
G3 X170.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X170.198 Y159.36 E-.19049
G1 X170.008 Y159.411 E-.18665
G1 X169.863 Y159.387 E-.13928
G1 X169.726 Y159.306 E-.15161
G1 X169.619 Y159.153 E-.1773
G1 X169.59 Y159.017 E-.13187
G1 X169.607 Y158.88 E-.13181
G1 X169.67 Y158.756 E-.13207
G1 X169.831 Y158.626 E-.19655
G1 X169.965 Y158.591 E-.13189
G1 X170.035 Y158.591 E-.06628
G1 X170.169 Y158.626 E-.13189
G1 X170.278 Y158.713 E-.13231
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.302 J-.271 E.04951
G1 X168.035 Y158.591 E.00219
G3 X168.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 46
M204 S10000
G1 X168.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.39 J.111 E.06233
G1 X168.035 Y159.591 E.00219
G3 X168.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 47
M204 S10000
G1 X167.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.39 J.111 E.06233
G1 X167.035 Y159.591 E.00219
G3 X167.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 48
M204 S10000
G1 X167.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.302 J-.271 E.04951
G1 X167.035 Y158.591 E.00219
G3 X167.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.198 Y159.36 E-.19049
G1 X167.008 Y159.411 E-.18665
G1 X166.863 Y159.387 E-.13928
G1 X166.726 Y159.306 E-.15161
G1 X166.619 Y159.153 E-.1773
G1 X166.59 Y159.017 E-.13187
G1 X166.607 Y158.88 E-.13181
G1 X166.67 Y158.756 E-.13205
G1 X166.831 Y158.626 E-.19658
G1 X166.965 Y158.591 E-.13189
G1 X167.035 Y158.591 E-.06628
G1 X167.169 Y158.626 E-.13189
G1 X167.278 Y158.713 E-.13231
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X166.36 Y159.511 Z3.6 F60000
G1 Z3.2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.36 Y160.511 I.691 J.5 E.03616
G2 X166.642 Y161.729 I.66 J.489 E.04809
G1 X166.587 Y161.898 E.00602
G1 X165.602 Y161.898 E.03334
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.327 Y159.461 I.399 J.735 E.04614
; COOLING_NODE: 25
; WIPE_START
G1 X166.282 Y159.638 E-.17335
G1 X166.231 Y159.765 E-.12951
G1 X166.196 Y160.034 E-.25807
G1 X166.254 Y160.3 E-.25833
G1 X166.36 Y160.511 E-.22433
G1 X166.282 Y160.638 E-.14206
G1 X166.231 Y160.765 E-.12951
G1 X166.196 Y161.034 E-.25807
G1 X166.214 Y161.17 E-.12972
G1 X166.254 Y161.3 E-.12934
G1 X166.286 Y161.363 E-.06771
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.861 Y160.429 Z3.6 F60000
G1 X183.302 Y159.265 Z3.6
G1 Z3.2
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.302 J-.271 E.04951
G1 X183.035 Y158.591 E.00219
G3 X183.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.198 Y159.36 E-.19046
G1 X183.008 Y159.411 E-.18665
G1 X182.863 Y159.387 E-.13928
G1 X182.726 Y159.306 E-.15161
G1 X182.619 Y159.153 E-.1773
G1 X182.59 Y159.017 E-.13187
G1 X182.607 Y158.88 E-.1319
G1 X182.67 Y158.756 E-.13195
G1 X182.831 Y158.626 E-.19659
G1 X182.965 Y158.591 E-.13189
G1 X183.035 Y158.591 E-.06628
G1 X183.169 Y158.626 E-.13189
G1 X183.278 Y158.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.626 Y160.15 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.374 J-.156 E.02388
G1 X183.035 Y159.591 E.00219
G3 X182.653 Y160.204 I-.035 J.404 E.05191
; COOLING_NODE: 23
M204 S10000
G1 X182.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.39 J.111 E.06233
G1 X182.035 Y159.591 E.00219
G3 X182.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 22
M204 S10000
G1 X182.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.302 J-.271 E.04951
G1 X182.035 Y158.591 E.00219
G3 X182.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X182.198 Y159.36 E-.19049
G1 X182.008 Y159.411 E-.18665
G1 X181.863 Y159.387 E-.13928
G1 X181.726 Y159.306 E-.15162
G1 X181.619 Y159.153 E-.1773
G1 X181.59 Y159.017 E-.13187
G1 X181.607 Y158.88 E-.13181
G1 X181.67 Y158.756 E-.13205
G1 X181.831 Y158.626 E-.19658
G1 X181.965 Y158.591 E-.13189
G1 X182.035 Y158.591 E-.06628
G1 X182.169 Y158.626 E-.13189
G1 X182.278 Y158.713 E-.1323
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.302 Y159.265 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.302 J-.271 E.04951
G1 X180.035 Y158.591 E.00219
G3 X180.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 21
M204 S10000
G1 X181.302 Y159.265 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.302 J-.271 E.04951
G1 X181.035 Y158.591 E.00219
G3 X181.338 Y159.218 I-.035 J.404 E.02628
; COOLING_NODE: 20
M204 S10000
G1 X181.39 Y159.884 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.39 J.111 E.06233
G1 X181.035 Y159.591 E.00219
G3 X181.369 Y159.827 I-.035 J.404 E.01347
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.18472
G1 X181.381 Y160.153 E-.13186
G1 X181.308 Y160.271 E-.13193
G1 X181.198 Y160.36 E-.13505
G1 X181.008 Y160.411 E-.18665
G1 X180.863 Y160.387 E-.13928
G1 X180.726 Y160.306 E-.15162
G1 X180.619 Y160.153 E-.17723
G1 X180.59 Y160.017 E-.13193
G1 X180.607 Y159.88 E-.13177
G1 X180.67 Y159.756 E-.13209
G1 X180.831 Y159.626 E-.19658
G1 X180.901 Y159.607 E-.06928
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.193 Y160.351 Z3.6 F60000
G1 Z3.2
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.193 J-.357 E.04513
G1 X180.035 Y159.591 E.00219
G3 X180.243 Y160.319 I-.035 J.404 E.03066
; COOLING_NODE: 29
M204 S10000
G1 X180.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.302 J-.271 E.04951
G1 X180.035 Y160.591 E.00219
G3 X180.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 28
M204 S10000
G1 X181.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.302 J-.271 E.04951
G1 X181.035 Y160.591 E.00219
G3 X181.339 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 27
M204 S10000
G1 X182.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.302 J-.271 E.04951
G1 X182.035 Y160.591 E.00219
G3 X182.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 26
M204 S10000
G1 X183.302 Y161.265 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.302 J-.271 E.04951
G1 X183.035 Y160.591 E.00219
G3 X183.338 Y161.218 I-.035 J.404 E.02628
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.198 Y161.36 E-.19047
G1 X183.008 Y161.411 E-.18665
G1 X182.863 Y161.387 E-.13928
G1 X182.726 Y161.306 E-.15162
G1 X182.619 Y161.153 E-.1773
G1 X182.59 Y161.017 E-.13187
G1 X182.607 Y160.88 E-.13186
G1 X182.67 Y160.756 E-.13198
G1 X182.831 Y160.626 E-.19659
G1 X182.965 Y160.591 E-.13189
G1 X183.035 Y160.591 E-.06628
G1 X183.169 Y160.626 E-.13188
G1 X183.278 Y160.713 E-.13233
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z3.6 F60000
G1 Z3.2
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.684 J-.5 E.03621
G2 X183.363 Y158.285 I-.633 J-.495 E.04793
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311678
G1 F4018.487
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294452
G1 F4293.69
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266325
G1 F4834.269
G1 X184.09 Y161.225 E.00194
; LINE_WIDTH: 0.244096
G1 F5368.434
G2 X184.077 Y160.673 I-2.509 J-.221 E.00926
; LINE_WIDTH: 0.293725
G1 F4306.139
G1 X184.061 Y160.585 E.00186
; LINE_WIDTH: 0.327487
G1 F3795.246
G1 X184.044 Y160.497 E.00211
G1 X184.024 Y160.496 E.00046
; LINE_WIDTH: 0.289855
G1 F4373.635
G1 X183.95 Y160.496 E.00153
; LINE_WIDTH: 0.251631
G1 F5174.627
G1 X183.875 Y160.496 E.00129
M204 S10000
G1 X183.986 Y160.808 F60000
; LINE_WIDTH: 0.311735
G1 F4017.637
M204 S8000
G1 X184.062 Y160.415 E.00896
; LINE_WIDTH: 0.29449
G1 F4293.05
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266339
G1 F4833.977
G1 X184.09 Y160.225 E.00194
; LINE_WIDTH: 0.244097
G1 F5368.407
G2 X184.077 Y159.673 I-2.509 J-.221 E.00926
; LINE_WIDTH: 0.293731
G1 F4306.043
G1 X184.061 Y159.585 E.00186
; LINE_WIDTH: 0.327486
G1 F3795.259
G1 X184.044 Y159.497 E.00211
G1 X184.024 Y159.496 E.00046
; LINE_WIDTH: 0.289835
G1 F4373.978
G1 X183.95 Y159.496 E.00153
; LINE_WIDTH: 0.251647
G1 F5174.224
G1 X183.875 Y159.496 E.00129
M204 S10000
G1 X183.986 Y159.808 F60000
; LINE_WIDTH: 0.311678
G1 F4018.487
M204 S8000
G1 X184.062 Y159.415 E.00896
; LINE_WIDTH: 0.294457
G1 F4293.615
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266327
G1 F4834.242
G1 X184.09 Y159.225 E.00194
; LINE_WIDTH: 0.244097
G1 F5368.42
G2 X184.077 Y158.673 I-2.509 J-.221 E.00926
; LINE_WIDTH: 0.294511
G1 F4292.693
G1 X184.06 Y158.581 E.00196
; LINE_WIDTH: 0.352555
G1 F3487.977
G2 X184.036 Y158.464 I-1.426 J.228 E.00308
G1 X183.756 Y158.306 E.00829
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609643
G1 F1905.695
M204 S8000
G1 X182.343 Y158.184 E.03849
; LINE_WIDTH: 0.574699
G1 F2030.919
G2 X182.196 Y158.161 I-.351 J1.741 E.00657
; LINE_WIDTH: 0.540429
G1 F2170.815
G2 X181.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581514
G1 F2005.221
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609611
G1 F1905.802
G1 X181.609 Y158.195 E.00233
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609643
G1 F1905.695
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574699
G1 F2030.919
G2 X168.196 Y158.161 I-.351 J1.741 E.00657
; LINE_WIDTH: 0.540429
G1 F2170.815
G2 X167.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581514
G1 F2005.221
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609611
G1 F1905.802
G1 X166.859 Y158.357 E.03849
M204 S10000
G1 X166.245 Y158.306 F60000
; LINE_WIDTH: 0.358793
G1 F3419.1
M204 S8000
G1 X165.964 Y158.464 E.00848
G1 X165.958 Y158.49 E.00069
; LINE_WIDTH: 0.33111
G1 F3747.533
G1 X165.941 Y158.575 E.00209
; LINE_WIDTH: 0.294448
G1 F4293.757
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.24385
G1 F5375.011
G2 X165.912 Y159.244 I2.457 J.324 E.00944
; LINE_WIDTH: 0.268959
G1 F4777.934
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308678
G1 F4063.855
G2 X166.014 Y159.806 I5.575 J-.791 E.01072
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.25286
G1 F5144.342
M204 S8000
G1 X166.05 Y159.496 E.00131
; LINE_WIDTH: 0.291282
G1 F4348.497
G1 X165.975 Y159.496 E.00154
; LINE_WIDTH: 0.314549
G1 F3976.015
G1 X165.956 Y159.497 E.00042
G1 X165.925 Y159.66 E.00375
; LINE_WIDTH: 0.257928
G1 F5023.088
G2 X165.903 Y159.867 I6.907 J.847 E.00372
; LINE_WIDTH: 0.237924
G1 F5538.364
G2 X165.912 Y160.244 I3.131 J.109 E.00611
; LINE_WIDTH: 0.268979
G1 F4777.512
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.30875
G1 F4062.758
G2 X166.014 Y160.806 I5.585 J-.792 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.252657
G1 F5149.314
M204 S8000
G1 X166.05 Y160.496 E.0013
; LINE_WIDTH: 0.291112
G1 F4351.484
G1 X165.975 Y160.496 E.00154
; LINE_WIDTH: 0.314542
G1 F3976.123
G1 X165.956 Y160.497 E.00042
G1 X165.925 Y160.66 E.00375
; LINE_WIDTH: 0.257928
G1 F5023.088
G2 X165.903 Y160.867 I6.907 J.847 E.00372
; LINE_WIDTH: 0.237919
G1 F5538.498
G2 X165.912 Y161.244 I3.13 J.109 E.00611
; LINE_WIDTH: 0.268959
G1 F4777.934
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.30773
G1 F4078.4
G2 X165.992 Y161.694 I4.301 J-.6 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4078.4
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 17/25
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z3.6 I.139 J1.209 P1  F60000
G1 X174.745 Y160.315 Z3.6
G1 Z3.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03045
G1 X175.035 Y159.591 E.00219
G3 X174.795 Y160.349 I-.035 J.406 E.04581
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.633 Y159.815 E-.25071
G1 X175.716 Y159.703 E-.1318
G1 X175.831 Y159.626 E-.132
G1 X175.965 Y159.591 E-.13185
G1 X176.035 Y159.591 E-.06622
G1 X176.169 Y159.626 E-.13176
G1 X176.284 Y159.704 E-.13212
G1 X176.367 Y159.815 E-.13168
G1 X176.394 Y159.882 E-.06885
G1 X176.41 Y160.017 E-.12922
G1 X176.381 Y160.153 E-.13196
G1 X176.308 Y160.272 E-.13226
G1 X176.137 Y160.387 E-.19645
G1 X176 Y160.411 E-.13149
G1 X175.999 Y160.41 E-.00162
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.653 Y160.211 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.347 J-.214 E.02604
G1 X177.035 Y159.591 E.00219
G3 X176.688 Y160.259 I-.035 J.406 E.05022
; COOLING_NODE: 14
M204 S10000
G1 X177.653 Y160.211 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.347 J-.214 E.02604
G1 X178.035 Y159.591 E.00219
G3 X177.688 Y160.259 I-.035 J.406 E.05022
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X177.59 Y160.018 E-.24802
G1 X177.607 Y159.88 E-.13204
G1 X177.67 Y159.756 E-.1319
G1 X177.831 Y159.626 E-.19662
G1 X177.965 Y159.591 E-.13185
G1 X178.035 Y159.591 E-.06622
G1 X178.169 Y159.626 E-.13176
G1 X178.284 Y159.704 E-.13212
G1 X178.367 Y159.815 E-.13168
G1 X178.394 Y159.882 E-.06885
G1 X178.41 Y160.017 E-.12922
G1 X178.381 Y160.153 E-.13196
G1 X178.308 Y160.272 E-.13226
G1 X178.19 Y160.351 E-.13549
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.391 Y159.883 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.392 J.114 E.06279
G1 X179.035 Y159.591 E.00219
G3 X179.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 16
M204 S10000
G1 X179.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.305 J-.271 E.04986
G1 X179.035 Y158.591 E.00219
G3 X179.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X179.193 Y159.362 E-.19524
G1 X179 Y159.411 E-.1883
G1 X178.863 Y159.387 E-.13212
G1 X178.742 Y159.32 E-.13192
G1 X178.619 Y159.153 E-.19676
G1 X178.59 Y159.018 E-.13181
G1 X178.607 Y158.88 E-.13204
G1 X178.67 Y158.756 E-.1319
G1 X178.77 Y158.66 E-.13184
G1 X178.965 Y158.591 E-.19656
G1 X179.035 Y158.591 E-.0663
G1 X179.169 Y158.626 E-.13176
G1 X179.284 Y158.704 E-.13212
G1 X179.285 Y158.705 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.305 J-.271 E.04986
G1 X178.035 Y158.591 E.00219
G3 X178.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X178.193 Y159.362 E-.1952
G1 X178 Y159.411 E-.18831
G1 X177.863 Y159.387 E-.13212
G1 X177.742 Y159.32 E-.13192
G1 X177.619 Y159.153 E-.19676
G1 X177.59 Y159.018 E-.13182
G1 X177.607 Y158.88 E-.13204
G1 X177.67 Y158.756 E-.13191
G1 X177.831 Y158.626 E-.19662
G1 X177.965 Y158.591 E-.13185
G1 X178.035 Y158.591 E-.06622
G1 X178.169 Y158.626 E-.13176
G1 X178.284 Y158.704 E-.13212
G1 X178.285 Y158.705 E-.00135
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.305 J-.271 E.04986
G1 X177.035 Y158.591 E.00219
G3 X177.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X177.193 Y159.362 E-.1952
G1 X177 Y159.411 E-.18831
G1 X176.863 Y159.387 E-.13212
G1 X176.742 Y159.32 E-.13192
G1 X176.619 Y159.153 E-.19676
G1 X176.59 Y159.018 E-.13182
G1 X176.607 Y158.88 E-.13204
G1 X176.67 Y158.756 E-.13191
G1 X176.831 Y158.626 E-.19662
G1 X176.965 Y158.591 E-.13185
G1 X177.035 Y158.591 E-.06622
G1 X177.169 Y158.626 E-.13176
G1 X177.284 Y158.704 E-.13212
G1 X177.285 Y158.705 E-.00135
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.305 J-.271 E.04986
G1 X176.035 Y158.591 E.00219
G3 X176.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X176.193 Y159.362 E-.1952
G1 X176 Y159.411 E-.1883
G1 X175.863 Y159.387 E-.13232
G1 X175.742 Y159.32 E-.13173
G1 X175.619 Y159.153 E-.19676
G1 X175.59 Y159.018 E-.13181
G1 X175.633 Y158.815 E-.19677
G1 X175.716 Y158.703 E-.1318
G1 X175.831 Y158.626 E-.132
G1 X175.965 Y158.591 E-.13185
G1 X176.035 Y158.591 E-.06622
G1 X176.169 Y158.626 E-.13176
G1 X176.284 Y158.704 E-.13212
G1 X176.285 Y158.705 E-.00135
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.305 J-.271 E.04985
G1 X175.035 Y158.591 E.00219
G3 X175.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 8
M204 S10000
G1 X174.345 Y159.213 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.345 J-.216 E.05194
G1 X174.035 Y158.591 E.00219
G3 X174.373 Y159.16 I-.035 J.406 E.02422
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.258 Y159.32 E-.18742
G1 X174.137 Y159.387 E-.13184
G1 X173.998 Y159.411 E-.13399
G1 X173.8 Y159.359 E-.19434
G1 X173.692 Y159.271 E-.13226
G1 X173.618 Y159.151 E-.13426
G1 X173.59 Y159.017 E-.12964
G1 X173.633 Y158.815 E-.19659
G1 X173.717 Y158.701 E-.13433
G1 X173.831 Y158.626 E-.12956
G1 X173.965 Y158.591 E-.13184
G1 X174.035 Y158.591 E-.06622
G1 X174.169 Y158.626 E-.13176
G1 X174.227 Y158.665 E-.06595
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.696 Y160.267 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.304 J-.271 E.02826
G1 X174.035 Y159.591 E.00219
G3 X173.739 Y160.309 I-.035 J.406 E.0479
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X173.618 Y160.151 E-.18977
G1 X173.59 Y160.017 E-.12955
G1 X173.633 Y159.815 E-.19659
G1 X173.717 Y159.701 E-.13433
G1 X173.831 Y159.626 E-.12956
G1 X173.965 Y159.591 E-.13184
G1 X174.035 Y159.591 E-.06622
G1 X174.169 Y159.626 E-.13176
G1 X174.286 Y159.705 E-.13461
G1 X174.393 Y159.88 E-.19422
G1 X174.41 Y160.017 E-.13165
G1 X174.35 Y160.215 E-.1969
G1 X174.258 Y160.32 E-.13189
G1 X174.257 Y160.32 E-.00111
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.345 Y161.213 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.345 J-.216 E.05194
G1 X174.035 Y160.591 E.00219
G3 X174.373 Y161.16 I-.035 J.406 E.02422
; COOLING_NODE: 34
M204 S10000
G1 X175.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.305 J-.271 E.04985
G1 X175.035 Y160.591 E.00219
G3 X175.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 33
M204 S10000
G1 X176.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.305 J-.271 E.04986
G1 X176.035 Y160.591 E.00219
G3 X176.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 32
M204 S10000
G1 X177.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.305 J-.271 E.04986
G1 X177.035 Y160.591 E.00219
G3 X177.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 31
M204 S10000
G1 X178.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.305 J-.271 E.04986
G1 X178.035 Y160.591 E.00219
G3 X178.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 30
M204 S10000
G1 X179.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.305 J-.271 E.04986
G1 X179.035 Y160.591 E.00219
G3 X179.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 29
M204 S10000
G1 X180.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.305 J-.271 E.04986
G1 X180.035 Y160.591 E.00218
G3 X180.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 28
M204 S10000
G1 X181.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.305 J-.271 E.04986
G1 X181.035 Y160.591 E.00219
G3 X181.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 27
M204 S10000
G1 X182.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.305 J-.271 E.04986
G1 X182.035 Y160.591 E.00219
G3 X182.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 26
M204 S10000
G1 X183.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.305 J-.271 E.04986
G1 X183.035 Y160.591 E.00219
G3 X183.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.193 Y161.362 E-.19521
G1 X183 Y161.411 E-.1883
G1 X182.863 Y161.387 E-.13212
G1 X182.742 Y161.32 E-.13192
G1 X182.619 Y161.153 E-.19675
G1 X182.59 Y161.017 E-.13189
G1 X182.633 Y160.815 E-.19671
G1 X182.716 Y160.703 E-.1318
G1 X182.831 Y160.626 E-.13203
G1 X182.965 Y160.591 E-.13174
G1 X183.035 Y160.591 E-.0663
G1 X183.169 Y160.626 E-.13176
G1 X183.284 Y160.704 E-.13212
G1 X183.285 Y160.705 E-.00135
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.654 Y160.213 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.346 J-.216 E.02612
G1 X183.035 Y159.591 E.00219
G3 X182.689 Y160.261 I-.035 J.406 E.05014
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182.59 Y160.017 E-.25046
G1 X182.633 Y159.815 E-.19669
G1 X182.716 Y159.703 E-.1318
G1 X182.831 Y159.626 E-.13203
G1 X182.965 Y159.591 E-.13174
G1 X183.035 Y159.591 E-.0663
G1 X183.169 Y159.626 E-.13176
G1 X183.284 Y159.704 E-.13212
G1 X183.367 Y159.815 E-.13168
G1 X183.394 Y159.882 E-.06885
G1 X183.41 Y160.017 E-.12922
G1 X183.381 Y160.153 E-.13196
G1 X183.308 Y160.272 E-.13226
G1 X183.192 Y160.35 E-.13312
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.305 J-.271 E.04986
G1 X183.035 Y158.591 E.00219
G3 X183.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X183.193 Y159.362 E-.19519
G1 X183 Y159.411 E-.1883
G1 X182.863 Y159.387 E-.13212
G1 X182.742 Y159.32 E-.13192
G1 X182.619 Y159.153 E-.19676
G1 X182.59 Y159.017 E-.1319
G1 X182.633 Y158.815 E-.19669
G1 X182.716 Y158.703 E-.1318
G1 X182.831 Y158.626 E-.13203
G1 X182.965 Y158.591 E-.13174
G1 X183.035 Y158.591 E-.0663
G1 X183.169 Y158.626 E-.13176
G1 X183.284 Y158.704 E-.13212
G1 X183.285 Y158.705 E-.00137
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X182.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.305 J-.271 E.04987
G1 X182.035 Y158.591 E.00219
G3 X182.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 23
M204 S10000
G1 X182.391 Y159.883 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.392 J.114 E.06279
G1 X182.035 Y159.591 E.00219
G3 X182.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 20
M204 S10000
G1 X181.391 Y159.883 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.392 J.114 E.06279
G1 X181.035 Y159.591 E.00219
G3 X181.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.1849
G1 X181.381 Y160.153 E-.13196
G1 X181.308 Y160.271 E-.13207
G1 X181.256 Y160.321 E-.06877
G1 X181.137 Y160.387 E-.1294
G1 X181 Y160.411 E-.13149
G1 X180.863 Y160.387 E-.13212
G1 X180.742 Y160.32 E-.13193
G1 X180.65 Y160.215 E-.1321
G1 X180.59 Y160.017 E-.19655
G1 X180.607 Y159.88 E-.13196
G1 X180.67 Y159.756 E-.13191
G1 X180.77 Y159.66 E-.13184
G1 X180.902 Y159.613 E-.133
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.19 Y160.358 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.19 J-.361 E.04528
G1 X180.035 Y159.591 E.00218
G3 X180.241 Y160.326 I-.035 J.406 E.03099
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X180 Y160.411 E-.24262
G1 X179.863 Y160.387 E-.13212
G1 X179.742 Y160.32 E-.13193
G1 X179.649 Y160.213 E-.13462
G1 X179.59 Y160.018 E-.19409
G1 X179.607 Y159.88 E-.13204
G1 X179.671 Y159.753 E-.13444
G1 X179.831 Y159.626 E-.19417
G1 X179.965 Y159.591 E-.13198
G1 X180.035 Y159.591 E-.06614
G1 X180.169 Y159.626 E-.13176
G1 X180.284 Y159.704 E-.13212
G1 X180.367 Y159.815 E-.13168
G1 X180.371 Y159.825 E-.01028
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.305 J-.271 E.04987
G1 X180.035 Y158.591 E.00218
G3 X180.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 21
M204 S10000
G1 X181.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.305 J-.271 E.04986
G1 X181.035 Y158.591 E.00219
G3 X181.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X181.193 Y159.362 E-.19524
G1 X181 Y159.411 E-.18831
G1 X180.863 Y159.387 E-.13212
G1 X180.742 Y159.32 E-.13192
G1 X180.619 Y159.153 E-.19676
G1 X180.59 Y159.017 E-.1319
G1 X180.607 Y158.88 E-.13196
G1 X180.67 Y158.756 E-.13191
G1 X180.77 Y158.66 E-.13184
G1 X180.965 Y158.591 E-.19656
G1 X181.035 Y158.591 E-.0663
G1 X181.169 Y158.626 E-.13176
G1 X181.284 Y158.704 E-.13212
G1 X181.285 Y158.705 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z3.8 F60000
G1 Z3.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.408 Y161.898 E.03349
G1 X183.357 Y161.722 E.0062
G2 X183.63 Y160.495 I-.395 J-.732 E.04824
G2 X183.63 Y159.495 I-.684 J-.5 E.0362
G2 X183.363 Y158.285 I-.633 J-.495 E.04794
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 7
; WIPE_START
G1 X183.408 Y161.898 E-.94173
G1 X183.357 Y161.722 E-.17388
G1 X183.5 Y161.631 E-.16072
M73 P82 R6
G1 X183.604 Y161.531 E-.13693
G1 X183.685 Y161.422 E-.12972
G1 X183.786 Y161.169 E-.25856
G1 X183.799 Y161.066 E-.09847
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.245 Y159.979 Z3.8 F60000
G1 X171.305 Y159.268 Z3.8
G1 Z3.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.305 J-.271 E.04986
G1 X171.035 Y158.591 E.00219
G3 X171.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 6
M204 S10000
G1 X171.391 Y159.883 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.392 J.114 E.06279
G1 X171.035 Y159.591 E.00219
G3 X171.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 5
; WIPE_START
M204 S8000
G1 X171.41 Y160.017 E-.18489
G1 X171.381 Y160.153 E-.13196
G1 X171.308 Y160.272 E-.13226
G1 X171.137 Y160.387 E-.19645
G1 X171 Y160.411 E-.1315
G1 X170.863 Y160.387 E-.13212
G1 X170.742 Y160.32 E-.13193
G1 X170.649 Y160.213 E-.13462
G1 X170.59 Y160.018 E-.19409
G1 X170.607 Y159.88 E-.13204
G1 X170.671 Y159.753 E-.13444
G1 X170.831 Y159.626 E-.1942
G1 X170.902 Y159.607 E-.06948
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.391 Y159.883 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.392 J.114 E.06279
G1 X172.035 Y159.591 E.00219
G3 X172.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 2
; WIPE_START
M204 S8000
G1 X172.41 Y160.017 E-.18489
G1 X172.381 Y160.153 E-.13195
G1 X172.308 Y160.271 E-.13207
G1 X172.256 Y160.321 E-.06877
G1 X172.137 Y160.387 E-.1294
G1 X172 Y160.411 E-.13149
G1 X171.863 Y160.387 E-.13212
G1 X171.742 Y160.32 E-.13193
G1 X171.649 Y160.213 E-.13462
G1 X171.59 Y160.018 E-.19409
G1 X171.607 Y159.88 E-.13204
G1 X171.67 Y159.756 E-.1319
G1 X171.77 Y159.66 E-.13184
G1 X171.902 Y159.613 E-.13287
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.391 Y159.883 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.392 J.114 E.06279
G1 X173.035 Y159.591 E.00219
G3 X173.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 3
M204 S10000
G1 X173.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.305 J-.271 E.04986
G1 X173.035 Y158.591 E.00219
G3 X173.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173.193 Y159.362 E-.1952
G1 X173 Y159.411 E-.1883
G1 X172.863 Y159.387 E-.13212
G1 X172.742 Y159.32 E-.13192
G1 X172.619 Y159.153 E-.19676
G1 X172.59 Y159.018 E-.13181
G1 X172.607 Y158.88 E-.13204
G1 X172.67 Y158.756 E-.1319
G1 X172.77 Y158.66 E-.13184
G1 X172.965 Y158.591 E-.19656
G1 X173.035 Y158.591 E-.0663
G1 X173.169 Y158.626 E-.13176
G1 X173.284 Y158.704 E-.13212
G1 X173.285 Y158.705 E-.00136
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.305 J-.271 E.04986
G1 X172.035 Y158.591 E.00219
G3 X172.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 36
; WIPE_START
M204 S8000
G1 X172.193 Y159.362 E-.19524
G1 X172 Y159.411 E-.1883
G1 X171.863 Y159.387 E-.13212
G1 X171.742 Y159.32 E-.13192
G1 X171.619 Y159.153 E-.19676
G1 X171.59 Y159.018 E-.13181
G1 X171.607 Y158.88 E-.13204
G1 X171.67 Y158.756 E-.1319
G1 X171.77 Y158.66 E-.13184
G1 X171.965 Y158.591 E-.19656
G1 X172.035 Y158.591 E-.0663
G1 X172.169 Y158.626 E-.13176
G1 X172.284 Y158.704 E-.13212
G1 X172.285 Y158.705 E-.00132
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.305 J-.271 E.04986
G1 X173.035 Y160.591 E.00219
G3 X173.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X173.193 Y161.362 E-.19521
G1 X173 Y161.411 E-.1883
G1 X172.863 Y161.387 E-.13212
G1 X172.742 Y161.32 E-.13192
G1 X172.619 Y161.153 E-.19671
G1 X172.59 Y161.017 E-.13194
G1 X172.607 Y160.88 E-.13196
G1 X172.67 Y160.756 E-.1319
G1 X172.77 Y160.66 E-.13184
G1 X172.965 Y160.591 E-.19655
G1 X173.035 Y160.591 E-.0663
G1 X173.169 Y160.626 E-.13176
G1 X173.284 Y160.704 E-.13212
G1 X173.285 Y160.705 E-.00136
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.305 J-.271 E.04986
G1 X172.035 Y160.591 E.00219
G3 X172.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X172.193 Y161.362 E-.19525
G1 X172 Y161.411 E-.1883
G1 X171.863 Y161.387 E-.13212
G1 X171.742 Y161.32 E-.13192
G1 X171.619 Y161.153 E-.19671
G1 X171.59 Y161.017 E-.13194
G1 X171.607 Y160.88 E-.13196
G1 X171.67 Y160.756 E-.1319
G1 X171.77 Y160.66 E-.13184
G1 X171.965 Y160.591 E-.19655
G1 X172.035 Y160.591 E-.0663
G1 X172.169 Y160.626 E-.13176
G1 X172.284 Y160.704 E-.13212
G1 X172.285 Y160.705 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.305 J-.271 E.04986
G1 X171.035 Y160.591 E.00219
G3 X171.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.193 Y161.362 E-.19521
G1 X171 Y161.411 E-.18831
G1 X170.863 Y161.387 E-.13212
G1 X170.742 Y161.32 E-.13192
G1 X170.619 Y161.153 E-.19671
G1 X170.59 Y161.017 E-.13194
G1 X170.607 Y160.88 E-.13196
G1 X170.671 Y160.753 E-.13444
G1 X170.831 Y160.626 E-.1942
G1 X170.965 Y160.591 E-.1318
G1 X171.035 Y160.591 E-.0663
G1 X171.169 Y160.626 E-.13176
G1 X171.284 Y160.704 E-.13212
G1 X171.285 Y160.705 E-.00121
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.305 J-.271 E.04986
G1 X170.035 Y160.591 E.00219
G3 X170.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170.193 Y161.362 E-.19525
G1 X170 Y161.411 E-.1883
G1 X169.863 Y161.387 E-.13232
G1 X169.742 Y161.32 E-.13173
G1 X169.619 Y161.153 E-.19671
G1 X169.59 Y161.017 E-.13194
G1 X169.607 Y160.88 E-.13196
G1 X169.671 Y160.753 E-.13444
G1 X169.831 Y160.626 E-.1942
G1 X169.965 Y160.591 E-.1318
G1 X170.035 Y160.591 E-.0663
G1 X170.169 Y160.626 E-.13176
G1 X170.284 Y160.704 E-.13212
G1 X170.285 Y160.705 E-.00117
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.305 J-.271 E.04986
G1 X169.035 Y160.591 E.00218
G3 X169.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X169.193 Y161.362 E-.1952
G1 X169 Y161.411 E-.18831
G1 X168.863 Y161.387 E-.13212
G1 X168.742 Y161.32 E-.13192
G1 X168.619 Y161.153 E-.19675
G1 X168.59 Y161.017 E-.13189
G1 X168.633 Y160.815 E-.19671
G1 X168.716 Y160.703 E-.1318
G1 X168.831 Y160.626 E-.132
G1 X168.965 Y160.591 E-.13193
G1 X169.035 Y160.591 E-.06614
G1 X169.169 Y160.626 E-.13176
G1 X169.284 Y160.704 E-.13212
G1 X169.285 Y160.705 E-.00135
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.654 Y160.213 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.346 J-.216 E.02612
G1 X169.035 Y159.591 E.00218
G3 X168.69 Y160.261 I-.035 J.406 E.05014
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.25046
G1 X168.633 Y159.815 E-.19669
G1 X168.716 Y159.703 E-.1318
G1 X168.831 Y159.626 E-.132
G1 X168.965 Y159.591 E-.13193
G1 X169.035 Y159.591 E-.06614
G1 X169.169 Y159.626 E-.13176
G1 X169.284 Y159.704 E-.13212
G1 X169.367 Y159.815 E-.13168
G1 X169.394 Y159.882 E-.06885
G1 X169.41 Y160.017 E-.12922
G1 X169.381 Y160.153 E-.13196
G1 X169.308 Y160.272 E-.13223
G1 X169.192 Y160.35 E-.13316
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.391 Y159.883 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.392 J.114 E.06279
G1 X170.035 Y159.591 E.00219
G3 X170.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 43
M204 S10000
G1 X170.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.305 J-.271 E.04986
G1 X170.035 Y158.591 E.00219
G3 X170.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.193 Y159.362 E-.19524
G1 X170 Y159.411 E-.1883
G1 X169.863 Y159.387 E-.13232
G1 X169.742 Y159.32 E-.13173
G1 X169.619 Y159.153 E-.19676
G1 X169.59 Y159.018 E-.13181
G1 X169.607 Y158.88 E-.13204
G1 X169.671 Y158.753 E-.13444
G1 X169.831 Y158.626 E-.1942
G1 X169.965 Y158.591 E-.1318
G1 X170.035 Y158.591 E-.0663
G1 X170.169 Y158.626 E-.13176
G1 X170.284 Y158.704 E-.13212
G1 X170.285 Y158.705 E-.00118
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.305 J-.271 E.04986
G1 X169.035 Y158.591 E.00218
G3 X169.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.193 Y159.362 E-.19519
G1 X169 Y159.411 E-.1883
G1 X168.863 Y159.387 E-.13212
G1 X168.742 Y159.32 E-.13192
G1 X168.619 Y159.153 E-.19676
G1 X168.59 Y159.017 E-.1319
G1 X168.633 Y158.815 E-.19669
G1 X168.716 Y158.703 E-.1318
G1 X168.831 Y158.626 E-.132
G1 X168.965 Y158.591 E-.13193
G1 X169.035 Y158.591 E-.06614
G1 X169.169 Y158.626 E-.13176
G1 X169.284 Y158.704 E-.13212
G1 X169.285 Y158.705 E-.00137
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.305 Y159.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.305 J-.271 E.04987
G1 X168.035 Y158.591 E.00219
G3 X168.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 46
M204 S10000
G1 X168.391 Y159.883 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.392 J.114 E.06279
G1 X168.035 Y159.591 E.00219
G3 X168.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 47
M204 S10000
G1 X167.391 Y159.883 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.392 J.114 E.06279
G1 X167.035 Y159.591 E.00219
G3 X167.371 Y159.827 I-.035 J.406 E.01348
; COOLING_NODE: 48
M204 S10000
G1 X167.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.305 J-.271 E.04987
G1 X167.035 Y158.591 E.00219
G3 X167.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.193 Y159.362 E-.19525
G1 X167 Y159.411 E-.1883
G1 X166.863 Y159.387 E-.13232
G1 X166.742 Y159.32 E-.13173
G1 X166.619 Y159.153 E-.19676
G1 X166.59 Y159.017 E-.1319
G1 X166.607 Y158.88 E-.13195
G1 X166.67 Y158.756 E-.1319
G1 X166.77 Y158.66 E-.13184
G1 X166.965 Y158.591 E-.19656
G1 X167.035 Y158.591 E-.0663
G1 X167.169 Y158.626 E-.13176
G1 X167.284 Y158.704 E-.13212
G1 X167.285 Y158.705 E-.00132
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X166.37 Y159.495 Z3.8 F60000
G1 Z3.4
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.689 J.5 E.03618
G2 X166.642 Y161.725 I.672 J.496 E.04829
G1 X166.589 Y161.898 E.00612
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04592
; COOLING_NODE: 49
; WIPE_START
G1 X166.282 Y159.638 E-.18843
G1 X166.231 Y159.764 E-.12935
G1 X166.196 Y160.034 E-.25841
G1 X166.254 Y160.3 E-.25799
G1 X166.37 Y160.495 E-.21611
G1 X166.282 Y160.638 E-.15918
G1 X166.231 Y160.764 E-.12934
G1 X166.196 Y161.034 E-.25847
G1 X166.214 Y161.17 E-.12974
G1 X166.254 Y161.3 E-.1294
G1 X166.278 Y161.339 E-.04359
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.305 Y161.268 Z3.8 F60000
G1 Z3.4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.305 J-.271 E.04986
G1 X167.035 Y160.591 E.00219
G3 X167.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 50
M204 S10000
G1 X168.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.305 J-.271 E.04986
G1 X168.035 Y160.591 E.00219
G3 X168.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X168.193 Y161.362 E-.19525
G1 X168 Y161.411 E-.1883
G1 X167.863 Y161.387 E-.13212
G1 X167.742 Y161.32 E-.13192
G1 X167.619 Y161.153 E-.19675
G1 X167.59 Y161.017 E-.13189
G1 X167.607 Y160.88 E-.13198
G1 X167.67 Y160.756 E-.1319
G1 X167.77 Y160.66 E-.13184
G1 X167.965 Y160.591 E-.19655
G1 X168.035 Y160.591 E-.0663
G1 X168.169 Y160.626 E-.13176
G1 X168.284 Y160.704 E-.13212
G1 X168.285 Y160.705 E-.00131
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.883 Y161.434 Z3.8 F60000
G1 X184.79 Y162.29 Z3.8
G1 Z3.4
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311599
G1 F4019.676
M204 S8000
G1 X184.062 Y161.414 E.00637
; LINE_WIDTH: 0.294385
G1 F4294.831
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266262
G1 F4835.633
G1 X184.09 Y161.225 E.00194
; LINE_WIDTH: 0.244232
G1 F5364.826
G2 X184.077 Y160.67 I-2.504 J-.22 E.00931
; LINE_WIDTH: 0.294404
G1 F4294.517
G1 X184.06 Y160.584 E.00184
; LINE_WIDTH: 0.327444
G1 F3795.817
G1 X184.044 Y160.497 E.00208
G1 X184.023 Y160.496 E.0005
; LINE_WIDTH: 0.287561
G1 F4414.631
G1 X183.949 Y160.496 E.0015
; LINE_WIDTH: 0.249772
G1 F5221.122
G1 X183.875 Y160.496 E.00127
M204 S10000
G1 X183.986 Y160.808 F60000
; LINE_WIDTH: 0.311561
G1 F4020.242
M204 S8000
G1 X184.062 Y160.414 E.00896
; LINE_WIDTH: 0.294367
G1 F4295.151
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266256
G1 F4835.767
G1 X184.09 Y160.225 E.00194
; LINE_WIDTH: 0.244227
G1 F5364.954
G2 X184.077 Y159.67 I-2.506 J-.22 E.00931
; LINE_WIDTH: 0.29439
G1 F4294.756
G1 X184.06 Y159.584 E.00184
; LINE_WIDTH: 0.327444
G1 F3795.816
G1 X184.044 Y159.497 E.00208
G1 X184.023 Y159.496 E.00049
; LINE_WIDTH: 0.2876
G1 F4413.928
G1 X183.949 Y159.496 E.0015
; LINE_WIDTH: 0.2498
G1 F5220.422
G1 X183.875 Y159.496 E.00127
M204 S10000
G1 X183.986 Y159.808 F60000
; LINE_WIDTH: 0.311594
G1 F4019.743
M204 S8000
G1 X184.062 Y159.414 E.00897
; LINE_WIDTH: 0.294385
G1 F4294.831
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266262
G1 F4835.633
G1 X184.09 Y159.225 E.00194
; LINE_WIDTH: 0.244232
G1 F5364.826
G2 X184.077 Y158.67 I-2.505 J-.22 E.00931
; LINE_WIDTH: 0.295239
G1 F4280.306
G1 X184.059 Y158.58 E.00194
; LINE_WIDTH: 0.352581
G1 F3487.691
G1 X184.036 Y158.464 E.00304
G1 X183.751 Y158.306 E.00839
M204 S10000
G1 X183.141 Y158.356 F60000
; LINE_WIDTH: 0.609523
G1 F1906.099
M204 S8000
G1 X182.343 Y158.184 E.0385
; LINE_WIDTH: 0.57465
G1 F2031.107
G2 X182.196 Y158.161 I-.349 J1.725 E.00656
; LINE_WIDTH: 0.540442
G1 F2170.759
G2 X181.76 Y158.167 I-.194 J1.905 E.01808
; LINE_WIDTH: 0.581546
G1 F2005.104
G1 X181.657 Y158.184 E.00467
; LINE_WIDTH: 0.609542
G1 F1906.034
G1 X181.609 Y158.195 E.00232
M204 S10000
G1 X168.391 Y158.194 F60000
; LINE_WIDTH: 0.609523
G1 F1906.099
M204 S8000
G1 X168.343 Y158.184 E.00231
; LINE_WIDTH: 0.57465
G1 F2031.107
G2 X168.196 Y158.161 I-.349 J1.725 E.00656
; LINE_WIDTH: 0.540442
G1 F2170.759
G2 X167.76 Y158.167 I-.194 J1.905 E.01808
; LINE_WIDTH: 0.581546
G1 F2005.104
G1 X167.657 Y158.184 E.00467
; LINE_WIDTH: 0.609542
G1 F1906.034
G1 X166.859 Y158.356 E.03849
M204 S10000
G1 X166.241 Y158.306 F60000
; LINE_WIDTH: 0.358754
G1 F3419.521
M204 S8000
G1 X165.964 Y158.464 E.00838
G1 X165.958 Y158.489 E.00068
; LINE_WIDTH: 0.331232
G1 F3745.946
G1 X165.941 Y158.575 E.00208
; LINE_WIDTH: 0.294556
G1 F4291.913
G1 X165.922 Y158.68 E.00224
; LINE_WIDTH: 0.24388
G1 F5374.201
G2 X165.912 Y159.244 I2.457 J.325 E.00945
; LINE_WIDTH: 0.268984
G1 F4777.408
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308739
G1 F4062.927
G2 X166.014 Y159.806 I5.588 J-.792 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.251719
G1 F5172.45
M204 S8000
G1 X166.05 Y159.496 E.00129
; LINE_WIDTH: 0.289807
G1 F4374.484
G1 X165.976 Y159.497 E.00153
; LINE_WIDTH: 0.314606
G1 F3975.181
G1 X165.956 Y159.497 E.00044
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.258012
G1 F5021.114
G2 X165.903 Y159.867 I6.891 J.846 E.00373
; LINE_WIDTH: 0.237934
G1 F5538.073
G2 X165.912 Y160.244 I3.125 J.109 E.00611
; LINE_WIDTH: 0.268959
G1 F4777.937
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.308592
G1 F4065.162
G2 X166.014 Y160.807 I5.653 J-.802 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.251671
G1 F5173.633
M204 S8000
G1 X166.05 Y160.496 E.00129
; LINE_WIDTH: 0.28982
G1 F4374.24
G1 X165.976 Y160.497 E.00153
; LINE_WIDTH: 0.314604
G1 F3975.213
G1 X165.956 Y160.497 E.00044
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.258012
G1 F5021.109
G2 X165.903 Y160.867 I6.89 J.846 E.00373
; LINE_WIDTH: 0.237933
G1 F5538.094
G2 X165.912 Y161.244 I3.128 J.109 E.00612
; LINE_WIDTH: 0.269013
G1 F4776.802
G1 X165.925 Y161.329 E.00162
; LINE_WIDTH: 0.307779
G1 F4077.646
G2 X165.992 Y161.694 I4.253 J-.592 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z3.8 I-1.171 J.331 P1  F60000
G1 X199.428 Y279.944 Z3.8
G1 Z3.4
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y279.944  E1.2162 F2363
G1  Y270.944  E0.3421
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #18
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z3.8 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z3.4
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M73 P83 R6
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
M73 P83 R5
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
M73 P84 R5
G1  X198.678 
G1  Y266.819 
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S174 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z3.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E4

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

M73 P85 R5
G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z6.4 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S160.65
M106 P2 S191
G1 X204.318 Y264.712 F60000
G1 Z3.4
G17
G3 Z3.8 I1.217 J0 P1
G1 X204.318 Y247.518 Z3.8
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z3.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X199.428  E1.2162 F2473
G1  Y254.944  E0.0285
G1  X167.428  E1.2162 F4725
G1  Y255.694  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X167.428  E1.2162
G1  Y257.194  E0.0285
G1  X199.428  E1.2162
G1  Y257.944  E0.0285
G1  X167.428  E1.2162
G1  Y258.694  E0.0285
G1  X199.428  E1.2162
G1  Y259.444  E0.0285
G1  X167.428  E1.2162
G1  Y260.194  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #18
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X199.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X199.928 Y280.444  
M204 S8000
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S10000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S8000
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F5400
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
; WIPE_TOWER_END

; WIPE_START
G1 F4077.646
M204 S8000
G1 X199.928 Y280.444 E0
G1 X199.928 Y280.444 E0
G1 X200.578 Y279.685 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z3.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2118
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
M73 P86 R5
G3 Z3.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 17 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z3.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer17 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 18/25
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z3.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1960
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
M73 P86 R4
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 18 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer18 end: 224,265
M625
M204 S10000
G1 X199.428 Y279.944
G1 Z3.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X201.640 Y278.401  
M204 S8000
G3  X197.871 Y282.511   I-16.869 J-11.684 E0.2126 F5400
G3  X194.841 Y281.395   I-0.631 J-2.959 E0.1295
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.112 Y276.190   I3.543 J-0.156 E0.1075
; WIPE_TOWER_END
G1  X199.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #19
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #18
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z4 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z3.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S76 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E3

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z6.6 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y277.194 F60000
G1 Z3.6

; filament start gcode
G1 X199.428 Y277.194 Z4
G1 Z3.6
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X200.928 
G1  X199.428  F240
G1  X199.928  F600
G1  Y277.694 
G1  X198.928 
G1  Y276.694 
G1  X200.428 
G1  Y278.194 
G1  X198.428 
G1  Y276.194 
G1  X196.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X167.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X199.428  E1.2162
G1  Y274.194  E0.0285
G1  X167.428  E1.2162
G1  Y273.444  E0.0285
G1  X199.428  E1.2162
G1  Y272.694  E0.0285
G1  X167.428  E1.2162
G1  Y271.944  E0.0285
M73 P87 R4
G1  X199.428  E1.2162
G1  Y271.194  E0.0285
G1  X167.428  E1.2162
G1  Y270.444  E0.0285
G1  X199.428  E1.2162
G1  Y269.694  E0.0285
G1  X167.428  E1.2162
G1  Y268.944  E0.0285
G1  X199.428  E1.2162
G1  Y268.194  E0.0285
G1  X167.428  E1.2162
G1  Y267.444  E0.0285
G1  X199.428  E1.2162
G1  Y266.694  E0.0285
G1  X167.428  E1.2162
G1  Y265.944  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162 F2363
G1  Y277.944  E0.0760
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #19
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.745 Y160.315
G1 Z3.6
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03044
G1 X175.035 Y159.591 E.00219
G3 X174.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01962
G1 X176.035 Y159.591 E.00219
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X175.607 Y159.879 E-.18755
G1 X175.716 Y159.703 E-.19658
G1 X175.831 Y159.626 E-.13189
G1 X175.965 Y159.591 E-.1317
G1 X176.035 Y159.591 E-.06624
G1 X176.169 Y159.626 E-.132
G1 X176.284 Y159.704 E-.13196
G1 X176.367 Y159.815 E-.13187
G1 X176.41 Y160.018 E-.1966
G1 X176.381 Y160.153 E-.13198
G1 X176.258 Y160.32 E-.19657
G1 X176.137 Y160.387 E-.13187
G1 X176 Y160.411 E-.13202
G1 X175.999 Y160.411 E-.00117
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.255 J-.319 E.0477
G1 X176.035 Y158.591 E.00219
G3 X176.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.18722
G1 X176 Y159.411 E-.13202
G1 X175.8 Y159.358 E-.19663
G1 X175.691 Y159.271 E-.132
G1 X175.619 Y159.153 E-.13173
G1 X175.59 Y159.017 E-.13193
G1 X175.607 Y158.879 E-.13194
G1 X175.67 Y158.756 E-.13181
G1 X175.77 Y158.66 E-.13191
G1 X175.965 Y158.591 E-.19645
G1 X176.035 Y158.591 E-.06624
G1 X176.169 Y158.626 E-.132
G1 X176.284 Y158.704 E-.13196
G1 X176.326 Y158.76 E-.06616
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.305 Y159.268 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.305 J-.271 E.04986
G1 X177.035 Y158.591 E.00219
G3 X177.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X177.137 Y159.387 E-.25066
G1 X177 Y159.411 E-.13199
G1 X176.8 Y159.358 E-.19665
G1 X176.691 Y159.271 E-.132
G1 X176.619 Y159.153 E-.13173
G1 X176.59 Y159.017 E-.13194
G1 X176.607 Y158.879 E-.13195
G1 X176.67 Y158.756 E-.13184
G1 X176.77 Y158.66 E-.13186
G1 X176.965 Y158.591 E-.19645
G1 X177.035 Y158.591 E-.06624
G1 X177.169 Y158.626 E-.132
G1 X177.284 Y158.704 E-.13196
G1 X177.286 Y158.706 E-.00272
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.623 Y160.151 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.154 E.02396
G1 X177.035 Y159.591 E.00219
G3 X176.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 14
M204 S10000
G1 X177.623 Y160.151 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.154 E.02396
G1 X178.035 Y159.591 E.00219
G3 X177.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18728
G1 X177.607 Y159.879 E-.13195
G1 X177.716 Y159.703 E-.19656
G1 X177.831 Y159.626 E-.13189
G1 X177.965 Y159.591 E-.1317
G1 X178.035 Y159.591 E-.06624
G1 X178.169 Y159.626 E-.132
G1 X178.284 Y159.704 E-.13196
G1 X178.367 Y159.815 E-.13187
G1 X178.41 Y160.018 E-.1966
G1 X178.381 Y160.153 E-.13198
G1 X178.258 Y160.32 E-.19657
G1 X178.137 Y160.387 E-.13187
G1 X178.135 Y160.388 E-.00152
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.255 J-.319 E.0477
G1 X178.035 Y158.591 E.00219
G3 X178.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X178.137 Y159.387 E-.18722
G1 X178 Y159.411 E-.13201
G1 X177.8 Y159.358 E-.19664
G1 X177.691 Y159.271 E-.132
G1 X177.619 Y159.153 E-.13173
G1 X177.59 Y159.017 E-.13194
G1 X177.607 Y158.879 E-.13195
G1 X177.67 Y158.756 E-.13184
G1 X177.77 Y158.66 E-.13186
G1 X177.965 Y158.591 E-.19645
G1 X178.035 Y158.591 E-.06624
G1 X178.169 Y158.626 E-.132
G1 X178.284 Y158.704 E-.13196
G1 X178.326 Y158.76 E-.06616
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.255 J-.319 E.0477
G1 X175.035 Y158.591 E.00219
G3 X175.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 8
M204 S10000
G1 X174.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.377 J-.155 E.05418
G1 X174.035 Y158.591 E.00219
G3 X174.396 Y159.095 I-.035 J.406 E.02208
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X174.258 Y159.32 E-.25083
G1 X174.137 Y159.387 E-.13182
G1 X174 Y159.411 E-.13201
G1 X173.8 Y159.358 E-.19664
G1 X173.691 Y159.271 E-.132
G1 X173.619 Y159.153 E-.13173
G1 X173.59 Y159.017 E-.13193
G1 X173.607 Y158.879 E-.13194
G1 X173.67 Y158.756 E-.13181
G1 X173.77 Y158.66 E-.13191
G1 X173.965 Y158.591 E-.19645
G1 X174.035 Y158.591 E-.06624
G1 X174.169 Y158.626 E-.132
G1 X174.172 Y158.627 E-.00268
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.255 J-.319 E.0477
G1 X173.035 Y158.591 E.00219
G3 X173.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X173.137 Y159.387 E-.18722
G1 X173 Y159.411 E-.13201
G1 X172.8 Y159.358 E-.19664
G1 X172.691 Y159.271 E-.132
G1 X172.619 Y159.153 E-.13173
G1 X172.59 Y159.017 E-.13194
G1 X172.607 Y158.879 E-.13195
G1 X172.67 Y158.756 E-.13184
G1 X172.77 Y158.66 E-.13188
G1 X172.965 Y158.591 E-.19645
G1 X173.035 Y158.591 E-.06623
G1 X173.169 Y158.626 E-.132
G1 X173.284 Y158.704 E-.13196
G1 X173.326 Y158.76 E-.06615
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.745 Y160.315 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03044
G1 X174.035 Y159.591 E.00219
G3 X173.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 2
M204 S10000
G1 X173.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.365 J.181 E.06504
G1 X173.035 Y159.591 E.00219
G3 X173.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 5
M204 S10000
G1 X172.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.365 J.181 E.06504
G1 X172.035 Y159.591 E.00219
G3 X172.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 4
M204 S10000
G1 X172.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.255 J-.319 E.0477
G1 X172.035 Y158.591 E.00219
G3 X172.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X172.137 Y159.387 E-.18722
G1 X172 Y159.411 E-.13201
G1 X171.8 Y159.358 E-.19664
G1 X171.691 Y159.271 E-.132
G1 X171.619 Y159.153 E-.13173
G1 X171.59 Y159.017 E-.13194
G1 X171.607 Y158.879 E-.13195
G1 X171.67 Y158.756 E-.13184
G1 X171.77 Y158.66 E-.13188
G1 X171.965 Y158.591 E-.19645
G1 X172.035 Y158.591 E-.06623
G1 X172.169 Y158.626 E-.132
G1 X172.284 Y158.704 E-.13196
G1 X172.326 Y158.76 E-.06615
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X171.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.255 J-.319 E.0477
G1 X171.035 Y158.591 E.00219
G3 X171.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X171.137 Y159.387 E-.18722
G1 X171 Y159.411 E-.13201
G1 X170.863 Y159.387 E-.13178
G1 X170.742 Y159.319 E-.13203
G1 X170.65 Y159.215 E-.13192
G1 X170.59 Y159.017 E-.19657
G1 X170.607 Y158.879 E-.13195
G1 X170.67 Y158.756 E-.13182
G1 X170.77 Y158.66 E-.1319
G1 X170.965 Y158.591 E-.19644
G1 X171.035 Y158.591 E-.06623
G1 X171.169 Y158.626 E-.132
G1 X171.284 Y158.704 E-.13196
G1 X171.326 Y158.76 E-.06615
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X170.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.255 J-.319 E.0477
G1 X170.035 Y158.591 E.00219
G3 X170.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X170.137 Y159.387 E-.18722
G1 X170 Y159.411 E-.13202
G1 X169.863 Y159.387 E-.13177
G1 X169.742 Y159.319 E-.13203
G1 X169.65 Y159.215 E-.13192
G1 X169.59 Y159.017 E-.19657
G1 X169.607 Y158.879 E-.13195
G1 X169.67 Y158.756 E-.13182
G1 X169.77 Y158.66 E-.1319
G1 X169.965 Y158.591 E-.19644
G1 X170.035 Y158.591 E-.06623
G1 X170.169 Y158.626 E-.132
G1 X170.284 Y158.704 E-.13196
G1 X170.326 Y158.76 E-.06615
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X169.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.255 J-.319 E.0477
G1 X169.035 Y158.591 E.00219
G3 X169.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.18717
G1 X169 Y159.411 E-.13202
G1 X168.863 Y159.387 E-.13178
G1 X168.742 Y159.319 E-.13203
G1 X168.65 Y159.215 E-.13192
G1 X168.59 Y159.017 E-.19656
G1 X168.607 Y158.879 E-.13194
G1 X168.67 Y158.756 E-.13181
G1 X168.77 Y158.66 E-.13191
G1 X168.965 Y158.591 E-.19645
G1 X169.035 Y158.591 E-.06624
G1 X169.169 Y158.626 E-.132
G1 X169.284 Y158.704 E-.13196
G1 X169.326 Y158.76 E-.0662
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.255 Y159.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.255 J-.319 E.0477
G1 X168.035 Y158.591 E.00219
G3 X168.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X168.137 Y159.387 E-.1872
G1 X168 Y159.411 E-.13202
G1 X167.863 Y159.387 E-.13178
G1 X167.742 Y159.319 E-.13203
G1 X167.65 Y159.215 E-.13192
G1 X167.59 Y159.017 E-.19657
G1 X167.607 Y158.879 E-.13195
G1 X167.67 Y158.756 E-.13184
G1 X167.77 Y158.66 E-.13188
G1 X167.965 Y158.591 E-.19645
G1 X168.035 Y158.591 E-.06623
G1 X168.169 Y158.626 E-.132
G1 X168.284 Y158.704 E-.13196
G1 X168.326 Y158.76 E-.06617
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.37 Y159.495 Z4 F60000
G1 Z3.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.688 J.5 E.03618
G2 X166.642 Y161.725 I.673 J.496 E.04829
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.335 Y159.447 I.364 J.715 E.04592
; COOLING_NODE: 48
M204 S10000
G1 X167.255 Y159.316 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.255 J-.319 E.0477
G1 X167.035 Y158.591 E.00219
G3 X167.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 47
M204 S10000
G1 X167.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.365 J.181 E.06504
G1 X167.035 Y159.591 E.00219
G3 X167.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.018 E-.25119
G1 X167.381 Y160.153 E-.13198
G1 X167.258 Y160.32 E-.19664
G1 X167.137 Y160.387 E-.13178
G1 X167 Y160.411 E-.13202
G1 X166.863 Y160.387 E-.13179
G1 X166.742 Y160.319 E-.13207
G1 X166.619 Y160.153 E-.19657
G1 X166.59 Y160.017 E-.13188
G1 X166.607 Y159.879 E-.13195
G1 X166.716 Y159.703 E-.19656
G1 X166.831 Y159.626 E-.13192
G1 X166.835 Y159.625 E-.00365
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.365 Y159.816 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.365 J.181 E.06504
G1 X168.035 Y159.591 E.00219
G3 X168.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 41
M204 S10000
G1 X168.623 Y160.151 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.377 J-.154 E.02395
G1 X169.035 Y159.591 E.00219
G3 X168.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18723
G1 X168.607 Y159.879 E-.13194
G1 X168.716 Y159.703 E-.19658
G1 X168.831 Y159.626 E-.13189
G1 X168.965 Y159.591 E-.1317
G1 X169.035 Y159.591 E-.06624
G1 X169.169 Y159.626 E-.132
G1 X169.284 Y159.704 E-.13196
G1 X169.367 Y159.815 E-.13187
G1 X169.41 Y160.018 E-.1966
G1 X169.381 Y160.153 E-.13198
G1 X169.258 Y160.32 E-.19659
G1 X169.137 Y160.387 E-.13184
G1 X169.135 Y160.388 E-.00158
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.405 Y159.948 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.897 Y159.602 I-.405 J.049 E.05852
G1 X169.965 Y159.591 E.00218
G3 X170.393 Y159.889 I.034 J.406 E.01775
; COOLING_NODE: 6
; WIPE_START
M204 S8000
G1 X170.402 Y160.087 E-.18766
G1 X170.308 Y160.271 E-.19664
G1 X170.2 Y160.359 E-.13189
G1 X170.069 Y160.405 E-.13189
G1 X169.863 Y160.387 E-.1966
G1 X169.742 Y160.319 E-.13207
G1 X169.65 Y160.215 E-.1319
G1 X169.598 Y160.086 E-.13184
G1 X169.593 Y159.948 E-.1318
G1 X169.633 Y159.815 E-.13197
G1 X169.77 Y159.66 E-.19651
G1 X169.897 Y159.602 E-.13188
G1 X169.965 Y159.591 E-.06613
G1 X169.966 Y159.591 E-.00123
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.405 Y159.948 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.897 Y159.602 I-.405 J.049 E.05852
G1 X170.965 Y159.591 E.00218
G3 X171.393 Y159.889 I.034 J.406 E.01775
; COOLING_NODE: 38
; WIPE_START
M204 S8000
G1 X171.402 Y160.087 E-.18766
G1 X171.35 Y160.216 E-.1319
G1 X171.258 Y160.32 E-.13183
G1 X171.069 Y160.405 E-.19667
G1 X170.863 Y160.387 E-.19661
G1 X170.742 Y160.319 E-.13207
G1 X170.65 Y160.215 E-.1319
G1 X170.598 Y160.086 E-.13184
G1 X170.593 Y159.948 E-.1318
G1 X170.633 Y159.815 E-.13197
G1 X170.77 Y159.66 E-.19651
G1 X170.897 Y159.602 E-.13188
G1 X170.965 Y159.591 E-.06613
G1 X170.966 Y159.591 E-.00122
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X171.346 Y161.213 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.897 Y160.602 I-.346 J-.216 E.04985
G1 X170.965 Y160.591 E.00218
G3 X171.374 Y161.16 I.034 J.406 E.02641
; COOLING_NODE: 39
; WIPE_START
M204 S8000
G1 X171.258 Y161.32 E-.1876
G1 X171.069 Y161.405 E-.19663
G1 X170.93 Y161.405 E-.13193
G1 X170.8 Y161.358 E-.1319
G1 X170.691 Y161.271 E-.13197
G1 X170.598 Y161.086 E-.19661
G1 X170.593 Y160.948 E-.13179
G1 X170.633 Y160.815 E-.13197
G1 X170.77 Y160.66 E-.19651
G1 X170.897 Y160.602 E-.13188
G1 X170.965 Y160.591 E-.06613
G1 X171.104 Y160.603 E-.13195
G1 X171.23 Y160.66 E-.13202
G1 X171.231 Y160.661 E-.00111
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.304 Y161.268 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.897 Y160.602 I-.305 J-.271 E.0477
G1 X169.965 Y160.591 E.00218
G3 X170.341 Y161.22 I.034 J.406 E.02858
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X170.2 Y161.359 E-.18739
G1 X170.069 Y161.405 E-.13189
G1 X169.93 Y161.405 E-.13192
G1 X169.8 Y161.358 E-.1319
G1 X169.691 Y161.271 E-.13197
G1 X169.598 Y161.086 E-.19661
G1 X169.593 Y160.948 E-.13179
G1 X169.633 Y160.815 E-.13197
G1 X169.77 Y160.66 E-.19651
G1 X169.897 Y160.602 E-.13188
G1 X169.965 Y160.591 E-.06613
G1 X170.104 Y160.603 E-.13195
G1 X170.23 Y160.66 E-.13202
G1 X170.276 Y160.712 E-.06607
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.255 J-.319 E.0477
G1 X169.035 Y160.591 E.00219
G3 X169.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X169.137 Y161.387 E-.18719
G1 X169 Y161.411 E-.13202
G1 X168.863 Y161.387 E-.13178
G1 X168.742 Y161.319 E-.13203
G1 X168.619 Y161.153 E-.19659
G1 X168.59 Y161.017 E-.13189
G1 X168.607 Y160.879 E-.13194
G1 X168.716 Y160.703 E-.19658
G1 X168.831 Y160.626 E-.13189
G1 X168.965 Y160.591 E-.1317
G1 X169.035 Y160.591 E-.06624
G1 X169.169 Y160.626 E-.132
G1 X169.284 Y160.704 E-.13196
G1 X169.326 Y160.76 E-.06618
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.255 Y161.316 Z4 F60000
G1 Z3.6
M73 P88 R4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.255 J-.319 E.0477
G1 X168.035 Y160.591 E.00219
G3 X168.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.1872
G1 X168 Y161.411 E-.13202
G1 X167.863 Y161.387 E-.13178
G1 X167.742 Y161.319 E-.13203
G1 X167.619 Y161.153 E-.19659
G1 X167.59 Y161.017 E-.1319
G1 X167.607 Y160.879 E-.13195
G1 X167.716 Y160.703 E-.19656
G1 X167.831 Y160.626 E-.13192
G1 X167.965 Y160.591 E-.13168
G1 X168.035 Y160.591 E-.06623
G1 X168.169 Y160.626 E-.132
G1 X168.284 Y160.704 E-.13196
G1 X168.326 Y160.76 E-.06617
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.255 J-.319 E.0477
G1 X167.035 Y160.591 E.00219
G3 X167.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 37
; WIPE_START
M204 S8000
G1 X167.137 Y161.387 E-.1872
G1 X167 Y161.411 E-.13202
G1 X166.863 Y161.387 E-.13178
G1 X166.742 Y161.319 E-.13203
G1 X166.619 Y161.153 E-.19659
G1 X166.59 Y161.017 E-.1319
G1 X166.607 Y160.879 E-.13195
G1 X166.716 Y160.703 E-.19656
G1 X166.831 Y160.626 E-.13192
G1 X166.965 Y160.591 E-.13168
G1 X167.035 Y160.591 E-.06623
G1 X167.169 Y160.626 E-.132
G1 X167.284 Y160.704 E-.13196
G1 X167.326 Y160.76 E-.06617
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.255 J-.319 E.0477
G1 X172.035 Y160.591 E.00219
G3 X172.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 36
M204 S10000
G1 X173.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.255 J-.319 E.0477
G1 X173.035 Y160.591 E.00219
G3 X173.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.18724
G1 X173 Y161.411 E-.13201
G1 X172.863 Y161.387 E-.13178
G1 X172.742 Y161.319 E-.13203
G1 X172.619 Y161.153 E-.19653
G1 X172.59 Y161.017 E-.13196
G1 X172.607 Y160.879 E-.13195
G1 X172.716 Y160.703 E-.19657
G1 X172.831 Y160.626 E-.13192
G1 X172.965 Y160.591 E-.13168
G1 X173.035 Y160.591 E-.06623
G1 X173.169 Y160.626 E-.132
G1 X173.284 Y160.704 E-.13196
G1 X173.326 Y160.76 E-.06613
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.377 Y161.152 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.377 J-.155 E.05418
G1 X174.035 Y160.591 E.00219
G3 X174.396 Y161.095 I-.035 J.406 E.02208
; COOLING_NODE: 34
M204 S10000
G1 X175.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.255 J-.319 E.0477
G1 X175.035 Y160.591 E.00219
G3 X175.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 33
M204 S10000
G1 X176.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.255 J-.319 E.0477
G1 X176.035 Y160.591 E.00219
G3 X176.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 32
; WIPE_START
M204 S8000
G1 X176.137 Y161.387 E-.18724
G1 X176 Y161.411 E-.13202
G1 X175.863 Y161.387 E-.13177
G1 X175.742 Y161.319 E-.13203
G1 X175.619 Y161.153 E-.19653
G1 X175.59 Y161.017 E-.13196
G1 X175.607 Y160.879 E-.13194
G1 X175.716 Y160.703 E-.19658
G1 X175.831 Y160.626 E-.13189
G1 X175.965 Y160.591 E-.1317
G1 X176.035 Y160.591 E-.06624
G1 X176.169 Y160.626 E-.132
G1 X176.284 Y160.704 E-.13196
G1 X176.326 Y160.76 E-.06613
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.305 Y161.268 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.305 J-.271 E.04986
G1 X177.035 Y160.591 E.00219
G3 X177.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 31
M204 S10000
G1 X178.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.255 J-.319 E.0477
G1 X178.035 Y160.591 E.00219
G3 X178.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 30
M204 S10000
G1 X179.255 Y161.316 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.255 J-.319 E.0477
G1 X179.035 Y160.591 E.00219
G3 X179.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 29
; WIPE_START
M204 S8000
G1 X179.137 Y161.387 E-.18724
G1 X179 Y161.411 E-.13201
G1 X178.863 Y161.387 E-.13178
G1 X178.742 Y161.319 E-.13203
G1 X178.619 Y161.153 E-.19653
G1 X178.59 Y161.017 E-.13196
G1 X178.607 Y160.879 E-.13195
G1 X178.716 Y160.703 E-.19657
G1 X178.831 Y160.626 E-.13192
G1 X178.965 Y160.591 E-.13168
G1 X179.035 Y160.591 E-.06623
G1 X179.169 Y160.626 E-.132
G1 X179.284 Y160.704 E-.13196
G1 X179.326 Y160.76 E-.06613
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.304 Y161.268 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.897 Y160.602 I-.305 J-.271 E.0477
G1 X179.965 Y160.591 E.00218
G3 X180.341 Y161.22 I.034 J.406 E.02858
; COOLING_NODE: 19
M204 S10000
G1 X180.254 Y160.315 F60000
G1 F2864.117
M204 S5000
G3 X179.897 Y159.602 I-.255 J-.318 E.04553
G1 X179.965 Y159.591 E.00218
G3 X180.299 Y160.274 I.034 J.406 E.03073
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X180.069 Y160.405 E-.25058
G1 X179.863 Y160.387 E-.19661
G1 X179.742 Y160.319 E-.13207
G1 X179.65 Y160.215 E-.1319
G1 X179.598 Y160.086 E-.13184
G1 X179.593 Y159.948 E-.1318
G1 X179.633 Y159.815 E-.13197
G1 X179.77 Y159.66 E-.19651
G1 X179.897 Y159.602 E-.13186
G1 X179.965 Y159.591 E-.06614
G1 X180.104 Y159.603 E-.13196
G1 X180.23 Y159.66 E-.13202
G1 X180.324 Y159.766 E-.13475
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.365 Y159.816 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.365 J.181 E.06504
G1 X179.035 Y159.591 E.00219
G3 X179.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 16
M204 S10000
G1 X179.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.255 J-.319 E.0477
G1 X179.035 Y158.591 E.00219
G3 X179.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 18
M204 S10000
G1 X180.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.255 J-.319 E.0477
G1 X180.035 Y158.591 E.00219
G3 X180.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 21
M204 S10000
G1 X181.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.255 J-.319 E.0477
G1 X181.035 Y158.591 E.00219
G3 X181.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 20
M204 S10000
G1 X181.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.365 J.181 E.06504
G1 X181.035 Y159.591 E.00219
G3 X181.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X181.41 Y160.018 E-.25119
G1 X181.381 Y160.153 E-.13198
G1 X181.258 Y160.32 E-.19664
G1 X181.137 Y160.387 E-.13178
G1 X181 Y160.411 E-.13202
G1 X180.863 Y160.387 E-.13179
G1 X180.742 Y160.319 E-.13207
G1 X180.619 Y160.153 E-.19657
G1 X180.59 Y160.017 E-.13188
G1 X180.607 Y159.879 E-.13195
G1 X180.716 Y159.703 E-.19657
G1 X180.831 Y159.626 E-.13192
G1 X180.835 Y159.625 E-.00364
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.365 Y159.816 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.365 J.181 E.06504
G1 X182.035 Y159.591 E.00219
G3 X182.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 22
M204 S10000
G1 X182.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.255 J-.319 E.0477
G1 X182.035 Y158.591 E.00219
G3 X182.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 25
M204 S10000
G1 X183.255 Y159.316 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.255 J-.319 E.0477
G1 X183.035 Y158.591 E.00219
G3 X183.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.18722
G1 X183 Y159.411 E-.132
G1 X182.863 Y159.387 E-.13178
G1 X182.742 Y159.319 E-.13203
G1 X182.65 Y159.215 E-.13192
G1 X182.59 Y159.017 E-.19657
G1 X182.607 Y158.879 E-.13194
G1 X182.67 Y158.756 E-.13181
G1 X182.77 Y158.66 E-.13192
G1 X182.965 Y158.591 E-.19645
G1 X183.035 Y158.591 E-.06623
G1 X183.169 Y158.626 E-.132
G1 X183.284 Y158.704 E-.13196
G1 X183.326 Y158.76 E-.06616
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.623 Y160.151 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.377 J-.154 E.02396
G1 X183.035 Y159.591 E.00219
G3 X182.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X182.59 Y160.017 E-.18723
G1 X182.607 Y159.879 E-.13194
G1 X182.716 Y159.703 E-.19658
G1 X182.831 Y159.626 E-.13192
G1 X182.965 Y159.591 E-.13168
G1 X183.035 Y159.591 E-.06623
G1 X183.169 Y159.626 E-.132
G1 X183.284 Y159.704 E-.13196
G1 X183.367 Y159.815 E-.13187
G1 X183.41 Y160.018 E-.1966
G1 X183.381 Y160.153 E-.13198
G1 X183.258 Y160.32 E-.19657
G1 X183.137 Y160.387 E-.13187
G1 X183.135 Y160.388 E-.00157
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.255 J-.319 E.0477
G1 X183.035 Y160.591 E.00219
G3 X183.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 27
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.18724
G1 X183 Y161.411 E-.132
G1 X182.863 Y161.387 E-.13178
G1 X182.742 Y161.319 E-.13203
G1 X182.619 Y161.153 E-.19659
G1 X182.59 Y161.017 E-.13189
G1 X182.607 Y160.879 E-.13194
G1 X182.716 Y160.703 E-.19658
G1 X182.831 Y160.626 E-.13192
G1 X182.965 Y160.591 E-.13168
G1 X183.035 Y160.591 E-.06623
G1 X183.169 Y160.626 E-.132
G1 X183.284 Y160.704 E-.13196
G1 X183.326 Y160.76 E-.06614
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.255 J-.319 E.0477
G1 X182.035 Y160.591 E.00219
G3 X182.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X182.137 Y161.387 E-.1872
G1 X182 Y161.411 E-.13202
G1 X181.863 Y161.387 E-.13178
G1 X181.742 Y161.319 E-.13203
G1 X181.619 Y161.153 E-.19659
G1 X181.59 Y161.017 E-.1319
G1 X181.607 Y160.879 E-.13195
G1 X181.716 Y160.703 E-.19657
G1 X181.831 Y160.626 E-.13192
G1 X181.965 Y160.591 E-.13168
G1 X182.035 Y160.591 E-.06623
G1 X182.169 Y160.626 E-.132
G1 X182.284 Y160.704 E-.13196
G1 X182.326 Y160.76 E-.06616
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.255 Y161.316 Z4 F60000
G1 Z3.6
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.255 J-.319 E.0477
G1 X181.035 Y160.591 E.00219
G3 X181.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 28
; WIPE_START
M204 S8000
G1 X181.137 Y161.387 E-.1872
G1 X181 Y161.411 E-.13202
G1 X180.863 Y161.387 E-.13178
G1 X180.742 Y161.319 E-.13203
G1 X180.619 Y161.153 E-.19659
G1 X180.59 Y161.017 E-.1319
G1 X180.607 Y160.879 E-.13195
G1 X180.716 Y160.703 E-.19657
G1 X180.831 Y160.626 E-.13192
G1 X180.965 Y160.591 E-.13168
G1 X181.035 Y160.591 E-.06623
G1 X181.169 Y160.626 E-.132
G1 X181.284 Y160.704 E-.13196
G1 X181.326 Y160.76 E-.06616
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z4 F60000
G1 Z3.6
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00612
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04795
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 51
M204 S10000
G1 X184.79 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311996
G1 F4013.744
M204 S8000
G1 X184.062 Y161.415 E.00636
; LINE_WIDTH: 0.294734
G1 F4288.884
G1 X184.075 Y161.33 E.00181
; LINE_WIDTH: 0.266522
G1 F4830.017
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243496
G1 F5384.515
G2 X184.078 Y160.681 I-2.44 J-.221 E.00912
; LINE_WIDTH: 0.278444
G1 F4585.53
G1 X184.075 Y160.661 E.0004
; LINE_WIDTH: 0.297218
G1 F4246.991
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.328547
G1 F3781.158
G1 X184.044 Y160.497 E.00198
G1 X184.025 Y160.496 E.00045
; LINE_WIDTH: 0.291039
G1 F4352.753
G1 X183.95 Y160.496 E.00154
; LINE_WIDTH: 0.252689
G1 F5148.519
G1 X183.875 Y160.496 E.0013
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.31199
G1 F4013.826
M204 S8000
G1 X184.062 Y160.415 E.00892
; LINE_WIDTH: 0.29473
G1 F4288.959
G1 X184.075 Y160.33 E.00181
; LINE_WIDTH: 0.266521
G1 F4830.03
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243496
G1 F5384.505
G2 X184.078 Y159.681 I-2.44 J-.221 E.00912
; LINE_WIDTH: 0.278444
G1 F4585.53
G1 X184.075 Y159.661 E.0004
; LINE_WIDTH: 0.297218
G1 F4246.991
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328581
G1 F3780.711
G1 X184.044 Y159.497 E.00198
G1 X184.025 Y159.497 E.00044
; LINE_WIDTH: 0.291374
G1 F4346.895
G1 X183.95 Y159.496 E.00155
; LINE_WIDTH: 0.253009
G1 F5140.683
G1 X183.875 Y159.496 E.00131
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.312
G1 F4013.677
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294734
G1 F4288.884
G1 X184.075 Y159.33 E.00181
; LINE_WIDTH: 0.266522
G1 F4830.017
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243496
G1 F5384.515
G2 X184.078 Y158.681 I-2.44 J-.221 E.00912
; LINE_WIDTH: 0.278434
G1 F4585.725
G1 X184.075 Y158.661 E.0004
; LINE_WIDTH: 0.297966
G1 F4234.53
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.353314
G1 F3479.456
G1 X184.036 Y158.464 E.00293
G1 X183.753 Y158.306 E.00837
M204 S10000
G1 X183.141 Y158.357 F60000
; LINE_WIDTH: 0.609702
G1 F1905.496
M204 S8000
G1 X182.343 Y158.184 E.03848
; LINE_WIDTH: 0.574709
G1 F2030.883
G2 X182.196 Y158.161 I-.35 J1.73 E.00658
; LINE_WIDTH: 0.540431
G1 F2170.81
G2 X181.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581473
G1 F2005.375
G1 X181.657 Y158.184 E.00467
; LINE_WIDTH: 0.609437
G1 F1906.389
G1 X181.609 Y158.194 E.00231
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609702
G1 F1905.496
M204 S8000
G1 X168.343 Y158.184 E.00232
; LINE_WIDTH: 0.574709
G1 F2030.883
G2 X168.196 Y158.161 I-.35 J1.73 E.00658
; LINE_WIDTH: 0.540431
G1 F2170.81
G2 X167.76 Y158.166 I-.194 J1.906 E.01808
; LINE_WIDTH: 0.581473
G1 F2005.375
G1 X167.657 Y158.184 E.00467
; LINE_WIDTH: 0.609437
G1 F1906.389
G1 X166.858 Y158.356 E.0385
M204 S10000
G1 X166.245 Y158.306 F60000
; LINE_WIDTH: 0.358207
G1 F3425.455
M204 S8000
G1 X165.964 Y158.464 E.00846
G1 X165.958 Y158.488 E.00066
; LINE_WIDTH: 0.33158
G1 F3741.433
G1 X165.942 Y158.574 E.00209
; LINE_WIDTH: 0.294732
G1 F4288.926
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.243887
G1 F5374.017
G2 X165.912 Y159.243 I2.46 J.325 E.00944
; LINE_WIDTH: 0.268731
G1 F4782.771
G1 X165.925 Y159.329 E.00162
; LINE_WIDTH: 0.308466
G1 F4067.098
G2 X166.014 Y159.807 I5.592 J-.792 E.01074
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.248574
G1 F5251.541
M204 S8000
G1 X166.051 Y159.496 E.00125
; LINE_WIDTH: 0.286145
G1 F4440.332
G1 X165.978 Y159.496 E.00148
; LINE_WIDTH: 0.314589
G1 F3975.435
G1 X165.956 Y159.497 E.00049
G1 X165.925 Y159.66 E.00373
; LINE_WIDTH: 0.258047
G1 F5020.31
G2 X165.903 Y159.867 I7.009 J.859 E.00374
; LINE_WIDTH: 0.237899
G1 F5539.066
G2 X165.912 Y160.243 I3.143 J.109 E.00609
; LINE_WIDTH: 0.268736
G1 F4782.666
G1 X165.925 Y160.329 E.00162
; LINE_WIDTH: 0.30845
G1 F4067.347
G2 X166.014 Y160.807 I5.59 J-.791 E.01074
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.248561
G1 F5251.87
M204 S8000
G1 X166.051 Y160.496 E.00125
; LINE_WIDTH: 0.286141
G1 F4440.414
G1 X165.978 Y160.496 E.00148
; LINE_WIDTH: 0.314585
G1 F3975.491
G1 X165.956 Y160.497 E.00049
G1 X165.925 Y160.66 E.00373
; LINE_WIDTH: 0.258047
G1 F5020.288
G2 X165.903 Y160.867 I7.003 J.859 E.00374
; LINE_WIDTH: 0.237888
G1 F5539.374
G2 X165.912 Y161.243 I3.14 J.109 E.00609
; LINE_WIDTH: 0.268731
G1 F4782.758
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307546
G1 F4081.238
G2 X165.992 Y161.694 I4.304 J-.599 E.00819
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4081.238
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 19/25
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z4 I.139 J1.209 P1  F60000
G1 X174.745 Y160.315 Z4
G1 Z3.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03045
G1 X175.035 Y159.591 E.00218
G3 X174.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00218
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18761
G1 X175.67 Y159.756 E-.13192
G1 X175.831 Y159.626 E-.19654
G1 X175.965 Y159.591 E-.13201
G1 X176.035 Y159.591 E-.06616
G1 X176.169 Y159.626 E-.1317
G1 X176.284 Y159.703 E-.13213
G1 X176.367 Y159.815 E-.13189
G1 X176.41 Y160.017 E-.1967
G1 X176.381 Y160.153 E-.13182
G1 X176.308 Y160.271 E-.13201
G1 X176.137 Y160.387 E-.1966
G1 X176 Y160.411 E-.13181
G1 X175.999 Y160.411 E-.00112
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.623 Y160.152 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.155 E.02397
G1 X177.035 Y159.591 E.00218
G3 X176.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.59 Y160.018 E-.18722
G1 X176.607 Y159.88 E-.13203
G1 X176.67 Y159.756 E-.13191
G1 X176.831 Y159.626 E-.19652
G1 X176.965 Y159.591 E-.13201
G1 X177.035 Y159.591 E-.06616
G1 X177.169 Y159.626 E-.1317
G1 X177.284 Y159.703 E-.13213
G1 X177.367 Y159.815 E-.13189
G1 X177.41 Y160.017 E-.1967
G1 X177.381 Y160.153 E-.13182
G1 X177.308 Y160.271 E-.13201
G1 X177.137 Y160.387 E-.1966
G1 X177.135 Y160.388 E-.00133
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.305 J-.271 E.04986
G1 X177.035 Y158.591 E.00218
G3 X177.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X177.137 Y159.387 E-.25064
G1 X177 Y159.411 E-.13181
G1 X176.863 Y159.387 E-.13192
G1 X176.742 Y159.32 E-.13193
G1 X176.619 Y159.153 E-.19657
G1 X176.59 Y159.018 E-.13187
G1 X176.607 Y158.88 E-.13203
G1 X176.67 Y158.756 E-.13191
G1 X176.831 Y158.626 E-.19652
G1 X176.965 Y158.591 E-.13201
G1 X177.035 Y158.591 E-.06616
G1 X177.169 Y158.626 E-.13186
G1 X177.284 Y158.703 E-.13195
G1 X177.286 Y158.706 E-.00283
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X176.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.305 J-.271 E.04986
G1 X176.035 Y158.591 E.00218
G3 X176.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.25064
G1 X176 Y159.411 E-.13181
G1 X175.863 Y159.387 E-.13191
G1 X175.742 Y159.32 E-.13193
G1 X175.619 Y159.153 E-.19657
G1 X175.59 Y159.018 E-.13187
G1 X175.607 Y158.88 E-.13201
G1 X175.67 Y158.756 E-.13192
G1 X175.831 Y158.626 E-.19654
G1 X175.965 Y158.591 E-.13201
G1 X176.035 Y158.591 E-.06616
G1 X176.169 Y158.626 E-.13186
G1 X176.284 Y158.703 E-.13195
G1 X176.286 Y158.706 E-.00282
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.305 J-.271 E.04986
G1 X175.035 Y158.591 E.00218
G3 X175.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 8
M204 S10000
G1 X174.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.377 J-.155 E.05419
G1 X174.035 Y158.591 E.00218
G3 X174.396 Y159.094 I-.035 J.406 E.02207
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.308 Y159.271 E-.18776
G1 X174.137 Y159.387 E-.19658
G1 X174 Y159.411 E-.13181
G1 X173.863 Y159.387 E-.13192
G1 X173.742 Y159.32 E-.13193
G1 X173.619 Y159.153 E-.19657
G1 X173.59 Y159.018 E-.13187
G1 X173.607 Y158.88 E-.13201
G1 X173.67 Y158.756 E-.13192
G1 X173.831 Y158.626 E-.19654
G1 X173.965 Y158.591 E-.13201
G1 X174.035 Y158.591 E-.06616
G1 X174.169 Y158.626 E-.13186
G1 X174.17 Y158.626 E-.00108
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.745 Y160.315 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03045
G1 X174.035 Y159.591 E.00218
G3 X173.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 2
M204 S10000
G1 X173.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.365 J.181 E.06505
G1 X173.035 Y159.591 E.00218
G3 X173.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 3
M204 S10000
G1 X173.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.305 J-.271 E.04986
G1 X173.035 Y158.591 E.00218
G3 X173.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X173.137 Y159.387 E-.25065
G1 X173 Y159.411 E-.13181
G1 X172.863 Y159.387 E-.13192
G1 X172.742 Y159.32 E-.13193
G1 X172.619 Y159.153 E-.19657
G1 X172.59 Y159.018 E-.13187
G1 X172.607 Y158.88 E-.13203
G1 X172.67 Y158.756 E-.13191
G1 X172.831 Y158.626 E-.19654
G1 X172.965 Y158.591 E-.13198
G1 X173.035 Y158.591 E-.06617
G1 X173.169 Y158.626 E-.13186
G1 X173.284 Y158.703 E-.13195
G1 X173.286 Y158.706 E-.00283
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.305 J-.271 E.04987
G1 X172.035 Y158.591 E.00218
G3 X172.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 7
; WIPE_START
M204 S8000
G1 X172.137 Y159.387 E-.25075
G1 X172 Y159.411 E-.13181
G1 X171.863 Y159.387 E-.13192
G1 X171.742 Y159.32 E-.13193
G1 X171.619 Y159.153 E-.19657
G1 X171.59 Y159.018 E-.13187
G1 X171.607 Y158.88 E-.13203
G1 X171.67 Y158.756 E-.13191
G1 X171.831 Y158.626 E-.19654
G1 X171.965 Y158.591 E-.13198
G1 X172.035 Y158.591 E-.06617
G1 X172.169 Y158.626 E-.13186
G1 X172.284 Y158.703 E-.13195
G1 X172.286 Y158.706 E-.00273
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X171.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.305 J-.271 E.04986
G1 X171.035 Y158.591 E.00218
G3 X171.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 6
M204 S10000
G1 X171.407 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.407 J-.02 E.05853
G1 X171.035 Y159.591 E.00218
G3 X171.406 Y159.957 I-.035 J.406 E.01775
; COOLING_NODE: 5
M204 S10000
G1 X172.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.365 J.181 E.06505
G1 X172.035 Y159.591 E.00218
G3 X172.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 42
; WIPE_START
M204 S8000
G1 X172.41 Y160.017 E-.25127
G1 X172.381 Y160.153 E-.13182
G1 X172.308 Y160.271 E-.13196
G1 X172.137 Y160.387 E-.19665
G1 X172 Y160.411 E-.13181
G1 X171.863 Y160.387 E-.13192
G1 X171.742 Y160.32 E-.132
G1 X171.619 Y160.153 E-.1965
G1 X171.59 Y160.018 E-.13187
G1 X171.607 Y159.88 E-.13203
G1 X171.67 Y159.756 E-.13191
G1 X171.831 Y159.626 E-.19654
G1 X171.835 Y159.625 E-.00373
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.407 Y160.017 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.407 J-.02 E.05853
G1 X170.035 Y159.591 E.00218
G3 X170.406 Y159.957 I-.035 J.406 E.01775
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X170.381 Y160.153 E-.18734
G1 X170.308 Y160.271 E-.13196
G1 X170.137 Y160.387 E-.19665
G1 X170 Y160.411 E-.13181
G1 X169.863 Y160.387 E-.13191
G1 X169.742 Y160.32 E-.132
G1 X169.619 Y160.153 E-.1965
G1 X169.59 Y160.018 E-.13187
G1 X169.607 Y159.88 E-.13208
G1 X169.67 Y159.756 E-.13187
G1 X169.831 Y159.626 E-.19654
G1 X169.965 Y159.591 E-.13196
G1 X170.035 Y159.591 E-.06617
G1 X170.036 Y159.591 E-.00135
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.623 Y160.152 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.377 J-.155 E.02397
G1 X169.035 Y159.591 E.00218
G3 X168.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 44
; WIPE_START
M204 S8000
G1 X168.59 Y160.018 E-.18723
G1 X168.607 Y159.88 E-.13201
G1 X168.67 Y159.756 E-.13192
G1 X168.831 Y159.626 E-.19654
G1 X168.965 Y159.591 E-.13201
G1 X169.035 Y159.591 E-.06616
G1 X169.169 Y159.626 E-.1317
G1 X169.284 Y159.703 E-.13213
G1 X169.367 Y159.815 E-.13189
G1 X169.41 Y160.017 E-.1967
G1 X169.381 Y160.153 E-.13182
G1 X169.308 Y160.271 E-.13201
G1 X169.137 Y160.387 E-.1966
G1 X169.135 Y160.388 E-.0013
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.305 J-.271 E.04986
G1 X169.035 Y158.591 E.00218
G3 X169.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 43
M204 S10000
G1 X170.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.305 J-.271 E.04986
G1 X170.035 Y158.591 E.00218
G3 X170.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 45
; WIPE_START
M204 S8000
G1 X170.137 Y159.387 E-.25074
G1 X170 Y159.411 E-.13181
G1 X169.863 Y159.387 E-.13191
G1 X169.742 Y159.32 E-.13193
G1 X169.619 Y159.153 E-.19657
G1 X169.59 Y159.018 E-.13187
G1 X169.607 Y158.88 E-.13208
G1 X169.67 Y158.756 E-.13187
G1 X169.831 Y158.626 E-.19654
G1 X169.965 Y158.591 E-.13196
G1 X170.035 Y158.591 E-.06617
G1 X170.169 Y158.626 E-.13186
G1 X170.284 Y158.703 E-.13195
G1 X170.286 Y158.706 E-.00274
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.305 J-.271 E.04986
G1 X168.035 Y158.591 E.00218
G3 X168.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 46
M204 S10000
G1 X168.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.365 J.181 E.06505
G1 X168.035 Y159.591 E.00218
G3 X168.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 47
M204 S10000
G1 X167.365 Y159.816 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.365 J.181 E.06505
G1 X167.035 Y159.591 E.00218
G3 X167.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 48
M204 S10000
G1 X167.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.305 J-.271 E.04986
G1 X167.035 Y158.591 E.00218
G3 X167.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.137 Y159.387 E-.25074
G1 X167 Y159.411 E-.13181
G1 X166.863 Y159.387 E-.13192
G1 X166.742 Y159.32 E-.13193
G1 X166.619 Y159.153 E-.19657
G1 X166.59 Y159.018 E-.13187
G1 X166.607 Y158.88 E-.13208
G1 X166.67 Y158.756 E-.13188
G1 X166.831 Y158.626 E-.19652
G1 X166.965 Y158.591 E-.13198
G1 X167.035 Y158.591 E-.06617
G1 X167.169 Y158.626 E-.13186
G1 X167.284 Y158.703 E-.13195
G1 X167.286 Y158.706 E-.00274
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X166.37 Y159.495 Z4.2 F60000
G1 Z3.8
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G2 X166.37 Y160.495 I.688 J.5 E.03618
G2 X166.642 Y161.725 I.673 J.496 E.04829
G1 X166.589 Y161.898 E.00611
G1 X165.602 Y161.898 E.03341
G1 X165.602 Y158.102 E.12849
G1 X166.59 Y158.102 E.03343
G1 X166.637 Y158.285 E.00639
G2 X166.334 Y159.447 I.364 J.715 E.04593
; COOLING_NODE: 49
; WIPE_START
G1 X166.282 Y159.638 E-.18804
G1 X166.231 Y159.764 E-.12965
G1 X166.197 Y160.034 E-.25857
G1 X166.254 Y160.3 E-.25824
G1 X166.37 Y160.495 E-.21578
G1 X166.282 Y160.638 E-.1589
G1 X166.231 Y160.764 E-.12961
G1 X166.202 Y160.898 E-.12985
G1 X166.214 Y161.17 E-.25826
G1 X166.254 Y161.3 E-.12959
G1 X166.278 Y161.339 E-.04352
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.305 Y161.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.305 J-.271 E.04986
G1 X167.035 Y160.591 E.00218
G3 X167.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 50
M204 S10000
G1 X168.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.305 J-.271 E.04986
G1 X168.035 Y160.591 E.00218
G3 X168.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 40
M204 S10000
G1 X169.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.305 J-.271 E.04986
G1 X169.035 Y160.591 E.00218
G3 X169.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 39
M204 S10000
G1 X170.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.305 J-.271 E.04986
G1 X170.035 Y160.591 E.00218
G3 X170.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 38
M204 S10000
G1 X171.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.305 J-.271 E.04986
G1 X171.035 Y160.591 E.00218
G3 X171.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 37
M204 S10000
G1 X172.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.305 J-.271 E.04986
G1 X172.035 Y160.591 E.00218
G3 X172.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 36
M204 S10000
G1 X173.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.305 J-.271 E.04986
G1 X173.035 Y160.591 E.00218
G3 X173.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.25066
G1 X173 Y161.411 E-.13181
G1 X172.863 Y161.387 E-.13192
G1 X172.742 Y161.32 E-.13193
G1 X172.619 Y161.153 E-.19657
G1 X172.59 Y161.018 E-.13187
G1 X172.607 Y160.88 E-.13203
G1 X172.67 Y160.756 E-.13191
G1 X172.831 Y160.626 E-.19654
G1 X172.965 Y160.591 E-.13197
G1 X173.035 Y160.591 E-.06617
G1 X173.169 Y160.626 E-.13169
G1 X173.284 Y160.703 E-.13213
G1 X173.286 Y160.706 E-.00281
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.377 Y161.152 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.377 J-.155 E.05419
G1 X174.035 Y160.591 E.00218
G3 X174.396 Y161.094 I-.035 J.406 E.02207
; COOLING_NODE: 34
M204 S10000
G1 X175.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.305 J-.271 E.04986
G1 X175.035 Y160.591 E.00218
G3 X175.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 33
M204 S10000
G1 X176.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.305 J-.271 E.04986
G1 X176.035 Y160.591 E.00218
G3 X176.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 32
M204 S10000
G1 X177.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.305 J-.271 E.04986
G1 X177.035 Y160.591 E.00218
G3 X177.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 31
M204 S10000
G1 X178.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.305 J-.271 E.04986
G1 X178.035 Y160.591 E.00218
G3 X178.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 30
M204 S10000
G1 X179.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.305 J-.271 E.04986
G1 X179.035 Y160.591 E.00218
G3 X179.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 29
M204 S10000
G1 X180.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.305 J-.271 E.04986
G1 X180.035 Y160.591 E.00218
G3 X180.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 28
M204 S10000
G1 X181.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.305 J-.271 E.04986
G1 X181.035 Y160.591 E.00218
G3 X181.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 27
M204 S10000
G1 X182.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.305 J-.271 E.04986
G1 X182.035 Y160.591 E.00218
G3 X182.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 26
M204 S10000
G1 X183.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.305 J-.271 E.04986
G1 X183.035 Y160.591 E.00218
G3 X183.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 26
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.25066
G1 X183 Y161.411 E-.13181
G1 X182.863 Y161.387 E-.13192
G1 X182.742 Y161.32 E-.13193
G1 X182.619 Y161.153 E-.19657
G1 X182.59 Y161.018 E-.13187
G1 X182.607 Y160.88 E-.13201
G1 X182.67 Y160.756 E-.13192
G1 X182.831 Y160.626 E-.19656
G1 X182.965 Y160.591 E-.13197
G1 X183.035 Y160.591 E-.06617
G1 X183.169 Y160.626 E-.13169
G1 X183.284 Y160.703 E-.13213
G1 X183.286 Y160.706 E-.0028
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.398 Y161.898 Z4.2 F60000
G1 Z3.8
G1 E2 F600
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2653.043
M204 S8000
G1 X183.411 Y161.898 E.03341
G1 X183.358 Y161.725 E.00611
G2 X183.63 Y160.495 I-.4 J-.734 E.04829
G2 X183.63 Y159.495 I-.688 J-.5 E.03618
G2 X183.363 Y158.285 I-.632 J-.495 E.04796
G1 X183.41 Y158.102 E.00639
G1 X184.398 Y158.102 E.03343
G1 X184.398 Y161.838 E.12646
; COOLING_NODE: 19
; WIPE_START
G1 X183.411 Y161.898 E-.93939
G1 X183.358 Y161.725 E-.17156
G1 X183.505 Y161.626 E-.16879
G1 X183.604 Y161.532 E-.12942
G1 X183.685 Y161.422 E-.12986
G1 X183.786 Y161.17 E-.2581
G1 X183.791 Y161.061 E-.10288
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y160.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.305 J-.271 E.04986
G1 X180.035 Y159.591 E.00218
G3 X180.341 Y160.22 I-.035 J.406 E.0264
; COOLING_NODE: 20
; WIPE_START
M204 S8000
G1 X180.137 Y160.387 E-.25072
G1 X180 Y160.411 E-.13181
G1 X179.863 Y160.387 E-.13192
G1 X179.742 Y160.32 E-.132
G1 X179.619 Y160.153 E-.1965
G1 X179.59 Y160.018 E-.13187
G1 X179.607 Y159.88 E-.13203
G1 X179.67 Y159.756 E-.13188
G1 X179.831 Y159.626 E-.19656
G1 X179.965 Y159.591 E-.132
G1 X180.035 Y159.591 E-.06616
G1 X180.169 Y159.626 E-.1317
G1 X180.284 Y159.703 E-.13213
G1 X180.286 Y159.706 E-.00275
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.365 Y159.816 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.365 J.181 E.06505
G1 X181.035 Y159.591 E.00218
G3 X181.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 23
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.25127
G1 X181.381 Y160.153 E-.13182
G1 X181.308 Y160.271 E-.13196
G1 X181.137 Y160.387 E-.19665
G1 X181 Y160.411 E-.13181
G1 X180.863 Y160.387 E-.13192
G1 X180.742 Y160.32 E-.13201
G1 X180.619 Y160.153 E-.1965
G1 X180.59 Y160.018 E-.13187
G1 X180.607 Y159.88 E-.13208
G1 X180.67 Y159.756 E-.13188
G1 X180.831 Y159.626 E-.19652
M73 P88 R3
G1 X180.835 Y159.625 E-.00372
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.365 Y159.816 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.365 J.181 E.06505
G1 X182.035 Y159.591 E.00218
G3 X182.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 24
M204 S10000
G1 X182.623 Y160.152 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.377 J-.155 E.02396
G1 X183.035 Y159.591 E.00218
G3 X182.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X182.59 Y160.018 E-.18722
G1 X182.607 Y159.88 E-.13201
G1 X182.67 Y159.756 E-.13192
G1 X182.831 Y159.626 E-.19656
G1 X182.965 Y159.591 E-.13198
G1 X183.035 Y159.591 E-.06617
G1 X183.169 Y159.626 E-.1317
G1 X183.284 Y159.703 E-.13213
G1 X183.367 Y159.815 E-.13189
G1 X183.41 Y160.017 E-.1967
G1 X183.381 Y160.153 E-.13182
G1 X183.308 Y160.271 E-.13201
G1 X183.137 Y160.387 E-.1966
G1 X183.135 Y160.388 E-.00132
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.305 J-.271 E.04986
G1 X183.035 Y158.591 E.00218
G3 X183.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 22
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.25064
G1 X183 Y159.411 E-.13181
G1 X182.863 Y159.387 E-.13192
G1 X182.742 Y159.32 E-.13193
G1 X182.619 Y159.153 E-.19657
G1 X182.59 Y159.018 E-.13187
G1 X182.607 Y158.88 E-.13201
G1 X182.67 Y158.756 E-.13192
G1 X182.831 Y158.626 E-.19656
G1 X182.965 Y158.591 E-.13198
G1 X183.035 Y158.591 E-.06617
G1 X183.169 Y158.626 E-.13186
G1 X183.284 Y158.703 E-.13195
G1 X183.286 Y158.706 E-.00282
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.305 J-.271 E.04986
G1 X182.035 Y158.591 E.00218
G3 X182.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 21
; WIPE_START
M204 S8000
G1 X182.137 Y159.387 E-.25074
G1 X182 Y159.411 E-.13181
G1 X181.863 Y159.387 E-.13192
G1 X181.742 Y159.32 E-.13193
G1 X181.619 Y159.153 E-.19657
G1 X181.59 Y159.018 E-.13187
G1 X181.607 Y158.88 E-.13203
G1 X181.67 Y158.756 E-.13191
G1 X181.831 Y158.626 E-.19654
G1 X181.965 Y158.591 E-.13198
G1 X182.035 Y158.591 E-.06617
G1 X182.169 Y158.626 E-.13186
G1 X182.284 Y158.703 E-.13195
G1 X182.286 Y158.706 E-.00274
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X181.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.305 J-.271 E.04987
G1 X181.035 Y158.591 E.00218
G3 X181.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X181.137 Y159.387 E-.25074
G1 X181 Y159.411 E-.13181
G1 X180.863 Y159.387 E-.13192
G1 X180.742 Y159.32 E-.13193
G1 X180.619 Y159.153 E-.19657
G1 X180.59 Y159.018 E-.13187
G1 X180.607 Y158.88 E-.13208
G1 X180.67 Y158.756 E-.13188
G1 X180.831 Y158.626 E-.19652
G1 X180.965 Y158.591 E-.13198
G1 X181.035 Y158.591 E-.06616
G1 X181.169 Y158.626 E-.13189
G1 X181.284 Y158.703 E-.13193
G1 X181.286 Y158.706 E-.00272
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.305 J-.271 E.04986
G1 X180.035 Y158.591 E.00218
G3 X180.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X180.137 Y159.387 E-.25074
G1 X180 Y159.411 E-.13181
G1 X179.863 Y159.387 E-.13192
G1 X179.742 Y159.32 E-.13193
G1 X179.619 Y159.153 E-.19657
G1 X179.59 Y159.018 E-.13187
G1 X179.607 Y158.88 E-.13203
G1 X179.67 Y158.756 E-.13188
G1 X179.831 Y158.626 E-.19656
G1 X179.965 Y158.591 E-.132
G1 X180.035 Y158.591 E-.06616
G1 X180.169 Y158.626 E-.13186
G1 X180.284 Y158.703 E-.13195
G1 X180.286 Y158.706 E-.00274
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.305 J-.271 E.04987
G1 X179.035 Y158.591 E.00218
G3 X179.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X179.137 Y159.387 E-.25074
G1 X179 Y159.411 E-.13181
G1 X178.863 Y159.387 E-.13192
G1 X178.742 Y159.32 E-.13193
G1 X178.619 Y159.153 E-.19657
G1 X178.59 Y159.018 E-.13187
G1 X178.607 Y158.88 E-.13203
G1 X178.67 Y158.756 E-.13191
G1 X178.831 Y158.626 E-.19654
G1 X178.965 Y158.591 E-.13198
G1 X179.035 Y158.591 E-.06617
G1 X179.169 Y158.626 E-.13186
G1 X179.284 Y158.703 E-.13195
G1 X179.286 Y158.706 E-.00272
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.305 Y159.268 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.305 J-.271 E.04986
G1 X178.035 Y158.591 E.00218
G3 X178.341 Y159.22 I-.035 J.406 E.02641
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178.137 Y159.387 E-.25064
G1 X178 Y159.411 E-.13181
G1 X177.863 Y159.387 E-.13192
G1 X177.742 Y159.32 E-.13193
G1 X177.619 Y159.153 E-.19657
G1 X177.59 Y159.018 E-.13187
G1 X177.607 Y158.88 E-.13203
G1 X177.67 Y158.756 E-.13191
G1 X177.831 Y158.626 E-.19652
G1 X177.965 Y158.591 E-.13201
G1 X178.035 Y158.591 E-.06616
G1 X178.169 Y158.626 E-.13186
G1 X178.284 Y158.703 E-.13195
G1 X178.286 Y158.706 E-.00283
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.623 Y160.152 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.155 E.02397
G1 X178.035 Y159.591 E.00218
M73 P89 R3
G3 X177.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X177.59 Y160.018 E-.18722
G1 X177.607 Y159.88 E-.13203
G1 X177.67 Y159.756 E-.13191
G1 X177.831 Y159.626 E-.19652
G1 X177.965 Y159.591 E-.13201
G1 X178.035 Y159.591 E-.06616
G1 X178.169 Y159.626 E-.1317
G1 X178.284 Y159.703 E-.13213
G1 X178.367 Y159.815 E-.13189
G1 X178.41 Y160.017 E-.1967
G1 X178.381 Y160.153 E-.13182
G1 X178.308 Y160.271 E-.13201
G1 X178.137 Y160.387 E-.1966
G1 X178.135 Y160.388 E-.00133
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.365 Y159.816 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.365 J.181 E.06505
G1 X179.035 Y159.591 E.00218
G3 X179.335 Y159.764 I-.035 J.406 E.01122
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.25127
G1 X179.381 Y160.153 E-.13182
G1 X179.308 Y160.271 E-.13196
G1 X179.137 Y160.387 E-.19665
G1 X179 Y160.411 E-.13181
G1 X178.863 Y160.387 E-.13192
G1 X178.742 Y160.32 E-.13201
G1 X178.619 Y160.153 E-.1965
G1 X178.59 Y160.018 E-.13187
G1 X178.607 Y159.88 E-.13203
G1 X178.67 Y159.756 E-.13191
G1 X178.831 Y159.626 E-.19654
G1 X178.835 Y159.625 E-.00372
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.79 Y162.29 Z4.2 F60000
G1 Z3.8
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.008 Y161.694 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.311765
G1 F4017.192
M204 S8000
G1 X184.062 Y161.415 E.00637
; LINE_WIDTH: 0.294545
G1 F4292.11
G1 X184.075 Y161.329 E.00181
; LINE_WIDTH: 0.266403
G1 F4832.6
G1 X184.09 Y161.226 E.00194
; LINE_WIDTH: 0.243505
G1 F5384.264
G2 X184.078 Y160.68 I-2.437 J-.221 E.00912
; LINE_WIDTH: 0.27859
G1 F4582.688
G1 X184.075 Y160.661 E.00039
; LINE_WIDTH: 0.297308
G1 F4245.495
G1 X184.059 Y160.579 E.00176
; LINE_WIDTH: 0.328459
G1 F3782.327
G1 X184.044 Y160.497 E.00197
G1 X184.024 Y160.496 E.00046
; LINE_WIDTH: 0.289984
G1 F4371.349
G1 X183.95 Y160.496 E.00153
; LINE_WIDTH: 0.251514
G1 F5177.54
G1 X183.875 Y160.496 E.00129
M204 S10000
G1 X183.986 Y160.807 F60000
; LINE_WIDTH: 0.311731
G1 F4017.692
M204 S8000
G1 X184.062 Y160.415 E.00892
; LINE_WIDTH: 0.294522
G1 F4292.504
G1 X184.075 Y160.329 E.00181
; LINE_WIDTH: 0.266396
G1 F4832.741
G1 X184.09 Y160.226 E.00194
; LINE_WIDTH: 0.243505
G1 F5384.257
G2 X184.078 Y159.68 I-2.437 J-.221 E.00912
; LINE_WIDTH: 0.27859
G1 F4582.688
G1 X184.075 Y159.661 E.00039
; LINE_WIDTH: 0.297313
G1 F4245.402
G1 X184.059 Y159.579 E.00176
; LINE_WIDTH: 0.328455
G1 F3782.382
G1 X184.044 Y159.497 E.00197
G1 X184.024 Y159.496 E.00046
; LINE_WIDTH: 0.289938
G1 F4372.158
G1 X183.95 Y159.496 E.00153
; LINE_WIDTH: 0.251488
G1 F5178.178
G1 X183.875 Y159.496 E.00129
M204 S10000
G1 X183.986 Y159.807 F60000
; LINE_WIDTH: 0.311765
G1 F4017.192
M204 S8000
G1 X184.062 Y159.415 E.00892
; LINE_WIDTH: 0.294545
G1 F4292.11
G1 X184.075 Y159.329 E.00181
; LINE_WIDTH: 0.266403
G1 F4832.6
G1 X184.09 Y159.226 E.00194
; LINE_WIDTH: 0.243505
G1 F5384.257
G2 X184.078 Y158.68 I-2.437 J-.221 E.00912
; LINE_WIDTH: 0.27859
G1 F4582.688
G1 X184.075 Y158.661 E.00039
; LINE_WIDTH: 0.298078
G1 F4232.674
G1 X184.059 Y158.575 E.00185
; LINE_WIDTH: 0.35307
G1 F3482.194
G1 X184.036 Y158.464 E.00292
G1 X183.753 Y158.306 E.00836
M204 S10000
G1 X183.141 Y158.356 F60000
; LINE_WIDTH: 0.609485
G1 F1906.224
M204 S8000
G1 X182.343 Y158.184 E.0385
; LINE_WIDTH: 0.574582
G1 F2031.368
G2 X182.196 Y158.161 I-.349 J1.732 E.00656
; LINE_WIDTH: 0.540431
G1 F2170.806
G2 X181.76 Y158.166 I-.194 J1.905 E.01807
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X181.657 Y158.184 E.00469
; LINE_WIDTH: 0.609673
G1 F1905.593
G1 X181.609 Y158.195 E.00233
M204 S10000
G1 X168.391 Y158.195 F60000
; LINE_WIDTH: 0.609485
G1 F1906.224
M204 S8000
G1 X168.343 Y158.184 E.00233
; LINE_WIDTH: 0.574582
G1 F2031.368
G2 X168.196 Y158.161 I-.349 J1.732 E.00656
; LINE_WIDTH: 0.540431
G1 F2170.806
G2 X167.76 Y158.166 I-.194 J1.905 E.01807
; LINE_WIDTH: 0.581537
G1 F2005.137
G1 X167.657 Y158.184 E.00469
; LINE_WIDTH: 0.609673
G1 F1905.593
G1 X166.859 Y158.357 E.03848
M204 S10000
G1 X166.248 Y158.306 F60000
; LINE_WIDTH: 0.358394
G1 F3423.423
M204 S8000
G1 X165.964 Y158.464 E.00854
G1 X165.958 Y158.489 E.00067
; LINE_WIDTH: 0.331364
G1 F3744.23
G1 X165.942 Y158.574 E.00209
; LINE_WIDTH: 0.294556
G1 F4291.911
G1 X165.922 Y158.68 E.00225
; LINE_WIDTH: 0.243869
G1 F5374.497
G2 X165.912 Y159.244 I2.46 J.325 E.00944
; LINE_WIDTH: 0.268965
G1 F4777.815
G1 X165.925 Y159.329 E.00163
; LINE_WIDTH: 0.308758
G1 F4062.624
G2 X166.014 Y159.806 I5.595 J-.794 E.01073
M204 S10000
G1 X166.125 Y159.496 F60000
; LINE_WIDTH: 0.249997
G1 F5215.469
M204 S8000
G1 X166.051 Y159.496 E.00127
; LINE_WIDTH: 0.28786
G1 F4409.245
G1 X165.977 Y159.496 E.0015
; LINE_WIDTH: 0.314548
G1 F3976.024
G1 X165.956 Y159.497 E.00047
G1 X165.925 Y159.66 E.00374
; LINE_WIDTH: 0.257926
G1 F5023.132
G2 X165.903 Y159.868 I6.975 J.854 E.00374
; LINE_WIDTH: 0.237929
G1 F5538.208
G2 X165.912 Y160.244 I3.136 J.108 E.0061
; LINE_WIDTH: 0.26897
G1 F4777.71
G1 X165.925 Y160.329 E.00163
; LINE_WIDTH: 0.308769
G1 F4062.464
G2 X166.014 Y160.806 I5.599 J-.795 E.01073
M204 S10000
G1 X166.125 Y160.496 F60000
; LINE_WIDTH: 0.250136
G1 F5211.95
M204 S8000
G1 X166.051 Y160.496 E.00127
; LINE_WIDTH: 0.288047
G1 F4405.893
G1 X165.977 Y160.496 E.0015
; LINE_WIDTH: 0.314549
G1 F3976.016
G1 X165.956 Y160.497 E.00047
G1 X165.925 Y160.66 E.00374
; LINE_WIDTH: 0.257924
G1 F5023.163
G2 X165.903 Y160.868 I6.964 J.853 E.00374
; LINE_WIDTH: 0.237929
G1 F5538.208
G2 X165.912 Y161.244 I3.136 J.108 E.0061
; LINE_WIDTH: 0.268965
G1 F4777.815
G1 X165.925 Y161.329 E.00163
; LINE_WIDTH: 0.307813
G1 F4077.117
G2 X165.992 Y161.694 I4.271 J-.596 E.00818
; WIPE_START
M204 S8000
G1 X165.925 Y161.329 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
M204 S10000
G17
G3 Z4.2 I-1.217 J.015 P1  F60000
G1 X167.428 Y279.944 Z4.2
G1 Z3.8
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428 Y270.944  E0.3421 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.3421
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y270.944  
;--------------------
; CP EMPTY GRID START
; layer #20
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X175.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.3421
M204 S10000
G1  X190.928 
M204 S8000
G1  Y270.944  E0.3421
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.3421
; CP EMPTY GRID END
;------------------






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
G1 E-2 F600
G17
G3 Z4.2 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z3.8
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
M73 P90 R3
G1  Y270.569 
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
M73 P91 R3
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S176 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
G3 Z4.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z6.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E2

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

M73 P91 R2
G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z6.8 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S163.2
M106 P2 S191
G1 X204.318 Y252.694 F60000
G1 Z3.8

; filament start gcode
G17
G3 Z4.2 I0 J-1.217 P1
G1 X199.428 Y252.694 Z4.2
G1 Z3.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X196.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X200.928  F600
G1  X199.428  F240
M73 P92 R2
G1  X199.928  F600
G1  Y253.194 
G1  X198.928 
G1  Y252.194 
G1  X200.428 
G1  Y253.694 
G1  X198.428 
G1  Y251.694 
G1  X196.428 Y252.694   F1782
G1 E0.4000 F1800
M204 S8000
G1  X167.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X199.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X167.428  E1.2162 F2473
G1  Y254.944  E0.0285
M104 T0 S230 N0 ;Multi extruder pre heating
G1  X199.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X167.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X199.428  E1.2162
G1  Y257.194  E0.0285
G1  X167.428  E1.2162
G1  Y257.944  E0.0285
G1  X199.428  E1.2162
G1  Y258.694  E0.0285
G1  X167.428  E1.2162
G1  Y259.444  E0.0285
G1  X199.428  E1.2162
G1  Y260.194  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #20
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X167.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G1  X168.229 Y250.675   E0.1661
G3  X171.707 Y251.015   I1.606 J1.535 E0.1529
G2  X175.079 Y252.194   I3.377 J-4.247 E0.1383
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.543 Y251.744   E0.0535
G1 E-0.4000 F1800
M204 S10000
G1  X201.169 Y253.644   F600
G1 E0.4000 F1800
M204 S8000
G3  X200.739 Y256.835   I-1.385 J1.438 E0.1423 F5400
G2  X199.928 Y259.090   I2.785 J2.275 E0.0929
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END

; WIPE_START
G1 F4077.117
M204 S8000
G1 X166.928 Y280.444 E-.00001
G1 X167.578 Y281.204 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z3.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 19 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z4.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer19 end: 224,265
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 20/25
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

M106 S183.6
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z4.4
G1 Z4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 20 start: 224,265
M624 AwAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z4.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer20 end: 224,265
M625
M204 S10000
G1 X167.428 Y279.944
G1 Z4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.928 Y280.444  
M204 S8000
G3  X165.216 Y278.401   I8.989 J-9.270 E0.1015 F5400
G1 E-0.4000 F1800
M204 S10000
G1  X165.744 Y276.190   F600
G1 E0.4000 F1800
M204 S8000
G2  X166.928 Y273.548   I-2.389 J-2.656 E0.1133 F5400
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.387 Y253.994   I1.461 J-0.738 E0.0730
G3  X168.451 Y250.453   I20.946 J15.027 E0.1782
G3  X171.859 Y251.132   I1.345 J2.142 E0.1456
G2  X175.079 Y252.194   I3.241 J-4.414 E0.1310
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
; WIPE_TOWER_END
G1  X167.428 Y265.444
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y255.194  E0.3896
G1  X199.428  E1.2162
G1  Y265.444  E0.3896
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y255.194  
;--------------------
; CP EMPTY GRID START
; layer #21
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X175.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.3896
M204 S10000
G1  X190.928 
M204 S8000
G1  Y255.194  E0.3896
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.3896
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #20
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z4.4 I1.217 J0 P1  F60000
G1 X167.678 Y252.944
G1 Z4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF3 NF0
M204 S8000
G1  X199.178 Y252.944  E2.5068 F7836
G1  Y254.194  E0.0995
G1  X167.678  E2.5068
; NOZZLE_CHANGE_END OF3 NF0
M104 T1 S94 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X168.678 Y254.194 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z7 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F623.623 L0 H0.4 T240 P220 S1



M620.10 A1 F89.8017 L0 H0.4 T250 P230 S1



M620.11 P0 I3 E0



M620.11 K1 I3 R10 F623.623


M628 S1


M620.11 S1 L0 I3 R10 D8 E-10 F623.623


M629


M620.11 H2 C331


T0
M73 E1

;deretract



; VFLUSH_START


;VG1 E0 F89


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83


M620.10 R2
M628 S0
;VM109 S230
M629
M400

M983.3 F1.5 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

M73 P93 R2
G1 Y295
G1 Y265 F18000
G1 Z7 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X204.318 Y265.285 F60000
G1 Z4
G1 X204.318 Y272.917 Z4.4
G1 X204.318 Y285.121 Z4.4
G1 X162.538 Y285.121
G1 X162.538 Y277.194

; filament start gcode
G1 X167.428 Y277.194
G1 Z4
G1 E2 F600

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y277.194  E0.1140 F1782
G1 E-2.0000 F600
M204 S10000
G1  X165.928 
G1  X167.428  F240
G1  X167.928  F600
G1  Y277.694 
G1  X166.928 
G1  Y276.694 
G1  X168.428 
G1  Y278.194 
G1  X166.428 
G1  Y276.194 
G1  X170.428 Y277.194   F1782
G1 E2.0000 F600
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y276.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y275.694  E0.0285
G1  X199.428  E1.2162 F2363
G1  Y274.944  E0.0285
G1  X167.428  E1.2162
G1  Y274.194  E0.0285
G1  X199.428  E1.2162
G1  Y273.444  E0.0285
G1  X167.428  E1.2162
G1  Y272.694  E0.0285
G1  X199.428  E1.2162
G1  Y271.944  E0.0285
G1  X167.428  E1.2162
G1  Y271.194  E0.0285
G1  X199.428  E1.2162
G1  Y270.444  E0.0285
G1  X167.428  E1.2162
G1  Y269.694  E0.0285
G1  X199.428  E1.2162
G1  Y268.944  E0.0285
G1  X167.428  E1.2162
G1  Y268.194  E0.0285
G1  X199.428  E1.2162
G1  Y267.444  E0.0285
G1  X167.428  E1.2162
G1  Y266.694  E0.0285
G1  X199.428  E1.2162
G1  Y265.944  E0.0285
G1  X167.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


M73 P94 R2
G1  Y279.944   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y277.944  E0.0760 F2363
G1  X199.428  E1.2162
G1  Y279.944  E0.0760
G1  X167.428  E1.2162
M204 S10000
G1  X168.428 Y277.944  
;--------------------
; CP EMPTY GRID START
; layer #21
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X175.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X183.428 
M204 S8000
G1  Y279.944  E0.0760
M204 S10000
G1  X190.928 
M204 S8000
G1  Y277.944  E0.0760
M204 S10000
G1  X198.428 
M204 S8000
G1  Y279.944  E0.0760
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S8000
G1 X198.428 Y277.944 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
; OBJECT_ID: 224
; COOLING_NODE: 0
; start printing object, unique label id: 224
M624 AQAAAAAAAAA=
M204 S10000
G1 X174.745 Y160.315
G1 Z4
G1 E2 F600
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2864.117
M204 S5000
G3 X174.965 Y159.591 I.255 J-.318 E.03045
G1 X175.035 Y159.591 E.00218
G3 X174.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 13
M204 S10000
G1 X175.593 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y159.591 I.407 J-.02 E.01963
G1 X176.035 Y159.591 E.00218
G3 X175.6 Y160.077 I-.035 J.406 E.05664
; COOLING_NODE: 12
; WIPE_START
M204 S8000
G1 X175.607 Y159.88 E-.18767
G1 X175.67 Y159.756 E-.13183
G1 X175.831 Y159.626 E-.19665
G1 X175.965 Y159.591 E-.13193
G1 X176.035 Y159.591 E-.06614
G1 X176.23 Y159.66 E-.19664
G1 X176.33 Y159.756 E-.1318
G1 X176.393 Y159.88 E-.1321
G1 X176.41 Y160.017 E-.13183
G1 X176.35 Y160.215 E-.19653
G1 X176.258 Y160.32 E-.13196
G1 X176.137 Y160.387 E-.13191
G1 X176 Y160.411 E-.13195
G1 X175.999 Y160.411 E-.00105
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.623 Y160.152 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y159.591 I.377 J-.155 E.02396
G1 X177.035 Y159.591 E.00218
G3 X176.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 11
; WIPE_START
M204 S8000
G1 X176.59 Y160.017 E-.18715
G1 X176.607 Y159.88 E-.13206
G1 X176.67 Y159.756 E-.13186
G1 X176.831 Y159.626 E-.19661
G1 X176.965 Y159.591 E-.13193
G1 X177.035 Y159.591 E-.06613
G1 X177.169 Y159.626 E-.13188
G1 X177.33 Y159.756 E-.19658
G1 X177.393 Y159.88 E-.1321
G1 X177.41 Y160.017 E-.13183
G1 X177.35 Y160.215 E-.19653
G1 X177.258 Y160.32 E-.13196
G1 X177.137 Y160.387 E-.1319
G1 X177.135 Y160.388 E-.00149
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X177.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X176.965 Y158.591 I-.255 J-.318 E.04771
G1 X177.035 Y158.591 E.00218
G3 X177.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 10
; WIPE_START
M204 S8000
G1 X177.137 Y159.387 E-.1873
G1 X177 Y159.411 E-.13198
G1 X176.863 Y159.387 E-.1318
G1 X176.692 Y159.271 E-.19665
G1 X176.619 Y159.153 E-.13194
G1 X176.59 Y159.017 E-.13182
G1 X176.607 Y158.88 E-.13206
G1 X176.67 Y158.756 E-.13186
G1 X176.831 Y158.626 E-.19661
G1 X176.965 Y158.591 E-.13193
G1 X177.035 Y158.591 E-.06613
G1 X177.169 Y158.626 E-.13188
G1 X177.33 Y158.756 E-.19658
G1 X177.331 Y158.757 E-.00147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X175.965 Y158.591 I-.255 J-.318 E.04771
G1 X176.035 Y158.591 E.00218
G3 X176.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 9
; WIPE_START
M204 S8000
G1 X176.137 Y159.387 E-.18732
G1 X176 Y159.411 E-.13195
G1 X175.863 Y159.387 E-.13182
G1 X175.692 Y159.271 E-.19665
G1 X175.619 Y159.153 E-.13194
G1 X175.59 Y159.017 E-.13182
G1 X175.607 Y158.88 E-.13206
G1 X175.67 Y158.756 E-.13183
G1 X175.831 Y158.626 E-.19665
G1 X175.965 Y158.591 E-.13193
G1 X176.035 Y158.591 E-.06614
G1 X176.23 Y158.66 E-.19664
G1 X176.33 Y158.756 E-.1318
G1 X176.331 Y158.757 E-.00146
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X174.965 Y158.591 I-.255 J-.318 E.04771
G1 X175.035 Y158.591 E.00218
G3 X175.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 8
M204 S10000
G1 X174.377 Y159.152 F60000
G1 F2864.117
M204 S5000
G3 X173.965 Y158.591 I-.377 J-.155 E.05419
G1 X174.035 Y158.591 E.00218
G3 X174.396 Y159.094 I-.035 J.406 E.02208
; COOLING_NODE: 1
; WIPE_START
M204 S8000
G1 X174.258 Y159.32 E-.25088
G1 X174.137 Y159.387 E-.13191
G1 X174 Y159.411 E-.13195
G1 X173.863 Y159.387 E-.13182
G1 X173.692 Y159.271 E-.19665
G1 X173.619 Y159.153 E-.13194
G1 X173.59 Y159.017 E-.13182
G1 X173.607 Y158.88 E-.13206
G1 X173.67 Y158.756 E-.13183
G1 X173.831 Y158.626 E-.19665
G1 X173.965 Y158.591 E-.13193
G1 X174.035 Y158.591 E-.06614
G1 X174.168 Y158.638 E-.13444
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X173.745 Y160.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y159.591 I.255 J-.318 E.03045
G1 X174.035 Y159.591 E.00218
G3 X173.795 Y160.349 I-.035 J.406 E.04582
; COOLING_NODE: 3
; WIPE_START
M204 S8000
G1 X173.619 Y160.153 E-.25048
G1 X173.59 Y160.017 E-.13179
G1 X173.607 Y159.88 E-.13206
G1 X173.67 Y159.756 E-.13183
G1 X173.831 Y159.626 E-.19665
G1 X173.965 Y159.591 E-.13193
G1 X174.035 Y159.591 E-.06614
G1 X174.23 Y159.66 E-.19665
G1 X174.33 Y159.756 E-.1318
G1 X174.393 Y159.88 E-.1321
G1 X174.41 Y160.017 E-.13183
G1 X174.35 Y160.215 E-.19653
G1 X174.301 Y160.271 E-.07022
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X172.965 Y158.591 I-.255 J-.318 E.04771
G1 X173.035 Y158.591 E.00218
G3 X173.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 2
M204 S10000
G1 X173.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y159.591 I-.391 J.117 E.06287
G1 X173.035 Y159.591 E.00218
G3 X173.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 5
M204 S10000
G1 X172.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y159.591 I-.391 J.117 E.06287
G1 X172.035 Y159.591 E.00218
G3 X172.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 6
M204 S10000
G1 X171.407 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y159.591 I-.407 J-.02 E.05853
G1 X171.035 Y159.591 E.00218
G3 X171.406 Y159.957 I-.035 J.406 E.01774
; COOLING_NODE: 7
M204 S10000
G1 X171.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y158.591 I-.255 J-.318 E.04771
G1 X171.035 Y158.591 E.00218
G3 X171.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 4
; WIPE_START
M204 S8000
G1 X171.137 Y159.387 E-.18731
G1 X171 Y159.411 E-.13195
G1 X170.863 Y159.387 E-.13182
G1 X170.692 Y159.271 E-.19665
G1 X170.619 Y159.153 E-.13194
G1 X170.59 Y159.017 E-.13182
G1 X170.607 Y158.88 E-.13206
G1 X170.67 Y158.756 E-.13184
G1 X170.77 Y158.66 E-.13187
G1 X170.965 Y158.591 E-.19668
G1 X171.035 Y158.591 E-.06614
G1 X171.169 Y158.626 E-.13188
G1 X171.33 Y158.756 E-.19658
G1 X171.331 Y158.757 E-.00148
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X172.305 Y159.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X171.965 Y158.591 I-.305 J-.271 E.04987
G1 X172.035 Y158.591 E.00218
G3 X172.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 50
; WIPE_START
M204 S8000
G1 X172.137 Y159.387 E-.25079
G1 X172 Y159.411 E-.13195
G1 X171.863 Y159.387 E-.13182
G1 X171.692 Y159.271 E-.19665
G1 X171.619 Y159.153 E-.13194
G1 X171.59 Y159.017 E-.13182
G1 X171.607 Y158.88 E-.13206
G1 X171.67 Y158.756 E-.13186
G1 X171.831 Y158.626 E-.19651
G1 X171.965 Y158.591 E-.13202
G1 X172.035 Y158.591 E-.06615
G1 X172.23 Y158.66 E-.19664
G1 X172.283 Y158.711 E-.0698
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.305 Y161.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y160.591 I-.305 J-.271 E.04986
G1 X168.035 Y160.591 E.00218
G3 X168.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 49
; WIPE_START
M204 S8000
G1 X168.137 Y161.387 E-.2508
G1 X168 Y161.411 E-.13186
G1 X167.863 Y161.387 E-.13189
G1 X167.692 Y161.271 E-.19665
G1 X167.619 Y161.153 E-.13194
G1 X167.59 Y161.017 E-.13182
G1 X167.607 Y160.88 E-.13206
G1 X167.67 Y160.756 E-.13186
G1 X167.831 Y160.626 E-.19651
G1 X167.965 Y160.591 E-.13202
G1 X168.035 Y160.591 E-.06614
G1 X168.169 Y160.626 E-.13188
G1 X168.279 Y160.715 E-.13459
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.305 Y161.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y160.591 I-.305 J-.271 E.04986
G1 X167.035 Y160.591 E.00218
G3 X167.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 48
; WIPE_START
M204 S8000
G1 X167.137 Y161.387 E-.2508
G1 X167 Y161.411 E-.13186
G1 X166.863 Y161.387 E-.13189
G1 X166.692 Y161.271 E-.19665
G1 X166.619 Y161.153 E-.13194
G1 X166.59 Y161.017 E-.13182
G1 X166.607 Y160.88 E-.13206
G1 X166.67 Y160.756 E-.13186
G1 X166.831 Y160.626 E-.19651
G1 X166.965 Y160.591 E-.13202
M73 P94 R1
G1 X167.035 Y160.591 E-.06614
G1 X167.169 Y160.626 E-.13188
G1 X167.279 Y160.715 E-.13459
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X167.305 Y159.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X166.965 Y158.591 I-.305 J-.271 E.04987
G1 X167.035 Y158.591 E.00218
G3 X167.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 47
M204 S10000
G1 X167.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X166.965 Y159.591 I-.391 J.117 E.06287
G1 X167.035 Y159.591 E.00218
G3 X167.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 46
; WIPE_START
M204 S8000
G1 X167.41 Y160.017 E-.18769
G1 X167.381 Y160.153 E-.13183
G1 X167.258 Y160.32 E-.19665
G1 X167.137 Y160.387 E-.13191
G1 X167 Y160.411 E-.13195
G1 X166.863 Y160.387 E-.13182
G1 X166.742 Y160.32 E-.13197
G1 X166.619 Y160.153 E-.19665
G1 X166.59 Y160.017 E-.13179
G1 X166.607 Y159.88 E-.13206
G1 X166.67 Y159.756 E-.13186
G1 X166.831 Y159.626 E-.19651
G1 X166.899 Y159.608 E-.06731
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.391 Y159.88 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X167.965 Y159.591 I-.391 J.117 E.06287
G1 X168.035 Y159.591 E.00218
G3 X168.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 45
M204 S10000
G1 X168.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X167.965 Y158.591 I-.305 J-.271 E.04987
G1 X168.035 Y158.591 E.00218
G3 X168.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 44
M204 S10000
G1 X169.255 Y159.315 F60000
G1 F2864.117
M204 S5000
G3 X168.965 Y158.591 I-.255 J-.318 E.04771
G1 X169.035 Y158.591 E.00218
G3 X169.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 43
; WIPE_START
M204 S8000
G1 X169.137 Y159.387 E-.18732
G1 X169 Y159.411 E-.13195
G1 X168.863 Y159.387 E-.13182
G1 X168.692 Y159.271 E-.19665
G1 X168.619 Y159.153 E-.13194
G1 X168.59 Y159.017 E-.13182
G1 X168.607 Y158.88 E-.13206
G1 X168.67 Y158.756 E-.13183
G1 X168.831 Y158.626 E-.19665
G1 X168.965 Y158.591 E-.13193
G1 X169.035 Y158.591 E-.06613
G1 X169.169 Y158.626 E-.13188
G1 X169.33 Y158.756 E-.19658
G1 X169.331 Y158.757 E-.00146
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X170.305 Y159.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X169.965 Y158.591 I-.305 J-.271 E.04987
G1 X170.035 Y158.591 E.00218
G3 X170.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 42
M204 S10000
G1 X170.407 Y160.017 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y159.591 I-.407 J-.02 E.05853
G1 X170.035 Y159.591 E.00218
G3 X170.406 Y159.957 I-.035 J.406 E.01774
; COOLING_NODE: 41
; WIPE_START
M204 S8000
G1 X170.381 Y160.153 E-.18763
G1 X170.258 Y160.32 E-.19665
G1 X170.137 Y160.387 E-.13191
G1 X170 Y160.411 E-.13195
G1 X169.863 Y160.387 E-.13182
G1 X169.742 Y160.32 E-.13197
G1 X169.619 Y160.153 E-.19665
G1 X169.59 Y160.017 E-.13179
G1 X169.607 Y159.88 E-.13206
G1 X169.67 Y159.756 E-.13184
G1 X169.77 Y159.66 E-.13187
G1 X169.965 Y159.591 E-.19668
G1 X170.035 Y159.591 E-.06615
G1 X170.036 Y159.591 E-.00105
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X168.623 Y160.152 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y159.591 I.377 J-.155 E.02396
G1 X169.035 Y159.591 E.00218
G3 X168.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 40
; WIPE_START
M204 S8000
G1 X168.59 Y160.017 E-.18716
G1 X168.607 Y159.88 E-.13206
G1 X168.67 Y159.756 E-.13183
G1 X168.831 Y159.626 E-.19665
G1 X168.965 Y159.591 E-.13193
G1 X169.035 Y159.591 E-.06613
G1 X169.169 Y159.626 E-.13188
G1 X169.33 Y159.756 E-.19658
G1 X169.393 Y159.88 E-.1321
G1 X169.41 Y160.017 E-.13183
G1 X169.35 Y160.215 E-.19653
G1 X169.258 Y160.32 E-.13196
G1 X169.137 Y160.387 E-.13191
G1 X169.135 Y160.388 E-.00145
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X169.305 Y161.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X168.965 Y160.591 I-.305 J-.271 E.04987
G1 X169.035 Y160.591 E.00218
G3 X169.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 39
M204 S10000
G1 X170.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X169.965 Y160.591 I-.305 J-.271 E.04986
G1 X170.035 Y160.591 E.00218
G3 X170.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 38
M204 S10000
G1 X171.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X170.965 Y160.591 I-.305 J-.271 E.04987
G1 X171.035 Y160.591 E.00218
G3 X171.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 37
M204 S10000
G1 X172.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X171.965 Y160.591 I-.305 J-.271 E.04986
G1 X172.035 Y160.591 E.00218
G3 X172.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 36
M204 S10000
G1 X173.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X172.965 Y160.591 I-.305 J-.271 E.04987
G1 X173.035 Y160.591 E.00218
G3 X173.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 35
; WIPE_START
M204 S8000
G1 X173.137 Y161.387 E-.25083
G1 X173 Y161.411 E-.13186
G1 X172.863 Y161.387 E-.13189
G1 X172.692 Y161.271 E-.19665
G1 X172.619 Y161.153 E-.13194
G1 X172.59 Y161.017 E-.13182
G1 X172.607 Y160.88 E-.13206
G1 X172.67 Y160.756 E-.13186
G1 X172.831 Y160.626 E-.19651
G1 X172.965 Y160.591 E-.13202
G1 X173.035 Y160.591 E-.06615
G1 X173.23 Y160.66 E-.19664
G1 X173.283 Y160.71 E-.06978
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X174.377 Y161.152 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X173.965 Y160.591 I-.377 J-.155 E.05419
G1 X174.035 Y160.591 E.00218
G3 X174.396 Y161.094 I-.035 J.406 E.02207
; COOLING_NODE: 34
M204 S10000
G1 X175.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X174.965 Y160.591 I-.305 J-.271 E.04986
G1 X175.035 Y160.591 E.00218
G3 X175.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 33
M204 S10000
G1 X176.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X175.965 Y160.591 I-.305 J-.271 E.04986
G1 X176.035 Y160.591 E.00218
G3 X176.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 32
M204 S10000
G1 X177.255 Y161.315 F60000
G1 F2864.117
M204 S5000
G3 X176.965 Y160.591 I-.255 J-.318 E.0477
G1 X177.035 Y160.591 E.00218
G3 X177.299 Y161.275 I-.035 J.406 E.02857
; COOLING_NODE: 31
; WIPE_START
M204 S8000
G1 X177.137 Y161.387 E-.18731
G1 X177 Y161.411 E-.13192
G1 X176.863 Y161.387 E-.13186
G1 X176.692 Y161.271 E-.19665
G1 X176.619 Y161.153 E-.13194
G1 X176.59 Y161.017 E-.13182
G1 X176.607 Y160.88 E-.13206
G1 X176.67 Y160.756 E-.13186
G1 X176.831 Y160.626 E-.19661
G1 X176.965 Y160.591 E-.13193
G1 X177.035 Y160.591 E-.06613
G1 X177.169 Y160.626 E-.13188
G1 X177.33 Y160.756 E-.19658
G1 X177.331 Y160.757 E-.00147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.305 Y161.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y160.591 I-.305 J-.271 E.04987
G1 X178.035 Y160.591 E.00218
G3 X178.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 30
M204 S10000
G1 X179.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X178.965 Y160.591 I-.305 J-.271 E.04986
G1 X179.035 Y160.591 E.00218
G3 X179.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 29
M204 S10000
G1 X180.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X179.965 Y160.591 I-.305 J-.271 E.04986
G1 X180.035 Y160.591 E.00218
G3 X180.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 28
M204 S10000
G1 X181.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y160.591 I-.305 J-.271 E.04986
G1 X181.035 Y160.591 E.00218
G3 X181.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 27
M204 S10000
G1 X182.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y160.591 I-.305 J-.271 E.04986
G1 X182.035 Y160.591 E.00218
G3 X182.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 26
M204 S10000
G1 X183.305 Y161.268 F60000
G1 F2864.117
M204 S5000
G3 X182.965 Y160.591 I-.305 J-.271 E.04987
G1 X183.035 Y160.591 E.00218
G3 X183.341 Y161.22 I-.035 J.406 E.0264
; COOLING_NODE: 25
; WIPE_START
M204 S8000
G1 X183.137 Y161.387 E-.25082
G1 X183 Y161.411 E-.13186
G1 X182.863 Y161.387 E-.1319
G1 X182.692 Y161.271 E-.19665
G1 X182.619 Y161.153 E-.13194
G1 X182.59 Y161.017 E-.13182
G1 X182.607 Y160.88 E-.13206
G1 X182.67 Y160.756 E-.13183
G1 X182.831 Y160.626 E-.19655
G1 X182.965 Y160.591 E-.13202
G1 X183.035 Y160.591 E-.06614
G1 X183.169 Y160.626 E-.13188
G1 X183.279 Y160.715 E-.13455
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y158.591 I-.255 J-.318 E.04771
G1 X183.035 Y158.591 E.00218
G3 X183.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 24
; WIPE_START
M204 S8000
G1 X183.137 Y159.387 E-.18731
G1 X183 Y159.411 E-.13195
G1 X182.863 Y159.387 E-.13182
G1 X182.692 Y159.271 E-.19665
G1 X182.619 Y159.153 E-.13194
G1 X182.59 Y159.017 E-.13182
G1 X182.607 Y158.88 E-.13206
G1 X182.67 Y158.756 E-.13183
G1 X182.831 Y158.626 E-.19655
G1 X182.965 Y158.591 E-.13202
G1 X183.035 Y158.591 E-.06614
G1 X183.169 Y158.626 E-.13188
G1 X183.33 Y158.756 E-.19658
G1 X183.331 Y158.757 E-.00147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X182.623 Y160.152 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X182.965 Y159.591 I.377 J-.155 E.02396
G1 X183.035 Y159.591 E.00218
G3 X182.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 23
M204 S10000
G1 X182.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y159.591 I-.391 J.117 E.06287
G1 X182.035 Y159.591 E.00218
G3 X182.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 20
M204 S10000
G1 X181.391 Y159.88 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y159.591 I-.391 J.117 E.06287
G1 X181.035 Y159.591 E.00218
G3 X181.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 19
; WIPE_START
M204 S8000
G1 X181.41 Y160.017 E-.18769
G1 X181.381 Y160.153 E-.13184
G1 X181.258 Y160.32 E-.19665
G1 X181.137 Y160.387 E-.13191
G1 X181 Y160.411 E-.13195
G1 X180.863 Y160.387 E-.13182
G1 X180.742 Y160.32 E-.13197
G1 X180.619 Y160.153 E-.19665
G1 X180.59 Y160.017 E-.13179
G1 X180.607 Y159.88 E-.13206
G1 X180.67 Y159.756 E-.13186
G1 X180.831 Y159.626 E-.19651
G1 X180.899 Y159.608 E-.06731
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.255 Y160.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y159.591 I-.255 J-.318 E.04771
G1 X180.035 Y159.591 E.00218
G3 X180.299 Y160.275 I-.035 J.406 E.02857
; COOLING_NODE: 18
; WIPE_START
M204 S8000
G1 X180.137 Y160.387 E-.18731
G1 X180 Y160.411 E-.13195
G1 X179.863 Y160.387 E-.13182
G1 X179.742 Y160.32 E-.13197
G1 X179.619 Y160.153 E-.19665
G1 X179.59 Y160.017 E-.13179
G1 X179.607 Y159.88 E-.13206
G1 X179.67 Y159.756 E-.13184
G1 X179.831 Y159.626 E-.19663
G1 X179.965 Y159.591 E-.13192
G1 X180.035 Y159.591 E-.06613
G1 X180.23 Y159.66 E-.19664
G1 X180.33 Y159.756 E-.13184
G1 X180.331 Y159.757 E-.00145
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X180.305 Y159.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X179.965 Y158.591 I-.305 J-.271 E.04987
G1 X180.035 Y158.591 E.00218
G3 X180.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 21
M204 S10000
G1 X181.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X180.965 Y158.591 I-.305 J-.271 E.04987
G1 X181.035 Y158.591 E.00218
G3 X181.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 22
M204 S10000
G1 X182.305 Y159.268 F60000
G1 F2864.117
M204 S5000
G3 X181.965 Y158.591 I-.305 J-.271 E.04987
G1 X182.035 Y158.591 E.00218
G3 X182.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 16
; WIPE_START
M204 S8000
G1 X182.137 Y159.387 E-.25079
G1 X182 Y159.411 E-.13195
G1 X181.863 Y159.387 E-.13182
G1 X181.692 Y159.271 E-.19665
G1 X181.619 Y159.153 E-.13194
G1 X181.59 Y159.017 E-.13182
G1 X181.607 Y158.88 E-.13206
G1 X181.67 Y158.756 E-.13186
G1 X181.831 Y158.626 E-.19651
G1 X181.965 Y158.591 E-.13202
G1 X182.035 Y158.591 E-.06614
G1 X182.169 Y158.626 E-.13188
G1 X182.279 Y158.715 E-.13457
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X179.305 Y159.268 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y158.591 I-.305 J-.271 E.04987
G1 X179.035 Y158.591 E.00218
G3 X179.341 Y159.22 I-.035 J.406 E.0264
; COOLING_NODE: 17
; WIPE_START
M204 S8000
G1 X179.137 Y159.387 E-.25079
G1 X179 Y159.411 E-.13195
G1 X178.863 Y159.387 E-.13182
G1 X178.692 Y159.271 E-.19665
G1 X178.619 Y159.153 E-.13194
G1 X178.59 Y159.017 E-.13182
G1 X178.607 Y158.88 E-.13206
G1 X178.67 Y158.756 E-.13186
G1 X178.831 Y158.626 E-.19651
G1 X178.965 Y158.591 E-.13202
G1 X179.035 Y158.591 E-.06614
G1 X179.23 Y158.66 E-.19664
G1 X179.283 Y158.711 E-.06982
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X178.255 Y159.315 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y158.591 I-.255 J-.318 E.04771
G1 X178.035 Y158.591 E.00218
G3 X178.299 Y159.275 I-.035 J.406 E.02857
; COOLING_NODE: 14
; WIPE_START
M204 S8000
G1 X178.137 Y159.387 E-.18731
G1 X178 Y159.411 E-.13195
G1 X177.863 Y159.387 E-.13182
G1 X177.692 Y159.271 E-.19665
G1 X177.619 Y159.153 E-.13194
G1 X177.59 Y159.017 E-.13182
G1 X177.607 Y158.88 E-.13206
G1 X177.67 Y158.756 E-.13186
G1 X177.831 Y158.626 E-.19661
G1 X177.965 Y158.591 E-.13193
G1 X178.035 Y158.591 E-.06613
G1 X178.169 Y158.626 E-.13188
G1 X178.33 Y158.756 E-.19658
G1 X178.331 Y158.757 E-.00147
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.623 Y160.152 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X177.965 Y159.591 I.377 J-.155 E.02396
G1 X178.035 Y159.591 E.00218
G3 X177.649 Y160.205 I-.035 J.406 E.05231
; COOLING_NODE: 15
; WIPE_START
M204 S8000
G1 X177.59 Y160.017 E-.18715
G1 X177.607 Y159.88 E-.13206
G1 X177.67 Y159.756 E-.13186
G1 X177.831 Y159.626 E-.19661
G1 X177.965 Y159.591 E-.13193
G1 X178.035 Y159.591 E-.06613
G1 X178.169 Y159.626 E-.13188
G1 X178.33 Y159.756 E-.19658
G1 X178.393 Y159.88 E-.1321
G1 X178.41 Y160.017 E-.13183
G1 X178.35 Y160.215 E-.19653
G1 X178.258 Y160.32 E-.13196
G1 X178.137 Y160.387 E-.13191
G1 X178.135 Y160.388 E-.00148
; WIPE_END
G1 E-.09999 F600
M204 S10000
G1 X179.391 Y159.88 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G3 X178.965 Y159.591 I-.391 J.117 E.06287
G1 X179.035 Y159.591 E.00218
G3 X179.369 Y159.824 I-.035 J.406 E.0134
; COOLING_NODE: 51
; WIPE_START
M204 S8000
G1 X179.41 Y160.017 E-.18769
G1 X179.381 Y160.153 E-.13184
G1 X179.258 Y160.32 E-.19665
G1 X179.137 Y160.387 E-.13191
G1 X179 Y160.411 E-.13195
G1 X178.863 Y160.387 E-.13182
G1 X178.742 Y160.32 E-.13197
G1 X178.619 Y160.153 E-.19665
G1 X178.59 Y160.017 E-.13179
G1 X178.607 Y159.88 E-.13206
G1 X178.67 Y159.756 E-.13186
G1 X178.831 Y159.626 E-.19651
G1 X178.899 Y159.608 E-.06731
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X184.79 Y162.29 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S5000
G1 X165.21 Y162.29 E.61392
G1 X165.21 Y157.71 E.1436
G1 X184.79 Y157.71 E.61392
G1 X184.79 Y162.23 E.14172
M204 S10000
G1 X184.583 Y161.349 F60000
; FEATURE: Top surface
G1 F2864.117
M204 S2000
G1 X183.849 Y162.083 E.03253
G1 X183.316 Y162.083
G1 X184.583 Y160.816 E.05617
G1 X184.583 Y160.283
G1 X183.485 Y161.38 E.04868
G1 X183.568 Y160.764
G1 X184.583 Y159.749 E.04499
G1 X184.583 Y159.216
G1 X183.582 Y160.217 E.04436
G1 X183.551 Y159.715
G1 X184.583 Y158.683 E.04576
G1 X184.583 Y158.15
G1 X183.597 Y159.135 E.04369
G1 X183.522 Y158.676
G1 X184.282 Y157.917 E.03366
; WIPE_START
M204 S8000
G1 X183.522 Y158.676 E-1.01982
G1 X183.597 Y159.135 E-.44134
G1 X183.924 Y158.808 E-.43884
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.417 Y161.448 Z4.4 F60000
G1 Z4
G1 E2 F600
G1 F2864.117
M204 S2000
G1 X182.783 Y162.083 E.02813
G1 X182.249 Y162.083
G1 X182.762 Y161.57 E.02275
G1 X182.214 Y161.584
G1 X181.716 Y162.083 E.02209
G1 X181.183 Y162.083
G1 X181.723 Y161.543 E.02394
G1 X181.134 Y161.598
G1 X180.65 Y162.083 E.02148
G1 X180.116 Y162.083
G1 X180.683 Y161.516 E.02513
G1 X180.054 Y161.612
G1 X179.583 Y162.083 E.02087
G1 X179.05 Y162.083
G1 X179.643 Y161.489 E.02632
G1 X178.981 Y161.618
G1 X178.517 Y162.083 E.0206
G1 X177.983 Y162.083
G1 X178.604 Y161.462 E.02751
G1 X177.924 Y161.608
G1 X177.45 Y162.083 E.02104
G1 X176.917 Y162.083
G1 X177.564 Y161.435 E.0287
G1 X176.868 Y161.598
G1 X176.383 Y162.083 E.02147
G1 X175.85 Y162.083
G1 X176.529 Y161.403 E.03012
G1 X175.811 Y161.589
G1 X175.317 Y162.083 E.0219
G1 X174.784 Y162.083
G1 X175.42 Y161.446 E.02823
G1 X174.763 Y161.57
G1 X174.25 Y162.083 E.02273
G1 X173.717 Y162.083
G1 X174.216 Y161.584 E.0221
G1 X173.723 Y161.543
G1 X173.184 Y162.083 E.02392
G1 X172.651 Y162.083
G1 X173.135 Y161.598 E.02149
G1 X172.684 Y161.516
G1 X172.117 Y162.083 E.02511
G1 X171.584 Y162.083
G1 X172.055 Y161.612 E.02088
G1 X171.644 Y161.49
G1 X171.051 Y162.083 E.0263
G1 X170.518 Y162.083
G1 X170.982 Y161.618 E.0206
G1 X170.604 Y161.463
G1 X169.984 Y162.083 E.02749
G1 X169.451 Y162.083
G1 X169.925 Y161.608 E.02103
G1 X169.565 Y161.436
G1 X168.918 Y162.083 E.02868
G1 X168.385 Y162.083
G1 X168.869 Y161.599 E.02146
G1 X168.53 Y161.404
G1 X167.851 Y162.083 E.03009
G1 X167.318 Y162.083
G1 X167.812 Y161.589 E.02189
G1 X167.424 Y161.444
G1 X166.785 Y162.083 E.02834
G1 X166.252 Y162.083
G1 X166.764 Y161.57 E.02271
G1 X166.479 Y161.322
G1 X165.718 Y162.083 E.03374
G1 X165.417 Y161.85
G1 X166.4 Y160.868 E.04356
G1 X166.455 Y160.28
G1 X165.417 Y161.317 E.04599
G1 X165.417 Y160.784
G1 X166.429 Y159.772 E.04488
G1 X166.438 Y159.23
G1 X165.417 Y160.251 E.04525
G1 X165.417 Y159.717
G1 X166.632 Y158.503 E.05384
M73 P95 R1
G1 X166.575 Y158.026
G1 X165.417 Y159.184 E.05134
G1 X165.417 Y158.651
G1 X166.151 Y157.917 E.03252
; WIPE_START
M204 S8000
G1 X165.417 Y158.651 E-.98533
G1 X165.417 Y159.184 E-.5066
G1 X165.721 Y158.88 E-.40807
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.353 Y158.988 Z4.4 F60000
G1 X183.594 Y159.132 Z4.4
G1 Z4
G1 E2 F600
; FEATURE: Gap infill
; LINE_WIDTH: 0.173263
G1 F8285.854
M204 S8000
G1 X183.624 Y159.268 E.00151
G3 X183.386 Y159.545 I-3.883 J-3.098 E.00395
M204 S10000
G1 X183.644 Y160.278 F60000
; LINE_WIDTH: 0.204858
G1 F6669.218
M204 S8000
G3 X183.387 Y160.553 I-.828 J-.518 E.00509
; WIPE_START
G1 X183.513 Y160.445 E-.83292
G1 X183.644 Y160.278 E-1.06708
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X183.584 Y161.548 Z4.4 F60000
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.137578
G1 F11409.574
M204 S8000
G1 X183.478 Y161.442 E.00118
G1 X183.405 Y161.437 E.00058
; WIPE_START
G1 X183.478 Y161.442 E-.62364
G1 X183.584 Y161.548 E-1.27636
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.952 Y161.455 Z4.4 F60000
G1 X173.573 Y161.427 Z4.4
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.107305
G1 F15000
M204 S8000
G1 X173.519 Y161.425 E.00029
; LINE_WIDTH: 0.144346
G1 F10648.192
G1 X173.477 Y161.448 E.0004
; LINE_WIDTH: 0.160974
G1 F9148.41
G1 X173.373 Y161.534 E.00133
; LINE_WIDTH: 0.18629
G1 F7532.984
G1 X173.269 Y161.62 E.00161
G1 X173.244 Y161.618 E.0003
; LINE_WIDTH: 0.152517
G1 F9854.347
G1 X173.134 Y161.596 E.00102
M204 S10000
G1 X172.523 Y161.356 F60000
; LINE_WIDTH: 0.105392
G1 F15000
M204 S8000
G3 X172.464 Y161.429 I-.37 J-.241 E.00049
; LINE_WIDTH: 0.114434
G1 X172.352 Y161.521 E.00086
; LINE_WIDTH: 0.144888
G1 F10591.579
G3 X172.219 Y161.627 I-.554 J-.558 E.00144
; LINE_WIDTH: 0.176676
G1 F8074.439
G1 X172.121 Y161.678 E.00123
M204 S10000
G1 X171.326 Y161.511 F60000
; LINE_WIDTH: 0.106173
G1 F15000
M204 S8000
G3 X171.064 Y161.7 I-1.002 J-1.113 E.0017
M204 S10000
G1 X170.117 Y161.683 F60000
; LINE_WIDTH: 0.106859
G1 F15000
M204 S8000
G3 X169.949 Y161.609 I.333 J-.987 E.00098
M204 S10000
G1 X169.115 Y161.602 F60000
; LINE_WIDTH: 0.147257
G1 F10351.127
M204 S8000
G1 X169.002 Y161.656 E.00108
G1 X168.889 Y161.605 E.00107
M204 S10000
G1 X168.032 Y161.612 F60000
; LINE_WIDTH: 0.0960929
G1 F15000
M204 S8000
G3 X167.895 Y161.672 I-.399 J-.735 E.00066
; WIPE_START
G1 X168.032 Y161.612 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X166.859 Y158.357 Z4.4 F60000
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.609668
G1 F1905.612
M204 S8000
G1 X167.657 Y158.184 E.03848
; LINE_WIDTH: 0.581608
G1 F2004.874
G1 X167.76 Y158.167 E.00468
; LINE_WIDTH: 0.540446
G1 F2170.744
G3 X168.196 Y158.161 I.243 J1.901 E.01809
; LINE_WIDTH: 0.574649
G1 F2031.11
G3 X168.343 Y158.184 I-.203 J1.752 E.00657
; LINE_WIDTH: 0.609584
G1 F1905.894
G1 X168.391 Y158.195 E.00232
; WIPE_START
G1 X168.343 Y158.184 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.971 Y158.428 Z4.4 F60000
G1 X180.428 Y158.571 Z4.4
G1 Z4
G1 E2 F600
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2864.117
M204 S2000
G1 X181.082 Y157.917 E.02899
G1 X180.549 Y157.917
G1 X180.074 Y158.392 E.02104
G1 X179.397 Y158.536
G1 X180.015 Y157.917 E.02742
G1 X179.482 Y157.917
G1 X179.013 Y158.387 E.02081
G1 X178.361 Y158.505
G1 X178.949 Y157.917 E.02606
G1 X178.416 Y157.917
G1 X177.954 Y158.379 E.02049
G1 X177.321 Y158.478
G1 X177.882 Y157.917 E.02487
G1 X177.349 Y157.917
G1 X176.864 Y158.403 E.02153
G1 X176.279 Y158.454
G1 X176.816 Y157.917 E.02381
G1 X176.283 Y157.917
G1 X175.774 Y158.426 E.02256
G1 X175.233 Y158.434
G1 X175.749 Y157.917 E.02289
G1 X175.216 Y157.917
G1 X174.538 Y158.596 E.03008
G1 X174.187 Y158.413
G1 X174.683 Y157.917 E.02197
G1 X174.15 Y157.917
G1 X173.46 Y158.607 E.03058
G1 X173.137 Y158.397
G1 X173.616 Y157.917 E.02128
G1 X173.083 Y157.917
G1 X172.429 Y158.572 E.02901
G1 X172.075 Y158.392
G1 X172.55 Y157.917 E.02104
G1 X172.017 Y157.917
G1 X171.402 Y158.532 E.02727
G1 X171.012 Y158.388
G1 X171.483 Y157.917 E.02089
G1 X170.95 Y157.917
G1 X170.367 Y158.501 E.02588
G1 X169.953 Y158.382
G1 X170.417 Y157.917 E.02058
G1 X169.884 Y157.917
G1 X169.322 Y158.479 E.02489
G1 X168.865 Y158.402
G1 X169.35 Y157.917 E.02151
; WIPE_START
M204 S8000
G1 X168.865 Y158.402 E-.65171
G1 X169.322 Y158.479 E-.44008
G1 X169.884 Y157.917 E-.75428
G1 X169.94 Y157.917 E-.05393
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X177.563 Y158.304 Z4.4 F60000
G1 X181.323 Y158.495 Z4.4
G1 Z4
G1 E2 F600
; FEATURE: Gap infill
; LINE_WIDTH: 0.234316
G1 F5642.773
M204 S8000
G1 X181.28 Y157.988 E.00809
G1 X181.064 Y157.899 E.00372
; WIPE_START
G1 X181.28 Y157.988 E-.59878
G1 X181.323 Y158.495 E-1.30122
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X175.186 Y158.413 Z4.4 F60000
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.0922875
G1 F15000
M204 S8000
G2 X175.062 Y158.339 I-.479 J.665 E.00059
; WIPE_START
G1 X175.186 Y158.413 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X173.056 Y158.317 Z4.4 F60000
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.105368
G1 F15000
M204 S8000
G2 X172.894 Y158.397 I.377 J.968 E.00094
M204 S10000
G1 X172.081 Y158.398 F60000
; LINE_WIDTH: 0.156791
G1 F9484.429
M204 S8000
G1 X171.942 Y158.342 E.00142
G1 X171.801 Y158.416 E.00151
M204 S10000
G1 X170.989 Y158.388 F60000
; LINE_WIDTH: 0.10362
G1 F15000
M204 S8000
G2 X170.815 Y158.32 I-.338 J.609 E.00095
M204 S10000
G1 X169.867 Y158.296 F60000
; LINE_WIDTH: 0.111131
G1 F15000
M204 S8000
G2 X169.472 Y158.64 I1.402 J2.007 E.00298
; WIPE_START
G1 X169.645 Y158.471 E-.87742
G1 X169.867 Y158.296 E-1.02258
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X168.697 Y157.899 Z4.4 F60000
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.234164
G1 F5647.247
M204 S8000
G1 X168.658 Y158.343 E.00709
; LINE_WIDTH: 0.264948
G1 F4864.256
G1 X168.675 Y158.368 E.00056
; LINE_WIDTH: 0.248587
G1 F5251.225
G1 X168.767 Y158.382 E.00159
; LINE_WIDTH: 0.219335
G1 F6121.938
G1 X168.859 Y158.396 E.00136
; WIPE_START
G1 X168.767 Y158.382 E-1.9
; WIPE_END
G1 E-.1 F600
M204 S10000
G1 X176.398 Y158.271 Z4.4 F60000
G1 X181.609 Y158.195 Z4.4
G1 Z4
G1 E2 F600
; LINE_WIDTH: 0.609668
G1 F1905.612
M204 S8000
G1 X181.657 Y158.184 E.00232
; LINE_WIDTH: 0.581608
G1 F2004.874
G1 X181.76 Y158.167 E.00468
; LINE_WIDTH: 0.540446
G1 F2170.744
G3 X182.196 Y158.161 I.243 J1.901 E.01809
; LINE_WIDTH: 0.574649
G1 F2031.11
G3 X182.343 Y158.184 I-.203 J1.752 E.00657
; LINE_WIDTH: 0.609584
G1 F1905.894
G1 X183.141 Y158.357 E.03849
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1905.894
G1 X182.343 Y158.184 E-1.9
; WIPE_END
G1 E-.1 F600
; stop printing object, unique label id: 224
M625
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 21/25
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

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
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
G1 X167.678 Y266.194
G1 Z4.2
G1 E2 F600
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF3
M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X199.178 Y266.194  E2.5068 F282
G1  Y267.444  E0.0995
G1  X167.678  E2.5068
G1  Y268.694  E0.0995
M104 T1 S220 N0 ;Multi extruder pre heating
G1  X199.178  E2.5068
G1  Y269.944  E0.0995
G1  X167.678  E2.5068
M204 S10000
G1  Y270.569 
M73 P96 R1
G1  X198.678  F366
G1  Y269.319 
G1  X168.178 
G1  Y268.069 
G1  X198.678 
G1  Y266.819 
M73 P97 R1
G1  X168.178 
; NOZZLE_CHANGE_END OF0 NF3
M104 T0 S0 N0 ;Multi extruder pre cooling

G1 E-2 F600
G17
M73 P97 R0
G3 Z4.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20251031 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S3A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z7.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F89.8017 L0 H0.4 T250 P230 S1



M620.10 A1 F623.623 L0 H0.4 T240 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R0 F200


M628 S1

M620.11 S0 L0 I0 E-10 F200

M629


M620.11 H2 C331


T3
M73 E0

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F89


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

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X205.318

G1 Y295
G1 Y265 F18000
G1 Z7.2 F3000

M204 S8000


M621 S3A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I3 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S170.85
M106 P2 S191
G1 X204.318 Y264.712 F60000
G1 Z4.2
G17
G3 Z4.6 I1.217 J0 P1
G1 X204.318 Y247.518 Z4.6
G1 X162.538 Y247.518
G1 X162.538 Y252.694

; filament start gcode
G1 X167.428 Y252.694
G1 Z4.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.428 Y252.694  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.928  F600
G1  X167.428  F240
G1  X167.928  F600
G1  Y253.194 
G1  X166.928 
G1  Y252.194 
G1  X168.428 
G1  Y253.694 
G1  X166.428 
G1  Y251.694 
G1  X170.428 Y252.694   F1782
M73 P98 R0
G1 E0.4000 F1800
M204 S8000
G1  X199.428  E1.1022 F1782
G1  Y253.444  E0.0285
G1  X167.428  E1.2162 F2025
G1  Y254.194  E0.0285
G1  X199.428  E1.2162 F2473
G1  Y254.944  E0.0285
G1  X167.428  E1.2162 F4725
G1  Y255.694  E0.0285
G1  X199.428  E1.2162 F4775
G1  Y256.444  E0.0285
G1  X167.428  E1.2162
G1  Y257.194  E0.0285
G1  X199.428  E1.2162
G1  Y257.944  E0.0285
G1  X167.428  E1.2162
G1  Y258.694  E0.0285
G1  X199.428  E1.2162
G1  Y259.444  E0.0285
G1  X167.428  E1.2162
G1  Y260.194  E0.0285
G1  X199.428  E1.2162
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y265.444   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X167.428  E1.2162
G1  Y260.944  E0.1710
G1  X199.428  E1.2162
G1  Y265.444  E0.1710
M204 S10000
G1  X168.428 Y260.944  
;--------------------
; CP EMPTY GRID START
; layer #22
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X175.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X183.428 
M204 S8000
G1  Y265.444  E0.1710
M204 S10000
G1  X190.928 
M204 S8000
G1  Y260.944  E0.1710
M204 S10000
G1  X198.428 
M204 S8000
G1  Y265.444  E0.1710
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X199.428 Y279.944
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X199.928 Y280.444  
M204 S8000
G3  X197.573 Y282.608   I-4.508 J-2.542 E0.1236
G3  X194.841 Y281.395   I-0.213 J-3.202 E0.1182
G2  X191.777 Y280.444   I-3.069 J4.479 E0.1238
G2  X174.887 Y280.447   I-8.349 J477.152 E0.6420
G2  X170.515 Y282.510   I1.087 J7.970 E0.1866
G3  X168.229 Y281.963   I-0.760 J-1.879 E0.0953
G1  X166.928 Y280.444   E0.0760
G3  X165.076 Y278.089   I4.993 J-5.834 E0.1146
G3  X166.212 Y275.683   I2.550 J-0.267 E0.1063
G2  X166.928 Y273.548   I-2.841 J-2.141 E0.0871
G2  X166.925 Y258.937   I-338.192 J-7.229 E0.5553
G2  X165.172 Y255.793   I-5.162 J0.817 E0.1397
G3  X165.687 Y253.644   I1.601 J-0.753 E0.0907
G1 E-0.4000 F1800
M204 S10000
G1  X167.313 Y251.744   F600
G1 E0.4000 F1800
M204 S8000
G3  X170.217 Y250.031   I2.745 J1.335 E0.1358 F5400
G3  X172.675 Y251.631   I-12.425 J21.780 E0.1115
G2  X175.079 Y252.194   I2.411 J-4.880 E0.0946
G2  X191.969 Y252.191   I8.349 J-477.127 E0.6420
G2  X196.341 Y250.128   I-1.087 J-7.970 E0.1866
G3  X198.627 Y250.675   I0.760 J1.879 E0.0953
G1  X199.928 Y252.194   E0.0760
G1 E0.0000
G3  X201.780 Y254.549   I-4.993 J5.834 E0.1146
G3  X200.644 Y256.954   I-2.550 J0.267 E0.1063
G2  X199.928 Y259.090   I2.841 J2.141 E0.0871
G2  X199.931 Y273.701   I338.209 J7.229 E0.5554
G2  X201.684 Y276.845   I5.162 J-0.817 E0.1397
G3  X201.469 Y278.644   I-1.461 J0.738 E0.0730
G1  X199.928 Y280.444   E0.0901
; WIPE_TOWER_END

; WIPE_START
G1 F1905.894
M204 S8000
G1 X199.928 Y280.444 E0
G1 X199.928 Y280.444 E0
G1 X200.578 Y279.685 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F60000
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
M204 S10000
G1 X201.898 Y161.898
G1 Z4.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1495
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z4.6
G1 Z4.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F15000
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F15000
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F15000
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F15000
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 21 start: 265
M624 AgAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z4.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer21 end: 265
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 22/25
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

M106 S204
; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z4.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.8 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z4.8
G1 Z4.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F1200
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F1200
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F1200
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 F15000
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 22 start: 265
M624 AgAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z4.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer22 end: 265
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 23/25
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z4.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z5
G1 Z4.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F1200
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F1200
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F1200
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 F15000
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 23 start: 265
M624 AgAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z5 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer23 end: 265
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 24/25
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X201.898 Y161.898 F60000
G1 Z4.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S8000
G1 X198.102 Y161.898 E.12592
G1 X198.102 Y158.102 E.12592
M73 P99 R0
G1 X201.898 Y158.102 E.12592
G1 X201.898 Y161.838 E.12393
; COOLING_NODE: 0
M204 S10000
G1 X202.29 Y162.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.2 I1.064 J-.59 P1  F60000
G1 X200.023 Y159.96 Z5.2
G1 Z4.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S8000
G1 X199.953 Y160 E.00244
G1 X200.012 Y160.034 E.00204
M204 S10000
G1 X200.375 Y160 F60000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S8000
G1 X200.375 Y159.625 E.01151
G1 X199.625 Y159.625 E.02302
G1 X199.625 Y160.375 E.02302
G1 X200.375 Y160.375 E.02302
G1 X200.375 Y160.06 E.00967
M204 S10000
G1 X200.752 Y160 F60000
G1 F1200
M204 S8000
G1 X200.752 Y159.248 E.0231
G1 X199.248 Y159.248 E.0462
G1 X199.248 Y160.752 E.0462
G1 X200.752 Y160.752 E.0462
G1 X200.752 Y160.06 E.02125
M204 S10000
G1 X201.129 Y160 F60000
G1 F1200
M204 S8000
G1 X201.129 Y158.871 E.03468
G1 X198.871 Y158.871 E.06937
G1 X198.871 Y161.129 E.06937
G1 X201.129 Y161.129 E.06937
G1 X201.129 Y160.06 E.03284
M204 S10000
G1 X201.506 Y160 F60000
G1 F1200
M204 S8000
G1 X201.506 Y158.494 E.04627
G1 X198.494 Y158.494 E.09254
G1 X198.494 Y161.506 E.09254
G1 X201.506 Y161.506 E.09254
G1 X201.506 Y160.06 E.04443
; WIPE_START
G1 F15000
G1 X201.506 Y161.06 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 24 start: 265
M624 AgAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z5.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer24 end: 265
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 25/25
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 265
; COOLING_NODE: 0
; start printing object, unique label id: 265
M624 AgAAAAAAAAA=
G1 X202.29 Y162.29 F60000
G1 Z5
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X197.71 Y162.29 E.14073
G1 X197.71 Y157.71 E.14073
G1 X202.29 Y157.71 E.14073
G1 X202.29 Y162.23 E.13889
; WIPE_START
G1 F12000
M204 S8000
G1 X201.29 Y162.243 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J.026 P1  F60000
G1 X201.383 Y157.917 Z5.4
G1 Z5
G1 E.4 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X202.083 Y158.617 E.03038
G1 X202.083 Y159.15
G1 X200.85 Y157.917 E.05355
G1 X200.317 Y157.917
G1 X202.083 Y159.683 E.07673
G1 X202.083 Y160.216
G1 X199.784 Y157.917 E.0999
G1 X199.25 Y157.917
G1 X202.083 Y160.75 E.12307
G1 X202.083 Y161.283
G1 X198.717 Y157.917 E.14624
G1 X198.184 Y157.917
G1 X202.083 Y161.816 E.16942
G1 X201.816 Y162.083
G1 X197.917 Y158.184 E.16941
G1 X197.917 Y158.717
G1 X201.283 Y162.083 E.14624
G1 X200.749 Y162.083
G1 X197.917 Y159.251 E.12307
G1 X197.917 Y159.784
G1 X200.216 Y162.083 E.09989
G1 X199.683 Y162.083
G1 X197.917 Y160.317 E.07672
G1 X197.917 Y160.85
G1 X199.15 Y162.083 E.05355
G1 X198.616 Y162.083
G1 X197.917 Y161.384 E.03038
; WIPE_START
G1 F12000
M204 S8000
G1 X198.616 Y162.083 E-.37565
G1 X198.628 Y162.083 E-.00435
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 265
M625
; object ids of layer 25 start: 265
M624 AgAAAAAAAAA=
;======== H2D 20250818========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X270 Y160 Z5.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer25 end: 265
M625
; close powerlost recovery
M1003 S0
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
;===== date: 2025/05/16 =====================
;===== H2D =====================
G392 S0 ;turn off nozzle clog detect
M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z5.5 F900 ; lower z a little

G90
M141 S0 ; turn off chamber heating
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

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

M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S5 ;wait for last picture to be taken
M623  ;end of "timelapse_record_flag"

M104 S0 T0; turn off hotend
M104 S0 T1; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z105 F600
    G1 Z103

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M1015.4 S0 K0 ;disable air printing detect
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

