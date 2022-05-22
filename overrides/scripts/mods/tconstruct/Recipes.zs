import mods.primal.Flake as PFlaking;

// Stone Tool Parts
val rock = <ore:rock>;
val rockShard = <tconstruct:shard>.withTag({Material: "stone"});
val stoneKamaHead = <tconstruct:kama_head>.withTag({Material: "stone"});

PFlaking.addRecipe("ticon.shard-rock", 1.5F, 1.0F, 0.0F, rock, rockShard * 2, rockShard);
recipes.addShaped("ticon.kama_head-stone", stoneKamaHead, [[rock, rock], [null, GToolSharp]]);