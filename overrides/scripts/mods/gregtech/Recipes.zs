
// Flint Tools
recipes.removeByRecipeName("gregtech:knife_flint");
recipes.removeByRecipeName("gregtech:mortar_flint");
recipes.removeByRecipeName("gregtech:sword_flint");
recipes.removeByRecipeName("gregtech:hoe_flint");
recipes.removeByRecipeName("gregtech:axe_flint");
recipes.removeByRecipeName("gregtech:shovel_flint");
recipes.removeByRecipeName("gregtech:pickaxe_flint");

// Will add a recipe for knife and axe as "perfected"

// Flint Mortar
recipes.addShaped("gregtech.mortar_flint", <gregtech:meta_tool:12>.withTag({"GT.ToolStats": {Material: "flint"}}), REC.build(["0", "0", "1"], [<ore:flakeFlint>, <contentcreator:stone_bowl>]));