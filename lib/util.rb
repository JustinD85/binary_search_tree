module Util

def Util.values_for_conclusion
  {
    weight_found: false,
    depth: 0,
    heaviest_node: {name: "", value: 0},
    lightest_node: {name:"", value:0},
    sorted_nodes: [],
    number_of_nodes:0
  }
end

end
