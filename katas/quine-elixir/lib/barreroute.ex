defmodule Barreroute do
  def tab do
    [
      "defmodule Barreroute do",
      "  def tab do",
      "    [",
      "    ]",
      "  end",
      "",
      "  def new_line do",
      "    to_string([10])",
      "  end",
      "",
      "  def double_quote do",
      "    to_string([34])",
      "  end",
      "",
      "  def anti_slash do",
      "    to_string([92])",
      "  end",
      "",
      "  def replace_chars(x) do",
      "    String.replace(x, double_quote, anti_slash <> double_quote)",
      "    |> String.replace(new_line, anti_slash <> to_string([110]))",
      "  end",
      "",
      "  def listing do",
      "    Enum.join(Enum.slice(tab(), 0..2), new_line) <> new_line <>",
      "    Enum.map_join(tab(), to_string([44]) <> new_line, fn(x) -> to_string([32, 32, 32, 32, 32, 32]) <> double_quote <> replace_chars(x)  <> double_quote end) <> new_line <>",
      "    Enum.join(Enum.slice(tab(), 3..-1), new_line)",
      "  end",
      "",
      "  def main do",
      "    IO.puts listing()",
      "  end",
      "end"
    ]
  end

  def new_line do
    to_string([10])
  end

  def double_quote do
    to_string([34])
  end

  def anti_slash do
    to_string([92])
  end

  def replace_chars(x) do
    String.replace(x, double_quote, anti_slash <> double_quote)
    |> String.replace(new_line, anti_slash <> to_string([110]))
  end

  def listing do
    Enum.join(Enum.slice(tab(), 0..2), new_line) <> new_line <>
    Enum.map_join(tab(), to_string([44]) <> new_line, fn(x) -> to_string([32, 32, 32, 32, 32, 32]) <> double_quote <> replace_chars(x)  <> double_quote end) <> new_line <>
    Enum.join(Enum.slice(tab(), 3..-1), new_line)
  end

  def main do
    IO.puts listing()
  end
end
