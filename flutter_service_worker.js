'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "d887454d7e0edd947cff0341001fd6df",
"assets/assets/beerr.png": "73fa9a0512aad5cfc911d02359cea2e5",
"assets/assets/ig_logo.png": "84455fbaae537ec62c7a3b0572f1b733",
"assets/assets/linked_in.png": "a9f7af5796bd66458bb89dd1d78c38ae",
"assets/assets/movies.jpeg": "7820fcf494c1ddc2034b57cdb2353840",
"assets/assets/OpenSans-Bold.ttf": "1025a6e0fb0fa86f17f57cc82a6b9756",
"assets/assets/removed.png": "35e8478c63322ab207088fb723dd0c7f",
"assets/assets/RobotoMono-Regular.ttf": "b4618f1f7f4cee0ac09873fcc5a966f9",
"assets/assets/snake_pygame.png": "89ea21a65e1e27aba40f628c9b6f248d",
"assets/FontManifest.json": "092802b4989bc4b23e1ce91174ff3f96",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "6f7dca6305a3043b40eca9b30dfa4184",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "9aeda4c0247e8f85faaeaaaf1db04cb2",
"/": "9aeda4c0247e8f85faaeaaaf1db04cb2",
"main.dart.js": "1cbe32c96b18f79395f3711ca6199b68",
"manifest.json": "2175942578d2b62dc0c979a227d608b1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
