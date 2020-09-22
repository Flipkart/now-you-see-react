/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  StyleSheet,
  View,
  Dimensions, SafeAreaView
} from 'react-native';

import { RecyclerListView, DataProvider, LayoutProvider } from 'recyclerlistview';
import TrackableView from './TrackableView';

const App: () => React$Node = () => {
  return (
    <SafeAreaView style={styles.container}>
      <RecyclerListView
        style={styles.container}
        dataProvider={dataProvider}
        layoutProvider={layoutProvider}
        rowRenderer={rowRenderer}
      />
    </SafeAreaView>
  );
};

const data = new Array(100);
const windowWidth = Dimensions.get('window').width;

const dataProvider = new DataProvider((r1, r2) => {
  return true;
}).cloneWithRows(data, 100);

const layoutProvider = new LayoutProvider(
  (_index) => {
    return 0
  },
  (_type, dimension) => {
    dimension.height = 200
    dimension.width = windowWidth/2
  }
);

const rowRenderer = (_type, _data) => {
  return <TrackableView style={styles.trackableView} />;
};

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  trackableView: {
    flexDirection: 'column',
    flex: 1,
    margin: 16,
    height: 200
  }
});

export default App;
