defmodule BarrerouteTest do
  use ExUnit.Case
  doctest Barreroute

  test "last line == end" do
    assert List.last(String.split(Barreroute.listing(), "\n")) == "end"
  end

  test "before last line == end" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list)-2) == "  end"
  end

  test "before before last line == IO.puts" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list)-3) == "    IO.puts listing()"
    assert Enum.at(list, length(list)-4) == "  def main do"
  end

  test "cas du guillemet" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list)-7) == "    Enum.join(tab(), \"\\n\")"
  end

  test "cas de la derniere ligne du tableau" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list)-12) == "      \"end\""
  end
end
