
// https://vue-chartjs.org/ja/guide/#最初のチャートの作成
<template>
  <div id="app">
    <p>dashboard</p>
    <div class="container">
      <div v-for="(group,index) in groups" :key="index" class="each-group">
        <p>{{ group.name }}</p>
        <p>DevOps Score: {{group.score}}</p>
        <RadarChart :chartdata='group.chartdata' :options='group.options' />
      </div>
    </div>
  </div>
</template>

<script>
import RadarChart from 'components/radarChart'
export default {
  components: {
    RadarChart
  },
  data: function () {
    return {
      groups: [
        {
          name: 'SOK',
          score: 90,
          chartdata: {
            labels: ["シンクロ度", "コラボレーション", "アフィニティ", "ツール", "スケーリング"],
            datasets: [
              {
                label: "グループ平均",
                data: [40, 50, 60, 70, 80]
              }
            ]
          }
        }
      ],
      options: {
        scale: {
            ticks: {
                beginAtZero: true,
                max: 100,
                min: 0,
                stepSize: 50
            }
        }
      }
    }
  },
  created: function(){
    // debug data
    for (let index = 0; index < 13; index++) {
      this.groups.push(this.groups[0]); 
    }

    for (let index = 0; index < this.groups.length; index++) {
      Object.assign(this.groups[index],{options: this.options});
    }
    console.log(this.groups)
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.each-group {
  width: 400px;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
</style>
