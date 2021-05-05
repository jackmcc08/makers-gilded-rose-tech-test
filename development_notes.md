## To run tests

- git clone repository
- run in terminal `rspec gilded_rose_spec.rb`


## Development Plan

I need to refactor the existing code to include the update the client wants:
 - We have recently signed a supplier of conjured items. This requires an update to our system:
 - “Conjured” items degrade in Quality twice as fast as normal items

We also need to ensure the code maintains compliance with:
  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - “Aged Brie” actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
  - “Backstage passes”, like aged brie, increases in Quality as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

A couple of rules for the code:
  - All items have a `SellIn` value - number of days to sell the item
  - All items have a `Quality` value - denotes how valuable the item is
  - At end of each day - `SellIn` and `Quality` decreases for each item.


At the moment, there are no tests to ensure the code works with the current requirements.

The code is also quite low quality and readability so I will aim to refactor it to improve the code quality.

Therefore my plan is as follows:
- Figure out the way the code works currently
- Add tests to ensure code works as is correctly
- Implement new feature

Eventually may add in rubocop and standard rspec folders to organise files. I may seperate out the Item Class as well once I have added the initial tests.

Proposed Tests:
- Normal Items:
  - Quality decreases by 1 each day
  - Quality decreased by 2 once Sell_in is below 0
  - Quality is never negative
  - SellIn decreases by 1 each day
- Aged Brie
  - Quality increases by 1 each day
- Sulfuras
  - Sell_in never changes
  - Quality never changes
- Backstage Passes
  - Quality increases by 1 each day
  - Quality increases by 2 each day where sellin is between 10-6
  - Quality increases by 1 each day where sellin is between 5-0
  - QUality drops to 0 when sellin < 0

- Quality
  - Can never be above 50


Added in all tests for basic functionality of items
