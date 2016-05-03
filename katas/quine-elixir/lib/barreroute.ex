defmodule Barreroute do
  def tab do
    [
      "    ]",
      "  end",
      "",
      "  def listing do",
      "    Enum.join(tab(), \"\\n\")",
      "  end",
      "",
      "  def main do",
      "    IO.puts listing()",
      "  end",
      "end"
    ]
  end

  def listing do
    resultat = "      \"" <> List.last(tab) <> "\""
    resultat <> Enum.join(tab(), "\n")
  end

  def main do
    IO.puts listing()
  end
end
