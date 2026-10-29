{{flutter_js}}
{{flutter_build_config}}
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    try {
      const appRunner = await engineInitializer.initializeEngine();
      await appRunner.runApp();
      clearTimeout(window.balnanaLoadTimer);
      document.getElementById('loading')?.remove();
    } catch (error) {
      window.balnanaLoadFailed();
      console.error('Balnana could not start', error);
    }
  }
}).catch(window.balnanaLoadFailed);
