export const GIPHY_API_KEY = "SwJOQqZJRKhOnF19cABiJ25C2VXwLSPK"

export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${GIPHY_API_KEY}&limit=2`
  })
}