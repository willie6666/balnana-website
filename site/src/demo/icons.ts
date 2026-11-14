import BedDouble from '@lucide/astro/icons/bed-double';
import Car from '@lucide/astro/icons/car';
import CarTaxiFront from '@lucide/astro/icons/car-taxi-front';
import Coffee from '@lucide/astro/icons/coffee';
import Flower2 from '@lucide/astro/icons/flower-2';
import House from '@lucide/astro/icons/house';
import IceCreamCone from '@lucide/astro/icons/ice-cream-cone';
import KeyRound from '@lucide/astro/icons/key-round';
import ShoppingBasket from '@lucide/astro/icons/shopping-basket';
import Soup from '@lucide/astro/icons/soup';
import Utensils from '@lucide/astro/icons/utensils';
import Wifi from '@lucide/astro/icons/wifi';
import Wine from '@lucide/astro/icons/wine';
import Zap from '@lucide/astro/icons/zap';
import type { Messages } from '../i18n/index.ts';
import type { Scenario } from './ledger.ts';

/** Each sample group's name and icon, and the name and icon of its four expenses. */
export const groups = (t: Messages) =>
	({
		travel: {
			label: t.scenarioTravel,
			name: t.groupTravel,
			icon: Flower2,
			expenses: [t.expenseHotel, t.expenseCar, t.expenseGionDinner, t.expenseTea],
			icons: [BedDouble, Car, Soup, Coffee],
		},
		home: {
			label: t.scenarioHome,
			name: t.groupHome,
			icon: House,
			expenses: [t.expenseRent, t.expenseGroceries, t.expensePower, t.expenseInternet],
			icons: [KeyRound, ShoppingBasket, Zap, Wifi],
		},
		dinner: {
			label: t.scenarioDinner,
			name: t.groupDinner,
			icon: Utensils,
			expenses: [t.expenseDinner, t.expenseDrinks, t.expenseDessert, t.expenseTaxi],
			icons: [Utensils, Wine, IceCreamCone, CarTaxiFront],
		},
	}) satisfies Record<Scenario, object>;
