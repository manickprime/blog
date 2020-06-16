'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "cf931944f48022fec9d1902e9f58df9f",
"assets/assets/beerr.png": "73fa9a0512aad5cfc911d02359cea2e5",
"assets/assets/ig_logo.png": "84455fbaae537ec62c7a3b0572f1b733",
"assets/assets/linked_in.png": "a9f7af5796bd66458bb89dd1d78c38ae",
"assets/assets/OpenSans-Bold.ttf": "1025a6e0fb0fa86f17f57cc82a6b9756",
"assets/assets/removed.png": "d662044119197fc1cea6cdb039586817",
"assets/assets/RobotoMono-Regular.ttf": "b4618f1f7f4cee0ac09873fcc5a966f9",
"assets/FontManifest.json": "092802b4989bc4b23e1ce91174ff3f96",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "7f1df1ee47854388e684afc0845ea820",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "9aeda4c0247e8f85faaeaaaf1db04cb2",
"/": "9aeda4c0247e8f85faaeaaaf1db04cb2",
"main.dart.js": "d907b1f2ff9dce90e6d3cf43f62b8547",
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
