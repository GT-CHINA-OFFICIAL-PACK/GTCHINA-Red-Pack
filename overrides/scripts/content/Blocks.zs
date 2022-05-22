#loader preInit

import contentcreator.block.Block;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntity;
import crafttweaker.util.Position3f;
import crafttweaker.data.IData;

val stoneHardness as float = 1.5F;
val stoneResistance as float = 6.0F;

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