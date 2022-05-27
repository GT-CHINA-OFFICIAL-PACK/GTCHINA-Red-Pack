
// String
recipes.removeByRecipeName("primal:cordage_string");

// Stick
recipes.addShaped("minecraft.stick-from_twig", <minecraft:stick>, [[GToolSharp], [<ccitem:material:twig>]]);

// BWM Pile Recipes (Gravel, Sand etc.)
recipes.removeByRegex("betterwithmods:piles/.*");