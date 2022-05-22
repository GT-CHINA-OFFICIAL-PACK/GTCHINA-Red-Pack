// Plant Fibers
recipes.remove(<pyrotech:material:12>);

recipes.addShaped("pyrotech.plant_fibers", <pyrotech:material:12>, [[<ore:cordagePlant>], [<minecraft:tallgrass:1>]]);

// Twine
recipes.remove(<pyrotech:material:14>);
recipes.addShapeless("pyrotech.twine", <pyrotech:material:14> * 2, [<pyrotech:material:13>, <pyrotech:material:13>, <pyrotech:material:13>]);

// Crude Tools
val woodBinding = <tconstruct:binding>.withTag({Material: "wood"});

recipes.remove(<pyrotech:crude_hammer>);
recipes.addShapeless("pyrotech.crude_hammer", <pyrotech:crude_hammer>, [<ccitem:material:rock_hammer_head>, <ore:cordageMid>, <ore:stickWood>, woodBinding]);

recipes.remove(<pyrotech:crude_axe>);
recipes.addShapeless("pyrotech.crude_axe", <pyrotech:crude_axe>, [<ccitem:material:rock_axe_head>, <ore:cordageMid>, <ore:stickWood>, woodBinding]);

recipes.remove(<pyrotech:crude_hoe>);
recipes.addShapeless("pyrotech.crude_hoe", <pyrotech:crude_hoe>, [<ccitem:material:rock_hoe_head>, <ore:cordageMid>, <ore:stickWood>, woodBinding]);

recipes.remove(<pyrotech:crude_pickaxe>);
recipes.addShapeless("pyrotech.crude_pickaxe", <pyrotech:crude_pickaxe>, [<ccitem:material:rock_pick_head>, <ore:cordageMid>, <ore:stickWood>, woodBinding]);

recipes.remove(<pyrotech:crude_shovel>);
recipes.addShapeless("pyrotech.crude_shovel", <pyrotech:crude_shovel>, [<ccitem:material:rock_shovel_head>, <ore:cordageMid>, <ore:stickWood>, woodBinding]);

recipes.remove(<pyrotech:crude_fishing_rod>);
//recipes.addShapeless("pyrotech.crude_fishing_rod", <pyrotech:crude_fishing_rod>);

