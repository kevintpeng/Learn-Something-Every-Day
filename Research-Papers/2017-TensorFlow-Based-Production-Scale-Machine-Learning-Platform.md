# [TensorFlow Extended](http://www.kdd.org/kdd2017/papers/view/tfx-a-tensorflow-based-production-scale-machine-learning-platform)
TFX is Google's platform for machine learning
- models are described in TensorFlow

The platform aims for reliability, automated data validation, respecting data errors
- user defined schemas allow for data validation, making assertions about data quality (types, presence, valency/range of values) and throwing errors appropriately
- anomaly detection is important for data quality, based on defined schemas or potentially inferred
- it's important that users feel like data isn't missing and that it's relevant
- providing statistics on features is important for users to be able to understand their data before using it (geolocation heat map, histograms, standard deviation, etc...)

Model validation is ensuring that the model shipped to production is safe and has desired prediction quality
- should not crash, consume too many resources
- human-facing metrics from A/B testing is effective for large changes, but is costly and takes time
- machine

- Google Play was a use case, continuous model training improved install rates due to recency and relevance of the model

### Takeaways
- data transformations must be applied consistently to both to pipeline data and online data (going directly to the trained model)
- continuous model training allows more up to date predictions
