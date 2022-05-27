#loader preInit

import contentcreator.block.Block;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntity;
import crafttweaker.util.Position3f;
import crafttweaker.data.IData;
import crafttweaker.world.IFacing;

import crafttweaker.block.IMaterial;

val stoneHardness as float = 1.5F;
val stoneResistance as float = 6.0F;

static P as double = 0.0625D;

/*
function entitiesInCube(world as IWorld, pos as IBlockPos, size as int) as IEntity[] {
       var entities as IEntity[] = [];
       val s as float = (size / 2);

       world.getEntitiesInArea(Position3f.create((pos.x - s), (pos.y - s), (pos.z - s)), Position3f.create((pos.x + s), (pos.y + s), (pos.z + s)));
}

function distanceToPos3f(pos as Position3f, pos1 as Position3f) as Position3f {
       return Position3f.create((pos1.x - pos.x), (pos1.y - pos.y), (pos1.z - pos.z));
}

function dis(p as Position3f) as float {
       return p.x + p.y + p.z;
}

function abs(d as double) as double {
       if (d < 0) return -d;
       return d;
} */

function createTransparentBlock(material as IMaterial, name as string) as Block {
       return Block.create(material, name).setNonOpaque().setRenderLayer("cutout");
}

Block.setInteger("active", 1);
Block.create(<blockmaterial:rock>, "ancestral_stone").setHardness(stoneHardness).setResistance(stoneResistance).setColor(function(state, tintIndex) {  return (state.getPropertyValue("active") == 0 ? 0x646464 : 0xff0000); }).setSubItems();
/*.setUpdateTick(function(world, pos, state, random) {
       if (!world.remote && state.getPropertyValue("active") == 0) {
              var spiritValue = 0;

              val entities as IEntity[] = entitiesInCube(world, pos, 10);
              for entity in entities {
                     if (entity.definition.id == "betterwithaddons.entity.EntitySpirit") {
                            var distance as Position3f = distanceToPos3f(pos.asPosition3f(), entity.position3f);
                            entity.motionX = (-distance.x);
                            entity.motionY = (-distance.y);
                            entity.motionZ = (-distance.z);

                            if (dis(distance) <= 5) {
                                   val data as IData = entity.nbt;
                                   if (data.Value > 0) spiritValue += data.Value;
                                   entity.setDead();
                            }
                     }
              }

              if (spiritValue >= 32) world.setBlockState(state.withProperty("active", 1), pos);
       }})*/

Block.setInteger("level", 13);
Block.create(<blockmaterial:gourd>, "gravel").setHarvestLevel("shovel", 0).setSoundType(<soundtype:ground>).setHardness(0.6F).setResistance(0.6F).setFaceShape(function(world, state, pos, facing) { facing == IFacing.down() ? "solid" : "undefined"; });

createTransparentBlock(<blockmaterial:circuits>, "stone_bowl").setHarvestLevel("pickaxe", 0).setSoundType(<soundtype:stone>).setHardness(0.3F).setResistance(1.5F).setFaceShape("undefined").canPlace(function(world, pos) { return !world.isAirBlock(pos.down()) && world.getBlock(pos.down()).definition.getFaceShape(world, world.getBlockState(pos.down()), pos, IFacing.up()) == "solid"; }).checkAndDropBlock().setBoundingBox(P * 3, 0.0D, P * 3, P * 13, P * 4, P * 13).setLightOpacity(2).setSubItems();