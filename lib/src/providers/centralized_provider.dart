// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/services/api/global/base_repository.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/identity/identifiable.dart';

class CentralizedProvider<T extends Identifiable> extends ChangeNotifier {
  final BaseRepository<T> _repository;

  CentralizedProvider(this._repository);

  List<T> _entities = [];
  bool _isSearchActive = false;
  final Map<String, dynamic> _filters = {};
  Status _fetchStatus = Status.initial;
  SubmissionStatus _submissionStatus = SubmissionStatus.initial;
  int? _nextPage;
  List<T> _cachedEntities = [];
  int? _cachedNextPage;

  // Getters for state variables
  List<T> get entities => _entities;
  bool get isSearchActive => _isSearchActive;
  Map<String, dynamic> get filters => _filters;
  Status get fetchStatus => _fetchStatus;
  SubmissionStatus get submissionStatus => _submissionStatus;
  int? get nextPage => _nextPage;
  List<T> get cachedEntities => _cachedEntities;

  void setFetchStatus(Status status) {
    _fetchStatus = status;
    notifyListeners();
  }

  void setSubmissionStatus(SubmissionStatus status) {
    _submissionStatus = status;
    notifyListeners();
  }

  void handleNavigation(BuildContext context, T entity) {}

  /// Creates a new entity using [data] and handles the navigation
  /// to the detail page of the newly created entity upon success.
  ///
  /// The [successMessage] and [errorMessage] can be overridden to
  /// provide different success and error messages.
  ///
  /// The [handleNavigation] function is called with the created entity
  /// as an argument upon success.
  Future<void> createEntity(
    BuildContext context,
    Map<String, dynamic> data, {
    String successMessage = "Creation successful",
    String errorMessage = "Creation failed",
  }) async {
    setSubmissionStatus(SubmissionStatus.submitting);
    final result = await _repository.create(data);
    result.when(
      success: (data) {
        setSubmissionStatus(SubmissionStatus.success);
        showSuccess(successMessage);
        getEntities();
        notifyListeners();
        handleNavigation(context, data);
      },
      failure: (failure) {
        showError(failure.message?.toString() ?? errorMessage);
        setSubmissionStatus(SubmissionStatus.error);
      },
    );
  }

  /// Retrieves the list of all entities of type [T] from the repository
  /// and updates the [_entities] list accordingly.
  ///
  /// If [filters] are provided, they are passed to the repository's
  /// [getAll] function to filter the results.
  ///
  /// If the 'searchQuery' key is present in [filters], the search
  /// intent is considered to be active. If the search query is empty,
  /// the [_isSearchActive] flag is set to false and the cached entities
  /// are used to populate the [_entities] list. If the search query is
  /// not empty, the [_isSearchActive] flag is set to true.
  ///
  /// The [_cachedEntities] list is updated with the retrieved entities
  /// if the search intent is inactive.
  ///
  /// The [setFetchStatus] function is called with the appropriate [Status]
  /// value to indicate the state of the retrieval process.
  ///
  /// The [notifyListeners] function is called to notify the widgets
  /// listening to this provider of the changes.
  Future<void> getEntities({Map<String, dynamic>? filters}) async {
    filters ??= {};
    final searchIntent = filters.containsKey('searchQuery');
    if (searchIntent && filters['searchQuery'].isNotEmpty) {
      _isSearchActive = true;
    } else if (searchIntent && filters['searchQuery'].isEmpty) {
      _isSearchActive = false;
      if (_cachedEntities.isNotEmpty) {
        _entities = List<T>.from(_cachedEntities);
        notifyListeners();
        return;
      }
    }
    filters.addAll(_filters);
    setFetchStatus(Status.loading);
    final result = await _repository.getAll(filters: filters);

    result.when(success: (entities) {
      _nextPage = entities.$1;
      _entities = List<T>.from(entities.$2);
      setFetchStatus(Status.success);
      if (!_isSearchActive) {
        _cachedEntities = List<T>.from(entities.$2);
        _cachedNextPage = entities.$1;
        logger.w("Next Page $_cachedNextPage");
      }
      notifyListeners();
    }, failure: (failure) {
      logger.f(failure.toString());
      setFetchStatus(Status.error);
    });
  }

  /// Updates an entity using [data] and handles the navigation
  /// to the detail page of the updated entity upon success.
  ///
  /// The [successMessage] and [errorMessage] can be overridden to
  /// provide different success and error messages.
  ///
  /// The [handleNavigation] function is called with the updated entity
  /// as an argument upon success.
  Future<void> updateEntity(
      BuildContext context, Map<String, dynamic> data, String id,
      {String successMessage = "Update successful",
      String errorMessage = "Update failed"}) async {
    setSubmissionStatus(SubmissionStatus.submitting);
    final result = await _repository.update(data, id);
    result.when(success: (success) {
      setSubmissionStatus(SubmissionStatus.success);
      showSuccess(successMessage);
      final index = _entities.indexWhere((element) => element.id == id);
      _entities[index] = success;
      notifyListeners();
      handleNavigation(context, success);
    }, failure: (failure) {
      setSubmissionStatus(SubmissionStatus.error);
      logger.f(failure.toString());
    });
  }

  /// Deletes an entity with the given [id] and handles the navigation
  /// to the list page of the entity upon success.
  ///
  /// The [successMessage] and [errorMessage] can be overridden to
  /// provide different success and error messages.
  ///
  /// The [handleNavigation] function is called with no arguments upon
  /// success. If [fetch] is true, the list of entities is refetched.
  ///
  /// The [postActionCallback] is called with no arguments upon success.
  Future<void> deleteEntity(BuildContext context, String id,
      {String successMessage = "Deletion successful",
      String errorMessage = "Deletion failed",
      bool fetch = true,
      bool handleRouting = true,
      Function? postActionCallback}) async {
    final result = await _repository.delete(id);
    result.when(success: (success) {
      if (success) {
        if (handleRouting) context.handleRouting();
        showSuccess(successMessage);
        if (postActionCallback != null) postActionCallback();
        if (fetch) getEntities();
      } else {
        showError(errorMessage);
      }
    }, failure: (failure) {
      logger.f(failure.toString());
      showError(errorMessage);
    });
  }

  /// Retrieves the next page of entities from the repository and
  /// updates the [_entities] list accordingly.
  ///
  /// If the search intent is inactive, the [_cachedEntities] list is
  /// updated with the retrieved entities.
  ///
  /// The [notifyListeners] function is called to notify the widgets
  /// listening to this provider of the changes.
  ///
  /// If the [_nextPage] is null, the function returns immediately.
  ///
  /// The [failure] callback is called with the failure result if the
  /// retrieval fails. The error is logged using
  /// [Helpers.logger].
  Future<void> getNextPage() async {
    if (_nextPage == null) {
      return;
    }

    final result = await _repository.getAll(
        filters: {if (!_isSearchActive) "pageNumber": _nextPage, ...filters});

    result.when(success: (entities) {
      _entities.addAll(List<T>.from(entities.$2));
      _nextPage = entities.$1;
      if (!_isSearchActive) {
        _cachedNextPage = entities.$1;
        _cachedEntities.addAll(List<T>.from(entities.$2));
      }
      notifyListeners();
    }, failure: (failure) {
      logger.f(failure.toString());
    });
  }

  /// Clears the search intent and reverts the [_entities] list to the
  /// [_cachedEntities] list.
  ///
  /// The [_isSearchActive] flag is set to false and the [_entities] list
  /// is updated with the values from [_cachedEntities].
  ///
  /// The [notifyListeners] function is called to notify the widgets
  /// listening to this provider of the changes.
  void clearSearch() {
    _isSearchActive = false;
    _entities = List<T>.from(_cachedEntities);
    _nextPage = _cachedNextPage;
    notifyListeners();
  }

  void setFilters(String key, dynamic value, {bool fetch = false}) {
    _filters[key] = value;
    if (fetch) {
      getEntities(filters: _filters);
    }
    notifyListeners();
  }

  void removeFilter(String key, {dynamic value}) {
    _filters.remove(key);
  }

  void clearFilters({bool fetch = false}) {
    _filters.clear();
    if (fetch) {
      getEntities();
    }
    notifyListeners();
  }
}
