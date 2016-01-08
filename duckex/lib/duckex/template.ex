defmodule Duckex.Template do
  require EEx
  EEx.function_from_file :def, :index, "./lib/templates/index.html.eex", []

  EEx.function_from_file :def, :estimate, "./lib/templates/estimate.html.eex", [:number_of_people, :number_of_ducks]
end
