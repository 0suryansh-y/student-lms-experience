import { Card, CardContent } from "@/components/ui/card"
import { Button } from "@/components/ui/button"

export default function AssignmentDetail() {
    return (
        <Card>
            <CardContent className="p-6">
                <div className="flex flex-col gap-6 md:flex-row md:justify-between">
                    {/* Left Content */}
                    <div className="space-y-6">
                        <section>
                            <h2 className="text-lg font-semibold">Instructions</h2>
                            <p className="mt-2 text-sm text-muted-foreground max-w-2xl">
                                The goal of this assignment is to help you apply roadmap
                                planning concepts to a real-world scenario. You will
                                practice translating a high-level vision into a structured,
                                prioritised roadmap while making clear trade-offs.
                            </p>
                        </section>

                        <section>
                            <h3 className="font-medium">What you need to do</h3>
                            <ul className="mt-2 list-disc space-y-2 pl-5 text-sm text-muted-foreground">
                                <li>Define a clear product vision and target user problem.</li>
                                <li>Identify 6–8 key product initiatives aligned to the vision.</li>
                                <li>
                                    Prioritise initiatives using a framework (RICE, MoSCoW,
                                    Impact vs Effort, etc.) and justify your choices.
                                </li>
                                <li>
                                    Create a 6-month roadmap organised by themes or milestones.
                                </li>
                                <li>
                                    Highlight key trade-offs and deprioritised items with reasoning.
                                </li>
                            </ul>
                        </section>

                        <section>
                            <h3 className="font-medium">Deliverables</h3>
                            <ul className="mt-2 list-disc space-y-2 pl-5 text-sm text-muted-foreground">
                                <li>
                                    A 1–2 page document or presentation (5–7 slides) covering:
                                </li>
                                <li className="ml-4">• Product vision</li>
                                <li className="ml-4">• Prioritisation framework used</li>
                                <li className="ml-4">• Roadmap timeline</li>
                            </ul>
                        </section>
                    </div>

                    <div className="flex shrink-0 items-start">
                        <Button size="lg" className="rounded-xl px-8">
                            Start
                        </Button>
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}