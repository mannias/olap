select sqlj.replace_jar('file:///home/{SET USERNAME!}}/olap/scripts.jar', 'resource', true);
select sqlj.set_classpath('olap', 'resource');

CREATE OR REPLACE FUNCTION olap.st_intersection2(geometry,geometry)
  RETURNS geometry AS
  'olap.it.edu.itba.tp.Intersection.getIntersection'
  LANGUAGE java
  COST 100;

CREATE AGGREGATE st_intersects (
  sfunc=olap.st_intersection2,
  stype=geometry,
  basetype=geometry
);

CREATE OR REPLACE FUNCTION olap.st_union2(geometry,geometry)
  RETURNS geometry AS
  'olap.it.edu.itba.tp.Centroid.getUnion'
  LANGUAGE java
  COST 100;

CREATE OR REPLACE FUNCTION olap.st_findcentroid(geometry)
  RETURNS geometry AS
  'olap.it.edu.itba.tp.Centroid.getCentroid'
  LANGUAGE java
  COST 100;
  
CREATE AGGREGATE st_nearcentroid (
  sfunc=olap.st_union2,
  stype=geometry,
  basetype=geometry,
  finalfunc=olap.st_findcentroid
);

