drop table geomtable;
 
create table geomtable(the_geom geometry, id int);

select sqlj.install_jar('file://tpe.jar', 'resource', true);


SELECT st_intersects(the_geom) FROM geomtable GROUP BY id;

DROP FUNCTION st_intersection(geometry, geometry) CASCADE;


CREATE OR REPLACE FUNCTION st_intersection(base geometry, geom geometry)
  RETURNS geometry AS
  'resource.Intersection.getIntersection(base, geom)'
  LANGUAGE java VOLATILE
  COST 100;
ALTER FUNCTION st_intersection(geometry, geometry)
  OWNER TO postgres;


CREATE AGGREGATE st_intersects (
  sfunc=st_intersection,
  stype=geometry,
  basetype=geometry
);