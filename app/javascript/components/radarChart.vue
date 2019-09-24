// https://vue-chartjs.org/ja/guide/#最初のチャートの作成
<script>
import { Radar } from 'vue-chartjs'

export default {
  extends: Radar,
  props: ['chartdata', 'options'],
  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}
</script>
