const giphyApi = {
  fetchSearchGiphys: (searchTerm) => (
    $.ajax({
      method: 'GET',
      dataType: 'json',
      url: 'http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2'
    })
  )
};

export default giphyApi;
