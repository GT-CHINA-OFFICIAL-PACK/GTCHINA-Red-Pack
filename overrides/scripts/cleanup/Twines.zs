<ore:cordageQuality>.add(<pyrotech:material:26>, <ccitem:material:spider_twine>);
<ore:cordageQuality>.remove(<primal:sinuous_cordage>, <primal:silk_cordage>);

<ore:cordageMid>.add(<primal:silk_cordage>, <ccitem:material:valus_twine>, <pyrotech:material:14>);
<ore:cordageMid>.addAll(<ore:cordageQuality>);

<ore:cordageGeneral>.addAll(<ore:cordageMid>);

<ore:cordagePlant>.add(<primal:sinuous_cordage>, <primal:void_cordage>, <ccitem:material:valus_twine>, <pyrotech:material:26>, <pyrotech:material:14>);

ORE.clear(<ore:twine>);