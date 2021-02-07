
// a struct for the variables to avoid changing too much code in the game scripts
// this way only one variable is created and it is this struct with many members
struct ResourcePerkOverhaulProperties {
  var last_hit_timestamp: float;

  var is_instantiated: bool;
  default is_instantiated = false;
}
