# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Liveview.Repo.insert!(%Liveview.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query

Liveview.Repo.insert!(%Liveview.Market{name: "BAY", lat: 37.423021, lng: -122.083739})

market = Liveview.Repo.one(from m in Liveview.Market, limit: 1)

Liveview.Repo.insert!(%Liveview.Expert{id: 56, fullname: "George Alajaji", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 63, fullname: "Lauren Aldredge", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 315, fullname: "Kevin Graham", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 475, fullname: "Mason Lee", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 513, fullname: "Shafaq Ahmed", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 636, fullname: "West Wentz", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 641, fullname: "Maria Duran", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 665, fullname: "Jesse McManus", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 683, fullname: "Andrew Rogers", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 669, fullname: "Ronell Fields", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 895, fullname: "Enric Rangel", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 635, fullname: "Brian Frantz", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 675, fullname: "Kevin Luu", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 674, fullname: "Brandi Williams", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 670, fullname: "Fernando Lois", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 677, fullname: "Daniel Howarter", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 678, fullname: "Jasmin Staubli", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 672, fullname: "Farrah Kazemi", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 892, fullname: "John Kelly", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 123, fullname: "Drew Warren", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 473, fullname: "Casey Palma", market: market})
Liveview.Repo.insert!(%Liveview.Expert{id: 58, fullname: "Janan Barance", market: market})
