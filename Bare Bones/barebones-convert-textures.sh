echo "Resource Pack to Crafti terrain.png Converter"
echo
echo

let read block_resolution=16

echo "Block Resolution: "${block_resolution}

let block_half_resolution=block_resolution/2 block_quarter_resolution=block_resolution/4 block_double_resolution=block_resolution*2 block_quad_resolution=block_resolution*4 doublequad_block_resolution=block_double_resolution+block_resolution

echo "Block Half Resolution: "${block_half_resolution}
echo "Block Quarter Resolution: "${block_quarter_resolution}
echo "Block Double Resolution: "${block_double_resolution}
echo "Block DoubleQuad Resolution: "${doublequad_block_resolution}
echo "Block Quad Resolution: "${block_quad_resolution}

rm -rf ./temp/
mkdir temp

# Redstone Wire Fix
convert -rotate 90 ./assets/minecraft/textures/block/redstone_dust_line0.png ./temp/redstone_dust_line0-90.png
convert -composite ./assets/minecraft/textures/block/redstone_dust_line0.png ./temp/redstone_dust_line0-90.png ./temp/redstone_dust_lines.png
convert -composite ./temp/redstone_dust_lines.png ./assets/minecraft/textures/block/redstone_dust_dot.png ./temp/redstone_dust_lines.png

# Redstone overlay fix
convert -resize ${block_resolution}x${block_resolution} ./assets/minecraft/textures/block/redstone_dust_overlay.png ./temp/redstone_dust_overlay.png

# Water Fix
convert -crop ${block_resolution}x${block_resolution}+0+0 ./assets/minecraft/textures/block/water_flow.png ./temp/water-flow-0.png
convert -crop ${block_resolution}x${block_resolution}+0+${block_resolution} ./assets/minecraft/textures/block/water_flow.png ./temp/water-flow-1.png
convert -crop ${block_resolution}x${block_resolution}+0+${double_block_resolution} ./assets/minecraft/textures/block/water_flow.png ./temp/water-flow-2.png
convert -crop ${block_resolution}x${block_resolution}+0+${doublequad_block_resolution} ./assets/minecraft/textures/block/water_flow.png ./temp/water-flow-3.png
convert -crop ${block_resolution}x${block_resolution}+0+${quad_block_resolution} ./assets/minecraft/textures/block/water_flow.png ./temp/water-flow-4.png
convert -composite ./temp/water-flow-1.png ./assets/minecraft/textures/block/water_overlay.png ./temp/water-flow-1.png
convert -composite ./temp/water-flow-0.png ./assets/minecraft/textures/block/water_overlay.png ./temp/water-flow-0.png
convert -composite ./temp/water-flow-2.png ./assets/minecraft/textures/block/water_overlay.png ./temp/water-flow-2.png
convert -composite ./temp/water-flow-3.png ./assets/minecraft/textures/block/water_overlay.png ./temp/water-flow-3.png
convert -composite ./temp/water-flow-4.png ./assets/minecraft/textures/block/water_overlay.png ./temp/water-flow-4.png

# Lava Fix
convert -crop ${block_resolution}x${block_resolution}+0+0 ./assets/minecraft/textures/block/lava_flow.png ./temp/lava-flow-0.png
convert -crop ${block_resolution}x${block_resolution}+0+${block_resolution} ./assets/minecraft/textures/block/lava_flow.png ./temp/lava-flow-1.png
convert -crop ${block_resolution}x${block_resolution}+0+${double_block_resolution} ./assets/minecraft/textures/block/lava_flow.png ./temp/lava-flow-2.png
convert -crop ${block_resolution}x${block_resolution}+0+${doublequad_block_resolution} ./assets/minecraft/textures/block/lava_flow.png ./temp/lava-flow-3.png
convert -crop ${block_resolution}x${block_resolution}+0+${quad_block_resolution} ./assets/minecraft/textures/block/lava_flow.png ./temp/lava-flow-4.png

# Selection Generator
convert -crop 14x22+10+5 ./assets/minecraft/textures/gui/world_selection.png ./selection.png
convert -gravity East -resize 15x15 -repage 15x15 -extent 15x15 -background none ./selection.png ./selection.png
convert ./selection.png ./selection.kra


montage +repage -crop ${block_resolution}x${block_resolution}+0+0 -geometry +0+0 -background none -tile 16x16 \
./assets/minecraft/textures/block/grass_block_top.png ./assets/minecraft/textures/block/stone.png ./assets/minecraft/textures/block/dirt.png ./assets/minecraft/textures/block/grass_block_side.png ./assets/minecraft/textures/block/oak_planks.png ./assets/minecraft/textures/block/smooth_stone_slab_side.png ./assets/minecraft/textures/block/smooth_stone.png ./assets/minecraft/textures/block/bricks.png ./assets/minecraft/textures/block/tnt_side.png ./assets/minecraft/textures/block/tnt_top.png ./assets/minecraft/textures/block/tnt_bottom.png ./assets/minecraft/textures/block/cobweb.png ./assets/minecraft/textures/block/poppy.png ./assets/minecraft/textures/block/dandelion.png ./assets/minecraft/textures/block/nether_portal.png ./assets/minecraft/textures/block/oak_sapling.png \
./assets/minecraft/textures/block/cobblestone.png ./assets/minecraft/textures/block/bedrock.png ./assets/minecraft/textures/block/sand.png ./assets/minecraft/textures/block/gravel.png ./assets/minecraft/textures/block/oak_log.png ./assets/minecraft/textures/block/oak_log_top.png ./assets/minecraft/textures/block/iron_block.png ./assets/minecraft/textures/block/gold_block.png ./assets/minecraft/textures/block/diamond_block.png ./assets/minecraft/textures/block/emerald_block.png ./assets/minecraft/textures/block/redstone_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/red_mushroom.png ./assets/minecraft/textures/block/brown_mushroom.png ./assets/minecraft/textures/block/jungle_sapling.png ./assets/minecraft/textures/block/fire_0.png \
./assets/minecraft/textures/block/gold_ore.png ./assets/minecraft/textures/block/iron_ore.png ./assets/minecraft/textures/block/coal_ore.png ./assets/minecraft/textures/block/bookshelf.png ./assets/minecraft/textures/block/mossy_cobblestone.png ./assets/minecraft/textures/block/obsidian.png ./assets/minecraft/textures/block/grass_block_side_overlay.png ./assets/minecraft/textures/block/grass.png ./assets/minecraft/textures/block/grass_block_top.png ./assets/minecraft/textures/block/beacon.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/crafting_table_top.png ./assets/minecraft/textures/block/furnace_front.png ./assets/minecraft/textures/block/furnace_side.png ./assets/minecraft/textures/block/dispenser_front.png ./assets/minecraft/textures/block/fire_1.png \
./assets/minecraft/textures/block/sponge.png ./assets/minecraft/textures/block/glass.png ./assets/minecraft/textures/block/diamond_ore.png ./assets/minecraft/textures/block/redstone_ore.png ./assets/minecraft/textures/block/oak_leaves.png ./assets/minecraft/textures/block/oak_leaves.png ./assets/minecraft/textures/block/stone_bricks.png ./assets/minecraft/textures/block/dead_bush.png ./assets/minecraft/textures/block/fern.png ./assets/minecraft/textures/block/daylight_detector_top.png ./assets/minecraft/textures/block/daylight_detector_side.png ./assets/minecraft/textures/block/crafting_table_side.png ./assets/minecraft/textures/block/crafting_table_side.png ./assets/minecraft/textures/block/furnace_front_on.png ./assets/minecraft/textures/block/furnace_top.png ./assets/minecraft/textures/block/spruce_sapling.png \
./assets/minecraft/textures/block/white_wool.png ./assets/minecraft/textures/block/spawner.png ./assets/minecraft/textures/block/snow.png ./assets/minecraft/textures/block/ice.png ./assets/minecraft/textures/block/grass_block_snow.png ./assets/minecraft/textures/block/cactus_top.png ./assets/minecraft/textures/block/cactus_side.png ./assets/minecraft/textures/block/cactus_bottom.png ./assets/minecraft/textures/block/clay.png ./assets/minecraft/textures/block/sugar_cane.png ./assets/minecraft/textures/block/note_block.png ./assets/minecraft/textures/block/jukebox_top.png ./assets/minecraft/textures/block/lily_pad.png ./assets/minecraft/textures/block/mycelium_side.png ./assets/minecraft/textures/block/mycelium_top.png ./assets/minecraft/textures/block/birch_sapling.png \
./assets/minecraft/textures/block/torch.png ./assets/minecraft/textures/block/oak_door_top.png ./assets/minecraft/textures/block/iron_door_top.png ./assets/minecraft/textures/block/ladder.png ./assets/minecraft/textures/block/oak_trapdoor.png ./assets/minecraft/textures/block/iron_bars.png ./assets/minecraft/textures/block/farmland_moist.png ./assets/minecraft/textures/block/farmland.png ./assets/minecraft/textures/block/wheat_stage0.png ./assets/minecraft/textures/block/wheat_stage1.png ./assets/minecraft/textures/block/wheat_stage2.png ./assets/minecraft/textures/block/wheat_stage3.png ./assets/minecraft/textures/block/wheat_stage4.png ./assets/minecraft/textures/block/wheat_stage5.png ./assets/minecraft/textures/block/wheat_stage6.png ./assets/minecraft/textures/block/wheat_stage7.png \
./assets/minecraft/textures/block/lever.png ./assets/minecraft/textures/block/oak_door_bottom.png ./assets/minecraft/textures/block/iron_door_bottom.png ./assets/minecraft/textures/block/redstone_torch.png ./assets/minecraft/textures/block/mossy_stone_bricks.png ./assets/minecraft/textures/block/cracked_stone_bricks.png ./assets/minecraft/textures/block/pumpkin_top.png ./assets/minecraft/textures/block/netherrack.png ./assets/minecraft/textures/block/soul_sand.png ./assets/minecraft/textures/block/glowstone.png ./assets/minecraft/textures/block/piston_top_sticky.png ./assets/minecraft/textures/block/piston_top.png ./assets/minecraft/textures/block/piston_side.png ./assets/minecraft/textures/block/piston_bottom.png ./assets/minecraft/textures/block/piston_inner.png ./assets/minecraft/textures/block/melon_stem_disconnected.png \
./assets/minecraft/textures/block/rail_corner.png ./assets/minecraft/textures/block/black_wool.png ./assets/minecraft/textures/block/gray_wool.png ./assets/minecraft/textures/block/redstone_torch_off.png ./assets/minecraft/textures/block/dark_oak_log.png ./assets/minecraft/textures/block/birch_log.png ./assets/minecraft/textures/block/pumpkin_side.png ./assets/minecraft/textures/block/carved_pumpkin.png ./assets/minecraft/textures/block/carved_pumpkin.png ./assets/minecraft/textures/block/cake_top.png ./assets/minecraft/textures/block/cake_side.png ./assets/minecraft/textures/block/cake_inner.png ./assets/minecraft/textures/block/cake_bottom.png ./assets/minecraft/textures/block/red_mushroom_block.png ./assets/minecraft/textures/block/brown_mushroom_block.png ./assets/minecraft/textures/block/attached_melon_stem.png \
./assets/minecraft/textures/block/rail.png ./assets/minecraft/textures/block/red_wool.png ./assets/minecraft/textures/block/pink_wool.png ./assets/minecraft/textures/block/repeater.png ./assets/minecraft/textures/block/dark_oak_leaves.png ./assets/minecraft/textures/block/dark_oak_leaves.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/melon_side.png ./assets/minecraft/textures/block/melon_top.png ./assets/minecraft/textures/block/cauldron_top.png ./assets/minecraft/textures/block/cauldron_inner.png ./assets/minecraft/textures/item/cake.png ./assets/minecraft/textures/block/mushroom_stem.png ./assets/minecraft/textures/block/mushroom_block_inside.png ./assets/minecraft/textures/block/vine.png \
./assets/minecraft/textures/block/lapis_block.png ./assets/minecraft/textures/block/green_wool.png ./assets/minecraft/textures/block/lime_wool.png ./assets/minecraft/textures/block/repeater_on.png ./assets/minecraft/textures/block/glass_pane_top.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/jungle_log.png ./assets/minecraft/textures/block/cauldron_side.png ./assets/minecraft/textures/block/cauldron_bottom.png ./assets/minecraft/textures/block/brewing_stand_base.png ./assets/minecraft/textures/block/brewing_stand.png ./assets/minecraft/textures/block/end_portal_frame_top.png ./assets/minecraft/textures/block/end_portal_frame_side.png \
./assets/minecraft/textures/block/lapis_ore.png ./assets/minecraft/textures/block/brown_wool.png ./assets/minecraft/textures/block/yellow_wool.png ./assets/minecraft/textures/block/powered_rail.png ./temp/redstone_dust_lines.png ./assets/minecraft/textures/block/redstone_dust_line1.png ./assets/minecraft/textures/block/enchanting_table_top.png ./assets/minecraft/textures/block/dragon_egg.png ./assets/minecraft/textures/block/cocoa_stage2.png ./assets/minecraft/textures/block/cocoa_stage1.png ./assets/minecraft/textures/block/cocoa_stage0.png ./assets/minecraft/textures/block/emerald_ore.png ./assets/minecraft/textures/block/tripwire_hook.png ./assets/minecraft/textures/block/tripwire.png ./assets/minecraft/textures/block/end_portal_frame_eye.png ./assets/minecraft/textures/block/end_stone.png \
./assets/minecraft/textures/block/sandstone_top.png ./assets/minecraft/textures/block/blue_wool.png ./assets/minecraft/textures/block/light_blue_wool.png ./assets/minecraft/textures/block/powered_rail_on.png ./temp/redstone_dust_overlay.png ./temp/redstone_dust_overlay.png ./assets/minecraft/textures/block/enchanting_table_side.png ./assets/minecraft/textures/block/enchanting_table_bottom.png ./assets/minecraft/textures/block/command_block_back.png ./assets/minecraft/textures/block/item_frame.png ./assets/minecraft/textures/block/flower_pot.png ./assets/minecraft/textures/block/comparator.png ./assets/minecraft/textures/block/comparator_on.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/nether_quartz_ore.png \
./assets/minecraft/textures/block/sandstone.png ./assets/minecraft/textures/block/magenta_wool.png ./assets/minecraft/textures/block/pink_wool.png ./assets/minecraft/textures/block/detector_rail.png ./assets/minecraft/textures/block/jungle_leaves.png ./assets/minecraft/textures/block/jungle_leaves.png ./assets/minecraft/textures/block/dark_oak_planks.png ./assets/minecraft/textures/block/jungle_planks.png ./assets/minecraft/textures/block/carrots_stage0.png ./assets/minecraft/textures/block/carrots_stage1.png ./assets/minecraft/textures/block/carrots_stage2.png ./assets/minecraft/textures/block/carrots_stage3.png ./assets/minecraft/textures/block/potatoes_stage3.png ./temp/water-flow-0.png ./temp/water-flow-1.png ./temp/water-flow-2.png \
./assets/minecraft/textures/block/sandstone_bottom.png ./assets/minecraft/textures/block/cyan_wool.png ./assets/minecraft/textures/block/orange_wool.png ./assets/minecraft/textures/block/redstone_lamp.png ./assets/minecraft/textures/block/redstone_lamp_on.png ./assets/minecraft/textures/block/chiseled_stone_bricks.png ./assets/minecraft/textures/block/birch_planks.png ./assets/minecraft/textures/block/anvil.png ./assets/minecraft/textures/block/chipped_anvil_top.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./temp/water-flow-3.png ./temp/water-flow-4.png \
./assets/minecraft/textures/block/nether_bricks.png ./assets/minecraft/textures/block/light_gray_wool.png ./assets/minecraft/textures/block/nether_wart_stage0.png ./assets/minecraft/textures/block/nether_wart_stage1.png ./assets/minecraft/textures/block/nether_wart_stage2.png ./assets/minecraft/textures/block/chiseled_sandstone.png ./assets/minecraft/textures/block/cut_sandstone.png ./assets/minecraft/textures/block/anvil_top.png ./assets/minecraft/textures/block/damaged_anvil_top.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./assets/minecraft/textures/block/amethyst_block.png ./temp/lava-flow-0.png ./temp/lava-flow-1.png ./temp/lava-flow-2.png \
./assets/minecraft/textures/block/destroy_stage_0.png ./assets/minecraft/textures/block/destroy_stage_1.png ./assets/minecraft/textures/block/destroy_stage_2.png ./assets/minecraft/textures/block/destroy_stage_3.png ./assets/minecraft/textures/block/destroy_stage_4.png ./assets/minecraft/textures/block/destroy_stage_5.png ./assets/minecraft/textures/block/destroy_stage_6.png ./assets/minecraft/textures/block/destroy_stage_7.png ./assets/minecraft/textures/block/destroy_stage_8.png ./assets/minecraft/textures/block/destroy_stage_9.png ./temp/redstone_dust_overlay.png ./temp/redstone_dust_overlay.png ./temp/redstone_dust_overlay.png ./temp/redstone_dust_overlay.png ./temp/lava-flow-3.png ./temp/lava-flow-4.png \
./terrain.png
