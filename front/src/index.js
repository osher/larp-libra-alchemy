import './core/shims';
import model from './model';

console.log('hello index');

/*
  legend:
  =======
  a component is called: 
    view = when it's non-interactive and is mainly informative
    control = when it's interactive and is mainly for input
    view control = mainly informative, but has some interactivity
    dialog = appears on demand, and dismissed by user's choice
    modal dialog = shadows the rest of the screen while open
    
  structure:
  ==========
  main app control:
    init:
     - request data 
     - display loader view
    on: data error: 
     - display fatal crash view
    on: deta loaded:
     - init model
     - display lab view control

  lab control:
   - produce control:
      - procedures control: 
        > data-bound(data.procedures.all)
          shows a card per procedure
        > single-selection, togglable(select the selected clears selection)
      - ingredients control:
        > data-bound(data.ingredients.all)
          shows a card per ingredient
        > single-selection, togglable(select the selected clears selection)
      - add product button
         > enabled when both procedures and ingredients have active element
           on: click - receipt.produce && update views.
   - similar potions view: 
      > data-bound(state.similar)
   - receipt view control: 
      - products list view control:
          > data-bound (state.receipt.products)
            on: remove - remove ingredient && update views
      - specials list:
          > data-bound (state.receipt.specials)
            on: remove - remove specializer && update views
      - effects list
          > data-bound (state.results)
          - effect row (name, level, selected(top-5) )
   - misc controls:
      - add special
          > invokes find special lookup dialog:
            on: type - propose auto-completes of first 10 matches , 
             > first option selected
                - enter - adds the selected item (if any) and closes drop-list
                - single-click - changes selected item
                - double-click a list item - changes selected item + like enter clicked
            on: select - receipt.specialize
            on: cancel - close dialog
      - reset receipt
      - save as potion
        > invokes save form modal dialog:
           - name control
           - description control
           - save button
           on: cancel clicked - close dialog
           on: save clicked:
            > show loader for saving (removes or disables controls)
            > call save API
            ---
              on: api success - update model + ui notice gesture + update views
              on: api error - ui notice gesture + enable/bring back controls
*/