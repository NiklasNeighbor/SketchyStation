import { type Antagonist, Category } from '../base';

export const WORSHIPER_MECHANICAL_DESCRIPTION = `
  A God begins it's divine life aboard the station, growing more powerful
  as it gains followers that worship it. Spread your dogma, turn the station
  into your temple, and send creatures at anyone trying to destroy you
`;

const Worshiper: Antagonist = {
  key: 'worshipedgod',
  name: 'Worshiped God',
  description: [WORSHIPER_MECHANICAL_DESCRIPTION],
  category: Category.Midround,
};

export default Worshiper;
