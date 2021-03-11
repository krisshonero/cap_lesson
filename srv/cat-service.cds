using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  entity Books as SELECT from my.Books {*    
  } excluding { createdBy, modifiedBy };

  entity Authors as SELECT from my.Authors {*
  } excluding { createdBy, modifiedBy };

  @requires_: 'authenticated-user'
  action submitOrder (book: Books:ID, amount: Integer);
}

