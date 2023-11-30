using Tooks as my from '../db/data-model';
using MASTER as myMASTER from '../db/data-model';
using MASTER_001 as myMASTER001 from '../db/data-model';

service CatalogService {
    @readonly entity Tooks as projection on my;
    
    entity MASTER as projection on myMASTER;
    entity MASTER_001 as projection on myMASTER001;
}
