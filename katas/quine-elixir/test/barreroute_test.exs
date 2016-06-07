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

  test "cas de la derniere ligne du tableau" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list)-31) == "      \"end\""
  end

  test "cas de l'avant-derniere ligne du tableau" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list) - 32) == "      \"  end\","
  end

  test "cas de listing" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, length(list) - 37) == "      \"    Enum.join(Enum.slice(tab(), 3..-1), new_line)\","
  end

  test "cas du debut" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, 0) == "defmodule Barreroute do"
  end

  test "cas de tab" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, 1) == "  def tab do"
  end

  test "cas du debut du tableau" do
    list = String.split(Barreroute.listing(), "\n")
    assert Enum.at(list, 2) == "    ["
  end
end
