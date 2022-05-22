#priority 999998

import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

import crafttweaker.entity.IEntity;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityDefinition;

import crafttweaker.world.IWorld;

import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;

import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.IRecipeAction;

frigginClass ItemStackUtil {
       frigginConstructor() {}

       function isEmpty(itemStack as IItemStack) as bool {
              return isNull(itemStack) || itemStack.isEmpty;
       }
}

frigginClass IngredientUtil {
       frigginConstructor() {}

       function toDamageable(ingredient as IIngredient) as IIngredient {
              var ing as IIngredient = null;

              for i, s in ingredient.items {
                     var stack as IItemStack = s;

                     if (stack.isDamageable && stack.metadata != GWildcard) {
                            stack = s.withDamage(GWildcard);
                     }

                     if (i == 0) ing = stack;
                     else ing |= stack;
              }

              return ing;
       }

       function damage(ingredient as IIngredient, dmg as int) as IIngredient {
              var ingr as IIngredient = toDamageable(ingredient);
              var ing as IIngredient = null;

              for i, s in ingr.items {
                     var aaa as IIngredient = null;
                     if (s.isDamageable) {
                            aaa = s.transformDamage(dmg);
                     }
                     else aaa = s;

                     if (!isNull(aaa)) {
                            if (i == 0) ing = aaa;
                            else ing |= aaa;
                     }
              }

              return ing;
       }

       function damageReusable(ingredient as IIngredient, dmg as int) as IIngredient {
              return damage(ingredient, dmg).reuse();
       }
}

frigginClass DataUtil {
       frigginConstructor() {}

       function hasKey(stack as IItemStack, name as string) as bool {
              return stack.hasTag && stack.tag.memberGet(name) != null;
       }

       function replaceKey(stack as IItemStack, key as string, value as int) as IData {
              if (hasKey(stack, key)) {
                     var data as IData = stack.tag;                     
                     val toAdd as IData = {("" + key) : value};
                     data += toAdd;

                     return data;
              }

              return stack.tag;
       }
}

frigginClass OreDictUtil {
       frigginConstructor() {}

       function clear(entry as IOreDictEntry) {
              entry.removeItems(entry.items);
       }

       function removeAll(ingredient as IIngredient) {
              for item in ingredient.items {
                     for ore in item.ores {
                            ore.remove(item);
                     }
              }
       }

       function addAll(ingredient as IIngredient, entries as IOreDictEntry[]) {
              for entry in entries {
                     entry.addItems(ingredient.items);
              }
       }
}

frigginClass WorldUtil {
       frigginConstructor() {}

       function entitiesInCubeWPlayer(world as IWorld, pos as IBlockPos, size as int) as IEntity[] {
              val s as float = (size / 2) as float;
              return world.getEntitiesInArea(Position3f.create((pos.x - s), (pos.y - s), (pos.z - s)), Position3f.create((pos.x + s), (pos.y + s), (pos.z + s)));
       }

       function entitiesInCube(world as IWorld, pos as IBlockPos, size as int) as IEntity[] {
              val s as float = (size / 2) as float;
              var entities as IEntity[] = [];

              for entity in entitiesInCubeWPlayer(world, pos, size) {
                     if (!(entity instanceof IPlayer)) entities += entity;
              }

              return entities;
       }

       function entitiesInCube(world as IWorld, pos as IBlockPos, size as int, filter as IEntityDefinition) as IEntity[] {
              val s as float = (size / 2) as float;
              var entities as IEntity[] = [];

              for entity in entitiesInCubeWPlayer(world, pos, size) {
                     if (entity.definition.id == filter.id) entities += entity;
              }

              return entities;
       }
}

frigginClass PositionUtil {
       frigginConstructor() {}

       function distanceBetween(pos as IBlockPos, pos1 as IBlockPos) as Position3f {
              return Position3f.create((max(pos1.x, pos.x) - min(pos1.x, pos.x)), (max(pos1.y, pos.y) - min(pos1.y, pos.y)), (max(pos1.z, pos.z) - min(pos1.z, pos.z)));
       }

       function distanceBetween(pos as Position3f, pos1 as Position3f) as Position3f {
              return Position3f.create((max(pos1.x, pos.x) - min(pos1.x, pos.x)), (max(pos1.y, pos.y) - min(pos1.y, pos.y)), (max(pos1.z, pos.z) - min(pos1.z, pos.z)));
       }
}

frigginClass MathUtil {
       frigginConstructor() {}

       function abs(integer as int) as int {
              if (integer < 0) return -integer;
              return integer;
       }

       function abs(doub as double) as double {
              if (doub < 0) return -doub;
              return doub;
       }

       function abs(fl as float) as float {
              if (fl < 0) return -fl;
              return fl;
       }
}

frigginClass Recipe {
       // types = 0 shaped, 1 shapeless
       val type as byte;
       val name as string = null;
       val output as IItemStack;
       val inputs as IIngredient[][];

       val recipeFunction as IRecipeFunction;
       val recipeAction as IRecipeAction = null;

       frigginConstructor(output as IItemStack, inputs as IIngredient[][]) {
              type = 0;
              this.output = output;
              this.inputs = inputs;
              this.recipeFunction = function (out, ins, cInfo) { return output; };
       }

       frigginConstructor(output as IItemStack, inputs as IIngredient[]) {
              type = 1;
              this.output = output;
              this.inputs = [inputs] as IIngredient[][];
              this.recipeFunction = function (out, ins, cInfo) { return output; };
       }

       function output(output as IItemStack) as Recipe {
              this.output = output;
              return this;
       }

       function inputs(ingredient as IIngredient[][]) as Recipe {
              type = 0;
              this.inputs = ingredient;
              return this;
       }

       function inputs(ingredient as IIngredient[]) as Recipe {
              type = 1;
              this.inputs = [ingredient] as IIngredient[][];
              return this;
       }

       function name(name as string) as Recipe {
              this.name = name;
              return this;
       }

       function func(recipeFunction as IRecipeFunction) as Recipe {
              this.recipeFunction = recipeFunction;
              return this;
       }

       function action(recipeAction as IRecipeAction) as Recipe {
              this.recipeAction = recipeAction;
              return this;
       }

       function build() {
              if (type == 0) recipes.addShaped(name, output, inputs, recipeFunction, recipeAction);
              else recipes.addShapeless(name, output, inputs[0], recipeFunction, recipeAction);
       }
}

frigginClass RecipeUtil {
       frigginConstructor() {}
       static TEMP as string = "§l§4TEMPORARY RECIPE WILL BE DELETED";

       function build(shapes as string[], ingredients as IIngredient[]) as IIngredient[][] {
              var building as IIngredient[][] = [];

              for g in 0 to shapes.length {
                     var ings as IIngredient[] = [];
                     val shape as string = shapes[g];

                     for w in 0 to shape.length {
                            val str as string = shape[w];

                            if (str == ' ') ings += null;
                            else {
                                   if ((str as int) < ingredients.length)
                                          ings += ingredients[(str as int)];
                            }
                     }

                     building += ings;
              }

              return building;
       }

       // Don't ask me why tempRecipes needs these while build functions don't
       function build(ingredients as IIngredient[]) as IIngredient[] { ingredients; }

       function tempRecipe(output as IItemStack, inputs as IIngredient[][]) {
              recipes.addShaped(output.withLore([TEMP]), inputs, function(out, ins, cInfo) { return output; } as IRecipeFunction, null);
       }

       function tempRecipe(output as IItemStack, inputs as IIngredient[]) {
              recipes.addShapeless(output.withLore([TEMP]), inputs, function(out, ins, cInfo) { return output; } as IRecipeFunction, null);
       }
}

global IST as ItemStackUtil = ItemStackUtil();
global ING as IngredientUtil = IngredientUtil();
global NBT as DataUtil = DataUtil();
global ORE as OreDictUtil = OreDictUtil();
global LVL as WorldUtil = WorldUtil();
global POS as PositionUtil = PositionUtil();
global MTH as MathUtil = MathUtil();
global REC as RecipeUtil = RecipeUtil();