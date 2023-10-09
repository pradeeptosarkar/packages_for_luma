alias Himmel.Places
alias Himmel.Places.{Place, Coordinates}
alias Himmel.Accounts.User
alias Himmel.Repo

user = Repo.all(User) |> hd

place = %{name: "Hamburg", coordinates: %{latitude: 18.1, longitude: 8.1}, user: [%{id: 1}]}
