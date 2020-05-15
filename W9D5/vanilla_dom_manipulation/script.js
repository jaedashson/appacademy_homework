document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  
  const addToList = (e) => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favoriteText = favoriteInput.value;
    favoriteInput.value = "";

    const newFavoriteLi = document.createElement("li");
    newFavoriteLi.textContent = favoriteText;
    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newFavoriteLi);
  }

  const addToListButton = document.querySelector(".favorite-submit");

  addToListButton.addEventListener("click", addToList);


  // toggling new photo form
  const showPhotoForm = (e) => {
    const photoFormContainer = document.querySelector(".photo-form-container");

    if (photoFormContainer.className === "photo-form-container") {
      photoFormContainer.className = "photo-form-container hidden";
    } else {
      photoFormContainer.className = "photo-form-container";
    }
  };

  const showPhotoFormButton = document.querySelector(".photo-show-button");
  showPhotoFormButton.addEventListener("click", showPhotoForm);

  // new photo submission

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";
    
    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  }

  const addPhotoButton = document.querySelector(".photo-url-submit");
  addPhotoButton.addEventListener("click", handlePhotoSubmit);
})