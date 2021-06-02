gd = {}

gd.FR = {
	['press'] = 'Press ~r~[ E ] ~w~pour vendre de la drogue.',
    ['process'] = '~r~Vente en cours...',
	['meth'] = ' meth',
	['coke'] = ' coke',
	['weed'] = ' weed',
	['opium'] = ' pochons de opium',
	['done'] = 'Vous avez vendu x',
	['for'] = ' ~w~pour ~g~ -> $',
	['no'] = '~r~La personne n\'est pas interessé!',
	['cops1'] = 'Vous ne pouvez pas vendre de drogues. ~r~',
	['cops2'] = ' ~r~policiers en ville.',
	['dist'] = '~r~Vous etes trop loin!'
}
gd.Text = gd.FR

gd.CokePrice = math.random(120,150)
gd.WeedPrice = math.random(70,90)
gd.MethPrice = math.random(90,120)
gd.OpiumPrice = math.random(180,210)

gd.CopsNeeds = 0
