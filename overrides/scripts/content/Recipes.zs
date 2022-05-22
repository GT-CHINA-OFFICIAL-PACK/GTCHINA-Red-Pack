
// Valus Twine
recipes.addShapeless("cc.valus_twine", <ccitem:material:valus_twine>, [<ore:fiberValus>, <ore:fiberValus>, <ore:fiberValus>]);

// Spider Cordage
recipes.addShapeless("cc.spider_cordage", <ccitem:material:spider_twine>, [<ore:string>, <ore:string>, <ore:string>]);

// Rock Tool Heads
val rock = <ore:rock>;
val rockShard = <tconstruct:shard>.withTag({Material: "stone"});

recipes.addShaped("cc.rh_pick", <ccitem:material:rock_pick_head>, [[rockShard, rock], [GToolSharp, rockShard]]);
recipes.addShaped("cc.rh_axe", <ccitem:material:rock_axe_head>, [[rockShard, rock], [rockShard, GToolSharp]]);
recipes.addShaped("cc.rh_hammer", <ccitem:material:rock_hammer_head>, [[rock, null], [GToolSharp, rock]]);
recipes.addShaped("cc.rh_shovel", <ccitem:material:rock_shovel_head>, [[rock, GToolSharp], [rock, null]]);
recipes.addShaped("cc.rh_hoe", <ccitem:material:rock_hoe_head>, [[rockShard, rock], [null, GToolSharp]]);

// Ancestral Stone
REC.tempRecipe(<contentcreator:ancestral_stone:1>, REC.build([<betterwithaddons:ancestry_bottle>, <betterwithaddons:ancestry_bottle>, <betterwithaddons:ancestry_bottle>, <contentcreator:ancestral_stone>]));