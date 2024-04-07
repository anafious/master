/* checksum : bc6f7d4b7b127d72ed916ed5e12d6e6a */
@cds.external : true
type Product.SAP__Message {
  code : LargeString not null;
  message : LargeString not null;
  target : LargeString;
  additionalTargets : many LargeString not null;
  transition : Boolean not null;
  @odata.Type : 'Edm.Byte'
  numericSeverity : Integer not null;
  longtextUrl : LargeString;
};

@cds.external : true
@CodeList.UnitsOfMeasure : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'UnitsOfMeasure'
}
@CodeList.CurrencyCodes : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'Currencies'
}
@Aggregation.ApplySupported : {
  Transformations: [ 'aggregate', 'groupby', 'filter' ],
  Rollup: #None
}
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features : {
  DocumentDescriptionReference: '../../../../default/iwbep/common/0001/$metadata',
  DocumentDescriptionCollection: 'MyDocumentDescriptions',
  ArchiveFormat: true,
  Border: true,
  CoverPage: true,
  FitToPage: true,
  FontName: true,
  FontSize: true,
  Margin: true,
  Padding: true,
  Signature: true,
  HeaderFooter: true,
  ResultSizeDefault: 20000,
  ResultSizeMaximum: 20000,
  IANATimezoneFormat: true,
  Treeview: true
}
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
@Authorization.SecuritySchemes : [
  {
    Authorization: 'OAuth2Auth',
    RequiredScopes: [ 'OV4:API_PRODUCT' ]
  },
  { Authorization: 'BasicAuth' }
]
@Authorization.Authorizations : [
  {
    $Type: 'Auth.OAuth2AuthCode',
    Name: 'OAuth2Auth',
    RefreshUrl: 'https://{host}:{port}',
    AuthorizationUrl: 'https://{host}:{port}',
    TokenUrl: 'https://{host}:{port}',
    Scopes: [ { Scope: 'OV4:API_PRODUCT' } ]
  },
  {
    $Type: 'Auth.Http',
    Name: 'BasicAuth',
    Scheme: 'basic'
  }
]
service Product {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales Delivery Sales Tax'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductSalesDelivery' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProdSalesDeliverySalesTax {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Departure Ctry/Reg.'
  @Common.Heading : 'DeCR'
  @Common.QuickInfo : 'Departure Country/Region (from which the goods are sent)'
  key Country : String(3) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Tax Condition Type'
  @Common.Heading : 'TxCT'
  @Common.QuickInfo : 'Tax Condition Type (Sales Tax, Value-Added Tax,...)'
  key ProductSalesTaxCategory : String(4) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Sales Organization'
  @Common.Heading : 'SOrg.'
  key ProductSalesOrg : String(4) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Distribution Channel'
  @Common.Heading : 'DChl'
  key ProductDistributionChnl : String(2) not null;
  ProductTaxClassification : String(1) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductSalesDelivery : Association to one Product.ProductSalesDelivery on _ProductSalesDelivery.ProductDistributionChnl = ProductDistributionChnl;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductChangeMaster,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductDescription,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductEWMWarehouse,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlant,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductProcurement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductQualityManagement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductSales,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductSalesDelivery,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductStorage,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductUnitOfMeasure,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuation,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [
  '_ProductChangeMaster',
  '_ProductDescription',
  '_ProductEWMWarehouse',
  '_ProductPlant',
  '_ProductProcurement',
  '_ProductQualityManagement',
  '_ProductSales',
  '_ProductSalesDelivery',
  '_ProductStorage',
  '_ProductUnitOfMeasure',
  '_ProductValuation'
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ 'LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: GrossWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: NetWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductVolume,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuarantinePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TimeUnitForQuarantinePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuarantinePeriodISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitForMaxPackagingDimensions,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaxPackggDimensionISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.Product {
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductType'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Type'
  @Common.Heading : 'PTyp'
  ProductType : String(4) not null;
  @Core.Computed : true
  @Common.Label : 'Created On'
  @Common.Heading : 'Created'
  CreationDate : Date;
  @Core.Computed : true
  @Common.Label : 'Created At Time'
  @Common.QuickInfo : 'Time of Creation'
  CreationTime : Time not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @Common.Label : 'Created On'
  @Common.QuickInfo : 'Product Created On'
  CreationDateTime : Timestamp;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Created By'
  @Common.QuickInfo : 'Name of Person Responsible for Creating the Object'
  CreatedByUser : String(12) not null;
  @Core.Computed : true
  @Common.Label : 'Last Change'
  @Common.Heading : 'Last Chg'
  @Common.QuickInfo : 'Date of Last Change'
  LastChangeDate : Date;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Changed By'
  @Common.QuickInfo : 'Name of Person Who Changed Object'
  LastChangedByUser : String(12) not null;
  @Common.Label : 'Marked for Deletion'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Deletion Indicator'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductProfileCode'
  @Common.IsUpperCase : true
  @Common.Label : 'CrossPlantProdStatus'
  @Common.Heading : 'PS'
  @Common.QuickInfo : 'Cross-Plant Product Status'
  CrossPlantStatus : String(2) not null;
  @Common.Label : 'Valid from'
  @Common.QuickInfo : 'Date from which the cross-plant material status is valid'
  CrossPlantStatusValidityDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Old Product Number'
  @Common.Heading : 'Old Product No.'
  ProductOldID : String(40) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Gross Weight'
  GrossWeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Weight'
  @Common.Heading : 'WUn'
  WeightUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of weight ISO'
  @Common.Heading : 'WUn'
  @Common.QuickInfo : 'Unit of weight in ISO code'
  WeightISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group'
  @Common.Heading : 'Prd Group'
  ProductGroup : String(9) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductItemCategoryGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Gen. item cat. grp'
  @Common.Heading : 'ItCGr'
  @Common.QuickInfo : 'General item category group'
  ItemCategoryGroup : String(4) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Net Weight'
  NetWeight : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Division'
  @Common.Heading : 'Dv'
  Division : String(2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Volume Unit'
  @Common.Heading : 'VUn'
  VolumeUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Volume unit ISO'
  @Common.Heading : 'VUI'
  @Common.QuickInfo : 'Volume unit in ISO code'
  VolumeISOUnit : String(3) not null;
  @Measures.Unit : VolumeUnit
  @Measures.UNECEUnit : VolumeISOUnit
  @Common.Label : 'Volume'
  ProductVolume : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Authorization Group'
  @Common.Heading : 'AGrp'
  AuthorizationGroup : String(4) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'ANP Code'
  ANPCode : String(9) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Size/dimensions'
  SizeOrDimensionText : String(32) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Industry Std Desc.'
  @Common.QuickInfo : 'Industry Standard Description (such as ANSI or ISO)'
  IndustryStandardName : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN'
  @Common.QuickInfo : 'Global Trade Item Number (EAN/UPC/GTIN)'
  ProductStandardID : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'EAN Category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of International Article Number (EAN)'
  InternationalArticleNumberCat : String(2) not null;
  @Common.Label : 'Configurable'
  @Common.Heading : 'Conf.'
  @Common.QuickInfo : 'Product is Configurable'
  ProductIsConfigurable : Boolean not null;
  @Common.Label : 'Batch Management'
  @Common.Heading : 'BMR'
  @Common.QuickInfo : 'Batch Management Requirement Indicator'
  IsBatchManagementRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Ext. Product Group'
  @Common.Heading : 'Ext. Product Grp'
  @Common.QuickInfo : 'External Product Group'
  ExternalProductGroup : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cross-plant CP'
  @Common.QuickInfo : 'Cross-Plant Configurable Product'
  CrossPlantConfigurableProduct : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serialization level'
  @Common.Heading : 'SL'
  @Common.QuickInfo : 'Level of Explicitness for Serial Number'
  SerialNoExplicitnessLevel : String(1) not null;
  @Common.Label : 'Appr.Batch Recd Req.'
  @Common.Heading : 'AR'
  @Common.QuickInfo : 'Approved Batch Record Required'
  IsApprovedBatchRecordReqd : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Handling Indicator'
  @Common.Heading : 'Hand.Ind.'
  HandlingIndicator : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'WH Material Group'
  @Common.Heading : 'WHMatGrp'
  @Common.QuickInfo : 'Warehouse Material Group'
  WarehouseProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Whse Stor. Condition'
  @Common.Heading : 'Cond.'
  @Common.QuickInfo : 'Warehouse Storage Condition'
  WarehouseStorageCondition : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Standard HU Type'
  StandardHandlingUnitType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serial No. Profile'
  @Common.QuickInfo : 'Serial Number Profile'
  SerialNumberProfile : String(4) not null;
  @Common.Label : 'Pilferable'
  IsPilferable : Boolean not null;
  @Common.Label : 'Relevant for HS'
  @Common.Heading : 'Rel. for HS'
  @Common.QuickInfo : 'Relevant for Hazardous Substances'
  IsRelevantForHzdsSubstances : Boolean not null;
  @Measures.Unit : TimeUnitForQuarantinePeriod
  @Measures.UNECEUnit : QuarantinePeriodISOUnit
  @Common.Label : 'Quarant. Per.'
  @Common.Heading : 'QPer.'
  @Common.QuickInfo : 'Quarantine Period'
  QuarantinePeriod : Decimal(precision: 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Time Unit'
  @Common.Heading : 'Quarantine Time Unit'
  @Common.QuickInfo : 'Time Unit for Quarantine Period'
  TimeUnitForQuarantinePeriod : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Time Unit'
  @Common.Heading : 'Quarantine Time Unit'
  @Common.QuickInfo : 'Time Unit for Quarantine Time in ISO Code'
  QuarantinePeriodISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Quality Inspec. Grp'
  @Common.Heading : 'Quality Inspection Group'
  @Common.QuickInfo : 'Quality Inspection Group'
  QualityInspectionGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Handling Unit Type'
  HandlingUnitType : String(4) not null;
  @Common.Label : 'Varb. Tare Weight'
  @Common.Heading : 'V'
  @Common.QuickInfo : 'Variable Tare Weight'
  HasVariableTareWeight : Boolean not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Length'
  @Common.QuickInfo : 'Maximum Packing Length of Packaging Material'
  MaximumPackagingLength : Decimal(15, 3) not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Width'
  @Common.QuickInfo : 'Maximum Packing Width of Packaging Material'
  MaximumPackagingWidth : Decimal(15, 3) not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Height'
  @Common.QuickInfo : 'Maximum Packing Height of Packaging Material'
  MaximumPackagingHeight : Decimal(15, 3) not null;
  @Common.Label : 'Maximum Capacity'
  @Common.QuickInfo : 'Maximum Allowed Capacity of Packaging Material'
  MaximumCapacity : Decimal(15, 3) not null;
  @Common.Label : 'Overcapacity Toler.'
  @Common.Heading : 'OCT'
  @Common.QuickInfo : 'Overcapacity Tolerance of the Handling Unit'
  OvercapacityTolerance : Decimal(3, 1) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Measurement'
  @Common.Heading : 'UoM'
  @Common.QuickInfo : 'Unit of Measure for Maximum Packing Length/Width/Height'
  UnitForMaxPackagingDimensions : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Unit: ISO Code'
  @Common.Heading : 'Unt'
  @Common.QuickInfo : 'Unit for Maximum Packing Length/Width/Height in ISO Code'
  MaxPackggDimensionISOUnit : String(3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Length'
  BaseUnitSpecificProductLength : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Width'
  BaseUnitSpecificProductWidth : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Height'
  BaseUnitSpecificProductHeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Dimension'
  @Common.QuickInfo : 'Unit of Dimension for Length/Width/Height'
  ProductMeasurementUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Dimension unit ISO'
  @Common.Heading : 'DUI'
  @Common.QuickInfo : 'Unit for length/breadth/height in ISO code'
  ProductMeasurementISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Category'
  @Common.Heading : 'Ct'
  ArticleCategory : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Industry'
  @Common.Heading : 'I'
  IndustrySector : String(1) not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @Core.Computed : true
  @Common.Label : 'Last Changed'
  @Common.QuickInfo : 'Change Time Stamp'
  LastChangeDateTime : Timestamp;
  @Core.Computed : true
  @Common.Label : 'Last Changed Time'
  @Common.Heading : 'Last Chgd. Time'
  @Common.QuickInfo : 'Time of Last Change'
  LastChangeTime : Time not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DG indicator profile'
  @Common.Heading : 'Pro.'
  @Common.QuickInfo : 'Dangerous Goods Indicator Profile'
  DangerousGoodsIndProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document Change No.'
  @Common.Heading : 'Ch.no.'
  @Common.QuickInfo : 'Document change number (without document management system)'
  ProductDocumentChangeNumber : String(6) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Number Of Sheets'
  @Common.Heading : 'No.'
  @Common.QuickInfo : 'Number Of Sheets (without Document Management system)'
  ProductDocumentPageCount : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page Number'
  @Common.Heading : 'PNo'
  @Common.QuickInfo : 'Page Number of document (without Document Management system)'
  ProductDocumentPageNumber : String(3) not null;
  @Common.Label : 'CAD Indicator'
  @Common.Heading : 'CAD'
  DocumentIsCreatedByCAD : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Prod./insp. memo'
  @Common.QuickInfo : 'Production/inspection memo'
  ProductionOrInspectionMemoTxt : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page format'
  @Common.Heading : 'For.'
  @Common.QuickInfo : 'Page Format of Production Memo'
  ProductionMemoPageFormat : String(4) not null;
  @Common.Label : 'Highly viscous'
  @Common.Heading : 'HighlyVisc'
  @Common.QuickInfo : 'Indicator: Highly Viscous'
  ProductIsHighlyViscous : Boolean not null;
  @Common.Label : 'In bulk/liquid'
  @Common.QuickInfo : 'Indicator: In Bulk/Liquid'
  TransportIsInBulk : Boolean not null;
  @Common.Label : 'Assign effect. vals'
  @Common.Heading : 'Par.ef.'
  @Common.QuickInfo : 'Assign effectivity parameter values/ override change numbers'
  ProdEffctyParamValsAreAssigned : Boolean not null;
  @Common.Label : 'Environmentally rlvt'
  @Common.Heading : 'E'
  @Common.QuickInfo : 'Environmentally Relevant'
  ProdIsEnvironmentallyRelevant : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lab/Office'
  @Common.Heading : 'L/O'
  @Common.QuickInfo : 'Laboratory/Design Office'
  LaboratoryOrDesignOffice : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Matl Grp Pack.Matls'
  @Common.Heading : 'GrPMt'
  @Common.QuickInfo : 'Material Group: Packaging Materials'
  PackagingProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Ref. Mat. for Pckg'
  @Common.Heading : 'Reference Material'
  @Common.QuickInfo : 'Reference Material for Materials Packed in Same Way'
  PackingReferenceProduct : String(18) not null;
  @Common.Label : 'Basic Material'
  BasicProduct : String(48) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document'
  @Common.QuickInfo : 'Document number (without document management system)'
  ProductDocumentNumber : String(22) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document Version'
  @Common.Heading : 'Vers'
  @Common.QuickInfo : 'Document version (without Document Management system)'
  ProductDocumentVersion : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document Type'
  @Common.Heading : 'Type'
  @Common.QuickInfo : 'Document type (without Document Management system)'
  ProductDocumentType : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page Format'
  @Common.Heading : 'Page'
  @Common.QuickInfo : 'Page Format of Document (without Document Management system)'
  ProductDocumentPageFormat : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Chemical Compliance Relevance Indicator'
  ProdChmlCmplncRelevanceCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Qual.f.FreeGoodsDis.'
  @Common.Heading : 'DiK'
  @Common.QuickInfo : 'Material qualifies for discount in kind'
  DiscountInKindEligibility : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Mfr Part Number'
  @Common.Heading : 'MPN'
  @Common.QuickInfo : 'Manufacturer Part Number'
  ProductManufacturerNumber : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Manufacturer'
  @Common.Heading : 'Manufact.'
  @Common.QuickInfo : 'Number of a Manufacturer'
  ManufacturerNumber : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Mfr Part Profile'
  @Common.Heading : 'MPP'
  ManufacturerPartProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Int. material number'
  @Common.Heading : 'Int. material no.'
  @Common.QuickInfo : 'Number of firm''s own (internal) inventory-managed material'
  OwnInventoryManagedProduct : String(18) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductChangeMaster : Composition of many Product.ProductChangeMaster;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductDescription : Composition of many Product.ProductDescription;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductEWMWarehouse : Composition of many Product.ProductEWMWarehouse;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlant : Composition of many Product.ProductPlant;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductProcurement : Composition of one Product.ProductProcurement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductQualityManagement : Composition of one Product.ProductQualityManagement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductSales : Composition of one Product.ProductSales;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductSalesDelivery : Composition of many Product.ProductSalesDelivery;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductStorage : Composition of one Product.ProductStorage;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductUnitOfMeasure : Composition of many Product.ProductUnitOfMeasure;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuation : Composition of many Product.ProductValuation;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Change Master'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'ChangeNumber' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity Product.ProductChangeMaster {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Change Number'
  @Common.Heading : 'Change No.'
  key ChangeNumber : String(12) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Revision Level'
  @Common.Heading : 'Revision Level without Conversion Exit'
  @Common.QuickInfo : 'Revision Level without Conversion Exit'
  RevisionLevel : String(2) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Description'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'Language' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductDescription {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.Label : 'Language Key'
  @Common.Heading : 'Language'
  key Language : String(2) not null;
  @Common.Label : 'Product Description'
  ProductDescription : String(40) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product EWM Storage Type'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'EWMStorageType' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductEWMWarehouse' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: EWMMaximumStorageQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMaxStorQuantityBaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMaxStorQtyBaseUnitISOCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinimumStorageQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinStorQuantityBaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinStorQtyBaseUnitISOCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinReplnmtQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinReplnmtQtyBaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: EWMMinReplnmtQtyBsUnitISOCode,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductEWMStorageType {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Warehouse Number'
  @Common.Heading : 'WhN'
  @Common.QuickInfo : 'Warehouse Number/Warehouse Complex'
  key EWMWarehouse : String(4) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Business Partner'
  @Common.QuickInfo : 'Business Partner Number'
  key EntitledToDisposeParty : String(10) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Type'
  @Common.Heading : 'Ty.'
  key EWMStorageType : String(4) not null;
  @Common.Label : 'Product ID'
  @Common.QuickInfo : 'Internal Number (UID) for Product'
  ProductInternalUUID : UUID;
  @Common.Label : 'SC Unit GUID'
  @Common.Heading : 'Supply Chain Unit GUID'
  @Common.QuickInfo : 'Supply Chain Unit GUID'
  SupplyChainUnitUUID : UUID;
  @Common.Label : 'Ent. to Dispose'
  @Common.Heading : 'Ent.toDisp'
  @Common.QuickInfo : 'Party Entitled to Dispose (GUID)'
  EWMPartyEntitledToDisposeUUID : UUID;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Section'
  @Common.Heading : 'SSctInd'
  @Common.QuickInfo : 'Storage Section Indicator'
  EWMStorageSectionMethod : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Bin Type'
  @Common.Heading : 'BT'
  EWMStorageBinType : String(4) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Maximum No. of Bins'
  @Common.Heading : 'MaxBns'
  EWMMaximumNumberOfBins : String(3) not null;
  @Measures.Unit : EWMMaxStorQuantityBaseUnit
  @Measures.UNECEUnit : EWMMaxStorQtyBaseUnitISOCode
  @Common.Label : 'Maximum Quantity'
  @Common.Heading : 'Max.Qty'
  EWMMaximumStorageQuantity : Decimal(15, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMaxStorQuantityBaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  EWMMaxStorQtyBaseUnitISOCode : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMaxStorQuantityDisplayUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  EWMMaxStorageQtyDspUnitISOCode : String(3) not null;
  @Measures.Unit : EWMMinStorQuantityBaseUnit
  @Measures.UNECEUnit : EWMMinStorQtyBaseUnitISOCode
  @Common.Label : 'Minimum Quantity'
  @Common.Heading : 'Min. Qty'
  EWMMinimumStorageQuantity : Decimal(15, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMinStorQuantityBaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  EWMMinStorQtyBaseUnitISOCode : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMinStorQuantityDisplayUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  EWMMinStorageQtyDspUnitISOCode : String(3) not null;
  @Measures.Unit : EWMMinReplnmtQtyBaseUnit
  @Measures.UNECEUnit : EWMMinReplnmtQtyBsUnitISOCode
  @Common.Label : 'Min. Replenish. Qty'
  @Common.Heading : 'MnRQ'
  @Common.QuickInfo : 'Minimum Replenishment Quantity'
  EWMMinReplnmtQuantity : Decimal(15, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMinReplnmtQtyBaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  EWMMinReplnmtQtyBsUnitISOCode : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMMinReplnmtQtyDisplayUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  EWMMinReplnmtQtyDspUnitISOCode : String(3) not null;
  @Common.Label : 'Max./Min. Qty'
  @Common.Heading : 'Min.Qty (% of Max. Qty)'
  @Common.QuickInfo : 'Minimum Quantity as Percentage of Maximum Quantity'
  EWMMinStorQtyOfMaxStorQtyInPct : Decimal(5, 2) not null;
  @Common.Label : 'Thrshld Addition'
  @Common.Heading : 'Threshold Addition'
  @Common.QuickInfo : 'Putaway Threshold Addition (in Percent of Storage Bin)'
  EWMSpltPtwyThresholdInPercent : Decimal(5, 2) not null;
  @Common.Label : 'Split During Putaway'
  @Common.Heading : 'Split Put.'
  EWMProdIsSplitOnPtwy : Boolean not null;
  @Common.Label : 'Skip During Putaway'
  @Common.Heading : 'SkipPuta'
  EWMProdIsSkippedOnPtwy : Boolean not null;
  @Common.Label : 'No Replenishment'
  @Common.Heading : 'ND'
  EWMHasNoReplenishment : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Empty StorageBin Sch'
  @Common.Heading : 'BS'
  @Common.QuickInfo : 'Sort Rule for Empty Storage Bin Search'
  EWMStorageBinSearchRule : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Quantity Classif.'
  @Common.QuickInfo : 'Quantity Classification in Warehouse'
  EWMProdQuantityClassification : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Putaway Qty Classif.'
  @Common.QuickInfo : 'Putaway Quantity Classification'
  EWMProdPtwyQtyClassification : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Putaway Seq.'
  @Common.Heading : 'Putaw.Seq'
  @Common.QuickInfo : 'Putaway Sequence'
  EWMPtwySequence : String(2) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductEWMWarehouse : Association to one Product.ProductEWMWarehouse on _ProductEWMWarehouse.EntitledToDisposeParty = EntitledToDisposeParty;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product EWM Warehouse'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductEWMStorageType,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductEWMStorageType' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductEWMWarehouse {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Warehouse Number'
  @Common.Heading : 'WhN'
  @Common.QuickInfo : 'Warehouse Number/Warehouse Complex'
  key EWMWarehouse : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Business Partner'
  @Common.QuickInfo : 'Business Partner Number'
  key EntitledToDisposeParty : String(10) not null;
  @Common.Label : 'Product ID'
  @Common.QuickInfo : 'Internal Number (UID) for Product'
  ProductInternalUUID : UUID;
  @Common.Label : 'SC Unit GUID'
  @Common.Heading : 'Supply Chain Unit GUID'
  @Common.QuickInfo : 'Supply Chain Unit GUID'
  SupplyChainUnitUUID : UUID;
  @Common.Label : 'Ent. to Dispose'
  @Common.Heading : 'Ent.toDisp'
  @Common.QuickInfo : 'Party Entitled to Dispose (GUID)'
  EWMPartyEntitledToDisposeUUID : UUID;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Process Block Prof.'
  @Common.Heading : 'Process Block Profile'
  @Common.QuickInfo : 'Process Block Profile'
  EWMProductProcessBlockProfile : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Proc.Type Det. Ind.'
  @Common.Heading : 'PTDInd.'
  @Common.QuickInfo : 'Control Indicator for Process Type Determination'
  EWMProcessTypeControlCode : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'StagArea/DoorDet.Grp'
  @Common.Heading : 'SDDGr'
  @Common.QuickInfo : 'Staging Area and Door Determination Group'
  EWMStggAreaDeterminationGroup : String(4) not null;
  @Common.Label : 'Min. Shelf Life'
  @Common.Heading : 'Min. Life'
  @Common.QuickInfo : 'Required Minimum Shelf Life'
  RequiredMinShelfLife : Decimal(precision: 11) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Putaway Control'
  @Common.Heading : 'Ptwy'
  EWMPtwyControlStrategy : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Section Ind.'
  @Common.Heading : 'SecIn'
  @Common.QuickInfo : 'Storage Section Indicator'
  EWMStorageSectionMethod : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Bin Type'
  @Common.Heading : 'BT'
  EWMStorageBinType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Bulk Storage'
  @Common.Heading : 'Blk'
  EWMBulkStorageMethod : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Stock Removal Ctrl'
  @Common.Heading : 'Rmvl'
  @Common.QuickInfo : 'Stock Removal Control'
  EWMStockRemovalControlStrategy : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Stk Determin. Group'
  @Common.Heading : 'SDGrp'
  @Common.QuickInfo : 'Stock Determination Group'
  EWMStockDeterminationGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cyc. Coun. Ind.'
  @Common.Heading : 'CC Indicator'
  @Common.QuickInfo : 'Cycle Counting Indicator'
  EWMPhysInventoryCountingCycle : String(1) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  EWMPreferredUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  EWMPreferredUnitISOCode : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Quality Insp. Group'
  @Common.Heading : 'Quality Inspection Group'
  @Common.QuickInfo : 'Quality Inspection Group'
  EWMQualityInspectionGroup : String(4) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductEWMStorageType : Composition of many Product.ProductEWMStorageType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProdPlantInternationalTrade,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantCosting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantForecast,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantInspTypeSetting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantMRP,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantProcurement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantPurchaseTax,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantQualityManagement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantSales,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantStorage,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantStorageLocation,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantSupplyPlanning,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantWorkScheduling,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'Plant' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [
  '_ProdPlantInternationalTrade',
  '_Product',
  '_ProductPlantCosting',
  '_ProductPlantForecast',
  '_ProductPlantInspTypeSetting',
  '_ProductPlantMRP',
  '_ProductPlantProcurement',
  '_ProductPlantPurchaseTax',
  '_ProductPlantQualityManagement',
  '_ProductPlantSales',
  '_ProductPlantStorage',
  '_ProductPlantStorageLocation',
  '_ProductPlantSupplyPlanning',
  '_ProductPlantWorkScheduling'
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductMinControlTemperature,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMaxControlTemperature,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductControlTemperatureUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdCtrlTemperatureUnitISOCode,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlant {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductProfileCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Material Status'
  @Common.Heading : 'Plant-Specific Material Status'
  @Common.QuickInfo : 'Plant-Specific Material Status'
  ProfileCode : String(2) not null;
  @Common.Label : 'Valid From'
  @Common.QuickInfo : 'Date from Which the Plant-Specific Material Status Is Valid'
  ProfileValidityStartDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Fiscal Year Variant'
  @Common.Heading : 'FV'
  FiscalYearVariant : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductConsumptionPeriodType'
  @Common.IsUpperCase : true
  @Common.Label : 'Period Indicator'
  @Common.Heading : 'PI'
  PeriodType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Profit Center'
  @Common.Heading : 'Profit Ctr'
  ProfitCenter : String(10) not null;
  @Common.Label : 'DF at plant level'
  @Common.Heading : 'Pl'
  @Common.QuickInfo : 'Flag Material for Deletion at Plant Level'
  IsMarkedForDeletion : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Conf. Material'
  @Common.Heading : 'Configurable Material'
  @Common.QuickInfo : 'Configurable Material'
  ConfigurableProduct : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Stock Determ. Group'
  @Common.Heading : 'Stock Determination Group'
  @Common.QuickInfo : 'Stock determination group'
  StockDeterminationGroup : String(4) not null;
  @Common.Label : 'Batch Mgmt Rqt(Plnt)'
  @Common.Heading : 'BMR'
  @Common.QuickInfo : 'Batch Management Requirement Indicator for Plant'
  IsBatchManagementRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serial No. Profile'
  @Common.Heading : 'Profl.'
  @Common.QuickInfo : 'Serial Number Profile'
  SerialNumberProfile : String(4) not null;
  @Common.Label : 'Neg. Stocks In Plant'
  @Common.Heading : 'NS'
  @Common.QuickInfo : 'Negative stocks allowed in plant'
  IsNegativeStockAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Mat. CFOP category'
  @Common.Heading : 'MC'
  @Common.QuickInfo : 'Material CFOP category'
  ProductCFOPCategory : String(2) not null;
  @Common.Label : 'Is Excise Tax Relevant'
  @Common.QuickInfo : 'Excise Tax Relevance Indicator'
  ProductIsExciseTaxRelevant : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  GoodsIssueUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of issue in ISO'
  @Common.Heading : 'UII'
  @Common.QuickInfo : 'Unit of issue in ISO code'
  GoodsIssueISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Distr. profile'
  @Common.QuickInfo : 'Distribution profile of material in plant'
  DistrCntrDistributionProfile : String(3) not null;
  @Common.Label : 'Critical Part'
  @Common.Heading : 'Cri'
  @Common.QuickInfo : 'Indicator: Critical part'
  ProductIsCriticalPrt : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductLogisticsHandlingGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Log. handling group'
  @Common.Heading : 'LHG'
  @Common.QuickInfo : 'Logistics handling group for workload calculation'
  ProductLogisticsHandlingGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material Freight Grp'
  @Common.Heading : 'MatFrtGp'
  @Common.QuickInfo : 'Material Freight Group'
  ProductFreightGroup : String(8) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'OB Reference Materl'
  @Common.QuickInfo : 'Reference Material for Original Batches'
  OriginalBatchReferenceProduct : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'OB Management'
  @Common.Heading : 'OBM'
  @Common.QuickInfo : 'Indicator for Original Batch Management'
  OriglBatchManagementIsRequired : String(1) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Measures.Unit : ProductControlTemperatureUnit
  @Measures.UNECEUnit : ProdCtrlTemperatureUnitISOCode
  @Common.Label : 'Min. Temperature'
  @Common.Heading : 'Minimum Temperature'
  @Common.QuickInfo : 'Minimum Temperature'
  ProductMinControlTemperature : Decimal(7, 2) not null;
  @Measures.Unit : ProductControlTemperatureUnit
  @Measures.UNECEUnit : ProdCtrlTemperatureUnitISOCode
  @Common.Label : 'Max. Temperature'
  @Common.Heading : 'Maximum Temperature'
  @Common.QuickInfo : 'Maximum Temperature'
  ProductMaxControlTemperature : Decimal(7, 2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Temperature UoM'
  @Common.Heading : 'Unit of Measure of Temperatu'
  @Common.QuickInfo : 'Unit of Measure of Temperature'
  ProductControlTemperatureUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Control Temperature ISO Unit'
  ProdCtrlTemperatureUnitISOCode : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProdPlantInternationalTrade : Composition of one Product.ProductPlantInternationalTrade;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantCosting : Composition of one Product.ProductPlantCosting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantForecast : Composition of one Product.ProductPlantForecast;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantInspTypeSetting : Composition of many Product.ProductPlantInspTypeSetting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantMRP : Composition of many Product.ProductPlantMRP;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantProcurement : Composition of one Product.ProductPlantProcurement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantPurchaseTax : Composition of many Product.ProductPlantPurchaseTax;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantQualityManagement : Composition of one Product.ProductPlantQualityManagement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantSales : Composition of one Product.ProductPlantSales;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantStorage : Composition of one Product.ProductPlantStorage;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantStorageLocation : Composition of many Product.ProductPlantStorageLocation;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantSupplyPlanning : Composition of one Product.ProductPlantSupplyPlanning;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantWorkScheduling : Composition of one Product.ProductPlantWorkScheduling;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Costing'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: CostingLotSize,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantCosting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Label : 'Co-Product'
  IsCoProduct : Boolean not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Costing Lot Size'
  @Common.QuickInfo : 'Lot Size for Product Costing'
  CostingLotSize : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Group'
  @Common.QuickInfo : 'Key for Task List Group'
  TaskListGroup : String(8) not null;
  @Common.SAPObjectNodeTypeReference : 'BillOfOperationsType'
  @Common.IsUpperCase : true
  @Common.Label : 'Task List Type'
  @Common.Heading : 'TLType'
  TaskListType : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type for Costing'
  CostingSpecialProcurementType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Alternative BOM'
  @Common.Heading : 'AltBOM'
  SourceBOMAlternative : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'BOM Usage'
  @Common.Heading : 'BOM Usg'
  ProductBOMUsage : String(1) not null;
  @Common.Label : 'Do Not Cost'
  ProductIsCostingRelevant : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Group Counter'
  @Common.Heading : 'GrC'
  TaskListGroupCounter : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Variance Key'
  @Common.Heading : 'VarKey'
  VarianceKey : String(6) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Production Version'
  @Common.Heading : 'Ver.'
  @Common.QuickInfo : 'Production Version To Be Costed'
  CostingProductionVersion : String(4) not null;
  @Common.Label : 'Fixed-Price Co-Prod.'
  @Common.QuickInfo : 'Fixed-Price Co-Product'
  IsFixedPriceCoProduct : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Forecast'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantForecast {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Label : 'Date to'
  @Common.QuickInfo : 'To date of the material to be copied for consumption'
  ConsumptionRefUsageEndDate : Date;
  @Common.Label : 'Multiplier'
  @Common.QuickInfo : 'Multiplier for reference material for consumption'
  CnsmpnQuantityMultiplierValue : Decimal(4, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'RefMatl: consumption'
  @Common.Heading : 'Consumable mat.'
  @Common.QuickInfo : 'Reference material for consumption'
  ConsumptionReferenceProduct : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'RefPlant:consumption'
  @Common.Heading : 'CNPL'
  @Common.QuickInfo : 'Reference plant for consumption'
  ConsumptionReferencePlant : String(4) not null;
  @Common.Label : 'Correction factors'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Indicator: take correction factors into account'
  CorrectionFactorIsRequired : Boolean not null;
  @Common.Label : 'Reset automatically'
  @Common.QuickInfo : 'Reset Forecast Model Automatically'
  ForecastModelIsReset : Boolean not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Inspection Type Settings'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantInspTypeSetting {
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Inspection Type'
  @Common.Heading : 'InspType'
  key InspectionLotType : String(8) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Label : 'Insp. with Task List'
  @Common.Heading : 'List'
  @Common.QuickInfo : 'Inspection with Task List'
  InspLotIsTaskListRequired : Boolean not null;
  @Common.Label : 'Insp. with Mat Spec.'
  @Common.QuickInfo : 'Inspect with Material Specification'
  InspLotHasMaterialSpec : Boolean not null;
  @Common.Label : 'Insp. by Configuratn'
  @Common.QuickInfo : 'Inspection Specifications from Configuration'
  InspLotHasConfignSpecification : Boolean not null;
  @Common.Label : 'Inspect by Batch'
  @Common.QuickInfo : 'Inspection Specifications from Batch Determination'
  InspLotHasBatchCharc : Boolean not null;
  @Common.Label : 'Automatic Assignment'
  @Common.Heading : 'APlS'
  @Common.QuickInfo : 'Automatic Specification Assignment'
  InspLotHasAutomSpecAssgmt : Boolean not null;
  @Common.Label : 'Inspect Charcs'
  @Common.Heading : 'ChIn'
  @Common.QuickInfo : 'Inspect by Characteristics'
  InspLotHasCharc : Boolean not null;
  @Common.Label : 'Post to Insp. Stock'
  @Common.Heading : 'I'
  @Common.QuickInfo : 'Post to Inspection Stock'
  HasPostToInspectionStock : Boolean not null;
  @Common.Label : 'Automatic UD'
  @Common.Heading : 'Auto UD'
  @Common.QuickInfo : 'Automatic Usage Decision Planned'
  InspLotIsAutomUsgeDcsnPossible : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Sampling Procedure'
  @Common.Heading : 'Prc'
  SamplingProcedure : String(8) not null;
  @Common.SAPObjectNodeTypeReference : 'InspectionLotDynamicRule'
  @Common.IsUpperCase : true
  @Common.Label : 'Modification Rule'
  @Common.Heading : 'DynR'
  @Common.QuickInfo : 'Dynamic Modification Rule'
  InspLotDynamicRule : String(3) not null;
  @Common.Label : 'Insp. percentage'
  @Common.Heading : 'Ins%'
  @Common.QuickInfo : 'Inspection Percentage'
  InspLotSampleQuantityInPercent : Decimal(precision: 3) not null;
  @Common.Label : '100% Inspection'
  @Common.Heading : '100%'
  InspectionLotIsFullInspection : Boolean not null;
  @Common.Label : 'Skips Allowed'
  @Common.Heading : 'Skip'
  InspLotSkipIsAllowed : Boolean not null;
  @Common.Label : 'Manual Sample Entry'
  @Common.Heading : 'MSE'
  @Common.QuickInfo : 'Enter Sample Manually'
  InspLotHasManualSampleSize : Boolean not null;
  @Common.Label : 'Manual Sample Calc.'
  @Common.Heading : 'MTC'
  @Common.QuickInfo : 'Trigger Sample Calculation Manually'
  InspLotIsSmplCalcMnlTriggered : Boolean not null;
  @Common.Label : 'Serial Numbers Poss.'
  @Common.Heading : 'SerN'
  @Common.QuickInfo : 'Serial Numbers Possible for Inspection Lot'
  InspLotIsSerialNmbrPossible : Boolean not null;
  @Common.Label : 'Avg. Insp. Duration'
  @Common.Heading : 'AInD'
  @Common.QuickInfo : 'Average Inspection Duration'
  InspLotDurationInDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'InspectionLotSummaryControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Control Lot Creation'
  @Common.Heading : 'LtCtl'
  @Common.QuickInfo : 'Control of Inspection Lot Creation (Lot Summary)'
  InspLotSummaryControl : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Q-Score Procedure'
  @Common.Heading : 'QSc'
  @Common.QuickInfo : 'Procedure for Calculating Quality Score'
  InspQualityScoreProcedure : String(2) not null;
  @Common.Label : 'Allowed Scrap Share'
  @Common.Heading : 'Scrap%'
  @Common.QuickInfo : 'Allowed Share of Scrap (Percent) in Inspection Lot'
  InspLotAcceptedScrapRatioInPct : Decimal(6, 4) not null;
  @Common.Label : 'Individual QM Order'
  @Common.Heading : 'InOr'
  @Common.QuickInfo : 'Record Appraisal Costs in Individual QM Order'
  InspectionLotHasAppraisalCosts : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Order'
  @Common.QuickInfo : 'Order Number for Recording Appraisal Costs'
  QualityCostCollector : String(12) not null;
  @Common.Label : 'InspType-Matl Active'
  @Common.Heading : 'Act'
  @Common.QuickInfo : 'Inspection Type - Material Combination Is Active'
  ProdInspTypeSettingIsActive : Boolean not null;
  @Common.Label : 'Preferred Insp. Type'
  @Common.Heading : 'Prf'
  @Common.QuickInfo : 'Preferred Inspection Type'
  InspTypeIsPrfrd : Boolean not null;
  @Common.Label : 'Inspection for HU'
  @Common.Heading : 'HU'
  @Common.QuickInfo : 'Inspection for Handling Unit'
  InspLotHasHandlingUnit : Boolean not null;
  @Common.Label : 'Multiple Specs'
  @Common.Heading : 'Indicator: Multiple Specifications'
  @Common.QuickInfo : 'Indicator: Multiple Specifications'
  InspLotHasMultipleSpec : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'InspLotOfEWMSummaryControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Insp. Lot Summary'
  @Common.Heading : 'Inspection Lot Summary (Warehouse-Managed Stock)'
  @Common.QuickInfo : 'Inspection Lot Summary (Warehouse-Managed Stock)'
  InspLotOfEWMSummaryControl : String(1) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant International Trade'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantInternationalTrade {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Country/Region of Origin'
  @Common.QuickInfo : 'Country/Region of Origin of Product'
  CountryOfOrigin : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Region of Origin'
  @Common.Heading : 'ROr'
  RegionOfOrigin : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Control Code'
  @Common.QuickInfo : 'Control code for consumption taxes in foreign trade'
  ConsumptionTaxCtrlCode : String(16) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Intrastat Group'
  @Common.Heading : 'IntraGrp'
  @Common.QuickInfo : 'Material Group for Intrastat'
  ExportAndImportProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CAS number (pharm.)'
  @Common.Heading : 'CAS no.'
  @Common.QuickInfo : 'CAS number for pharmaceutical products in foreign trade'
  ProductCASNumber : String(15) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'PRODCOM no.'
  @Common.QuickInfo : 'Production statistics: PRODCOM number for foreign trade'
  ProdIntlTradeClassification : String(9) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant MRP'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ReorderThresholdQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeRoundingQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FixedLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeIndependentCosts,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantMRP {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Area'
  key MRPArea : String(10) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Area Plant'
  @Common.Heading : 'Plnt'
  @Common.QuickInfo : 'MRP Area: Plant'
  key Plant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPType'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Type'
  @Common.Heading : 'Typ'
  MRPType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  @Common.Heading : 'MRPCn'
  MRPResponsible : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Group'
  @Common.Heading : 'MRP'
  MRPGroup : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Cycle'
  @Common.Heading : 'PCy'
  PlanAndOrderDayDetermination : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Planning time fence'
  PlanningTimeFence : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lot Sizing Procedure'
  @Common.QuickInfo : 'Lot Sizing Procedure in Materials Planning'
  LotSizingProcedure : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Rounding value'
  @Common.Heading : 'Rounding val.'
  @Common.QuickInfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Lot Size'
  @Common.Heading : 'Min. Lot Sze'
  MinimumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Lot Size'
  @Common.Heading : 'Max. Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Stock Level'
  @Common.Heading : 'Max. Level'
  MaximumStockQuantity : Decimal(13, 3) not null;
  @Common.Label : 'Assembly scrap (%)'
  @Common.Heading : 'A.scrap'
  @Common.QuickInfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement'
  @Common.Heading : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type'
  ProcurementSubType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Storage Location for External Procurement'
  @Common.QuickInfo : 'Default Storage Location for External Procurement'
  DfltStorageLocationExtProcmt : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  MRPPlanningCalendar : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkRangeOfCoverageProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Coverage Profile'
  @Common.Heading : 'Range-of-Coverage Profile'
  @Common.QuickInfo : 'Range-of-Coverage Profile'
  RangeOfCvrgPrflCode : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Safety Time'
  @Common.Heading : 'SafetyTime'
  @Common.QuickInfo : 'Safety Time (in Workdays)'
  SafetySupplyDurationInDays : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Fixed lot size'
  @Common.Heading : 'Fix. lot size'
  FixedLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'LS-Independent Costs'
  @Common.Heading : 'LSI Costs'
  @Common.QuickInfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(precision: 11) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageCostsPercentageCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Costs Code'
  @Common.Heading : 'Key'
  @Common.QuickInfo : 'Storage Costs Percentage Code'
  StorageCostsPercentageCode : String(1) not null;
  @Common.Label : 'Service level (%)'
  @Common.Heading : 'SLev'
  @Common.QuickInfo : 'Service level'
  ProductServiceLevelInPercent : Decimal(3, 1) not null;
  @Common.Label : 'Deletion Indicator'
  @Common.Heading : 'D'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkSafetyTimePeriodProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Time Profile'
  @Common.Heading : 'Safety Time Period Profile'
  @Common.QuickInfo : 'Period Profile for Safety Time'
  SafetyTimePeriodProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Relevant'
  @Common.Heading : 'MRP-Relevant Dependent Requirements'
  @Common.QuickInfo : 'MRP relevancy for dependent requirements'
  DependentRqmtMRPRelevance : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Time Ind'
  @Common.Heading : 'Safety Time Indicator'
  @Common.QuickInfo : 'Safety Time Indicator (with or Without Safety Time)'
  ProductSafetyTimeMRPRelevance : String(1) not null;
  @Common.Label : 'Planned Deliv. Time'
  @Common.Heading : 'PDT'
  @Common.QuickInfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(precision: 3) not null;
  @Common.Label : 'Consider PlDelTime'
  @Common.QuickInfo : 'Consider Planned Delivery Time of the MRP Area'
  IsPlannedDeliveryTime : Boolean not null;
  @Common.Label : 'Takt time'
  @Common.Heading : 'TT'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductSafetyStockMethod'
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Stock Method'
  @Common.QuickInfo : 'MRP Safety Stock Method'
  MRPSafetyStockMethod : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Procurement'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantProcurement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Label : 'Automatic PO'
  @Common.Heading : 'Aut'
  @Common.QuickInfo : 'Indicator: "automatic purchase order allowed"'
  IsAutoPurOrdCreationAllowed : Boolean not null;
  @Common.Label : 'Source list'
  @Common.QuickInfo : 'Indicator: Source list requirement'
  IsSourceListRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'JIT Delivery'
  @Common.Heading : 'JIT Delivery Schedules'
  @Common.QuickInfo : 'JIT Delivery Schedules'
  JustInTimeDeliveryScheduleCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Purchasing Group'
  @Common.Heading : 'PGr'
  PurchasingGroup : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Source of supply'
  @Common.Heading : 'S'
  @Common.QuickInfo : 'Source of Supply'
  SourceOfSupplyCategory : String(1) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Purchase Tax'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantPurchaseTax {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Departure Ctry/Reg.'
  @Common.Heading : 'DeCR'
  @Common.QuickInfo : 'Departure Country/Region (from which the goods are sent)'
  key DepartureCountry : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Tax ind. f. material'
  @Common.Heading : 'Material'
  @Common.QuickInfo : 'Tax indicator for material (Purchasing)'
  ProdPurchaseTaxClassification : String(1) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Quality Management'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantQualityManagement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Control Key'
  @Common.Heading : 'Ctrl Key'
  @Common.QuickInfo : 'Control Key for Quality Management in Procurement'
  ProdQltyManagementControlKey : String(8) not null;
  @Common.Label : 'Post to insp. stock'
  @Common.Heading : 'I'
  @Common.QuickInfo : 'Has Post to Inspection Stock'
  HasPostToInspectionStock : Boolean not null;
  @Common.Label : 'Documentation reqd'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Documentation required indicator'
  InspLotDocumentationIsRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Target QM System'
  @Common.QuickInfo : 'Required QM System for Supplier'
  QualityMgmtSystemForSupplier : String(4) not null;
  @Common.Label : 'Inspection Interval'
  @Common.Heading : 'InspIn'
  @Common.QuickInfo : 'Interval Until Next Recurring Inspection'
  RecrrgInspIntervalTimeInDays : Decimal(precision: 5) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Certificate Type'
  @Common.Heading : 'CTyp'
  ProductQualityCertificateType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Material Auth.'
  @Common.Heading : 'QMatAu'
  @Common.QuickInfo : 'Material Authorization Group for Activities in QM'
  ProdQualityAuthorizationGroup : String(6) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Sales'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: CapPlanningQuantityInBaseUoM,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantSales {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'LoadingGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Loading Group'
  @Common.Heading : 'LGrp'
  LoadingGroup : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Base quantity'
  @Common.QuickInfo : 'Base quantity for capacity planning in shipping'
  CapPlanningQuantityInBaseUoM : Decimal(13, 3) not null;
  @Common.Label : 'Processing time'
  @Common.Heading : 'PrTime'
  @Common.QuickInfo : 'Shipping processing time'
  ProdShipgProcgDurationInDays : Decimal(5, 2) not null;
  @Common.Label : 'Setup time'
  @Common.Heading : 'Setup'
  @Common.QuickInfo : 'Shipping setup time'
  WrkCentersShipgSetupTimeInDays : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductReplacementPartType'
  @Common.IsUpperCase : true
  @Common.Label : 'Replacement Part'
  @Common.Heading : 'R'
  @Common.QuickInfo : 'Replacement part'
  ReplacementPartType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Availability check'
  @Common.Heading : 'Av'
  @Common.QuickInfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Storage'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MaximumStoragePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdMaximumStoragePeriodUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStoragePeriodISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantStorage {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CC Phys. Inv. Ind.'
  @Common.Heading : 'CC'
  @Common.QuickInfo : 'Physical Inventory Indicator for Cycle Counting'
  PhysInventoryForCycleCounting : String(1) not null;
  @Measures.Unit : ProdMaximumStoragePeriodUnit
  @Measures.UNECEUnit : MaximumStoragePeriodISOUnit
  @Common.Label : 'Max. Storage Period'
  @Common.Heading : 'Stor.'
  @Common.QuickInfo : 'Maximum Storage Period'
  MaximumStoragePeriod : Decimal(precision: 5) not null;
  @Common.IsUnit : true
  @Common.Label : 'Time unit'
  @Common.Heading : 'TUn'
  @Common.QuickInfo : 'Unit for maximum storage period'
  ProdMaximumStoragePeriodUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Time unit ISO'
  @Common.Heading : 'TmI'
  @Common.QuickInfo : 'Unit for the maximum storage period in ISO code'
  MaximumStoragePeriodISOUnit : String(3) not null;
  @Common.Label : 'CC indicator fixed'
  @Common.Heading : 'CC fix'
  @Common.QuickInfo : 'CC indicator is fixed'
  CycleCountingIndicatorIsFixed : Boolean not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Storage Location'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductPlantStorageLocation {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  key StorageLocation : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Bin'
  @Common.Heading : 'Bin'
  WarehouseStorageBin : String(10) not null;
  @Common.Label : 'DF stor. loc. level'
  @Common.Heading : 'SL'
  @Common.QuickInfo : 'Flag Material for Deletion at Storage Location Level'
  IsMarkedForDeletion : Boolean not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Supply Planning'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: FixedLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeRoundingQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumSafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ReorderThresholdQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeIndependentCosts,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantSupplyPlanning {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Fixed lot size'
  @Common.Heading : 'Fix. lot size'
  FixedLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Lot Size'
  @Common.Heading : 'Max. Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Lot Size'
  @Common.Heading : 'Min. Lot Sze'
  MinimumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Rounding value'
  @Common.Heading : 'Rounding val.'
  @Common.QuickInfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lot Sizing Procedure'
  @Common.QuickInfo : 'Lot Sizing Procedure in Materials Planning'
  LotSizingProcedure : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPType'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Type'
  @Common.Heading : 'Typ'
  MRPType : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPController'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  @Common.Heading : 'MRPCn'
  MRPResponsible : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Min. Saf. Stock'
  @Common.Heading : 'Minimum Safety Stock'
  @Common.QuickInfo : 'Minimum Safety Stock'
  MinimumSafetyStockQuantity : Decimal(13, 3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Planning time fence'
  PlanningTimeFence : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdConsumptionValueCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'ABC Indicator'
  @Common.Heading : 'ABC'
  ConsumptionValueCategory : String(1) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Stock Level'
  @Common.Heading : 'Max. Level'
  MaximumStockQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3) not null;
  @Common.Label : 'Planned Deliv. Time'
  @Common.Heading : 'PDT'
  @Common.QuickInfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(precision: 3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Safety Time'
  @Common.Heading : 'SafetyTime'
  @Common.QuickInfo : 'Safety Time (in Workdays)'
  SafetySupplyDurationInDays : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Strategy Group'
  @Common.Heading : 'SG'
  @Common.QuickInfo : 'Planning Strategy Group'
  PlanningStrategyGroup : String(2) not null;
  @Common.Label : 'Tot. repl. lead time'
  @Common.Heading : 'TRLT'
  @Common.QuickInfo : 'Total replenishment lead time (in workdays)'
  TotalReplenishmentLeadTime : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementType'
  @Common.IsUpperCase : true
  @Common.Label : 'Procurement Type'
  @Common.Heading : 'ProcType'
  ProcurementType : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement'
  @Common.Heading : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type'
  ProcurementSubType : String(2) not null;
  @Common.Label : 'Assembly scrap (%)'
  @Common.Heading : 'A.scrap'
  @Common.QuickInfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Availability check'
  @Common.Heading : 'Av'
  @Common.QuickInfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2) not null;
  @Common.Label : 'GR processing time'
  @Common.Heading : 'GRT'
  @Common.QuickInfo : 'Goods receipt processing time in days'
  GoodsReceiptDuration : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Cycle'
  @Common.Heading : 'PCy'
  PlanAndOrderDayDetermination : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Storage Location for External Procurement'
  @Common.QuickInfo : 'Default Storage Location for External Procurement'
  DfltStorageLocationExtProcmt : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Group'
  @Common.Heading : 'MRP'
  MRPGroup : String(4) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'LS-Independent Costs'
  @Common.Heading : 'LSI Costs'
  @Common.QuickInfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(precision: 11) not null;
  @Common.Label : 'Takt time'
  @Common.Heading : 'TT'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  MRPPlanningCalendar : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkRangeOfCoverageProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Coverage Profile'
  @Common.Heading : 'Range-of-Coverage Profile'
  @Common.QuickInfo : 'Range-of-Coverage Profile'
  RangeOfCvrgPrflCode : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Time Ind'
  @Common.Heading : 'Safety Time Indicator'
  @Common.QuickInfo : 'Safety Time Indicator (with or Without Safety Time)'
  ProductSafetyTimeMRPRelevance : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkSafetyTimePeriodProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Time Profile'
  @Common.Heading : 'Safety Time Period Profile'
  @Common.QuickInfo : 'Period Profile for Safety Time'
  SafetyTimePeriodProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Relevant'
  @Common.Heading : 'MRP-Relevant Dependent Requirements'
  @Common.QuickInfo : 'MRP relevancy for dependent requirements'
  DependentRqmtMRPRelevance : String(1) not null;
  @Common.Label : 'Service level (%)'
  @Common.Heading : 'SLev'
  @Common.QuickInfo : 'Service level'
  ProductServiceLevelInPercent : Decimal(3, 1) not null;
  @Common.Label : 'In-house production'
  @Common.Heading : 'IPT'
  @Common.QuickInfo : 'In-house production time'
  ProdInhProdnDurationInWorkDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPAvailabilityType'
  @Common.IsUpperCase : true
  @Common.Label : 'Mixed MRP'
  @Common.Heading : 'Mx'
  @Common.QuickInfo : 'Mixed MRP indicator'
  MRPAvailabilityType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cross-Project'
  @Common.Heading : 'Cross-Project Material'
  @Common.QuickInfo : 'Indicator for Cross-Project Material'
  CrossProjectProduct : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageCostsPercentageCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Costs Code'
  @Common.Heading : 'Key'
  @Common.QuickInfo : 'Storage Costs Percentage Code'
  StorageCostsPercentageCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Follow-Up Material'
  FollowUpProduct : String(18) not null;
  @Common.Label : 'Repetitive Manufacturing Enabled'
  RepetitiveManufacturingIsAllwd : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProdDependentRequirementsType'
  @Common.IsUpperCase : true
  @Common.Label : 'Indiv./ Coll.'
  @Common.Heading : 'Individual/ Collective Requirements'
  @Common.QuickInfo : 'Indicator for Individual and Collective Requirements'
  DependentRequirementsType : String(1) not null;
  @Common.Label : 'Bulk Material'
  @Common.Heading : 'Bulk'
  @Common.QuickInfo : 'Indicator: Bulk Material'
  ProductIsBulkComponent : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'RepetitiveManufacturingProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Repetitive Manufacturing Profile'
  RepetitiveManufacturingProfile : String(4) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Backward Consumption Period'
  @Common.QuickInfo : 'Consumption Period: Backward'
  BackwardCnsmpnPeriodInWorkDays : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Forward Consumption Period'
  @Common.QuickInfo : 'Consumption period: Forward'
  FwdConsumptionPeriodInWorkDays : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdRqmtsConsumptionMode'
  @Common.IsUpperCase : true
  @Common.Label : 'Consumption mode'
  ProdRqmtsConsumptionMode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Splitting Indicator'
  ProdFcstRequirementsSplitCode : String(1) not null;
  @Common.Label : 'Effective-Out Date'
  EffectiveOutDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Scheduling Float Profile'
  @Common.QuickInfo : 'Scheduling Profile for Floats'
  SchedulingFloatProfile : String(3) not null;
  @Common.Label : 'Component Scrap (%)'
  @Common.Heading : 'C.scrap'
  @Common.QuickInfo : 'Component Scrap in Percent'
  ComponentScrapInPercent : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Discontinuation ind.'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Discontinuation indicator'
  ProductDiscontinuationCode : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdRequirementsGroupingCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Requirements group'
  @Common.Heading : 'G'
  @Common.QuickInfo : 'Indicator for Requirements Grouping'
  ProductRequirementsGrouping : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductComponentBackflushCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Backflush'
  @Common.Heading : 'B'
  @Common.QuickInfo : 'Indicator: Backflush'
  ProductComponentBackflushCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Proposed Supply Area'
  @Common.QuickInfo : 'Proposed Supply Area in Material Master Record'
  ProposedProductSupplyArea : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductSafetyStockMethod'
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Stock Method'
  @Common.QuickInfo : 'MRP Safety Stock Method'
  MRPSafetyStockMethod : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'JIT Production Confirmation Profile'
  JITProdnConfProfile : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  ProdnPlngAndControlCalendar : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Consign.Control'
  @Common.Heading : 'Consignment Control'
  @Common.QuickInfo : 'Consignment Control'
  ConsignmentControl : String(1) not null;
  @Common.Label : 'Availability Check Horizon'
  ATPCheckHorizonInDays : Decimal(precision: 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Calendar for Validating Check Horizon'
  @Common.Heading : 'Calendar for Validating Availability Check Horizon'
  @Common.QuickInfo : 'Calendar for Validating Availability Check Horizon'
  ATPCheckHorizonFactoryCalendar : String(2) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Work Scheduling'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductPlant' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductBaseQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductPlantWorkScheduling {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Base quantity'
  ProductBaseQuantity : Decimal(13, 3) not null;
  @Common.Label : 'Unltd Overdelivery'
  @Common.Heading : 'Unl'
  @Common.QuickInfo : 'Indicator: Unlimited Overdelivery Allowed'
  UnlimitedOverDelivIsAllowed : Boolean not null;
  @Common.Label : 'Overdelivery Toler.'
  @Common.Heading : 'OTol'
  @Common.QuickInfo : 'Overdelivery Tolerance Limit'
  OverDeliveryTolerancePercent : Decimal(3, 1) not null;
  @Common.Label : 'Underdelivery Toler.'
  @Common.Heading : 'UTol'
  @Common.QuickInfo : 'Underdelivery Tolerance Limit'
  UnderDeliveryTolerancePercent : Decimal(3, 1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductionOrderBatchCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Batch entry'
  @Common.Heading : 'Bch'
  @Common.QuickInfo : 'Determination of batch entry in the production/process order'
  ProductionOrderBatchCode : String(1) not null;
  @Common.Label : 'Withdr.from prod.bin'
  @Common.Heading : 'PBn'
  @Common.QuickInfo : 'Indicator: withdrawal of stock from production bin'
  ProdIsWithdrawnFrmProdnBin : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material Grouping'
  @Common.QuickInfo : 'Group of Materials for Transition Matrix'
  TransitionMatrixProductsGroup : String(20) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Change overall prof.'
  @Common.QuickInfo : 'Overall profile for order change management'
  OrderChangeManagementProfile : String(6) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductComponentBackflushCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Backflush'
  @Common.Heading : 'B'
  @Common.QuickInfo : 'Indicator: Backflush'
  ProductComponentBackflushCode : String(1) not null;
  @Common.Label : 'Setup time'
  @Common.Heading : 'SetupT'
  @Common.QuickInfo : 'Setup and teardown time'
  SetupAndTeardownTime : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductionSchedulingProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Production Scheduling Profile'
  ProductionSchedulingProfile : String(6) not null;
  @Common.Label : 'Interoperation'
  @Common.Heading : 'Interop'
  @Common.QuickInfo : 'Interoperation time'
  TransitionTime : Decimal(5, 2) not null;
  @Common.Label : 'Processing time'
  @Common.Heading : 'PrTime'
  ProcessingTimeInDays : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Prodn Supervisor'
  @Common.Heading : 'ProdS'
  @Common.QuickInfo : 'Production Supervisor'
  ProductionSupervisor : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  ProductProductionQuantityUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Prod. unit (ISO)'
  @Common.Heading : 'PUnI'
  @Common.QuickInfo : 'Production Unit in ISO Code'
  ProdProductionQuantityISOUnit : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one Product.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Procurement'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductProcurement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  PurchaseOrderQuantityUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Order unit in ISO'
  @Common.Heading : 'OUI'
  @Common.QuickInfo : 'Order unit in ISO code'
  PurchaseOrderQuantityISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Var. Order Unit'
  @Common.Heading : 'V'
  @Common.QuickInfo : 'Variable Purchase Order Unit Active'
  VarblPurOrdUnitStatus : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Purchasing value key'
  @Common.Heading : 'PV key'
  @Common.QuickInfo : 'Purchasing Value Key'
  PurchasingAcknProfile : String(4) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Quality Management'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductQualityManagement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.Label : 'QM in Procur. Active'
  @Common.Heading : 'QM'
  @Common.QuickInfo : 'QM in Procurement Is Active'
  QltyMgmtInProcmtIsActive : Boolean not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: AllowedPackagingWeightQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingWeightQtyUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllwdPackagingWeightQtyISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingVolumeQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingVolumeQtyUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllwdPackagingVolumeQtyISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductSales {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'X-DChain Status'
  @Common.Heading : 'Cross-Distribution-Chain Material Status'
  @Common.QuickInfo : 'Cross-Distribution-Chain Material Status'
  SalesStatus : String(2) not null;
  @Common.Label : 'Cross-Distr. Chain Product Validity'
  @Common.Heading : 'Valid from'
  @Common.QuickInfo : 'Date from which the X-distr.-chain Product status is valid'
  SalesStatusValidityDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Transportation Group'
  @Common.Heading : 'TGroup'
  TransportationGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Packaging Material Type'
  PackagingProductType : String(4) not null;
  @Measures.Unit : AllowedPackagingWeightQtyUnit
  @Measures.UNECEUnit : AllwdPackagingWeightQtyISOUnit
  @Common.Label : 'Allowed Pkg wt'
  @Common.Heading : 'AllowedWeight'
  @Common.QuickInfo : 'Allowed packaging weight'
  AllowedPackagingWeightQty : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Allowed Packaging Unit of Weight'
  @Common.Heading : 'Un.'
  @Common.QuickInfo : 'Unit of weight (allowed packaging weight)'
  AllowedPackagingWeightQtyUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  AllwdPackagingWeightQtyISOUnit : String(3) not null;
  @Measures.Unit : AllowedPackagingVolumeQtyUnit
  @Measures.UNECEUnit : AllwdPackagingVolumeQtyISOUnit
  @Common.Label : 'Allowed Volume'
  @Common.Heading : 'Allowed vol.'
  @Common.QuickInfo : 'Allowed packaging volume'
  AllowedPackagingVolumeQty : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Allowed Packaging Unit of Volume'
  @Common.Heading : 'VUn'
  @Common.QuickInfo : 'Volume unit (allowed packaging volume)'
  AllowedPackagingVolumeQtyUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  AllwdPackagingVolumeQtyISOUnit : String(3) not null;
  @Common.Label : 'Maximum level'
  @Common.Heading : 'MxL'
  @Common.QuickInfo : 'Maximum level (by volume)'
  MaximumLevelByVolumeInPercent : Decimal(precision: 3) not null;
  @Common.Label : 'Excess Weight Tolerance'
  @Common.QuickInfo : 'Excess Weight Tolerance for Handling unit'
  ExcessWeightToleranceValue : Decimal(3, 1) not null;
  @Common.Label : 'Closed'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Packaging Material is Closed Packaging'
  PackggProductIsClosedPackaging : Boolean not null;
  @Common.Label : 'Stackability factor'
  @Common.Heading : 'StFtr'
  @Common.QuickInfo : 'Stacking factor'
  ProductStackingFactor : Integer not null;
  @Common.Label : 'Excess Volume Tolerance'
  @Common.QuickInfo : 'Excess Volume Tolerance of the Handling Unit'
  ProdExcessVolumeToleranceValue : Decimal(3, 1) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales Delivery'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProdSalesDeliverySalesTax,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'ProductSalesOrg', 'ProductDistributionChnl' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_ProdSalesDeliverySalesTax', '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MinimumOrderQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryNoteProcMinDelivQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantityUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantityISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductSalesDelivery {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Sales Organization'
  @Common.Heading : 'SOrg.'
  key ProductSalesOrg : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Distribution Channel'
  @Common.Heading : 'DChl'
  key ProductDistributionChnl : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum order qty'
  @Common.Heading : 'Min.order qty'
  @Common.QuickInfo : 'Minimum order quantity in base unit of measure'
  MinimumOrderQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Delivering Plant'
  @Common.Heading : 'Plnt'
  SupplyingPlant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MaterialPricingGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Price Group'
  @Common.Heading : 'PPG'
  @Common.QuickInfo : 'Product Pricing Group'
  PriceSpecificationProductGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Acct Assmt Grp Mat.'
  @Common.Heading : 'AAGM'
  @Common.QuickInfo : 'Account Assignment Group for Material'
  AccountDetnProductGroup : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Delivery Qty'
  @Common.Heading : 'Min. Dely Qty'
  @Common.QuickInfo : 'Minimum Delivery Quantity in Delivery Note Processing'
  DeliveryNoteProcMinDelivQty : Decimal(13, 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductItemCategoryGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Item Category Group'
  @Common.Heading : 'ItCGr'
  @Common.QuickInfo : 'Item Category Group from Material Master'
  ItemCategoryGroup : String(4) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit Of Measure'
  @Common.Heading : 'Unit'
  @Common.QuickInfo : 'Unit Of Measure Of Delivery Unit'
  DeliveryQuantityUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  DeliveryQuantityISOUnit : String(3) not null;
  @Measures.Unit : DeliveryQuantityUnit
  @Measures.UNECEUnit : DeliveryQuantityISOUnit
  @Common.Label : 'Delivery unit'
  DeliveryQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DChain-spec. status'
  @Common.Heading : 'St'
  @Common.QuickInfo : 'Distribution-chain-specific material status'
  ProductSalesStatus : String(2) not null;
  @Common.Label : 'Valid from'
  @Common.Heading : 'ValidFrom'
  @Common.QuickInfo : 'Date from which distr.-chain-spec. material status is valid'
  ProductSalesStatusValidityDate : Date;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  SalesMeasureUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  SalesMeasureISOUnit : String(3) not null;
  @Common.Label : 'DF distr. chain lvl'
  @Common.Heading : 'DCh'
  @Common.QuickInfo : 'Ind.: Flag material for deletion at distribution chain level'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup1'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 1'
  @Common.Heading : 'PG 1'
  FirstSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup2'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 2'
  @Common.Heading : 'PG 2'
  SecondSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup3'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 3'
  @Common.Heading : 'PG 3'
  ThirdSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup4'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 4'
  @Common.Heading : 'PG 4'
  FourthSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup5'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 5'
  @Common.Heading : 'PG 5'
  FifthSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MaterialStatisticsGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Matl statistics grp'
  @Common.Heading : 'Material statistics group'
  @Common.QuickInfo : 'Material statistics group'
  LogisticsStatisticsGroup : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Volume Rebate Group'
  @Common.Heading : 'VRG'
  @Common.QuickInfo : 'Volume rebate group'
  VolumeRebateGroup : String(2) not null;
  @Common.Label : 'Cash Discount'
  @Common.Heading : 'CDc'
  @Common.QuickInfo : 'Cash Discount Indicator'
  CashDiscountIsDeductible : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Common.Label : 'Sales unit not var.'
  @Common.Heading : 'S'
  @Common.QuickInfo : 'Variable Sales Unit Not Allowed'
  VariableSalesUnitIsNotAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Commission Group'
  @Common.Heading : 'Com'
  ProductCommissionGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Pricing Ref. Matl'
  @Common.QuickInfo : 'Pricing Reference Material'
  PricingReferenceProduct : String(18) not null;
  @Common.Label : 'Product Attribute 1'
  @Common.QuickInfo : 'ID for product attribute 1'
  ProductHasAttributeID01 : Boolean not null;
  @Common.Label : 'Product Attribute 2'
  @Common.QuickInfo : 'ID for product attribute 2'
  ProductHasAttributeID02 : Boolean not null;
  @Common.Label : 'Product Attribute 3'
  @Common.QuickInfo : 'ID for product attribute 3'
  ProductHasAttributeID03 : Boolean not null;
  @Common.Label : 'Product Attribute 4'
  @Common.QuickInfo : 'ID for product attribute 4'
  ProductHasAttributeID04 : Boolean not null;
  @Common.Label : 'Product Attribute 5'
  @Common.QuickInfo : 'ID for product attribute 5'
  ProductHasAttributeID05 : Boolean not null;
  @Common.Label : 'Product Attribute 6'
  @Common.QuickInfo : 'ID for product attribute 6'
  ProductHasAttributeID06 : Boolean not null;
  @Common.Label : 'Product Attribute 7'
  @Common.QuickInfo : 'ID for product attribute 7'
  ProductHasAttributeID07 : Boolean not null;
  @Common.Label : 'Product Attribute 8'
  @Common.QuickInfo : 'ID for product attribute 8'
  ProductHasAttributeID08 : Boolean not null;
  @Common.Label : 'Product Attribute 9'
  @Common.QuickInfo : 'ID for product attribute 9'
  ProductHasAttributeID09 : Boolean not null;
  @Common.Label : 'Product Attribute 10'
  @Common.QuickInfo : 'ID for product attribute 10'
  ProductHasAttributeID10 : Boolean not null;
  @Common.Label : 'Rel. Entitlement Gen'
  @Common.QuickInfo : 'Relevant for Entitlement Generation'
  ProdIsEntlmntRlvt : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProdSalesDeliverySalesTax : Composition of many Product.ProdSalesDeliverySalesTax;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Storage'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: HazardousProduct,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: NmbrOfGROrGISlipsToPrintQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductStorage {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage conditions'
  @Common.Heading : 'SC'
  StorageConditions : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Temp. conditions'
  @Common.Heading : 'Temp'
  @Common.QuickInfo : 'Temperature conditions indicator'
  ProdTemperatureConditionCode : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Haz. material number'
  @Common.Heading : 'Haz. material no.'
  @Common.QuickInfo : 'Hazardous material number'
  HazardousProduct : String(18) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'GR slips quantity'
  @Common.Heading : 'Number of GR slips'
  @Common.QuickInfo : 'Quantity: Number of GR/GI slips to be printed'
  NmbrOfGROrGISlipsToPrintQty : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Label type'
  @Common.Heading : 'LT'
  LabelType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Label form'
  @Common.Heading : 'LF'
  LabelForm : String(2) not null;
  @Common.Label : 'Min. Rem. Shelf Life'
  @Common.Heading : 'RShLi'
  @Common.QuickInfo : 'Minimum Remaining Shelf Life'
  MinRemainingShelfLife : Decimal(precision: 4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Expiration Date'
  ProductExpirationDateType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Container reqmts'
  @Common.Heading : 'CR'
  @Common.QuickInfo : 'Container requirements'
  StorageBinInstruction : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ShelfLifeExpirationDatePeriod'
  @Common.IsUpperCase : true
  @Common.Label : 'Period Ind. for SLED'
  @Common.Heading : 'Per. Ind.'
  @Common.QuickInfo : 'Period Indicator for Shelf Life Expiration Date'
  ShelfLifeExpirationDatePeriod : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding rule SLED'
  @Common.Heading : 'Round.rule'
  @Common.QuickInfo : 'Rounding rule for calculation of SLED'
  ShelfLifeExprtnDateRndngRule : String(1) not null;
  @Common.Label : 'Storage percentage'
  @Common.Heading : 'Stge%'
  @Common.QuickInfo : 'Storage Percentage'
  TotalShelfLifeStoragePercent : Decimal(precision: 3) not null;
  @Common.Label : 'Total shelf life'
  @Common.Heading : 'SLife'
  TotalShelfLife : Decimal(precision: 4) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Unit of Measure'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductUnitOfMeasureEAN,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductUnitOfMeasureEAN' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: AlternativeSAPUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AlternativeISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuantityNumerator,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuantityDenominator,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductVolume,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: GrossWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductUnitOfMeasure {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  key AlternativeUnit : String(3) not null;
  @Common.IsUnit : true
  @Core.Immutable : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  AlternativeSAPUnit : String(3) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  AlternativeISOUnit : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Units / Quantity - Base Unit of Measure'
  @Common.QuickInfo : 'Numerator for Conversion to Base Units of Measure'
  QuantityNumerator : Decimal(precision: 5) not null;
  @Measures.Unit : AlternativeSAPUnit
  @Measures.UNECEUnit : AlternativeISOUnit
  @Common.Label : 'Units / Quantity - Alt Unit of Measure'
  @Common.Heading : 'Units / Quantity - Alternate Unit of Measure'
  @Common.QuickInfo : 'Denominator for conversion to base units of measure'
  QuantityDenominator : Decimal(precision: 5) not null;
  @Measures.Unit : VolumeUnit
  @Measures.UNECEUnit : VolumeISOUnit
  @Common.Label : 'Volume'
  ProductVolume : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Volume Unit'
  @Common.Heading : 'VUn'
  VolumeUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Volume unit ISO'
  @Common.Heading : 'VUI'
  @Common.QuickInfo : 'Volume unit in ISO code'
  VolumeISOUnit : String(3) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Gross Weight'
  GrossWeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Weight'
  @Common.Heading : 'WUn'
  WeightUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of weight ISO'
  @Common.Heading : 'WUn'
  @Common.QuickInfo : 'Unit of weight in ISO code'
  WeightISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'EAN/UPC'
  @Common.QuickInfo : 'International Article Number (EAN/UPC)'
  GlobalTradeItemNumber : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN Category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of Global Trade Item Number (GTIN)'
  GlobalTradeItemNumberCategory : String(2) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Length'
  UnitSpecificProductLength : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Width'
  UnitSpecificProductWidth : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Height'
  UnitSpecificProductHeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Dimension'
  @Common.QuickInfo : 'Unit of Dimension for Length/Width/Height'
  ProductMeasurementUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Dimension unit ISO'
  @Common.Heading : 'DUI'
  @Common.QuickInfo : 'Unit for length/breadth/height in ISO code'
  ProductMeasurementISOUnit : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  LowerLevelPackagingUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lower-level unit ISO'
  @Common.Heading : 'LUnI'
  @Common.QuickInfo : 'Lower-Level Unit of Measure in ISO Code'
  LowerLevelPackagingISOUnit : String(3) not null;
  @odata.Type : 'Edm.Byte'
  @Common.Label : 'Max. Stacking Factor'
  @Common.Heading : 'Max. Stack'
  @Common.QuickInfo : 'Maximum Stacking Factor'
  MaximumStackingFactor : Integer not null;
  @Common.Label : 'Capacity Usage'
  CapacityUsage : Decimal(15, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductUnitOfMeasureEAN : Composition of many Product.ProductUnitOfMeasureEAN;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Unit of Measure EAN'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductUnitOfMeasure' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
entity Product.ProductUnitOfMeasureEAN {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(18) not null;
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  @Common.QuickInfo : 'Base Unit of Measure - No Conversion Routine'
  key AlternativeUnit : String(3) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Consecutive number'
  @Common.Heading : 'ConNo'
  @Common.QuickInfo : 'Consecutive Number'
  key ConsecutiveNumber : String(5) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  AlternativeISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'EAN/UPC'
  @Common.QuickInfo : 'International Article Number (EAN/UPC)'
  ProductStandardID : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN Category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of Global Trade Item Number (GTIN)'
  InternationalArticleNumberCat : String(2) not null;
  @Common.Label : 'Main EAN'
  @Common.Heading : 'M'
  @Common.QuickInfo : 'Indicator: Main EAN'
  IsMainGlobalTradeItemNumber : Boolean not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductUnitOfMeasure : Association to one Product.ProductUnitOfMeasure on _ProductUnitOfMeasure.AlternativeUnit = AlternativeUnit;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductValuationAccounting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationCosting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationLedgerAccount,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationLedgerPrices,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'ValuationArea' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [
  '_Product',
  '_ProductValuationAccounting',
  '_ProductValuationCosting',
  '_ProductValuationLedgerAccount',
  '_ProductValuationLedgerPrices'
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: StandardPrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MovingAveragePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductValuation {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Class'
  @Common.Heading : 'ValCl'
  ValuationClass : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'PriceDeterminationControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price Determ.'
  @Common.Heading : 'Price Determination'
  @Common.QuickInfo : 'Material Price Determination: Control'
  PriceDeterminationControl : String(1) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Standard price'
  StandardPrice : Decimal(precision: 11) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price unit'
  @Common.Heading : 'per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductPriceControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price Control'
  @Common.Heading : 'Pr.'
  InventoryValuationProcedure : String(1) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Moving price'
  @Common.Heading : 'MovAvgPrice'
  @Common.QuickInfo : 'Moving Average Price/Periodic Unit Price'
  MovingAveragePrice : Decimal(precision: 11) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Category'
  @Common.Heading : 'ValCat'
  ValuationCategory : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Usage'
  @Common.Heading : 'U'
  @Common.QuickInfo : 'Usage of the Product'
  ProductUsageType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Origin'
  @Common.Heading : 'O'
  @Common.QuickInfo : 'Origin of the Product'
  ProductOriginType : String(1) not null;
  @Common.Label : 'Produced in-house'
  @Common.Heading : 'P'
  IsProducedInhouse : Boolean not null;
  @Common.Label : 'Del. flag val. type'
  @Common.Heading : 'VTy'
  @Common.QuickInfo : 'Deletion flag for all material data of a valuation type'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'VC: Sales Order Stk'
  @Common.Heading : 'VCl S'
  @Common.QuickInfo : 'Valuation Class for Sales Order Stock'
  ValuationClassSalesOrderStock : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'Proj. stk val. class'
  @Common.Heading : 'VCl P'
  @Common.QuickInfo : 'Valuation Class for Project Stock'
  ProjectStockValuationClass : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationAccounting : Composition of one Product.ProductValuationAccounting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationCosting : Composition of one Product.ProductValuationCosting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationLedgerAccount : Composition of many Product.ProductValuationLedgerAccount;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationLedgerPrices : Composition of many Product.ProductValuationLedgerPrices;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Accounting'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductValuation' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: CommercialPrice1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CommercialPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CommercialPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FuturePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPricel1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxBasedPricesPriceUnitQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductValuationAccounting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 1'
  @Common.Heading : 'Comm. pr. 1'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 1'
  CommercialPrice1InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 2'
  @Common.Heading : 'Comm. pr. 2'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 2'
  CommercialPrice2InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 3'
  @Common.Heading : 'Coml pr. 3'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 3'
  CommercialPrice3InCoCodeCrcy : Decimal(precision: 11) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Devaluation Ind.'
  @Common.Heading : 'DevIn'
  @Common.QuickInfo : 'Lowest value: devaluation indicator'
  DevaluationYearCount : String(2) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Future Price'
  FuturePrice : Decimal(precision: 11) not null;
  @Common.Label : 'Valid from'
  @Common.Heading : 'Valid fm'
  @Common.QuickInfo : 'Date as of which the price is valid'
  FuturePriceValidityStartDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'LIFO Pool'
  @Common.Heading : 'Pool'
  @Common.QuickInfo : 'Pool number for LIFO valuation'
  LIFOValuationPoolNumber : String(4) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 1'
  @Common.QuickInfo : 'Valuation price based on tax law: level 1'
  TaxPricel1InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 2'
  @Common.QuickInfo : 'Valuation price based on tax law: level 2'
  TaxPrice2InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 3'
  @Common.QuickInfo : 'Valuation price based on tax law: level 3'
  TaxPrice3InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price Unit'
  @Common.Heading : 'PrUnit'
  @Common.QuickInfo : 'Price unit for valuation prices based on tax/commercial law'
  TaxBasedPricesPriceUnitQty : Decimal(precision: 5) not null;
  @Common.Label : 'TRUE'
  @Common.QuickInfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  IsLIFOAndFIFORelevant : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one Product.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Costing'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductValuation' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: PlannedPrice1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductValuationCosting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.Label : 'With Qty Structure'
  @Common.Heading : 'Cost Est. with Qty Structure'
  @Common.QuickInfo : 'Material Is Costed with Quantity Structure'
  ProductIsCostedWithQtyStruc : Boolean not null;
  @Common.Label : 'Material origin'
  @Common.Heading : 'MO'
  @Common.QuickInfo : 'Material-related origin'
  IsMaterialRelatedOrigin : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'CostOriginGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Origin Group'
  @Common.Heading : 'OrGp'
  @Common.QuickInfo : 'Origin Group as Subdivision of Cost Element'
  CostOriginGroup : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'CostingOverheadGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Overhead Group'
  @Common.Heading : 'Ovrhd Grp'
  @Common.QuickInfo : 'Costing Overhead Group'
  CostingOverheadGroup : String(10) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 1'
  @Common.Heading : 'PlanPrice 1'
  @Common.QuickInfo : 'Future Planned Price 1'
  PlannedPrice1InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 2'
  @Common.Heading : 'PlanPrice 2'
  @Common.QuickInfo : 'Future Planned Price 2'
  PlannedPrice2InCoCodeCrcy : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 3'
  @Common.Heading : 'PlanPrice 3'
  @Common.QuickInfo : 'Future Planned Price 3'
  PlannedPrice3InCoCodeCrcy : Decimal(precision: 11) not null;
  @Common.Label : 'Planned price date 1'
  @Common.Heading : 'PP date 1'
  @Common.QuickInfo : 'Date from Which Future Planned Price 1 Is Valid'
  FuturePlndPrice1ValdtyDate : Date;
  @Common.Label : 'Planned price date 2'
  @Common.Heading : 'PP date 2'
  @Common.QuickInfo : 'Date from Which Future Planned Price 2 Is Valid'
  FuturePlndPrice2ValdtyDate : Date;
  @Common.Label : 'Planned price date 3'
  @Common.Heading : 'PP date 3'
  @Common.QuickInfo : 'Date from Which Future Planned Price 3 Is Valid'
  FuturePlndPrice3ValdtyDate : Date;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one Product.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Ledger Account'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'CurrencyRole', 'Ledger' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductValuation' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MovingAveragePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StandardPrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductValuationLedgerAccount {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'CurrencyRole'
  @Core.Immutable : true
  @Common.Label : 'Currency/Valuation'
  @Common.Heading : 'CrcyTy./ValView'
  @Common.QuickInfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Ledger'
  @Common.Heading : 'Ld'
  @Common.QuickInfo : 'Ledger in General Ledger Accounting'
  key Ledger : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductPriceControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price control'
  @Common.Heading : 'Pr.'
  @Common.QuickInfo : 'Price control indicator'
  ProductPriceControl : String(1) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price unit'
  @Common.Heading : 'per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Per. Unit Price'
  @Common.Heading : 'Per.Unit Price'
  @Common.QuickInfo : 'Periodic Unit Price'
  MovingAveragePrice : Decimal(precision: 11) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Standard Price'
  StandardPrice : Decimal(precision: 11) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one Product.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Ledger Prices'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.RequiredProperties : [ 'CurrencyRole', 'Ledger' ]
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Product', '_ProductValuation' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FuturePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
entity Product.ProductValuationLedgerPrices {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'CurrencyRole'
  @Core.Immutable : true
  @Common.Label : 'Currency/Valuation'
  @Common.Heading : 'CrcyTy./ValView'
  @Common.QuickInfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Ledger'
  @Common.Heading : 'Ld'
  @Common.QuickInfo : 'Ledger in General Ledger Accounting'
  key Ledger : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price unit'
  @Common.Heading : 'per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Future Price'
  FuturePrice : Decimal(precision: 11) not null;
  @Common.Label : 'Valid From'
  FuturePriceValidityStartDate : Date;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  SAP__Messages : many Product.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one Product.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one Product.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

