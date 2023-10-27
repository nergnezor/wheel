GDPC                �                                                                         T   res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn p      a      ����hiu�n� �՜�    ,   res://.godot/global_script_class_cache.cfg  �.             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �2      4      t�ֶ��Lj���WQB       res://camera.gd         �      Xoj�)I�����R�sd       res://icon.svg  �.      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       �:E���JnR�Z�       res://node_3d.tscn.remapP.      d       �k�	���c{oo�       res://player.gd �'      X      �����z.�q��Y�       res://project.binary�3      �      ���6����M���       res://wireframe.gdshader@+            ,']�>�ؐ�Z'�N��    `uX��O�+extends Camera3D

const SPEED = 20.0

@onready var player = get_node("../player")

var initial_transform = null
# Called when the node enters the scene tree for the first time.
func _ready():
	# Store the initial camera transform for later use.
	initial_transform = transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Follow player
	# var player = get_node("/root/player")
	if player == null:
		return
	if initial_transform == null:
		return
	# Set the camera offset from the initial offset.
	var target = player.global_transform.origin + initial_transform.origin
	var camera_pos = transform.origin
	var camera_to_target = target - camera_pos
	var camera_to_target_normal = camera_to_target.normalized()
	var distance_to_target = camera_to_target.length()
	var distance_to_move = SPEED * delta
	if distance_to_move > distance_to_target:
		distance_to_move = distance_to_target
	var new_camera_pos = camera_pos + camera_to_target_normal * distance_to_move
	transform.origin = new_camera_pos

�-��!F�*���/�GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[ �e������!���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://1mj65d3byn37"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                            �      ..    resource_local_to_scene    resource_name    custom_solver_bias    margin    size    script    diffuse_texture    normal_texture    specular_texture    specular_color    specular_shininess    texture_filter    texture_repeat    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    subdivide_width    subdivide_height    subdivide_depth    radius    shader    shader_parameter/albedo    shader_parameter/wire_color    shader_parameter/wire_width !   shader_parameter/wire_smoothness    height    radial_segments    rings    is_hemisphere 	   _bundled       Script    res://player.gd ��������   Shader    res://wireframe.gdshader ��������   Script    res://camera.gd ��������      local://BoxShape3D_mevju          local://CanvasTexture_6mye8 �      !   local://StandardMaterial3D_rud7g �         local://BoxMesh_aq5wg #         local://SphereShape3D_o6jnk k         local://ShaderMaterial_kragc �         local://SphereMesh_54p21           local://PackedScene_8521w o         BoxShape3D            pB  �?  �B         CanvasTexture             StandardMaterial3D                   ��C?��M?  �?���>                     BoxMesh    w                    pB  �?  �B|                  SphereShape3D             ShaderMaterial                        �            �        �?���>���>    �      ��j?��j?��j?  �?�   )   /�$���?�   )   {�G�z�?         SphereMesh    w                    �?�         �                  PackedScene    �      	         names "         world    Node3D    mark 
   transform    StaticBody3D    CollisionShape3D    shape    MeshInstance3D    mesh 	   skeleton    StaticBody3D2    light    shadow_enabled    DirectionalLight3D    player    mass    inertia    script    RigidBody3D    camera    keep_aspect    current    fov    near 	   Camera3D    	   variants            �?            m�&?�PB?    �PB�m�&?    �l��:#E�                                      �?            Ե~�1A�=    1AͽԵ~�    KH��2U;�     �?6Ϛ5e	/���/6!&<���?cǖ5���!&<�����4�A�5=�           zD   ��"D��B��B                      ���s}?    �s}���              �?                        ��?'��`�<,��h@?Q�Z?Q~w��Z�2?    ��vA�z A            fB   1,=               node_count             nodes     �   ��������       ����                      ����                           ����                          ����         	                     
   ����                          ����                          ����         	                        ����                                 ����                  	                    ����      
       	             ����                                 ����                                                 conn_count              conns               node_paths              editable_instances              version             RSRC����~a� �${FILextends RigidBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# var linear_velocity = Vector3()
var start_position = Vector3()
func _ready():
	start_position = transform.origin
	linear_velocity = Vector3()

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	
	# Reset to start position if too slow
	# if is_on_floor() and linear_velocity.length() < 10:
	# 	linear_velocity = Vector3()
	# 	transform.origin = start_position
	# 	velocity = Vector3()
	# else:
	# 	pass

	# Reset button
	if Input.is_action_just_pressed("ui_focus_next"):
		print("Reset")
		# linear_velocity = Vector3()
		transform.origin = start_position
		# velocity = Vector3()
	
	
h���MQ@shader_type spatial;

uniform vec4 albedo : source_color = vec4(1.0);
uniform vec4 wire_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float wire_width : hint_range(0.0, 40.0) = 5.0;
uniform float wire_smoothness : hint_range(0.0, 0.1) = 0.01;

varying vec3 barys;

void vertex() {
	int index = VERTEX_ID % 3;
	switch (index) {
		case 0:
			barys = vec3(1.0, 0.0, 0.0);
			break;
		case 1:
			barys = vec3(0.0, 1.0, 0.0);
			break;
		case 2:
			barys = vec3(0.0, 0.0, 1.0);
			break;
	}
}

void fragment() {
	vec3 deltas = fwidth(barys);
	vec3 barys_s = smoothstep(deltas * wire_width - wire_smoothness, deltas * wire_width + wire_smoothness, barys);
	float wires = min(barys_s.x, min(barys_s.y, barys_s.z));
	ALBEDO = mix(wire_color.rgb, albedo.rgb, wires);
}-�?�DM�LŲ�[remap]

path="res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn"
�N��\3��U96alist=Array[Dictionary]([])
#�9?J<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
�xBw��e�D   �%0��   res://icon.svg\��خ�B   res://node_3d.tscn�*�P݌�   res://target/wheel.icon.png3 z�o�'   res://target/wheel.apple-touch-icon.pngg�	+$�   res://target/wheel.png��-NY�/:   res://target/index.icon.png������'   res://target/index.apple-touch-icon.png���!�Sd   res://target/index.pngפ�F����f�ECFG      application/config/name         wheel      application/run/main_scene         res://node_3d.tscn     application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg  "   display/window/size/viewport_width         #   display/window/size/viewport_height      p     display/window/size/borderless         *   rendering/renderer/rendering_method.mobile         gl_compatibility��k�7H#Y�c�